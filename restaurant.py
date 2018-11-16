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
        return render_template('order.tpl', orders=orders, id=id)

if __name__ == '__main__':
    app.run()
