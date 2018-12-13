from flask import Flask, request, make_response, jsonify, render_template, redirect
from flask import session, url_for
from flask_mail import Mail,  Message
from tigermeals.mail_html import user_approved_html, rest_approved_html, user_denied_html, rest_denied_html, order_delivered_html
import requests
import json
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

# DATABASE_URL = "http://hidden-springs-97786.herokuapp.com"
DATABASE_URL="http://localhost:5000"


# Endpoint to logout a restaurant
@app.route("/restaurant/logout")
def logout():
    # remove the username from the session
    session.pop('username', None)
    return redirect(url_for('portal'))

# Endpoint to login a restaurant
@app.route("/login", methods=['POST'])
def login():

    if 'username' in session:
        return redirect('/home')

    login_query = {
        "email": request.form['email'],
        "password": request.form['password']
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
            "email": str(username)
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
        "email": str(username)
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
        "email": str(username)
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
        return

    orders = json.loads(res.content)
    active = []
    pending = []
    delivered = []
    # For logging purposes
    print ("Request Successful: ")
    length_orders = 0
    for order in orders:
        price = 0
        packages = []
        for package in order['food_items']:
            price += package['subtotal']
            packages.append(package['food_title'])
        for key in order:
            print (key + " : " + str(order[key]))
        order['price'] = price
        order['packages'] = packages
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
        "email": str(username)
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

    listings_url = DATABASE_URL + "/food/restaurant/" + str(id)
    res = requests.get(listings_url)

    if not res.ok:
        res.raise_for_status()
    else:
        listings = json.loads(res.content)
        length_listings = len(listings)

    return render_template('account_restaurant.tpl',\
        name=name, description=description,phone=phone,\
        address=address, image=image, id=id, length_orders=length_orders,\
        length_listings=length_listings, email=email, website=website)

# Endpoint to view restaurant's listings
@app.route("/listings")
def listings():
    if 'username' not in session:
        print("Login screen -----------------------------------")
        return render_template('login_restaurant.tpl')


    username = session['username']

    restaurant_info_url = DATABASE_URL + "/restaurant/email"

    email = {
        "email": str(username)
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
        print ("Request Successful: ")
        for listing in listings:
            for key in listing:
                print (key + " : " + str(listing[key]))
            if listing['allergies'] is "":
                listing['allergies'] = []
            else:
                listing['allergies'] = listing['allergies'].split(",")
            if listing['active']:
                active_listings.append(listing)
            else:
                inactive_listings.append(listing)
        print ()

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

# Endpoint to add a new restaurant listing.
@app.route("/listings/add", methods=["POST"])
def add_listing():
    if 'username' not in session:
        print("Login screen -----------------------------------")
        return render_template('login_restaurant.tpl')

    username = session['username']

    restaurant_info_url = DATABASE_URL + "/restaurant/email"

    email = {
        "email": str(username)
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
    }
    # Replace default image with uploaded image if it exists
    # TODO: Replace with image upload to remote server


    res = requests.post(add_food_url, json = entry)
    if not res.ok:
        res.raise_for_status()

    if 'image' in request.files:
        img = request.files['image']
        if img != None:
            # Create unique url of restaurant id + food title
            # Since this is a new food item it does not yet have an ID
            """print(img)
            print(img.filename)
            print(img.stream)
            print(type(img))"""
            
            #img_url = '/static/img/' + str(json.loads(res.content)['food_id']) + '.jpg'
            #img.save('tigermeals/' + img_url)
            #updateImage = {"image": img_url}
            response = cloudinary.uploader.upload(img)
            imgurl, options = cloudinary.utils.cloudinary_url(response['public_id'], format = response['format'], width=200, height=200, crop = "fit")
            #updateImage = {"image": cloudinary.CloudinaryImage(img.filename).image()}
            updateImage = {"image": imgurl}
            print(updateImage)
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
        "email": str(username)
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
        }

    # Replace default image with uploaded image if it exists
    # TODO: Replace with image upload to remote server
    if 'image' in request.files:
        img = request.files['image']
        if img != None:
            # Img url is unique name based on the food id
            response = cloudinary.uploader.upload(img)
            imgurl, options = cloudinary.utils.cloudinary_url(response['public_id'], format = response['format'], width=200, height=200, crop = "fit")
            #updateImage = {"image": cloudinary.CloudinaryImage(img.filename).image()}
            updateImage = {"image": imgurl}
            print(updateImage)
            #update_image_url = DATABASE_URL + "/food/image/" + str(json.loads(res.content)['food_id'])
            #requests.post(update_image_url, json=updateImage)
            #img_url = '/static/img/' + food_id + '.jpg'
            #img.save('tigermeals' + img_url)
            updatedEntry["image"] = imgurl

    res = requests.put(add_food_url, json = updatedEntry)
    print (updatedEntry)
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
        "email": str(username)
    }

    res = requests.post(restaurant_info_url, json = email)
    if not res.ok:
        res.raise_for_status()

    restaurant_info = json.loads(res.content)
    id = restaurant_info['restaurant_id']

    food_id = request.form.get('food_id')
    toggle_food_url = DATABASE_URL + "/food/toggle_active/" + food_id
    res = requests.post(toggle_food_url)
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
        "email": str(username)
    }

    res = requests.post(restaurant_info_url, json = email)
    if not res.ok:
        res.raise_for_status()

    restaurant_info = json.loads(res.content)
    id = restaurant_info['restaurant_id']


    order_id = request.form.get('order_id')
    delete_order_url = DATABASE_URL + "/order/" + order_id
    res = requests.delete(delete_order_url)
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
        "email": str(username)
    }

    res = requests.post(restaurant_info_url, json = email)
    if not res.ok:
        res.raise_for_status()

    restaurant_info = json.loads(res.content)
    id = restaurant_info['restaurant_id']

    order_id = request.form.get('order_id')
    approve_order_url = DATABASE_URL + "/order/approval/" + order_id

    res = requests.post(approve_order_url)
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
    stripeToken = tokenInfo['stripeToken']
    amount = tokenInfo['amount']

    if stripeToken is not None and stipeToken != "":
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
        "email": str(username)
    }

    res = requests.post(restaurant_info_url, json = email)
    if not res.ok:
        res.raise_for_status()

    restaurant_info = json.loads(res.content)
    id = restaurant_info['restaurant_id']

    order_id = request.form.get('order_id')
    delivered_order_url = DATABASE_URL + "/order/delivered/" + order_id
    res = requests.post(delivered_order_url)
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
