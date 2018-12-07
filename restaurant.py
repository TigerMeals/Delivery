from flask import Flask, request, make_response, jsonify, render_template, redirect
from flask import session, url_for
import requests
import json
import os

app = Flask(__name__)
app.config["DEBUG"] = True
app.config['SEND_FILE_MAX_AGE_DEFAULT'] = 0
DATABASE_URL = "http://localhost:5000"


# Endpoint to logout a restaurant
@app.route("/logout")
def logout():
    # remove the username from the session
    session.pop('username', None)
    return redirect(url_for('home'))

@app.route("/portal")
def portal():
    return render_template("portal.tpl")

# Endpoint to login a restaurant
@app.route("/login", methods=['POST'])
def login():
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
                return redirect('/home')
        else:
            return render_template('login_restaurant.tpl', error="Invalid Login")

# Endpoint to view homepage
@app.route("/")
@app.route("/home")
def home():
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
                if order['paid']:
                    length_orders += 1

            return render_template('home_restaurant.tpl', \
                id=id, length_orders=length_orders)


@app.route("/about")
def about():
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
            if order['paid']:
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
    else:
        orders = json.loads(res.content)
        active = []
        pending = []
        # For logging purposes
        print ("Request Successful: ")
        length_orders = 0
        for order in orders:
            if order['paid']:
                length_orders += 1
            price = 0
            packages = []
            for package in order['food_items']:
                price += package['subtotal']
                packages.append(package['food_title'])
            for key in order:
                print (key + " : " + str(order[key]))
            order['price'] = price
            order['packages'] = packages
            if order['paid']:
                active.append(order)
            else:
                pending.append(order)


    return render_template('orders_restaurant.tpl', pending=pending, \
        active=active, id=id, length_orders = length_orders)

# Endpoint to view the restaurant account page
@app.route("/account")
def account():
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
            if order['paid']:
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
            if order['paid']:
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
    for checkbox in range(1, 5):
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
            img_url = 'static/img/' + str(json.loads(res.content)['food_id']) + '.jpg'
            img.save(img_url)
            updateImage = {"image": "/" + img_url}
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
    for checkbox in range(1, 5):
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
            img_url = 'static/img/' + food_id + '.jpg'
            img.save(img_url)
            updatedEntry["image"] = "/" + img_url

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
def order_deny():
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
    return redirect('/orders?id=' + id)


# Endpoint to approve an order.
@app.route("/order/approve", methods=["POST"])
def order_approve():
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
    return redirect('/orders')

if __name__ == '__main__':
    app.secret_key = "kdlr3whrlq3ul8wDLI*ALDA(D*S(*Ah"
    app.run(port = 8081, host = '0.0.0.0')
