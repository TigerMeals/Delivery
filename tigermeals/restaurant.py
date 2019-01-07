from flask import Flask, request, make_response, jsonify, render_template, redirect
from flask import session, url_for
from flask_mail import Mail,  Message
from tigermeals.mail_html import user_approved_html, rest_approved_html, user_denied_html, rest_denied_html, order_delivered_html, reset_password_html
import requests
import json
import string
import random
import os
from tigermeals import app
import cloudinary
import cloudinary.uploader
import cloudinary.api
import cloudinary.utils
import stripe

app.config["DEBUG"] = True
app.config['SEND_FILE_MAX_AGE_DEFAULT'] = 0
app.config['MAIL_SERVER'] = 'smtp.gmail.com'
app.config['MAIL_PORT'] = 465
app.config['MAIL_USE_SSL'] = True
app.config['MAIL_USERNAME'] = 'tigermealsdelivery@gmail.com'
app.config['MAIL_PASSWORD'] = 'aksnpqtutouldhna'
mail = Mail(app)

cloudinary.config(
	cloud_name = "djclzxoun",
	api_key = "593593232441758",
	api_secret = "gQUTMItrljBmcZ2Po8cbVvEFJvU"
)

# DATABASE_URL = "http://tigermeals-delivery.herokuapp.com"
DATABASE_URL = "http://localhost:5000"

# The secure key that someone needs to use the POST methods.
SECURE_DATABASE_KEY = "sdjfhs24324[][p][}}P`092`)*@))@31DSDA&ASD{}[][]w]%%332"

## PRIVATE METHODS. GET METHOD
def _getJSON(url):
    r = requests.get(url=url)
    data = r.json()

    return (data)

## POST METHOD
def _postJSON(url, data):
    r = requests.post(url=url, data=data)

    response = r.json()
    return response


# Endpoint for a page that does not exist for a restaurant
@app.errorhandler(404)
def page_not_found(e):
	return render_template('not_found.tpl'), 404

# Endpoint to logout a restaurant
@app.route("/restaurant/logout")
def logout():
	# remove the username from the session
	session.pop('username', None)
	return redirect(url_for('portal'))

# Endpoint for a restaurant registration form
@app.route("/register")
def register():
    return render_template('create_account_restaurant.tpl')

# Endpoint for a restaurant to view their profile
@app.route("/view")
def view():
	if 'username' not in session:
		print("Login screen -----------------------------------")
		return render_template('login_restaurant.tpl')

	username = session['username']

	restaurant_info_url = DATABASE_URL + "/restaurant/email"

	email = {
		"email": str(username),
		"key": SECURE_DATABASE_KEY
	}

	res = requests.post(restaurant_info_url, json = email)
	if not res.ok:
		res.raise_for_status()

	restaurant_id = json.loads(res.content)['restaurant_id']
	restaurant_url = DATABASE_URL + "/restaurant/" + str(restaurant_id)
	res = requests.get(restaurant_url)
	if not res.ok:
		res.raise_for_status()
	rest = json.loads(res.content)

	meals_url = DATABASE_URL + "/food/restaurant/" + str(restaurant_id)
	res = requests.get(meals_url)
	if not res.ok:
		res.raise_for_status()
	meals = json.loads(res.content)

	rest['hours'] = rest['hours'].split(",")
	hours = []
	for hour in rest['hours']:
		# Convert time to a readable format
		if hour == "":
			hours.append("CLOSED")
			continue
		hr = hour.split(":")[0]
		min = hour.split(":")[1]
		time = "am"
		if int(hr) > 12:
			hr = str(int(hr) - 12)
			time = "pm"
		hours.append(hr + ":" + min + " " + time)

	for meal in meals:
		# Splice allergies into a list
		if meal['allergies'] is "":
			meal['allergies'] = []
		else:
			meal['allergies'] = meal['allergies'].split(",")
		meal['restaurant'] = rest['name']

	orders_url = DATABASE_URL + "/order/restaurant/" + str(restaurant_id)
	res = requests.get(orders_url)
	if not res.ok:
		res.raise_for_status()

	orders = json.loads(res.content)

	length_orders = 0

	for order in orders:
		if order['paid'] and order['delivery_in_process']:
			length_orders += 1

	error = request.args.get('error')

	r = make_response(render_template('restaurant_info_restaurant.tpl', meals=meals, restaurant=rest, length_orders=length_orders, hours=hours))

	r.headers["Pragma"] = "no-cache"
	r.headers["Expires"] = "0"
	r.headers['Cache-Control'] = 'public, max-age=0'
	return r


# Endpoint to reset a restaurant's password
@app.route("/reset")
def reset():
    return render_template('reset_restaurant.tpl')

def randompassword():
  chars = string.ascii_uppercase + string.ascii_lowercase + string.digits
  size = random.randint(8, 12)
  return ''.join(random.choice(chars) for x in range(size))

# Endpoint for a restaurant registration form
# Create new temp password, update database, email to user
@app.route("/reset/upload", methods=["POST"])
def reset_upload():
    email = request.form.get('email')
    new_password = randompassword()
    # lookup by email
    lookup_email_url = DATABASE_URL + "/restaurant/email"
    res = requests.post(lookup_email_url, json={"email": email, "key": SECURE_DATABASE_KEY})
    if not res.ok:
        res.raise_for_status()

    if res.json() == {}:
    	return render_template('reset_restaurant.tpl', error="Email is not owned by a registered restaurant")

    rest_id = json.loads(res.content)['restaurant_id']
    update_pass_url = DATABASE_URL + "/restaurant/password/" + str(rest_id)
    requests.put(update_pass_url, json={"password": new_password,
    "key": SECURE_DATABASE_KEY})
    if not res.ok:
        res.raise_for_status()

    # Now mail temp password to restaurant
    msg = mail.send_message(
    'Your TigerMeals Delivery Temporary Password',
    sender='tigermealsdelivery@gmail.com',
    recipients=[email],
    html=reset_password_html(new_password))

    return redirect('/restaurant/home')

# Register restaurant to database
@app.route("/register/upload", methods=["POST"])
def register_upload():
	if request.form['password'] != request.form['password2']:
		return render_template('create_account_restaurant.tpl', error="Passwords did not match.")

	cuisine = ""
	for checkbox in ['Chinese', 'Healthy', 'Indian', 'Mexican', 'Drinks', 'American', 'Breakfast', 'Italian', 'Asian']:
		if request.form.get(checkbox) is not None:
			if len(cuisine) > 0:
				cuisine += ","
			cuisine += checkbox

	hours = ""
	for day in ['sunday', 'monday', 'tuesday', 'wednesday', 'thursday', 'friday', 'saturday']:
		start_time = request.form.get(day + '1')
		if start_time is None:
			start_time = ""
		end_time = request.form.get(day + '2')
		if end_time is None:
			end_time = ""
		if len(hours) > 0:
			hours += ","
		hours += start_time + "," + end_time


	imgurl = None
	if 'image' in request.files:
		img = request.files['image']
		if img is not None:
			response = cloudinary.uploader.upload(img)
			imgurl, options = cloudinary.utils.cloudinary_url(response['public_id'], width=250, height=250, format = response['format'],  gravity = "auto", crop = "fill", quality=100, effect="sharpen")

	registration_info = {
	"name": request.form['name'],
	"email": request.form['email'],
	"password": request.form['password'],
	"website": request.form['website'],
	"image": "",
	"phone": request.form['restaurantPhone'],
	"description": "",
	"cuisine": cuisine,
	"servingSize": "100",
	"address": request.form['address'],
	"hours": hours,
	"key": SECURE_DATABASE_KEY
	}

	if request.form['primaryFirstName'] is not None:
	    registration_info['primaryFirstName'] = request.form['primaryFirstName']
	if request.form['primaryLastName'] is not None:
	    registration_info['primaryLastName'] = request.form['primaryLastName']
	if request.form['primaryEmail'] is not None:
	    registration_info['primaryEmail'] = request.form['primaryEmail']
	if request.form['primaryPhone'] is not None:
	    registration_info['primaryPhone'] = request.form['primaryPhone']

	if request.form['secondaryFirstName'] is not None:
	    registration_info['secondaryFirstName'] = request.form['secondaryFirstName']
	if request.form['secondaryLastName'] is not None:
	    registration_info['secondaryLastName'] = request.form['secondaryLastName']
	if request.form['secondaryEmail'] is not None:
	    registration_info['secondaryEmail'] = request.form['secondaryEmail']
	if request.form['secondaryPhone'] is not None:
	    registration_info['secondaryPhone'] = request.form['secondaryPhone']
	if imgurl is not None:
		registration_info['image'] = imgurl


	create_rest_url = DATABASE_URL + "/restaurant"
	res = requests.post(create_rest_url, json=registration_info)
	if not res.ok:
	    res.raise_for_status()

	return redirect('/restaurant/home')

# Endpoint to login a restaurant
@app.route("/login", methods=['POST'])
def login():

	if 'username' in session:
		return redirect('/home')

	login_query = {
		"email": request.form['email'],
		"password": request.form['password'],
	"key": SECURE_DATABASE_KEY
	}

	login_url = DATABASE_URL + '/restaurant/login'

	res = requests.post(login_url, json = login_query)
	if not res.ok:
		res.raise_for_status()
	else:
		login_feedback = json.loads(res.content)
		print(login_feedback)
		if 'error' not in login_feedback:
			id = login_feedback['restaurant_id']

			orders_url = DATABASE_URL + "/order/restaurant/" + str(id)
			res = requests.get(orders_url)
			if not res.ok:
				res.raise_for_status()
			else:
				session['username'] = request.form['email']
				return redirect('/restaurant/home')
		else:
			return render_template('login_restaurant.tpl', error="Invalid Login")


# Endpoint to view homepage
@app.route("/restaurant/home")
def home_restaurant():
	if 'username' not in session:
		print("Login screen -----------------------------------")
		return render_template('login_restaurant.tpl')
	else:
		username = session['username']

		restaurant_info_url = DATABASE_URL + "/restaurant/email"

		email = {
			"email": str(username),
	"key": SECURE_DATABASE_KEY
		}

		res = requests.post(restaurant_info_url, json = email)
		if not res.ok:
			res.raise_for_status()

		restaurant_info = json.loads(res.content)
		id = restaurant_info['restaurant_id']

		orders_url = DATABASE_URL + "/order/restaurant/" + str(id)
		res = requests.get(orders_url)
		if not res.ok:
			res.raise_for_status()
		else:
			orders = json.loads(res.content)
			length_orders = 0
			for order in orders:
				if order['paid'] and not order['delivered']:
					length_orders += 1

			return render_template('home_restaurant.tpl', \
				id=id, length_orders=length_orders)


@app.route("/restaurant/about")
def about_restaurant():
	if 'username' not in session:
		print("Login screen -----------------------------------")
		return render_template('login_restaurant.tpl')

	username = session['username']

	restaurant_info_url = DATABASE_URL + "/restaurant/email"

	email = {
		"email": str(username),
	"key": SECURE_DATABASE_KEY
	}

	res = requests.post(restaurant_info_url, json = email)
	if not res.ok:
		res.raise_for_status()

	restaurant_info = json.loads(res.content)
	id = restaurant_info['restaurant_id']
	orders_url = DATABASE_URL + "/order/restaurant/" + str(id)
	res = requests.get(orders_url)
	if not res.ok:
		res.raise_for_status()
	else:
		orders = json.loads(res.content)
		length_orders = 0
		for order in orders:
			if order['paid'] and not order['delivered']:
				length_orders += 1

	return render_template('about_restaurant.tpl', id=id,\
		 length_orders=length_orders)

# Endpoint to view restaurant's orders
@app.route("/orders")
def orders():
	if 'username' not in session:
		print("Login screen -----------------------------------")
		return render_template('login_restaurant.tpl')

	username = session['username']

	restaurant_info_url = DATABASE_URL + "/restaurant/email"

	email = {
		"email": str(username),
	"key": SECURE_DATABASE_KEY
	}

	res = requests.post(restaurant_info_url, json = email)
	if not res.ok:
		res.raise_for_status()

	restaurant_info = json.loads(res.content)
	id = restaurant_info['restaurant_id']

	orders_url = DATABASE_URL + "/order/restaurant/" + str(id)
	res = requests.get(orders_url)
	if not res.ok:
		res.raise_for_status()

	orders = json.loads(res.content)
	active = []
	pending = []
	delivered = []
	# For logging purposes
	length_orders = 0
	for order in orders:
		price = 0
		packages = []
		for package in order['food_items']:
			food_id = package['food_id']
			# look up food_id
			lookup_food_url = DATABASE_URL + "/food/" + str(food_id)
			res = requests.get(lookup_food_url)
			if not res.ok:
				res.raise_for_status()
			package['image'] = json.loads(res.content)['image']
			price += package['subtotal']
			packages.append(package['food_title'])

		order['price'] = price
		order['packages'] = packages

		order['phone'] = _getJSON(DATABASE_URL + "/user/" + str(order['user_id']))['phone']

		if order['delivered']:
			delivered.append(order)
		elif order['paid']:
			active.append(order)
		else:
			pending.append(order)

	length_orders = len(active)
	return render_template('orders_restaurant.tpl', pending=pending, \
		active=active, delivered=delivered, id=id, length_orders = length_orders)

# Endpoint to view the restaurant account page
@app.route("/restaurant/account")
def account_restaurant():
	if 'username' not in session:
		print("Login screen -----------------------------------")
		return render_template('login_restaurant.tpl')

	username = session['username']

	restaurant_info_url = DATABASE_URL + "/restaurant/email"

	email = {
		"email": str(username),
	"key": SECURE_DATABASE_KEY
	}

	res = requests.post(restaurant_info_url, json = email)
	if not res.ok:
		res.raise_for_status()

	restaurant_info = json.loads(res.content)
	id = restaurant_info['restaurant_id']


	restaurant_info_url = DATABASE_URL + "/restaurant/" + str(id)
	res = requests.get(restaurant_info_url)

	if not res.ok:
		res.raise_for_status()
	else:
		restaurant_info = json.loads(res.content)
		print ("Request Successful: ")
		for piece in restaurant_info:
			print(restaurant_info[piece])
			print(piece)

		name = restaurant_info['name']
		description = restaurant_info['description']
		phone = restaurant_info['phone']
		address = restaurant_info['address']
		image = restaurant_info['image']
		email = restaurant_info['email']
		website = restaurant_info['website']
		primaryEmail = restaurant_info['primaryEmail']
		primaryFirstName = restaurant_info['primaryFirstName']
		primaryLastName = restaurant_info['primaryLastName']
		primaryPhone = restaurant_info['primaryPhone']
		secondaryEmail = restaurant_info['secondaryEmail']
		secondaryFirstName = restaurant_info['secondaryFirstName']
		secondaryLastName = restaurant_info['secondaryLastName']
		secondaryPhone = restaurant_info['secondaryPhone']

	orders_url = DATABASE_URL + "/order/restaurant/" + str(id)
	res = requests.get(orders_url)
	if not res.ok:
		res.raise_for_status()
	else:
		orders = json.loads(res.content)
		length_orders = 0
		length_pending_orders = 0
		length_complete_orders = 0
		for order in orders:
			if order['paid'] and order['delivery_in_process']:
				length_orders += 1

			elif order['paid'] and not order['delivery_in_process'] and order['delivered']:
				length_complete_orders += 1

			elif not order['paid']:
				length_pending_orders += 1

	listings_url = DATABASE_URL + "/food/restaurant/" + str(id)
	res = requests.get(listings_url)

	if not res.ok:
		res.raise_for_status()
	else:
		listings = json.loads(res.content)
		length_listings = len(listings)

	print("RETURNING TEMPLATE ---------------------------------------------")

	error = request.args.get('error')
	if error is None:
		error = ""

	return render_template('account_restaurant.tpl',length_complete_orders=length_complete_orders,\
		secondaryFirstName=secondaryFirstName,primaryPhone=primaryPhone,primaryEmail=primaryEmail,\
		name=name, description=description,phone=phone,length_pending_orders=length_pending_orders,\
		secondaryPhone=secondaryPhone,primaryLastName=primaryLastName,address=address, image=image, \
		id=id, length_orders=length_orders,error=error,\
		secondaryLastName=secondaryLastName,secondaryEmail=secondaryEmail,primaryFirstName=primaryFirstName,\
		length_listings=length_listings, email=email, website=website)


# Endpoint to update account profile
@app.route("/restaurant/profile/update", methods=["POST"])
def profil_update():
    if 'username' not in session:
    	print("Login screen -----------------------------------")
    	return render_template('login_restaurant.tpl')

    username = session['username']

    restaurant_info_url = DATABASE_URL + "/restaurant/email"

    email = {
    	"email": str(username),
	"key": SECURE_DATABASE_KEY
    }

    res = requests.post(restaurant_info_url, json = email)
    if not res.ok:
    	res.raise_for_status()

    restaurant_info = json.loads(res.content)
    id = restaurant_info['restaurant_id']


    print("Updating account -------------------------------------------------")
    restaurant_name = request.form['restaurant_name']
    description = request.form['description']
    phone = request.form['phone']
    website = request.form['website']
    email = request.form['email']
    address = request.form['location']

    """if 'image' in request.files:
        img = request.files['image']
        if img is not None:
            response = cloudinary.uploader.upload(img)
            imgurl, options = cloudinary.utils.cloudinary_url(response['public_id'], format = response['format'], width=200, height=200, crop = "fit")
        else:
            imgurl = ""
    else:
        imgurl = """

    update_url = DATABASE_URL + '/restaurant/profile/' + str(id)

    info = {
    	"restaurant_name": restaurant_name,
    	"description": description,
    	"phone": phone,
    	"website": website,
    	"email": email,
    	"location": address,
    "key": SECURE_DATABASE_KEY
        #"image": imgurl
    }

    res = requests.put(update_url, json=info)
    if not res.ok:
    	res.raise_for_status()

    return redirect(url_for('account_restaurant'))

@app.route("/restaurant/image/update", methods=["POST"])
def image_update():

	username = session['username']

	restaurant_info_url = DATABASE_URL + "/restaurant/email"

	email = {
		"email": str(username),
	"key": SECURE_DATABASE_KEY
	}

	res = requests.post(restaurant_info_url, json = email)
	if not res.ok:
		res.raise_for_status()

	restaurant_info = json.loads(res.content)
	id = restaurant_info['restaurant_id']


	restaurant_info_url = DATABASE_URL + "/restaurant/" + str(id)
	res = requests.get(restaurant_info_url)

	if not res.ok:
		res.raise_for_status()
	else:
		restaurant_info = json.loads(res.content)
		print ("Request Successful: ")
		for piece in restaurant_info:
			print(restaurant_info[piece])
			print(piece)

		name = restaurant_info['name']
		description = restaurant_info['description']
		phone = restaurant_info['phone']
		address = restaurant_info['address']
		image = restaurant_info['image']
		email = restaurant_info['email']
		website = restaurant_info['website']
		primaryEmail = restaurant_info['primaryEmail']
		primaryFirstName = restaurant_info['primaryFirstName']
		primaryLastName = restaurant_info['primaryLastName']
		primaryPhone = restaurant_info['primaryPhone']
		secondaryEmail = restaurant_info['secondaryEmail']
		secondaryFirstName = restaurant_info['secondaryFirstName']
		secondaryLastName = restaurant_info['secondaryLastName']
		secondaryPhone = restaurant_info['secondaryPhone']

	orders_url = DATABASE_URL + "/order/restaurant/" + str(id)
	res = requests.get(orders_url)
	if not res.ok:
		res.raise_for_status()
	else:
		orders = json.loads(res.content)
		length_orders = 0
		length_pending_orders = 0
		length_complete_orders = 0
		for order in orders:
			if order['paid'] and order['delivery_in_process']:
				length_orders += 1

			elif order['paid'] and not order['delivery_in_process'] and order['delivered']:
				length_complete_orders += 1

			elif not order['paid']:
				length_pending_orders += 1

	listings_url = DATABASE_URL + "/food/restaurant/" + str(id)
	res = requests.get(listings_url)

	if not res.ok:
		res.raise_for_status()
	else:
		listings = json.loads(res.content)
		length_listings = len(listings)

	print("RETURNING TEMPLATE ---------------------------------------------")

	error = request.args.get('error')
	if error is None:
		error = ""

	if 'image' in request.files:
		img = request.files['image']
		if img is not None:
			response = cloudinary.uploader.upload(img)
			if int(response['width']) < 200 or int(response['height']) < 200:
				return render_template('account_restaurant.tpl',length_complete_orders=length_complete_orders,\
					secondaryFirstName=secondaryFirstName,primaryPhone=primaryPhone,primaryEmail=primaryEmail,\
					name=name, description=description,phone=phone,length_pending_orders=length_pending_orders,\
					secondaryPhone=secondaryPhone,primaryLastName=primaryLastName,address=address, image=image, \
					id=id, length_orders=length_orders,error=error,\
					secondaryLastName=secondaryLastName,secondaryEmail=secondaryEmail,primaryFirstName=primaryFirstName,\
					length_listings=length_listings, email=email, website=website, errorImage="Image width and height must be at least 200 pixels!")
			imgurl, options = cloudinary.utils.cloudinary_url(response['public_id'], width=200, height=200, format = response['format'],  gravity = "auto", crop = "fill", quality = 100, effect="sharpen")
			#updateImage = {"image": cloudinary.CloudinaryImage(img.filename).image()}
			updateImage = {"image": imgurl,
	"key": SECURE_DATABASE_KEY}
			update_image_url = DATABASE_URL + "/restaurant/image/" + str(id)
			requests.post(update_image_url, json=updateImage)
	return redirect(url_for('account_restaurant'))

@app.route("/restaurant/image/registrationUpdate", methods=["POST"])
def image_update_registration():
    username = session['username']

    restaurant_info_url = DATABASE_URL + "/restaurant/email"

    email = {
       "email": str(username),
	"key": SECURE_DATABASE_KEY
    }

    res = requests.post(restaurant_info_url, json = email)
    if not res.ok:
        res.raise_for_status()

    restaurant_info = json.loads(res.content)
    id = restaurant_info['restaurant_id']
    if 'image' in request.files:
        img = request.files['image']
        if img is not None:
            response = cloudinary.uploader.upload(img)
            imgurl, options = cloudinary.utils.cloudinary_url(response['public_id'], format = response['format'])
            #updateImage = {"image": cloudinary.CloudinaryImage(img.filename).image()}
            updateImage = {"image": imgurl,
	"key": SECURE_DATABASE_KEY}
            update_image_url = DATABASE_URL + "/restaurant/image/" + str(id)
            requests.post(update_image_url, json=updateImage)
    return render_template('create_account_restaurant.tpl', image=imgurl)

# Endpoint to update the account pane of the restaurant
@app.route("/restaurant/account/update", methods=["POST"])
def restaurant_account_update():
	if 'username' not in session:
		print("Login screen -----------------------------------")
		return render_template('login_restaurant.tpl')

	username = session['username']

	restaurant_info_url = DATABASE_URL + "/restaurant/email"

	email = {
		"email": str(username),
	"key": SECURE_DATABASE_KEY
	}

	res = requests.post(restaurant_info_url, json = email)
	if not res.ok:
		res.raise_for_status()

	restaurant_info = json.loads(res.content)
	id = restaurant_info['restaurant_id']
	print("Updating account -------------------------------------------------")

	password = request.form['password']
	password2 = request.form['password2']
	if password != password2:
		return redirect(url_for('account_restaurant', error="Password Validation Incorrect"))

	firstPrim = request.form['p_first_name']
	lastPrim = request.form['p_last_name']
	emailPrim = request.form['p_email']
	phonePrim = request.form['p_phone']

	firstSec = request.form['s_first_name']
	lastSec = request.form['s_last_name']
	emailSec = request.form['s_email']
	phoneSec = request.form['s_phone']

	if password is not None and password != "":
		info = {
			"firstPrim": firstPrim,
			"lastPrim": lastPrim,
			"emailPrim": emailPrim,
			"phonePrim": phonePrim,
			"firstSec": firstSec,
			"lastSec": lastSec,
			"emailSec": emailSec,
			"phoneSec": phoneSec,
			"password": password,
    "key": SECURE_DATABASE_KEY
		}
	else:
		info = {
			"firstPrim": firstPrim,
			"lastPrim": lastPrim,
			"emailPrim": emailPrim,
			"phonePrim": phonePrim,
			"firstSec": firstSec,
			"lastSec": lastSec,
			"emailSec": emailSec,
			"phoneSec": phoneSec,
    "key": SECURE_DATABASE_KEY
		}

	update_url = DATABASE_URL + "/restaurant/account/" + str(id)

	res = requests.put(update_url, json=info)
	if not res.ok:
		res.raise_for_status()

	return redirect(url_for('account_restaurant'))

# Endpoint to view restaurant's listings
@app.route("/listings")
def listings():
	if 'username' not in session:
		print("Login screen -----------------------------------")
		return render_template('login_restaurant.tpl')


	username = session['username']

	restaurant_info_url = DATABASE_URL + "/restaurant/email"

	email = {
		"email": str(username),
	"key": SECURE_DATABASE_KEY
	}

	res = requests.post(restaurant_info_url, json = email)
	if not res.ok:
		res.raise_for_status()

	restaurant_info = json.loads(res.content)
	id = restaurant_info['restaurant_id']

	listings_url = DATABASE_URL + "/food/restaurant/" + str(id)
	res = requests.get(listings_url)

	if not res.ok:
		res.raise_for_status()
	else:
		listings = json.loads(res.content)
		active_listings = []
		inactive_listings = []
		for listing in listings:
			if listing['allergies'] is "":
				listing['allergies'] = []
			else:
				listing['allergies'] = listing['allergies'].split(",")
			if listing['active']:
				active_listings.append(listing)
			else:
				inactive_listings.append(listing)

	orders_url = DATABASE_URL + "/order/restaurant/" + str(id)
	res = requests.get(orders_url)
	if not res.ok:
		res.raise_for_status()
	else:
		orders = json.loads(res.content)
		length_orders = 0
		for order in orders:
			if order['paid'] and not order['delivered']:
				length_orders += 1

	r = make_response(render_template('listings_restaurant.tpl',
	active_listings=active_listings, \
	id=id, length_orders=length_orders, inactive_listings=inactive_listings))

	r.headers["Pragma"] = "no-cache"
	r.headers["Expires"] = "0"
	r.headers['Cache-Control'] = 'public, max-age=0'
	return r

# Endpoint to delete a restaurant listing.
@app.route("/listings/delete/<food_id>", methods=["POST"])
def delete_listing(food_id):
	remove_listing_url = DATABASE_URL + "/food/" + food_id
	res = requests.delete(remove_listing_url, json={
    "key": SECURE_DATABASE_KEY})
	if not res.ok:
		res.raise_for_status()
	return redirect('/listings')

# Endpoint to add a new restaurant listing.
@app.route("/listings/add", methods=["POST"])
def add_listing():
    if 'username' not in session:
        print("Login screen -----------------------------------")
        return render_template('login_restaurant.tpl')

    username = session['username']

    restaurant_info_url = DATABASE_URL + "/restaurant/email"

    email = {
        "email": str(username),
	"key": SECURE_DATABASE_KEY
    }

    res = requests.post(restaurant_info_url, json = email)
    if not res.ok:
        res.raise_for_status()

    restaurant_info = json.loads(res.content)
    id = restaurant_info['restaurant_id']

    add_food_url = DATABASE_URL + "/food"
    allergens = ""
    for checkbox in range(1, 10):
        value = request.form.get('allergens' + str(checkbox))
        if value:
            allergens += value + ","

    if (len(allergens) > 0):
        # allergens ends with a comma if there is at least one value appended, remove it
        allergens = allergens[:-1]

    entry = {
        "title": request.form.get('title'),
        "description": request.form.get('description'),
        "image": "/static/img/burrito.jpg",
        "quantity_fed": request.form.get('quantity'),
        "price": request.form.get('price'),
        "allergies": allergens,
        "restaurant_id": id,
        "cuisine": "IMPLEMENT_LATER",
        "timesOrdered": 0,
	"key": SECURE_DATABASE_KEY
    }
    # Replace default image with uploaded image if it exists
    # TODO: Replace with image upload to remote server


    res = requests.post(add_food_url, json = entry)
    if not res.ok:
        res.raise_for_status()

    if 'image' in request.files:
        img = request.files['image']
        if img is not None:
            response = cloudinary.uploader.upload(img)

            imgurl, options = cloudinary.utils.cloudinary_url(response['public_id'], format = response['format'], width = 200, height = 200, gravity = "auto", crop = "fill", transformation = [{"quality":100}, {"effect": "improve"}])
            #updateImage = {"image": cloudinary.CloudinaryImage(img.filename).image()}
            updateImage = {"image": imgurl,
	"key": SECURE_DATABASE_KEY}
            update_image_url = DATABASE_URL + "/food/image/" + str(json.loads(res.content)['food_id'])
            requests.post(update_image_url, json=updateImage)

    return redirect('/listings')

# Endpoint to update a new restaurant listing.
@app.route("/listings/update", methods=["POST"])
def update_listing():

    if 'username' not in session:
        print("Login screen -----------------------------------")
        return render_template('login_restaurant.tpl')

    username = session['username']

    restaurant_info_url = DATABASE_URL + "/restaurant/email"

    email = {
        "email": str(username),
	"key": SECURE_DATABASE_KEY
    }

    res = requests.post(restaurant_info_url, json = email)
    if not res.ok:
        res.raise_for_status()

    restaurant_info = json.loads(res.content)
    id = restaurant_info['restaurant_id']


    food_id = str(request.form.get("food_id"))
    add_food_url = DATABASE_URL + "/food/" + food_id
    allergens = ""
    for checkbox in range(1, 10):
        value = request.form.get('allergens' + str(checkbox))
        if value:
            allergens += value + ","

    if (len(allergens) > 0):
        # allergens ends with a comma if there is at least one value appended, remove it
        allergens = allergens[:-1]

    updatedEntry = {
        "title": request.form.get('title'),
        "description": request.form.get('description'),
        "quantity_fed": request.form.get('quantity'),
        "price": request.form.get('price'),
        "allergies": allergens,
    "key": SECURE_DATABASE_KEY
        }

    # Replace default image with uploaded image if it exists
    # TODO: Replace with image upload to remote server
    if 'image' in request.files:
        img = request.files['image']
        if img is not None:
            # Img url is unique name based on the food id
            response = cloudinary.uploader.upload(img)
            if int(response['width']) < 200 or int(response['height']) < 200:
            	return redirect(url_for('listings'))

            imgurl, options = cloudinary.utils.cloudinary_url(response['public_id'], format = response['format'], width = 200, height = 200, gravity = "auto", crop = "fill", transformation = [{"quality":100, "effect": "sharpen"}])
            updateImage = {"image": imgurl}
            updatedEntry["image"] = imgurl

    res = requests.put(add_food_url, json = updatedEntry)
    if not res.ok:
        res.raise_for_status()

    return redirect('/listings')

# Endpoint to make a restaurant listing active or inactive.
@app.route("/toggle/active", methods=["POST"])
def toggle_active():
	if 'username' not in session:
		print("Login screen -----------------------------------")
		return render_template('login_restaurant.tpl')

	username = session['username']

	restaurant_info_url = DATABASE_URL + "/restaurant/email"

	email = {
		"email": str(username),
	"key": SECURE_DATABASE_KEY
	}

	res = requests.post(restaurant_info_url, json = email)
	if not res.ok:
		res.raise_for_status()

	restaurant_info = json.loads(res.content)
	id = restaurant_info['restaurant_id']

	food_id = request.form.get('food_id')
	toggle_food_url = DATABASE_URL + "/food/toggle_active/" + food_id
	res = requests.post(toggle_food_url, json={
	"key": SECURE_DATABASE_KEY})
	if not res.ok:
		res.raise_for_status()
	return redirect('/listings')


# Endpoint to deny an order.
@app.route("/order/deny", methods=["POST"])
def order_deny_rest():
	if 'username' not in session:
		print("Login screen -----------------------------------")
		return render_template('login_restaurant.tpl')

	username = session['username']

	restaurant_info_url = DATABASE_URL + "/restaurant/email"

	email = {
		"email": str(username),
	"key": SECURE_DATABASE_KEY
	}

	res = requests.post(restaurant_info_url, json = email)
	if not res.ok:
		res.raise_for_status()

	restaurant_info = json.loads(res.content)
	id = restaurant_info['restaurant_id']


	order_id = request.form.get('order_id')
	delete_order_url = DATABASE_URL + "/order/" + order_id
	res = requests.delete(delete_order_url, json={
    "key": SECURE_DATABASE_KEY})
	if not res.ok:
		res.raise_for_status()

	# Send email to restaurant
	msg = mail.send_message(
	'Denied TigerMeals Delivery order request!',
	sender='tigermealsdelivery@gmail.com',
	recipients=[email['email']],
	html=rest_denied_html())

	# Send email to user
	msg = mail.send_message(
	'Your TigerMeals Delivery order was denied.',
	sender='tigermealsdelivery@gmail.com',
	recipients=[json.loads(res.content)['email']],
	html=user_denied_html())

	return redirect('/orders')


# Endpoint to approve an order.
@app.route("/order/approve", methods=["POST"])
def order_approve_rest():
    if 'username' not in session:
        print("Login screen -----------------------------------")
        return render_template('login_restaurant.tpl')

    username = session['username']

    restaurant_info_url = DATABASE_URL + "/restaurant/email"

    email = {
        "email": str(username),
	"key": SECURE_DATABASE_KEY
    }

    res = requests.post(restaurant_info_url, json = email)
    if not res.ok:
        res.raise_for_status()

    restaurant_info = json.loads(res.content)
    id = restaurant_info['restaurant_id']

    order_id = request.form.get('order_id')
    approve_order_url = DATABASE_URL + "/order/approval/" + order_id

    res = requests.post(approve_order_url, json = {
	"key": SECURE_DATABASE_KEY})
    if not res.ok:
        res.raise_for_status()
        return None

    # Send email to restaurant
    msg = mail.send_message(
    'Approved TigerMeals Delivery order request!',
    sender='tigermealsdelivery@gmail.com',
    recipients=[email['email']],
    html=rest_approved_html())

    # Send email to user
    msg = mail.send_message(
    'Your TigerMeals Delivery order was approved!',
    sender='tigermealsdelivery@gmail.com',
    recipients=[json.loads(res.content)['email']],
    html=user_approved_html())

    res = requests.get(DATABASE_URL + "/order/" + str(order_id))
    if not res.ok:
        res.raise_for_status()
        return None

    tokenInfo = json.loads(res.content)

    email = tokenInfo['email']
    stripeToken = None
    amount = 0
    if 'stripeToken' in tokenInfo:
    	stripeToken = tokenInfo['stripeToken']
    if 'amount' in tokenInfo:
    	amount = tokenInfo['amount']


    if stripeToken is not None and stripeToken != "":
        try:
            customer = stripe.Customer.create(
                email=email,
                source=stripeToken
            )

            charge = stripe.Charge.create(
                customer=customer.id,
                amount=int(amount),
                currency='usd',
                description='Catering Payment'
            )

        except stripe.error.CardError as e:
            print("error")
    return redirect('/orders')

# Endpoint to mark an order as delivered.
@app.route("/order/delivered", methods=["POST"])
def order_delivered_rest():
	if 'username' not in session:
		print("Login screen -----------------------------------")
		return render_template('login_restaurant.tpl')

	username = session['username']

	restaurant_info_url = DATABASE_URL + "/restaurant/email"

	email = {
		"email": str(username),
	"key": SECURE_DATABASE_KEY
	}

	res = requests.post(restaurant_info_url, json = email)
	if not res.ok:
		res.raise_for_status()

	restaurant_info = json.loads(res.content)
	id = restaurant_info['restaurant_id']

	order_id = request.form.get('order_id')
	delivered_order_url = DATABASE_URL + "/order/delivered/" + order_id
	res = requests.post(delivered_order_url, json={
	"key": SECURE_DATABASE_KEY})
	if not res.ok:
		res.raise_for_status()

	# Send email to user
	msg = mail.send_message(
	'Your TigerMeals Delivery order was marked as delivered!',
	sender='tigermealsdelivery@gmail.com',
	recipients=[json.loads(res.content)['email']],
	html=order_delivered_html())

	# Send email to restaurant
	msg = mail.send_message(
	'Your TigerMeals Delivery order was marked as delivered!',
	sender='tigermealsdelivery@gmail.com',
	recipients=[email['email']],
	html=order_delivered_html())


	return redirect('/orders')
