from flask import Flask, request, jsonify, render_template, redirect
import requests
import json
import os

app = Flask(__name__)
url = "http://localhost:5000"
# Endpoint to create new user
@app.route("/orders")
def orders():
    id = request.args.get('id')
    orders_url = url + "/order/restaurant/" + id
    res = requests.get(orders_url)
    if not res.ok:
        res.raise_for_status()
    else:
        orders = json.loads(res.content)
        # For logging purposes
        print ("Request Successful: ")
        for order in orders:
            for key in order:
                print (key + " : " + str(order[key]))
        return render_template('orders.tpl', orders=orders, id=id)

@app.route("/about")
def about():
    id = request.args.get('id')
    return render_template('about.tpl', id=id)

@app.route("/food/add")
def add_food():
    id = request.args.get('id')
    return render_template('add_food.tpl', id=id)


@app.route("/food/upload", methods=["POST"])
def upload_food():
    id = request.args.get('id')
    add_food_url = url + "/food"
    foodInfo = {
    'title': request.form.get('title'),
    'description': request.form.get('description'),
    'image': "N/A",
    'quantity_fed': request.form.get('quantity_fed'),
    'price': request.form.get('price'),
    'allergies': "N/A",
    'restaurant_id': id
    }
    print (foodInfo)
    res = requests.post(add_food_url, json = foodInfo)
    return redirect('/orders?id=' + id)


if __name__ == '__main__':
    app.run()
