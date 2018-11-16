from flask import Flask, request, jsonify, render_template, redirect, make_response
import requests
import json
import os

app = Flask(__name__)
DATABASE_URL = "http://localhost:5000"

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
        print food_item['food_id']
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

    print food_prices
    print food_descriptions
    print food_titles
    print food_quantity_feds
    print food_images

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

    print data
    return data

## POST METHOD
def _postJSON(url, data):
    r = requests.post(url=url, data=data)

    response = r.json()
    return response


##### SIMPLE SCREEN NAVIGATION ------------------------------------------------
@app.route("/")
@app.route("/home")
def home():
    print "home template requested -----------------------------"
    user_id = request.cookies.get('user_id')
    print "User Id: " + str(user_id)

    food_prices, food_descriptions, food_titles, food_quantity_feds,\
        food_images, length_cart, food_subtotals, total, food_multiplier, food_ids = _getCart(user_id)

    resp = (render_template('home.tpl', user_id=user_id, food_prices=food_prices,\
        food_descriptions=food_descriptions, food_titles=food_titles,\
        food_quantity_feds=food_quantity_feds, food_images=food_images,\
        length_cart=length_cart, food_subtotals=food_subtotals, total=total))

 
    print "User Id: " + str(user_id)
    if user_id is None:
        # Redirect to login screen if the cookie is None
        pass

    

    return resp

@app.route("/cart")
def cart():
    print "cart template requested -----------------------------"
    user_id = request.cookies.get('user_id')
    print "User Id: " + str(user_id)

    food_prices, food_descriptions, food_titles, food_quantity_feds,\
        food_images, length_cart, food_subtotals, total, food_multiplier, food_ids = _getCart(user_id)


    return render_template('cart.tpl', user_id=user_id, food_prices=food_prices,\
        food_descriptions=food_descriptions, food_titles=food_titles,\
        food_quantity_feds=food_quantity_feds, food_images=food_images,\
        length_cart=length_cart, food_subtotals=food_subtotals, total=total, food_multiplier = food_multiplier)

@app.route("/about")
def about():
    print "about template requested -----------------------------"
    user_id = request.cookies.get('user_id')
    print "User Id: " + str(user_id)
    if user_id is None:
        # Redirect to login screen if the cookie is None
        pass

    food_prices, food_descriptions, food_titles, food_quantity_feds,\
        food_images, length_cart, food_subtotals, total, food_multiplier, food_ids = _getCart(user_id)

    return render_template('about.tpl', user_id=user_id, food_prices=food_prices,\
        food_descriptions=food_descriptions, food_titles=food_titles,\
        food_quantity_feds=food_quantity_feds, food_images=food_images,\
        length_cart=length_cart, food_subtotals=food_subtotals, total=total)

@app.route("/meals")
def meals():
    print "meals template requested -----------------------------"
    user_id = request.cookies.get('user_id')
    print "User Id: " + str(user_id)

    food_prices, food_descriptions, food_titles, food_quantity_feds,\
        food_images, length_cart, food_subtotals, total, food_multiplier, food_ids = _getCart(user_id)

    return render_template('index.tpl', user_id=user_id, food_prices=food_prices,\
        food_descriptions=food_descriptions, food_titles=food_titles,\
        food_quantity_feds=food_quantity_feds, food_images=food_images,\
        length_cart=length_cart, food_subtotals=food_subtotals, total=total)

@app.route("/checkout")
def checkout():
    print "checkout template requested -----------------------------"
    user_id = request.cookies.get('user_id')
    print "User Id: " + str(user_id)

    food_prices, food_descriptions, food_titles, food_quantity_feds,\
        food_images, length_cart, food_subtotals, total, food_multiplier, food_ids = _getCart(user_id)

    email, name, phone, address, netid, allergies = _getUser(user_id)

    name = name.split()

    return render_template('checkout.tpl', user_id=user_id, food_prices=food_prices,\
        food_descriptions=food_descriptions, food_titles=food_titles,\
        food_quantity_feds=food_quantity_feds, food_images=food_images,\
        length_cart=length_cart, food_subtotals=food_subtotals, total=total, food_multiplier=food_multiplier,\
        email=email, name=name, phone=phone,address=address, netid=netid)

@app.route("/account")
def account():
    print "account template requested -----------------------------"
    user_id = request.cookies.get('user_id')
    print "User Id: " + str(user_id)
    if user_id is None:
        # Redirect to login screen if the cookie is None
        pass

    email, name, phone, address, netid, allergies = _getUser(user_id)

    food_prices, food_descriptions, food_titles, food_quantity_feds,\
        food_images, length_cart, food_subtotals, total, food_multiplier, food_ids = _getCart(user_id)

    return render_template('account.tpl', name=name, email=email,\
        phone=phone, address=address, allergies=allergies, netid=netid, user_id=user_id, food_prices=food_prices,\
        food_descriptions=food_descriptions, food_titles=food_titles,\
        food_quantity_feds=food_quantity_feds, food_images=food_images,\
        length_cart=length_cart, food_subtotals=food_subtotals, total=total)

@app.route('/order/ordered/<order_id>')
def order_official(order_id):

    order = _postJSON(DATABASE_URL + '/order/ordered/' + str(order_id), data = None)

    return render_template



@app.route("/addtoCart/<food_id>/<quantity>")
def addtoCart(food_id, quantity):
    print "Adding to cart ------------------------------------------"
    user_id = request.cookies.get('user_id')
    print "User Id: " + str(user_id)
    if user_id is None:
        # Redirect to login screen if the cookie is None
        pass

    quantity = int(quantity)


    current_order = _getJSON(DATABASE_URL + "/order/current/" + str(user_id))
    print current_order

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





if __name__ == '__main__':
    app.run(debug=True)
