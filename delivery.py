from flask import Flask, request, jsonify, render_template, redirect
import requests
import json
import os
from flask_cas import CAS, login_required, login, logout

app = Flask(__name__)
cas = CAS(app, '/cas')
cas.init_app(app)
DATABASE_URL = "http://localhost:5000"
app.config['CAS_SERVER'] = 'https://fed.princeton.edu'
app.config['CAS_LOGIN_ROUTE'] = '/cas/login'
app.config['CAS_AFTER_LOGIN'] = 'home'
app.config['CAS_VALIDATE_ROUTE'] = '/cas/serviceValidate'
app.config['DEBUG'] = True


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
@app.route("/")
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
        food_descriptions=food_descriptions, food_titles=food_titles,\
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
        food_descriptions=food_descriptions, food_titles=food_titles,\
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
        food_descriptions=food_descriptions, food_titles=food_titles,\
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

    food_prices, food_descriptions, food_titles, food_quantity_feds,\
        food_images, length_cart, food_subtotals, total, food_multiplier, food_ids = _getCart(user_id)

    return render_template('account.tpl', name=name, email=email,\
        phone=phone, address=address, allergies=allergies, netid=netid, user_id=user_id, food_prices=food_prices,\
        food_descriptions=food_descriptions, food_titles=food_titles,\
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


# Endpoint to create new user
@app.route("/meals")
@login_required
def meals():
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

    res = requests.get(orders_url)
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
            else:
                meal['restaurant'] = json.loads(res.content)['name']
            # For logging purposes
            for key in meal:
                print (key + " : " + str(meal[key]))
            print()

    return render_template('meals.tpl', meals=meals, \
        id=request.args.get('id'), food_prices = food_prices, \
        food_subtotals = food_subtotals, food_titles = food_titles, \
        length_cart = length_cart, total=total, food_images= food_images, length_meals=length_meals)

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

    current_order_url = DATABASE_URL + "/order/current/" + str(id)
    res = requests.get(current_order_url)
    if not res.ok:
        res.raise_for_status()
    else:
        order_id = json.loads(res.content)['order_id']
        old_food_items = json.loads(res.content)['food_items']
        if old_food_items is None:
            old_food_items = []

        food_id = request.form.get('food_id')
        get_food_url = DATABASE_URL + "/food/" + str(food_id)
        res = requests.get(get_food_url)
        if not res.ok:
            res.raise_for_status()
        else:
            food_details = json.loads(res.content)

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
                "user_id": id,
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
    return redirect('/meals?id=' + id)


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

    current_order_url = DATABASE_URL + "/order/current/" + str(id)
    res = requests.get(current_order_url)
    if not res.ok:
        res.raise_for_status()
    else:
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


    return redirect('/meals?id=' + id)

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
    app.secret_key = 'dfasdkfjadkjfasdkjfhasdkjfh'
    app.run(host="0.0.0.0", port = 8080)

