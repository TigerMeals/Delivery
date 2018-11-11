from flask import Flask, request, jsonify
from flask_sqlalchemy import SQLAlchemy
from flask_marshmallow import Marshmallow
import os

app = Flask(__name__)

# Which database to fetch from:
basedir = os.path.abspath(os.path.dirname(__file__))

app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///' + os.path.join(basedir, 'crud.sqlite')
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
db = SQLAlchemy(app)
ma = Marshmallow(app)
################################################################################
class User(db.Model):
    user_id = db.Column(db.Integer, primary_key = True)
    name = db.Column(db.Unicode, unique = False)
    email = db.Column(db.Unicode, unique = False)
    birthday = db.Column(db.Unicode, unique = False)
    phone = db.Column(db.Integer, unique = False)
    address = db.Column(db.Unicode, unique = False)
    allergies = db.Column(db.Unicode, unique = False)
    userHistory = db.Column(db.Integer, unique = False)


    def __init__(self, name, email, birthday, phone, address, allergies, userHistory):
        self.name = name
        self.email = email
        self.birthday = birthday
        self.phone = phone
        self.address = address
        self.allergies = allergies
        self.userHistory = userHistory


class UserSchema(ma.Schema):
    class Meta:
        fields = ('user_id', 'name', 'email', 'birthday', 'phone', 'address', 'allergies', 'userHistory')

user_schema = UserSchema()
users_schema = UserSchema(many = True)

# Endpoint to create new user
@app.route("/user", methods = ["POST"])
def user_add():
    name = request.json['name']
    email = request.json['email']
    birthday = request.json['birthday']
    phone = request.json['phone']
    address = request.json['address']
    allergies = request.json['allergies']
    userHistory = request.json['userHistory']

    new_user = User(name, email, birthday, phone, address, allergies, userHistory)
    db.session.add(new_user)
    db.session.commit()
    return user_schema.jsonify(new_user)

# Endpoint to get user detail by id
@app.route("/user/<user_id>", methods = ["GET"])
def user_detail(user_id):
    user = User.query.get(user_id)
    return user_schema.jsonify(user)

# Endpoint to update user
@app.route("/user/<user_id>", methods = ["PUT"])
def user_update(user_id):
    user = User.query.get(user_id)
    user.name = request.json['name']
    user.email = request.json['email']
    user.birthday = request.json['birthday']
    user.phone = request.json['phone']
    user.address = request.json['address']
    user.allergies = request.json['allergies']
    user.userHistory = request.json['userHistory']

    db.session.commit()
    return user_schema.jsonify(user)

# Endpoint to delete user
@app.route("/user/<user_id>", methods = ["DELETE"])
def user_delete(user_id):
    user = User.query.get(user_id)

    db.session.delete(user)
    db.session.commit()
    return user_schema.jsonify(user)


################################################################################
class Restaurant(db.Model):
    restaurant_id = db.Column(db.Integer, primary_key = True)
    name = db.Column(db.Unicode, unique = False)
    image = db.Column(db.Unicode, unique = False)
    description = db.Column(db.Unicode, unique = False)
    address = db.Column(db.Unicode, unique = False)
    phone = db.Column(db.Integer, unique = False)
    cuisine = db.Column(db.Unicode, unique = False)
    numOrders = db.Column(db.Integer, unique = False)
    servingSize = db.Column(db.Integer, unique = False)

    def __init__(self, name, image, description, address, phone, cuisine, numOrders, servingSize):
        self.name = name
        self.image = image
        self.description = description
        self.address = address
        self.phone = phone
        self.cuisine = cuisine
        self.numOrders = numOrders
        self.servingSize = servingSize

class RestaurantSchema(ma.Schema):
    class Meta:
        fields = ('restaurant_id', 'name', 'image', 'description', 'address', 'phone', 'cuisine', 'numOrders', 'servingSize')
restaurant_schema = RestaurantSchema()
restaurants_schema = RestaurantSchema(many = True)

# Endpoint to create new restaurant
@app.route("/restaurant", methods = ["POST"])
def restaurant_add():
    name = request.json['name']
    image = request.json['image']
    description = request.json['description']
    address = request.json['address']
    phone = request.json['phone']
    cuisine = request.json['cuisine']
    numOrders = request.json['numOrders']
    servingSize = request.json['servingSize']

    new_restaurant = Restaurant(name, image, description, address, phone, cuisine, numOrders)
    db.session.add(new_restaurant)
    db.session.commit()
    return restaurant_schema.jsonify(new_restaurant)

# Endpoint to get restaurant detail by id
@app.route("/restaurant/<restaurant_id>", methods = ["GET"])
def restaurant_detail(restaurant_id):
    restaurant = Restaurant.query.get(restaurant_id)
    return restaurant_schema.jsonify(restaurant)

def sortFromColumn(data, col, ascending):
    return data.query.order_by(sqlalchemy.func.field(data.col))

# Endpoint to update restaurant
@app.route("/restaurant/<restaurant_id>", methods = ["PUT"])
def restaurant_update(restaurant_id):
    restaurant = Restaurant.query.get(restaurant_id)
    restaurant.name = request.json['name']
    restaurant.image = request.json['image']
    restaurant.description = request.json['description']
    restaurant.address = request.json['address']
    restaurant.phone = request.json['phone']
    restaurant.cuisine = request.json['cuisine']


    db.session.commit()
    return restaurant_schema.jsonify(user)

# Endpoint to delete restaurant
@app.route("/restaurant/<restaurant_id>", methods = ["DELETE"])
def restaurant_delete(restaurant_id):
    restaurant = Restaurant.query.get(restaurant_id)

    db.session.delete(restaurant)
    db.session.commit()
    return restaurant_schema.jsonify(restaurant)

################################################################################
class Food(db.Model):
    food_id = db.Column(db.Integer, primary_key = True)
    title = db.Column(db.Unicode, unique = False)
    description = db.Column(db.Unicode, unique = False)
    image = db.Column(db.Unicode, unique = False)
    quantity_fed = db.Column(db.Integer, unique = False)
    price = db.Column(db.Float, unique = False)
    allergies = db.Column(db.Unicode, unique = False)
    restaurant_id = db.Column(db.Integer, unique = False)

    def __init__(self, title, description, image, quantity_fed, price, allergies, restaurant_id):
        self.title = title
        self.description = description
        self.image = image
        self.quantity_fed = quantity_fed
        self.price = price
        self.allergies = allergies
        self.restaurant_id = restaurant_id

class FoodSchema(ma.Schema):
    class Meta:
        fields = ('food_id', 'title','description', 'image', 'quantity_fed', 'price', 'allergies', 'restaurant_id')

food_schema = FoodSchema()
foods_schema = FoodSchema(many = True)

# Endpoint to create new food
@app.route("/food", methods = ["POST"])
def food_add():
    title = request.json['title']
    description = request.json['description']
    image = request.json['image']
    quantity_fed = request.json['quantity_fed']
    price = request.json['price']
    allergies = request.json['allergies']
    restaurant_id = request.json['restaurant_id']

    new_food = Food(title, description, image, quantity_fed, price, allergies, restaurant_id)
    db.session.add(new_food)
    db.session.commit()
    return food_schema.jsonify(new_food)

# Endpoint to get food by id
@app.route("/food/<food_id>", methods = ["GET"])
def food_detail(food_id):
    food = Food.query.get(food_id)
    return food_schema.jsonify(food)

# Endpoint to get food by restaurant id
@app.route("/food/restaurant/<restaurant_id>", methods = ["GET"])
def food_by_rest(restaurant_id):
    food = Food.query.filter_by(restaurant_id = restaurant_id).all()
    return foods_schema.jsonify(food)

# Endpoint to update food
@app.route("/food/<food_id>", methods = ["PUT"])
def food_update(restaurant_id):
    food = Food.query.get(food_id)
    food.title = request.json['title']
    food.description = request.json['description']
    food.image = request.json['image']
    food.quantity_fed = request.json['quantity_fed']
    food.price = request.json['price']
    food.allergies = request.json['allergies']
    food.restaurant_id = request.json['restaurant_id']

    db.session.commit()
    return food_schema.jsonify(food)

# Endpoint to delete food
@app.route("/food/<food_id>", methods = ["DELETE"])
def food_delete(restaurant_id):
    food = Food.query.get(food_id)

    db.session.delete(food)
    db.session.commit()
    return food_schema.jsonify(food)

################################################################################
class Order(db.Model):
    order_id = db.Column(db.Integer, primary_key = True)
    user_id = db.Column(db.Integer, unique = False)
    food_ids = db.Column(db.Unicode, unique = False)
    restaurant_id = db.Column(db.Integer, unique = False)
    ordered = db.Column(db.Boolean, unique = False)
    paid = db.Column(db.Boolean, unique = False)
    date = db.Column(db.Unicode, unique = False)
    time = db.Column(db.Unicode, unique = False)
    location = db.Column(db.Unicode, unique = False)

    def __init__(self, user_id, food_ids, restaurant_id, ordered, paid, date, time, location):
        self.user_id = user_id
        self.food_ids = food_ids
        self.restaurant_id = restaurant_id
        self.ordered = ordered
        self.paid = paid
        self.date = date
        self.time = time
        self.location = location

class OrderSchema(ma.Schema):
    class Meta:
        fields = ('order_id', 'user_id', 'food_ids', 'restaurant_id', 'ordered', 'paid', 'date', 'time', 'location')

order_schema = OrderSchema()
orders_schema = OrderSchema(many = True)

# Endpoint to create new order
@app.route("/order", methods = ["POST"])
def order_add():
    user_id = request.json['user_id']
    food_ids = request.json['food_ids']
    restaurant_id = request.json['restaurant_id']
    ordered = request.json['ordered']
    paid = request.json['paid']
    date = request.json['date']
    time = request.json['time']
    location = request.json['location']

    new_order = Order(user_id, food_ids, restaurant_id, ordered, paid, date, time, location)
    db.session.add(new_order)
    db.session.commit()
    return order_schema.jsonify(new_order)

# Endpoint to get order detail by id
@app.route("/order/<order_id>", methods = ["GET"])
def order_detail(order_id):
    order = Order.query.get(order_id)
    return order_schema.jsonify(order)

@app.route("/order/restaurant/<restaurant_id>", methods = ["GET"])
def order_by_rest(restaurant_id):
    order = Order.query.filter_by(restaurant_id = restaurant_id).all()
    return orders_schema.jsonify(order)

# Endpoint to update order
@app.route("/order/<order_id>", methods = ["PUT"])
def order_update(order_id):
    order = Order.query.get(food_id)
    order.user_id = request.json['user_id']
    order.food_ids = request.json['food_ids']
    order.restaurant_id = request.json['restaurant_id']
    order.ordered = request.json['ordered']
    order.paid = request.json['paid']
    order.date = request.json['date']
    order.time = request.json['time']
    order.location = request.json['location']

    db.session.commit()
    return order_schema.jsonify(order)

# Endpoint to delete order
@app.route("/order/<order_id>", methods = ["DELETE"])
def order_delete(order_id):
    order = Order.query.get(order_id)

    db.session.delete(order)
    db.session.commit()
    return order_schema.jsonify(order)

db.create_all()
db.session.commit()

if __name__ == '__main__':
    app.run()
