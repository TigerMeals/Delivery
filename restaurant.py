from flask import Flask, request, jsonify, render_template, redirect
import requests
import json
import os

app = Flask(__name__)
DATABASE_URL = "http://localhost:5000"


# Endpoint to view homepage
@app.route("/")
@app.route("/home")
def home():
    id = request.args.get('id')
    return render_template('home_restaurant.tpl', id=id)


@app.route("/about")
def about():
    id = request.args.get('id')
    return render_template('about_restaurant.tpl', id=id)

# Endpoint to view restaurant's orders
@app.route("/orders")
def orders():
    id = request.args.get('id')
    orders_url = DATABASE_URL + "/order/restaurant/" + id
    res = requests.get(orders_url)
    if not res.ok:
        res.raise_for_status()
    else:
        orders = json.loads(res.content)

        # For logging purposes
        print ("Request Successful: ")
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
        print ()

    return render_template('orders_restaurant.tpl', orders=orders, id=id)

# Endpoint to view restaurant's listings
@app.route("/listings")
def listings():
    id = request.args.get('id')
    listings_url = DATABASE_URL + "/food/restaurant/" + id
    res = requests.get(listings_url)

    if not res.ok:
        res.raise_for_status()
    else:
        listings = json.loads(res.content)
        print ("Request Successful: ")
        for listing in listings:
            for key in listing:
                print (key + " : " + str(listing[key]))
            if listing['allergies'] is "":
                listing['allergies'] = []
            else:
                listing['allergies'] = listing['allergies'].split(",")
        print ()

        return render_template('listings_restaurant.tpl', listings=listings, id=id)

# Endpoint to add a new restaurant listing.
@app.route("/listings/add", methods=["POST"])
def add_listing():
    id = request.args.get('id')
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

    res = requests.post(add_food_url, json = entry)
    if not res.ok:
        res.raise_for_status()
    return redirect('/listings?id=' + id)

# Endpoint to update a new restaurant listing.
@app.route("/listings/update", methods=["POST"])
def update_listing():
    id = request.args.get('id')

    add_food_url = DATABASE_URL + "/food/" + str(request.form.get("food_id"))
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

    res = requests.put(add_food_url, json = updatedEntry)
    if not res.ok:
        res.raise_for_status()
    return redirect('/listings?id=' + id)

if __name__ == '__main__':
    app.run()
