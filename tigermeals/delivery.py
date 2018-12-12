from flask import Flask, make_response, \
request, jsonify, render_template, redirect, url_for
from flask_mail import Mail,  Message
from tigermeals.mail_html import user_order_html, rest_order_html
import requests
import json
import os
from flask_cas import CAS, login_required, login, logout
from tigermeals import app

cas = CAS(app, '/cas')
cas.init_app(app)
DATABASE_URL = "http://hidden-springs-97786.herokuapp.com"
app.secret_key = 'dfasdkfjadkjfasdkjfhasdkjfh'
app.config['CAS_SERVER'] = 'https://fed.princeton.edu'
app.config['CAS_LOGIN_ROUTE'] = '/cas/login'
app.config['CAS_AFTER_LOGIN'] = 'home'
app.config['CAS_VALIDATE_ROUTE'] = '/cas/serviceValidate'
app.config['DEBUG'] = True
app.config['MAIL_SERVER'] = 'smtp.gmail.com'
app.config['MAIL_PORT'] = 465
app.config['MAIL_USE_SSL'] = True
app.config['MAIL_USERNAME'] = 'tigermealsdelivery@gmail.com'
app.config['MAIL_PASSWORD'] = 'aksnpqtutouldhna'
mail = Mail(app)


def _getCart(user_id):
    order = _getJSON(DATABASE_URL + "/order/current/" + str(user_id))
    food_prices = []
    food_descriptions = []
    food_titles = []
    food_quantity_feds = []
    food_images = []
    food_subtotals = []
    food_multiplier = []
    food_ids = []

    for food_item in order['food_items']:
        print (food_item['food_id'])
        food = _getJSON(DATABASE_URL + '/food/' + str(food_item['food_id']))

        food_prices.append(food['price'])
        food_descriptions.append(food['description'])
        food_titles.append(food['title'])
        food_quantity_feds.append(food['quantity_fed'])
        food_images.append(food['image'])
        food_subtotals.append(food_item['subtotal'])
        food_multiplier.append(food_item['quantity'])
        food_ids.append(food_item['food_id'])

    if user_id is None:
        # Redirect to login screen if the cookie is None
        pass

    print (food_prices)
    print (food_descriptions)
    print (food_titles)
    print (food_quantity_feds)
    print (food_images)

    length_cart = len(food_prices)

    total = sum(food_subtotals)

    return food_prices, food_descriptions, food_titles, food_quantity_feds,\
        food_images, length_cart, food_subtotals, total, food_multiplier, food_ids



# Get the current user information
def _getUser(user_id):
    data = _getJSON(DATABASE_URL + '/user/' + str(user_id))

    email = str(data['email'])
    name = str(data['name'])
    phone = str(data['phone'])
    address = str(data['address'])
    netid = str(data['netid'])
    allergies = str(data['allergies'])

    return email, name, phone, address, netid, allergies


## PRIVATE METHODS. GET METHOD
def _getJSON(url):
    r = requests.get(url=url)
    data = r.json()

    print (data)
    return (data)

## POST METHOD
def _postJSON(url, data):
    r = requests.post(url=url, data=data)

    response = r.json()
    return response


##### SIMPLE SCREEN NAVIGATION ------------------------------------------------
# Portal that connects user & restaurant side.
@app.route("/portal")
@app.route("/")
def portal():
    return render_template("portal.tpl")

@app.route("/home")
@login_required
def home():
    print("home template requested -----------------------------")

    netid = cas.username
    print(netid)
    print(type(netid))

    print(cas.attributes)

    LOGIN_URL = DATABASE_URL + '/user/login'

    data = {
        "netid": netid
    }

    fetch_req = requests.post(url=LOGIN_URL, json=data)

    user_id = fetch_req.json()['user_id']
    print(user_id)

    food_prices, food_descriptions, food_titles, food_quantity_feds,\
        food_images, length_cart, food_subtotals, total, food_multiplier, food_ids = _getCart(user_id)

    resp = (render_template('home.tpl', user_id=user_id, food_prices=food_prices,\
        food_descriptions=food_descriptions, food_titles=food_titles,food_ids=food_ids,\
        food_quantity_feds=food_quantity_feds, food_images=food_images,\
        length_cart=length_cart, food_subtotals=food_subtotals, total=total, id=user_id))


    print("User Id: " + str(user_id))
    if user_id is None:
        # Redirect to login screen if the cookie is None
        pass



    return resp

@app.route("/cart")
@login_required
def cart():
    print("cart template requested -----------------------------")
    netid = cas.username
    print(netid)
    print(type(netid))

    LOGIN_URL = DATABASE_URL + '/user/login'

    data = {
        "netid": netid
    }

    fetch_req = requests.post(url=LOGIN_URL, json=data)

    user_id = fetch_req.json()['user_id']
    print(user_id)

    food_prices, food_descriptions, food_titles, food_quantity_feds,\
        food_images, length_cart, food_subtotals, total, food_multiplier, food_ids = _getCart(user_id)


    return render_template('cart.tpl', user_id=user_id, food_prices=food_prices,\
        food_descriptions=food_descriptions, food_titles=food_titles,\
        food_quantity_feds=food_quantity_feds, food_images=food_images,\
        length_cart=length_cart, food_subtotals=food_subtotals, total=total, food_multiplier = food_multiplier, food_ids = food_ids, id=user_id)

@app.route("/about")
@login_required
def about():
    print("about template requested -----------------------------")
    netid = cas.username
    print(netid)
    print(type(netid))

    LOGIN_URL = DATABASE_URL + '/user/login'

    data = {
        "netid": netid
    }

    fetch_req = requests.post(url=LOGIN_URL, json=data)

    user_id = fetch_req.json()['user_id']
    print(user_id)

    food_prices, food_descriptions, food_titles, food_quantity_feds,\
        food_images, length_cart, food_subtotals, total, food_multiplier, food_ids = _getCart(user_id)

    return render_template('about.tpl', user_id=user_id, food_prices=food_prices,\
        food_descriptions=food_descriptions, food_titles=food_titles,food_ids=food_ids,\
        food_quantity_feds=food_quantity_feds, food_images=food_images,\
        length_cart=length_cart, food_subtotals=food_subtotals, total=total, id=user_id)

@app.route("/checkout")
@login_required
def checkout():
    print("checkout template requested -----------------------------")
    netid = cas.username
    print(netid)
    print(type(netid))

    LOGIN_URL = DATABASE_URL + '/user/login'

    data = {
        "netid": netid
    }

    fetch_req = requests.post(url=LOGIN_URL, json=data)

    user_id = fetch_req.json()['user_id']
    print(user_id)

    food_prices, food_descriptions, food_titles, food_quantity_feds,\
        food_images, length_cart, food_subtotals, total, food_multiplier, food_ids = _getCart(user_id)

    email, name, phone, address, netid, allergies = _getUser(user_id)

    name = name.split()

    current_order_url = DATABASE_URL + "/order/current/" + str(user_id)
    res = requests.get(current_order_url)
    if not res.ok:
        res.raise_for_status()
    else:
        order_id = json.loads(res.content)['order_id']

    return render_template('checkout.tpl', user_id=user_id, food_prices=food_prices,\
        food_descriptions=food_descriptions, food_titles=food_titles,food_ids=food_ids,\
        food_quantity_feds=food_quantity_feds, food_images=food_images,\
        length_cart=length_cart, food_subtotals=food_subtotals, total=total, food_multiplier=food_multiplier,\
        email=email, name=name, phone=phone,address=address, netid=netid, id=user_id, order_id=order_id)

@app.route("/account")
@login_required
def account():
    print("account template requested -----------------------------")
    netid = cas.username
    print(netid)
    print(type(netid))

    LOGIN_URL = DATABASE_URL + '/user/login'

    data = {
        "netid": netid
    }

    fetch_req = requests.post(url=LOGIN_URL, json=data)

    user_id = fetch_req.json()['user_id']
    print(user_id)

    email, name, phone, address, netid, allergies = _getUser(user_id)

    print("Alleriges: ----------------------------------------------")

    # allergies = allergies.split(',')

    # allergyTemp = []
    # for allergy in allergies:
    #     allergyTemp.append(allergy.strip())

    # allergies = allergyTemp

    print(allergies)


    food_prices, food_descriptions, food_titles, food_quantity_feds,\
        food_images, length_cart, food_subtotals, total, food_multiplier, food_ids = _getCart(user_id)

    return render_template('account.tpl', name=name.split(), email=email,\
        phone=phone, address=address, allergies=allergies, netid=netid, user_id=user_id, food_prices=food_prices,\
        food_descriptions=food_descriptions, food_titles=food_titles,food_ids=food_ids,\
        food_quantity_feds=food_quantity_feds, food_images=food_images,\
        length_cart=length_cart, food_subtotals=food_subtotals, total=total, id=user_id)

    # food = _getJSON(DATABASE_URL + "/food/" + str(food_id))
    # print food

    # for food_item in current_order['food_items']:
    #     if food_item['food_id'] == food_id:
    #         food_item['quantity'] += quantity
    #         food_item['subtotal'] += food['price']
    #         url = DATABASE_URL + "/order/" + current_order['order_id']
    #         response = _postJSON(url, current_order)

    #         food_prices, food_descriptions, food_titles, food_quantity_feds,\
    #     food_images, length_cart, food_subtotals, total, food_multiplier, food_ids = _getCart(user_id)

    #         return render_template('index.tpl', user_id=user_id, food_prices=food_prices,\
    #     food_descriptions=food_descriptions, food_titles=food_titles,\
    #     food_quantity_feds=food_quantity_feds, food_images=food_images,\
    #     length_cart=length_cart, food_subtotals=food_subtotals, total=total)

    # food_prices.append(food['price'])
    # food_descriptions.append(food['description'])
    # food_titles.append(food['title'])
    # food_quantity_feds.append(food['quantity_fed'])
    # food_images.append(food['image'])
    # food_multiplier.append(quantity)


##### SIMPLE SCREEN NAVIGATION ------------------------------------------------


# Endpoint to delete an item from the current cart
@app.route("/cart/delete/<food_id>", methods=["POST"])
@login_required
def cart_delete(food_id):

    netid = cas.username
    print(netid)
    print(type(netid))

    print(cas.attributes)

    LOGIN_URL = DATABASE_URL + '/user/login'

    data = {
        "netid": netid
    }

    fetch_req = requests.post(url=LOGIN_URL, json=data)

    user_id = fetch_req.json()['user_id']
    print(user_id)

    order = _getJSON(DATABASE_URL + "/order/current/" + str(user_id))

    order_id = order['order_id']
    food_items = order['food_items']

    index = 0
    for food_item in food_items:
        if food_item['food_id'] == int(food_id):
            food_items.pop(index)
            break
        index += 1

    delete_url = DATABASE_URL + "/order/delete/" + str(order_id)

    json = {
        "food_items": food_items
    }

    res = requests.put(delete_url, json = json)
    if not res.ok:
        res.raise_for_status()

    return redirect("/cart")



# Endpoint to create new user
@app.route("/meals")
@login_required
def meals():
    meals_url = DATABASE_URL + "/food/sort/price/low-to-high"

    orders_url = DATABASE_URL + "/food/sort/price/low-to-high"
    netid = cas.username
    print(netid)
    print(type(netid))

    LOGIN_URL = DATABASE_URL + '/user/login'

    data = {
        "netid": netid
    }

    fetch_req = requests.post(url=LOGIN_URL, json=data)

    user_id = fetch_req.json()['user_id']
    print(user_id)

    food_prices, food_descriptions, food_titles, food_quantity_feds,\
    food_images, length_cart, food_subtotals, total, food_multiplier, food_ids = _getCart(user_id)

    restaurants_url = DATABASE_URL + "/restaurant"
    res = requests.get(restaurants_url)
    if not res.ok:
        res.raise_for_status()
    rests = json.loads(res.content)
    restaurants = []
    # Get updated list of restaurants from database for form options
    for rest in rests:
        if {"id": rest['restaurant_id'], "name": rest['name']} not in restaurants:
            restaurants.append({"id": rest['restaurant_id'], "name": rest['name']})

    res = requests.get(meals_url)

    if not res.ok:
        res.raise_for_status()
    else:
        meals = json.loads(res.content)
        length_meals = len(meals)
        # For logging purposes
        for meal in meals:
            # Make additional request to get restaurant name
            restaurantID = meal['restaurant_id']
            restaurant_url = DATABASE_URL + "/restaurant/" + str(restaurantID)
            res = requests.get(restaurant_url)
            # Splice allergies into a list
            if meal['allergies'] is "":
                meal['allergies'] = []
            else:
                meal['allergies'] = meal['allergies'].split(",")
            if not res.ok:
                res.raise_for_status()
                return None
            meal['restaurant'] = json.loads(res.content)['name']

            # For logging purposes
            for key in meal:
                print (key + " : " + str(meal[key]))
            print()


    error = request.args.get('error')

    r = make_response(render_template('meals.tpl', meals=meals, food_ids=food_ids,\
        id=user_id, food_prices = food_prices, error=error,\
        food_subtotals = food_subtotals, food_titles = food_titles, \
        length_cart = length_cart, total=total, food_images= food_images, length_meals=length_meals, restaurants=restaurants, current_filters=[], checkboxes=[]))

    r.headers["Pragma"] = "no-cache"
    r.headers["Expires"] = "0"
    r.headers['Cache-Control'] = 'public, max-age=0'
    return r

@app.route("/cart/upload", methods=["POST"])
@login_required
def upload_cart():
    netid = cas.username
    print(netid)
    print(type(netid))

    LOGIN_URL = DATABASE_URL + '/user/login'

    data = {
        "netid": netid
    }

    fetch_req = requests.post(url=LOGIN_URL, json=data)

    user_id = fetch_req.json()['user_id']
    print(user_id)

    current_order_url = DATABASE_URL + "/order/current/" + str(user_id)
    res = requests.get(current_order_url)
    if not res.ok:
        res.raise_for_status()
    else:
        order_id = json.loads(res.content)['order_id']
        old_food_items = json.loads(res.content)['food_items']
        current_order = json.loads(res.content)

        if old_food_items is None:
            old_food_items = []

        food_id = request.form.get('food_id')
        get_food_url = DATABASE_URL + "/food/" + str(food_id)
        res = requests.get(get_food_url)
        if not res.ok:
            res.raise_for_status()
        else:
            food_details = json.loads(res.content)

            print("Food Details: " + str(food_details))

            # Check to see if the restaurant is different
            if (food_details['restaurant_id'] != current_order['restaurant_id']) and (current_order['restaurant_id'] != -1):
                print("RESTAURANT NEEDS TO BE THE SAME--------------------------")
                print(current_order['restaurant_id'])
                print(food_details['restaurant_id'])

                return redirect(url_for('meals', error="PLEASE ONLY ORDER FROM ONE RESTAURANT PER ORDER"))

            # Check to see if the food item already exists within the order
            for food_item in old_food_items:
                if food_item['food_id'] == food_details['food_id']:
                    food_item['quantity'] += int(request.form.get('quantity'))
                    # if quantity is greater than 10, reject the request
                    if food_item['quantity'] > 10:
                        return redirect(url_for('meals', error="PLEASE ONLY ORDER A MAXIMUM OF 10 ITEMS OF A CATERING OPTION"))

                    food_item['subtotal'] = food_item['quantity'] * food_item['food_price']
                    updatedOrder = {
                        "user_id": user_id,
                        "food_items": old_food_items,
                        "restaurant_id": current_order['restaurant_id'],
                        "ordered": False,
                        "paid": False,
                        "date": None,
                        "order_time": None,
                        "delivery_time": None,
                        "location": None
                    }
                    update_order_url = DATABASE_URL + "/order/" + str(order_id)
                    res = requests.put(update_order_url, json = updatedOrder)
                    return redirect('/meals')



            old_food_items.append(
            {"food_title": food_details['title'],
             "food_id": food_details['food_id'],
             "food_quantity_fed": food_details['quantity_fed'],
             "food_price": food_details['price'],
             "quantity": int(request.form.get('quantity')),
             "customization": "N/A",
             "subtotal": int(request.form.get('quantity')) * food_details['price']}
             )

            print (old_food_items)

            updatedOrder = {
                "user_id": user_id,
                "food_items": old_food_items,
                "restaurant_id": food_details['restaurant_id'],
                "ordered": False,
                "paid": False,
                "date": None,
                "order_time": None,
                "delivery_time": None,
                "location": None
            }
            update_order_url = DATABASE_URL + "/order/" + str(order_id)
            res = requests.put(update_order_url, json = updatedOrder)
    return redirect('/meals')


@app.route("/ordered", methods=["POST"])
@login_required
def ordered():
    netid = cas.username
    print(netid)
    print(type(netid))

    LOGIN_URL = DATABASE_URL + '/user/login'

    data = {
        "netid": netid
    }

    fetch_req = requests.post(url=LOGIN_URL, json=data)

    user_id = fetch_req.json()['user_id']
    print(user_id)

    name = request.form.get('firstName') + " " + request.form.get('lastName')
    email = request.form.get('email')
    address = request.form.get('address')
    date = request.form.get('date')
    time = request.form.get('time')

    current_order_url = DATABASE_URL + "/order/current/" + str(user_id)
    res = requests.get(current_order_url)
    if not res.ok:
        res.raise_for_status()
        return None

    order_id = json.loads(res.content)['order_id']
    order_ordered_url = DATABASE_URL + "/order/ordered/" + str(order_id)

    formData = {
    "name": name,
    "email": email,
    "location": address,
    "date": date,
    "time": time
    }
    print (formData)
    res = requests.post(order_ordered_url, json=formData)
    if not res.ok:
        res.raise_for_status()
        return None

    msg = mail.send_message(
    'Your recent TigerMeals Delivery order!',
    sender='tigermealsdelivery@gmail.com',
    recipients=[email],
    html=user_order_html())

    restaurant_id = json.loads(res.content)['restaurant_id']
    restaurant_url = DATABASE_URL + "/restaurant/" + str(restaurant_id)
    res = requests.get(restaurant_url)

    if not res.ok:
        res.raise_for_status()
        return None

    rest = json.loads(res.content)
    print (rest)
    restEmail = rest['email']
    msg = mail.send_message(
    'New TigerMeals Delivery order request!',
    sender='tigermealsdelivery@gmail.com',
    recipients=[restEmail],
    html=rest_order_html())

    return redirect('/order/confirmed')

@login_required
@app.route('/order/confirmed')
def order_confirmed():
    netid = cas.username
    print(netid)
    print(type(netid))

    LOGIN_URL = DATABASE_URL + '/user/login'

    data = {
        "netid": netid
    }

    fetch_req = requests.post(url=LOGIN_URL, json=data)

    user_id = fetch_req.json()['user_id']
    print(user_id)

    return render_template('order_confirmed.tpl')

@app.route("/meals/filter", methods=["POST", "GET"])
@login_required
def filter():
    netid = cas.username
    print(netid)
    print(type(netid))

    LOGIN_URL = DATABASE_URL + '/user/login'

    data = {
        "netid": netid
    }

    fetch_req = requests.post(url=LOGIN_URL, json=data)

    user_id = fetch_req.json()['user_id']
    print(user_id)

    if request.method=="GET":
        return redirect('/meals')
    current_filters = []
    checkboxes = []
    # Get restaurant ids for selected restaurants
    restaurantsIds = []
    for checkbox in request.form:
        if checkbox == "sort":
            continue
        checkboxes.append(checkbox)
        if "restaurant" in checkbox:
            restaurantsIds.append(checkbox.split("restaurant_")[1].split("_")[1])
            current_filters.append(checkbox.split("restaurant_")[1].split("_")[0])
    cuisines = []
    for cuisine in ["Asian", "American", "Drinks", "Healthy"]:
        if request.form.get(cuisine) is not None:
            cuisines.append(cuisine)
            current_filters.append(cuisine)

    allergies = []
    for allergy in ["Contains dairy", "Contains meat", "Contains eggs", "Kosher"]:
        if request.form.get(allergy) is not None:
            allergies.append(allergy)
            current_filters.append(allergy)

    servings = []
    for serving in ["0-25", "25-50", "50-75", "75-100", "100-1000"]:
        if request.form.get(serving) is not None:
            servings.append(serving)
            current_filters.append(servings)

    food_prices, food_descriptions, food_titles, food_quantity_feds,\
    food_images, length_cart, food_subtotals, total, food_multiplier, food_ids = _getCart(user_id)

    restaurants_url = DATABASE_URL + "/restaurant"
    res = requests.get(restaurants_url)
    if not res.ok:
        res.raise_for_status()
    rests = json.loads(res.content)
    restaurants = []
    # Get updated list of restaurants from database for form options
    for rest in rests:
        if {"id": rest['restaurant_id'], "name": rest['name']} not in restaurants:
            restaurants.append({"id": rest['restaurant_id'], "name": rest['name']})

    filter_url = DATABASE_URL + "/food/filter"
    filterParams = {
    "restaurants": restaurantsIds,
    "cuisines": cuisines,
    "allergies": allergies,
    "servings": servings,
    "sort": request.form.get('sort')
    }
    res = requests.post(filter_url, json=filterParams)
    meals = json.loads(res.content)
    length_meals = len(meals)

    # For logging purposes
    for meal in meals:
        # Make additional request to get restaurant name
        restaurantID = meal['restaurant_id']
        restaurant_url = DATABASE_URL + "/restaurant/" + str(restaurantID)
        res = requests.get(restaurant_url)
        # Splice allergies into a list
        if meal['allergies'] is "":
            meal['allergies'] = []
        else:
            meal['allergies'] = meal['allergies'].split(",")
        if not res.ok:
            res.raise_for_status()
            return None
        meal['restaurant'] = json.loads(res.content)['name']
        # For logging purposes
        for key in meal:
            print (key + " : " + str(meal[key]))
        print()

    return render_template('meals.tpl', meals=meals, \
        id=user_id, food_prices = food_prices, food_ids=food_ids,\
        food_subtotals = food_subtotals, food_titles = food_titles, \
        length_cart = length_cart, total=total, food_images= food_images, length_meals=length_meals, restaurants=restaurants, current_filters=current_filters, checkboxes=checkboxes)


# @app.route("/test")
# def test():
#     orders_url = url + "/order/6"
#     res = requests.get(orders_url)
#     if not res.ok:
#         res.raise_for_status()
#     else:
#         meal = json.loads(res.content)
#         # For logging purposes
#         print ("Request Successful: ")
#         items = meal["food_items"]
#         for item in items:
#             for key in item:
#                 print (key + " : " + str(item[key]))
#             print()

if __name__ == '__main__':
    app.run(port=os.environ.get("PORT", 5000), host="0.0.0.0")
