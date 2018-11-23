from flask import Flask, request, jsonify, render_template, redirect
import requests
import json
import os

app = Flask(__name__)
DATABASE_URL = "http://localhost:5000"

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

    return render_template('order.tpl', orders=orders, id=id)

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
        print ()

        return render_template('restaurant_listings.tpl', listings=listings, id=id)

if __name__ == '__main__':
    app.run()
