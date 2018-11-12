from flask import Flask, request, jsonify, render_template, redirect, make_response
import requests
import json
import os

app = Flask(__name__)
DATABASE_URL = "http://localhost:5000"


##### SIMPLE SCREEN NAVIGATION ------------------------------------------------
@app.route("/")
@app.route("/home")
def home():
    resp = make_response(render_template('home.tpl'))
    resp.set_cookie('user_id', '1')
    user_id = request.cookies.get('user_id')
    print "User Id: " + str(user_id)
    if user_id is None:
        # Redirect to login screen if the cookie is None
        pass
    return resp

@app.route("/about")
def about():
    print "about template requested -----------------------------"
    user_id = request.cookies.get('user_id')
    print "User Id: " + str(user_id)
    if user_id is None:
        # Redirect to login screen if the cookie is None
        pass
    return render_template('about.tpl', user_id=user_id)

@app.route("/meals")
def meals():
    id = request.args.get('id')
    return render_template('index.tpl', id=id)

@app.route("/checkout")
def checkout():
    id = request.args.get('id')
    return render_template('checkout.tpl', id=id)

@app.route("/account")
def account():
    print "account template requested -----------------------------"
    user_id = request.cookies.get('user_id')
    print "User Id: " + str(user_id)
    if user_id is None:
        # Redirect to login screen if the cookie is None
        pass

    url = DATABASE_URL + '/user/' + str(user_id)
    r = requests.get(url = url)
    data = r.json()

    print data


    return render_template('account.tpl', data=data)


##### SIMPLE SCREEN NAVIGATION ------------------------------------------------





if __name__ == '__main__':
    app.run(debug=True)
