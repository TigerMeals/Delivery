from flask import Flask, request, jsonify, render_template
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
        for order in orders:
            for key in order:
                print (key + " : " + str(order[key]))
        return render_template('orders.tpl', orders=orders)


if __name__ == '__main__':
    app.run()
