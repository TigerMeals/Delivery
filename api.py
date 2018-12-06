from flask import Flask, request, jsonify
from flask_sqlalchemy import SQLAlchemy
from flask_marshmallow import Marshmallow
from sqlalchemy import or_, and_
import os
import json

app = Flask(__name__)

# Which database to fetch from:
basedir = os.path.abspath(os.path.dirname(__file__))

app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://localhost/delivery'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
db = SQLAlchemy(app)
ma = Marshmallow(app)
################################################################################
class User(db.Model):
	user_id = db.Column(db.Integer, primary_key = True)
	netid = db.Column(db.Unicode, unique = True)
	name = db.Column(db.Unicode, unique = False)
	email = db.Column(db.Unicode, unique = False)
	birthday = db.Column(db.Unicode, unique = False)
	phone = db.Column(db.Unicode, unique = False)
	address = db.Column(db.Unicode, unique = False)
	allergies = db.Column(db.Unicode, unique = False)
	userHistory = db.Column(db.JSON, unique = False)


	def __init__(self, netid, name, email, birthday, phone, address, allergies, userHistory = 0):
		self.name = name
		self.email = email
		self.birthday = birthday
		self.phone = phone
		self.address = address
		self.allergies = allergies
		self.userHistory = userHistory
		self.netid = netid


class UserSchema(ma.Schema):
	class Meta:
		fields = ('user_id', 'netid', 'name', 'email', 'birthday', 'phone', 'address', 'allergies', 'userHistory')

user_schema = UserSchema()
users_schema = UserSchema(many = True)

# Endpoint to create new user
@app.route("/user", methods = ["POST"])
def user_add():
	name = request.json['name']
	netid = request.json['netid']
	email = request.json['email']
	birthday = request.json['birthday']
	phone = request.json['phone']
	address = request.json['address']
	allergies = request.json['allergies']

	new_user = User(netid, name, email, birthday, phone, address, allergies)
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
	user.netid = request.json['netid']
	user.email = request.json['email']
	user.birthday = request.json['birthday']
	user.phone = request.json['phone']
	user.address = request.json['address']
	user.allergies = request.json['allergies']
	user.userHistory = request.json['userHistory']

	db.session.commit()
	return user_schema.jsonify(user)

# Endpoint to login a user, and to register them in our system
# if it is a new user.
@app.route("/user/login", methods = ["POST"])
def user_login():
	netid = request.json['netid']

	user = User.query.filter_by(netid=netid).first()

	if user is None:
		email = netid + "@princeton.edu"
		user = User(name="",netid=netid,email=email,\
			birthday='',phone='',address='',\
			allergies='')
		db.session.add(user)
		db.session.commit()
		return user_schema.jsonify(user)

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
	password = db.Column(db.Unicode, unique = False)
	name = db.Column(db.Unicode, unique = True)
	image = db.Column(db.Unicode, unique = False)
	description = db.Column(db.Unicode, unique = False)
	address = db.Column(db.Unicode, unique = False)
	phone = db.Column(db.Unicode, unique = False)
	email = db.Column(db.Unicode, unique = True)
	website = db.Column(db.Unicode, unique = False)
	cuisine = db.Column(db.Unicode, unique = False)
	servingSize = db.Column(db.Integer, unique = False)

	def __init__(self, name, image, description, address, phone, cuisine, servingSize, website, email, password):
		self.name = name
		self.image = image
		self.description = description
		self.address = address
		self.phone = phone
		self.cuisine = cuisine
		self.servingSize = servingSize
		self.website = website
		self.email = email
		self.password = password

class RestaurantSchema(ma.Schema):
	class Meta:
		fields = ('restaurant_id', 'name', 'image', 'description', 'address', 'phone', 'cuisine', 'servingSize',\
			'website', 'email', 'password')
restaurant_schema = RestaurantSchema()
restaurants_schema = RestaurantSchema(many = True)

# Endpoint to create new restaurant
@app.route("/restaurant", methods = ["POST"])
def restaurant_add():
	name = request.json['name']
	password = request.json['password']
	image = request.json['image']
	description = request.json['description']
	address = request.json['address']
	phone = request.json['phone']
	cuisine = request.json['cuisine']
	servingSize = request.json['servingSize']
	email = request.json['email']
	website = request.json['website']

	new_restaurant = Restaurant(name, image, description, address, phone, cuisine, servingSize, website, email, password)
	db.session.add(new_restaurant)
	db.session.commit()
	return restaurant_schema.jsonify(new_restaurant)

# Endpoint to get restaurant detail by id
@app.route("/restaurant/<restaurant_id>", methods = ["GET"])
def restaurant_detail(restaurant_id):
	restaurant = Restaurant.query.get(restaurant_id)
	return restaurant_schema.jsonify(restaurant)

# Endpoint to get all restaurants
@app.route("/restaurant", methods = ["GET"])
def restaurants_detail():
	restaurant = Restaurant.query.all()
	return restaurants_schema.jsonify(restaurant)

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

# Endpoint for restaurant's to login using email and phone number
# verification. We will add passwords later, much later
@app.route("/restaurant/login", methods = ["POST"])
def restaurant_login():
	email = request.json['email']
	password = request.json['password']

	restaurant = Restaurant.query.filter_by(email = email, \
		password = password).first()

	if restaurant is None:
		return jsonify({
				"error": "Invalid Login Error"
			})

	return restaurant_schema.jsonify(restaurant)

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
	cuisine = db.Column(db.Unicode, unique = False)
	allergies = db.Column(db.Unicode, unique = False)
	restaurant_id = db.Column(db.Integer, unique = False)
	timesOrdered = db.Column(db.Integer, unique = False)
	active = db.Column(db.Boolean)

	def __init__(self, cuisine, timesOrdered, title, description, image, quantity_fed, price, allergies, restaurant_id, active=True):
		self.title = title
		self.cuisine = cuisine
		self.timesOrdered = timesOrdered
		self.description = description
		self.image = image
		self.quantity_fed = quantity_fed
		self.price = price
		self.allergies = allergies
		self.restaurant_id = restaurant_id
		self.active = active

class FoodSchema(ma.Schema):
	class Meta:
		fields = ('food_id', 'title','description', 'image', 'quantity_fed', \
			'price', 'cuisine', 'allergies', 'restaurant_id', 'timesOrdered', 'active')

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
	cuisine = request.json['cuisine']
	timesOrdered = request.json['timesOrdered']

	new_food = Food(cuisine, timesOrdered, title, description, image, quantity_fed, price, allergies, restaurant_id)
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
def food_update(food_id):
	food = Food.query.get(food_id)
	food.title = request.json['title']
	food.description = request.json['description']
	food.quantity_fed = request.json['quantity_fed']
	food.price = request.json['price']
	food.allergies = request.json['allergies']

	# Optional
	if 'image' in request.json:
		food.image = request.json['image']

	db.session.commit()
	return food_schema.jsonify(food)

# Endpoint that sorts by price
# Expects following in json dict: restaurants: list of restaurant ids, cuisines: list of desired cuisines, allergies: list of dietary restrictions, servings: list of serving ranges, sort: type of sort desired (popular, servings, price_low_to_high, price_high_to_low, or recent).
@app.route('/food/filter', methods = ['POST'])
def food_filter():
	restaurants = request.json['restaurants']
	cuisines = request.json['cuisines']
	# Current allergies that are options are 'Contains dairy', 'Contains meat', 'Contains eggs', 'Kosher'
	allergies = request.json['allergies']

	# split the quantity fed ranges into min and max by splitting at -
	# if something goes wrong below, the servings fields were provided incorrectly, should be of the form ["1-20", "30-50"]
	servings = request.json['servings']
	ranges = []

	for s in servings:
		vals = s.split("-")
		ranges.append([vals[0], vals[1]])

	food = Food.query
	if restaurants is not []:
		food = food.filter(or_(Food.restaurant_id == v for v in restaurants))
	if cuisines is not []:
		food = food.filter(or_(Food.cuisine == c for c in cuisines))
	if allergies is not []:
		food = food.filter(or_(Food.allergies.contains(a) for a in allergies))
	if ranges is not []:
		food = food.filter(or_(Food.quantity_fed >= int(r[0]) for r in ranges))
		food = food.filter(or_(Food.quantity_fed <= int(r[1]) for r in ranges))
	sort = request.json['sort']
	food = food.filter_by(active = True)
	if (sort == "popular"):
		result = food.order_by(Food.timesOrdered).all()
	if (sort == "servings"):
		result = food.order_by(Food.quantity_fed).all()
	if (sort == "price_low_to_high"):
		result = food.order_by(Food.price).all()
	if (sort == "price_high_to_low"):
		result = food.order_by(Food.price).all()
		result.reverse()
	if (sort == "recent"):
		result = food.order_by(Food_id).all()

	return foods_schema.jsonify(result)

# Endpoint that sorts by price
@app.route('/food/sort/price/low-to-high', methods = ['GET'])
def food_sort_price_low_to_high():
	food = Food.query.filter_by(active = True)
	food = food.order_by(Food.price).all()
	return foods_schema.jsonify(food)

# Endpoint to delete food
@app.route("/food/<food_id>", methods = ["DELETE"])
def food_delete(food_id):
	food = Food.query.get(food_id)

	db.session.delete(food)
	db.session.commit()
	return food_schema.jsonify(food)

# Endpoint to make food active or inactive
@app.route("/food/toggle_active/<food_id>", methods = ["POST"])
def food_toggle_active(food_id):
	food = Food.query.get(food_id)
	food.active = not food.active

	db.session.commit()
	return food_schema.jsonify(food)

@app.route("/food/image/<food_id>", methods=["POST"])
def food_update_image(food_id):
	food = Food.query.get(food_id)
	food.image = request.json['image']
	db.session.commit()
	return food_schema.jsonify(food)

################################################################################
# NOTE: food_items is a dictionary of key value pairs describing the food items
# in the order. Its fields should be food_id, quantity, customization, subtotal.
#
# To specify food_items in JSON format as a dictionary use the following syntax
# food_items: { "key1": "value1", "key2": "value2 "}, ...
#
# IMPORTANT: No extra steps are needed! No need to serialize before passing to
# this function as long as request type is JSON.
#
# To retrieve food_items in JSON format as a dictionary, get the dictionary by
# its key. Now you can refer to any key in the food_items field by its key.
# get_items = result["food_items"]
# title = get_items["food_title"]
#
# IMPORTANT: No extra steps are needed! No need to unserialize after loading
# the JSON result. The JSON result itself must be serialized, but not food_items
# in particular.
class Order(db.Model):
	order_id = db.Column(db.Integer, primary_key = True)
	user_id = db.Column(db.Integer, unique = False)
	food_items = db.Column(db.JSON, unique = False)
	restaurant_id = db.Column(db.Integer, unique = False)
	ordered = db.Column(db.Boolean, unique = False)
	paid = db.Column(db.Boolean, unique = False)
	delivery_in_process = db.Column(db.Boolean, unique = False)
	delivered = db.Column(db.Boolean, unique = False)
	order_time = db.Column(db.Unicode, unique = False)
	delivery_time = db.Column(db.Unicode, unique = False)
	name = db.Column(db.Unicode, unique = False)
	email = db.Column(db.Unicode, unique = False)
	address = db.Column(db.Unicode, unique = False)
	date = db.Column(db.Unicode, unique = False)
	time = db.Column(db.Unicode, unique = False)
	location = db.Column(db.Unicode, unique = False)

	def __init__(self, user_id, food_items, restaurant_id, date, order_time, location , delivery_time = None, ordered = False, paid = False, delivery_in_process = False, delivered = False, name = None, email = None, address = None):
		self.user_id = user_id
		self.food_items = food_items
		self.restaurant_id = restaurant_id
		self.ordered = ordered
		self.paid = paid
		self.delivery_in_process = delivery_in_process
		self.delivered = delivered
		self.date = date
		self.name = name
		self.email = email
		self.address = address
		self.order_time = order_time
		self.location = location
		self.delivery_time = delivery_time

class OrderSchema(ma.Schema):
	class Meta:
		fields = ('order_id', 'user_id', 'food_items', 'restaurant_id', 'ordered', 'paid',  'delivery_in_process',  'delivered', 'date', 'order_time', 'delivery_time','location', 'name', 'email', 'address')

order_schema = OrderSchema()
orders_schema = OrderSchema(many = True)

# Endpoint of restaurant approval
@app.route('/order/approval/<order_id>', methods = ["POST"])
def order_approval(order_id):
	order = Order.query.get(order_id)

	order.paid = True
	order.delivery_in_process = True

	db.session.commit()
	return order_schema.jsonify(order)

# Endpoint that they delivered the order
@app.route('/order/delivered/<order_id>', methods = ["POST"])
def order_delivered(order_id):
	order = Order.query.get(order_id)

	order.delivered = True
	order.delivery_in_process = False
	order.delivery_time = request.json['delivery_time']
	db.session.commit()

	return order_schema.jsonify(order)


# Endpoint to place an order
@app.route('/order/ordered/<order_id>', methods = ["POST"])
def order_ordered(order_id):
	order = Order.query.get(order_id)

	order.ordered = True
	order.name = request.json['name']
	order.email = request.json['email']
	order.location = request.json['location']
	order.date = request.json['date']
	order.delivery_time = request.json['time']

	db.session.commit()

	return order_schema.jsonify(order)

# Endpoint to create new order
# To specify food_items in JSON format as a dictionary use the following syntax
# food_items: { "key1": "value1", "key2": "value2 "}, ...
#
# IMPORTANT: No extra steps are needed! No need to serialize before passing to
# this function as long as request type is JSON.
#
@app.route("/order", methods = ["POST"])
def order_add():
	# TODO: if food_items differs from the expected format then alert the user
	# and do not commit to the database.

	food_items = request.json['food_items']

	#  food_id,
	#  quantity, customization, subtotal.

	user_id = request.json['user_id']
	restaurant_id = request.json['restaurant_id']
	date = request.json['date']
	order_time = request.json['order_time']
	location = request.json['location']
	new_order = Order(user_id, food_items, restaurant_id, date, order_time, location)
	db.session.add(new_order)
	db.session.commit()
	return order_schema.jsonify(new_order)

# Endpoint to get order detail by id
#
# To retrieve food_items in JSON format as a dictionary, get the dictionary by
# its key. Now you can refer to any key in the food_items field by its key.
# get_items = result["food_items"]
# title = get_items["food_title"]
#
# IMPORTANT: No extra steps are needed! No need to unserialize after loading
# the JSON result. The JSON result itself must be unserialized, but not
# food_items in particular.
@app.route("/order/<order_id>", methods = ["GET"])
def order_detail(order_id):
	order = Order.query.get(order_id)
	return order_schema.jsonify(order)

# Endpoint to return orders from a restuarant
#
# To retrieve food_items in JSON format as a dictionary, get the dictionary by
# its key. Now you can refer to any key in the food_items field by its key.
# get_items = result["food_items"]
# title = get_items["food_title"]
#
# IMPORTANT: No extra steps are needed! No need to unserialize after loading
# the JSON result. The JSON result itself must be unserialized, but not
# food_items in particular.
@app.route("/order/restaurant/<restaurant_id>", methods = ["GET"])
def order_by_rest(restaurant_id):
	order = Order.query.filter_by(restaurant_id = restaurant_id).filter_by(ordered=True).all()
	return orders_schema.jsonify(order)

# Endpoint to update order
@app.route("/order/<order_id>", methods = ["PUT"])
def order_update(order_id):
	order = Order.query.get(order_id)
	order.user_id = request.json['user_id']
	order.food_items = request.json['food_items']
	order.restaurant_id = request.json['restaurant_id']
	order.ordered = request.json['ordered']
	order.paid = request.json['paid']
	order.date = request.json['date']
	order.order_time = request.json['order_time']
	order.delivery_time = request.json['delivery_time']
	order.location = request.json['location']

	db.session.commit()
	return order_schema.jsonify(order)

# Endpoint to return current user pending order_id (Before he finishes
# Checkout)
@app.route("/order/current/<user_id>", methods = ["GET"])
def order_current(user_id):
	order = Order.query.filter_by(user_id = user_id, ordered = False).first()
	if order is None:
		order = Order(user_id, [], -1, None, None, None)
		db.session.add(order)
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
	app.run(debug=True)
