from flask import Flask, request, jsonify
from flask_sqlalchemy import SQLAlchemy
from flask_marshmallow import Marshmallow
from sqlalchemy import or_, and_
import os
import hashlib
import json
from tigermeals import app
from threading import Timer, Thread
from tigermeals.mail_html import user_48hours_html, restaurant_48hours_html
from flask_mail import Mail,  Message

# Which database to fetch from:
basedir = os.path.abspath(os.path.dirname(__file__))


# app.config['SQLALCHEMY_DATABASE_URI'] = "postgresql://localhost/delivery"
app.config['SQLALCHEMY_DATABASE_URI'] = os.environ['DATABASE_URL']

app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.config['MAIL_SERVER'] = 'smtp.gmail.com'
app.config['MAIL_PORT'] = 465
app.config['MAIL_USE_SSL'] = True
app.config['MAIL_USERNAME'] = 'tigermealsdelivery@gmail.com'
app.config['MAIL_PASSWORD'] = 'aksnpqtutouldhna'
mail = Mail(app)
db = SQLAlchemy(app)
ma = Marshmallow(app)


# The secure key that someone needs to use the POST methods.
SECURE_DATABASE_KEY = "sdjfhs24324[][p][}}P`092`)*@))@31DSDA&ASD{}[][]w]%%332"

def asyncFunction(f):
	def wrapper(*args, **kwargs):
		thr = Thread(target = f, args = args, kwargs = kwargs)
		thr.start()
	return wrapper

@asyncFunction
def send_async_email(msg):
	with app.app_context():
		mail.send(msg)


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
	image = db.Column(db.Unicode, unique = False)


	def __init__(self, netid, name, email, birthday, phone, address, allergies, image):
		self.name = name
		self.email = email
		self.birthday = birthday
		self.phone = phone
		self.address = address
		self.allergies = allergies
		self.netid = netid
		self.image = image


class UserSchema(ma.Schema):
	class Meta:
		fields = ('user_id', 'netid', 'name', 'email', 'birthday', 'phone', 'address', 'allergies', 'image')

user_schema = UserSchema()
users_schema = UserSchema(many = True)

# Endpoint to create new user
@app.route("/user", methods = ["POST"])
def user_add():
	if 'key' not in request.json or request.json['key'] != SECURE_DATABASE_KEY:
		return jsonify({"error": "You don't have admin priveleges to this endpoint."})
	name = request.json['name']
	netid = request.json['netid']
	email = request.json['email']
	birthday = request.json['birthday']
	phone = request.json['phone']
	address = request.json['address']
	allergies = request.json['allergies']
	image = request.json['image']

	new_user = User(netid, name, email, birthday, phone, address, allergies, image)
	db.session.add(new_user)
	db.session.commit()
	return user_schema.jsonify(new_user)

# Endpoint to get user detail by id
@app.route("/user/<user_id>", methods = ["GET"])
def user_detail(user_id):
	user = User.query.get(user_id)
	return user_schema.jsonify(user)

@app.route("/user/image/<user_id>", methods=["POST"])
def user_update_image(user_id):
	if 'key' not in request.json or request.json['key'] != SECURE_DATABASE_KEY:
		return jsonify({"error": "You don't have admin priveleges to this endpoint."})
	user = User.query.get(user_id)
	user.image = request.json['image']
	db.session.commit()
	return user_schema.jsonify(user)

# Endpoint to update user
@app.route("/user/<user_id>", methods = ["PUT"])
def user_update(user_id):
	if 'key' not in request.json or request.json['key'] != SECURE_DATABASE_KEY:
		return jsonify({"error": "You don't have admin priveleges to this endpoint."})
	user = User.query.get(user_id)
	user.name = request.json['name']
	user.netid = request.json['netid']
	user.email = request.json['email']
	user.birthday = request.json['birthday']
	user.phone = request.json['phone']
	user.address = request.json['address']
	user.allergies = request.json['allergies']

	db.session.commit()
	return user_schema.jsonify(user)

# Endpoint to login a user, and to register them in our system
# if it is a new user.
@app.route("/user/login", methods = ["POST"])
def user_login():
	if 'key' not in request.json or request.json['key'] != SECURE_DATABASE_KEY:
		return jsonify({"error": "You don't have admin priveleges to this endpoint."})
	netid = request.json['netid']

	user = User.query.filter_by(netid=netid).first()

	if user is None:
		email = netid + "@princeton.edu"
		user = User(name="",netid=netid,email=email,\
			birthday='',phone='',address='',\
			allergies='', image = '')
		db.session.add(user)
		db.session.commit()
		return user_schema.jsonify(user)

	return user_schema.jsonify(user)

#Endpoint to update the user account stuff
@app.route("/user/account/update/<user_id>", methods=['PUT'])
def user_account_update(user_id):
	if 'key' not in request.json or request.json['key'] != SECURE_DATABASE_KEY:
		return jsonify({"error": "You don't have admin priveleges to this endpoint."})
	user = User.query.get(user_id)
	firstName = request.json['first']
	lastName = request.json['last']
	user.phone = request.json['phone']
	user.address = request.json['address']
	user.allergies = request.json['allergies']

	name = firstName + " " + lastName

	user.name = name

	db.session.commit()

	return user_schema.jsonify(user)

# Endpoint to get the quick stats of the users
@app.route("/user/quickstats/<user_id>", methods=["GET"])
def user_get_orderlength(user_id):
	orders = Order.query.filter_by(user_id=user_id, ordered=True).all()

	return orders_schema.jsonify(orders)

# Endpoint to delete user
@app.route("/user/<user_id>", methods = ["DELETE"])
def user_delete(user_id):
	if 'key' not in request.json or request.json['key'] != SECURE_DATABASE_KEY:
		return jsonify({"error": "You don't have admin priveleges to this endpoint."})
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
	hours = db.Column(db.Unicode, unique = False)
	servingSize = db.Column(db.Integer, unique = False)
	primaryFirstName = db.Column(db.Unicode, unique = False)
	primaryLastName = db.Column(db.Unicode, unique = False)
	primaryEmail = db.Column(db.Unicode, unique = False)
	primaryPhone = db.Column(db.Unicode, unique = False)
	secondaryFirstName = db.Column(db.Unicode, unique = False)
	secondaryLastName = db.Column(db.Unicode, unique = False)
	secondaryEmail = db.Column(db.Unicode, unique = False)
	secondaryPhone = db.Column(db.Unicode, unique = False)

	def __init__(self, name, image, description, address, phone, cuisine, servingSize, hours, \
	website, email, password, primaryFirstName, primaryLastName, primaryEmail, \
	primaryPhone, secondaryFirstName, secondaryLastName, secondaryEmail, secondaryPhone):
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
		self.hours = hours
		self.primaryFirstName = primaryFirstName
		self.primaryLastName = primaryLastName
		self.primaryEmail = primaryEmail
		self.primaryPhone = primaryPhone
		self.secondaryFirstName = secondaryFirstName
		self.secondaryLastName = secondaryLastName
		self.secondaryEmail = secondaryEmail
		self.secondaryPhone = secondaryPhone

class RestaurantSchema(ma.Schema):
	class Meta:
		fields = ('restaurant_id', 'name', 'image', 'description', 'address', 'phone', 'cuisine', 'servingSize', 'hours',\
			'website', 'email', 'primaryFirstName', 'primaryLastName', 'primaryEmail', 'primaryPhone', \
			'secondaryFirstName', 'secondaryLastName', 'secondaryEmail', 'secondaryPhone')
restaurant_schema = RestaurantSchema()
restaurants_schema = RestaurantSchema(many = True)


def _restaurant_hash(password):

	# Add salting to the password
	password = "%-AS%()*3094$(##(Q)[]}-&$@!~`^#@&" + \
	str(password) + "---&($^()```(@*%q%n%~adf%n^#)!@("

	# Hash the password
	m = hashlib.sha256()
	password = password.encode('utf-8')
	m.update(password)

	password = m.digest()

	# Add more salting to the password
	password = b"%-AS%()*3094$(##(Q)[]}-&$@!~`^#@&asd32423942342" + \
	password + b"0920202029320392032123901---&($^()```(@*%q%n%~adf%n^#)!@("

	return str(password)


# Endpoint to create new restaurant
@app.route("/restaurant", methods = ["POST"])
def restaurant_add():
	if 'key' not in request.json or request.json['key'] != SECURE_DATABASE_KEY:
		return jsonify({"error": "You don't have admin priveleges to this endpoint."})
	name = request.json['name']
	password = request.json['password']
	#image = request.json['image']
	image = ""
	description = request.json['description']
	address = request.json['address']
	phone = request.json['phone']
	hours = request.json['hours']
	cuisine = request.json['cuisine']
	servingSize = request.json['servingSize']
	email = request.json['email']
	website = request.json['website']


	if 'primaryFirstName' in request.json:
		primaryFirstName = request.json['primaryFirstName']
	if 'primaryLastName' in request.json:
		primaryLastName = request.json['primaryLastName']
	if 'primaryEmail' in request.json:
		primaryEmail = request.json['primaryEmail']
	if 'primaryPhone' in request.json:
		primaryPhone = request.json['primaryPhone']
	if 'secondaryFirstName' in request.json:
		secondaryFirstName = request.json['secondaryFirstName']
	if 'secondaryLastName' in request.json:
		secondaryLastName = request.json['secondaryLastName']
	if 'secondaryEmail' in request.json:
		secondaryEmail = request.json['secondaryEmail']
	if 'secondaryPhone' in request.json:
		secondaryPhone = request.json['secondaryPhone']
	if 'image' in request.json:
		image = request.json['image']

	# Hash the password
	password = _restaurant_hash(password)

	# Store the password securely
	new_restaurant = Restaurant(name, image, description, address, phone, cuisine, \
	 servingSize, hours, website, email, password, primaryFirstName, primaryLastName, primaryEmail, primaryPhone, \
	 secondaryFirstName, secondaryLastName, secondaryEmail, secondaryPhone)
	db.session.add(new_restaurant)
	db.session.commit()
	return restaurant_schema.jsonify(new_restaurant)


@app.route("/restaurant/image/<restaurant_id>", methods=["POST"])
def restaurant_update_image(restaurant_id):
	if 'key' not in request.json or request.json['key'] != SECURE_DATABASE_KEY:
		return jsonify({"error": "You don't have admin priveleges to this endpoint."})
	restaurant = Restaurant.query.get(restaurant_id)
	restaurant.image = request.json['image']
	db.session.commit()
	return restaurant_schema.jsonify(restaurant)

# Endpoint to get restaurant detail by id
@app.route("/restaurant/<restaurant_id>", methods = ["GET"])
def restaurant_detail(restaurant_id):
	restaurant = Restaurant.query.get(restaurant_id)
	return restaurant_schema.jsonify(restaurant)

# Endpoint to get restaurant detail by email
@app.route("/restaurant/email", methods = ["POST"])
def restaurant_email():
	if 'key' not in request.json or request.json['key'] != SECURE_DATABASE_KEY:
		return jsonify({"error": "You don't have admin priveleges to this endpoint."})
	email = request.json['email']
	restaurant = Restaurant.query.filter_by(email=email).first()
	return restaurant_schema.jsonify(restaurant)


# Endpoint to get all restaurants
@app.route("/restaurant", methods = ["GET"])
def restaurants_detail():
	restaurant = Restaurant.query.all()
	return restaurants_schema.jsonify(restaurant)

# Endpoint to update restaurant
@app.route("/restaurant/<restaurant_id>", methods = ["PUT"])
def restaurant_update(restaurant_id):
	if 'key' not in request.json or request.json['key'] != SECURE_DATABASE_KEY:
		return jsonify({"error": "You don't have admin priveleges to this endpoint."})
	restaurant = Restaurant.query.get(restaurant_id)
	restaurant.name = request.json['name']
	restaurant.image = request.json['image']
	restaurant.description = request.json['description']
	restaurant.address = request.json['address']
	restaurant.phone = request.json['phone']
	restaurant.cuisine = request.json['cuisine']

	password = request.json['password']

	password = _restaurant_hash(password)

	restaurant.password = password

	db.session.commit()
	return restaurant_schema.jsonify(restaurant)

# Endpoint to update restaurant password
@app.route("/restaurant/password/<restaurant_id>", methods = ["PUT"])
def restaurant_update_pass(restaurant_id):
	if 'key' not in request.json or request.json['key'] != SECURE_DATABASE_KEY:
		return jsonify({"error": "You don't have admin priveleges to this endpoint."})
	restaurant = Restaurant.query.get(restaurant_id)

	password = request.json['password']

	password = _restaurant_hash(password)

	restaurant.password = password

	db.session.commit()
	return restaurant_schema.jsonify(restaurant)

# Endpoint for restaurant's to login using email and phone number
# verification. We will add passwords later, much later
@app.route("/restaurant/login", methods = ["POST"])
def restaurant_login():
	if 'key' not in request.json or request.json['key'] != SECURE_DATABASE_KEY:
		return jsonify({"error": "You don't have admin priveleges to this endpoint."})
	email = request.json['email']
	password = request.json['password']

	# hash the password
	password = _restaurant_hash(password)

	restaurant = Restaurant.query.filter_by(email = email, \
		password = password).first()

	if restaurant is None:
		print("Login Failed")
		return jsonify({
				"error": "Invalid Login Error"
		})

	return restaurant_schema.jsonify(restaurant)

# Endpoint to delete restaurant
@app.route("/restaurant/<restaurant_id>", methods = ["DELETE"])
def restaurant_delete(restaurant_id):
	if 'key' not in request.json or request.json['key'] != SECURE_DATABASE_KEY:
		return jsonify({"error": "You don't have admin priveleges to this endpoint."})
	restaurant = Restaurant.query.get(restaurant_id)

	db.session.delete(restaurant)
	db.session.commit()
	return restaurant_schema.jsonify(restaurant)

# Endpoint to update the profile page
@app.route("/restaurant/profile/<restaurant_id>",methods=["PUT"])
def restaurant_profile(restaurant_id):
	if 'key' not in request.json or request.json['key'] != SECURE_DATABASE_KEY:
		return jsonify({"error": "You don't have admin priveleges to this endpoint."})
	restaurant = Restaurant.query.get(restaurant_id)
	restaurant.name = request.json['restaurant_name']
	restaurant.description = request.json['description']
	restaurant.phone = request.json['phone']
	restaurant.website = request.json['website']
	restaurant.address = request.json['location']
	#restaurant.image = request.json['image']

	db.session.commit()

	return restaurant_schema.jsonify(restaurant)

@app.route("/restaurant/account/<restaurant_id>", methods=["PUT"])
def restaurant_account_upgrade(restaurant_id):
	if 'key' not in request.json or request.json['key'] != SECURE_DATABASE_KEY:
		return jsonify({"error": "You don't have admin priveleges to this endpoint."})
	restaurant = Restaurant.query.get(restaurant_id)
	restaurant.primaryFirstName = request.json['firstPrim']
	restaurant.primaryLastName = request.json['lastPrim']
	restaurant.primaryEmail = request.json['emailPrim']
	restaurant.primaryPhone = request.json['phonePrim']

	restaurant.secondaryFirstName = request.json['firstSec']
	restaurant.secondaryLastName = request.json['lastSec']
	restaurant.secondaryEmail = request.json['emailSec']
	restaurant.secondaryPhone = request.json['phoneSec']

	if 'password' in request.json:
		password = request.json['password']

		password = _restaurant_hash(password)

		restaurant.password = password

	db.session.commit()

	return restaurant_schema.jsonify(restaurant)


@app.route("/restaurant/filter", methods=["POST"])
def restaurant_filter():
	if 'key' not in request.json or request.json['key'] != SECURE_DATABASE_KEY:
		return jsonify({"error": "You don't have admin priveleges to this endpoint."})
	restaurants = Restaurant.query
	cuisines = request.json.get('cuisines')
	cuisines = cuisines.split(",")
	if cuisines is not []:
		restaurants = restaurants.filter(or_(Restaurant.cuisine.contains(c) for c in cuisines))
	return restaurants_schema.jsonify(restaurants.all())

@app.route("/restaurant/search/<query>",methods=["GET"])
def restaurant_search(query):
	if query.strip() == '':
		return jsonify(query)

	query_string = query + "%"

	restaurants = Restaurant.query.filter(Restaurant.name.like(query_string.capitalize())).all()

	return restaurants_schema.jsonify(restaurants)

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
	if 'key' not in request.json or request.json['key'] != SECURE_DATABASE_KEY:
		return jsonify({"error": "You don't have admin priveleges to this endpoint."})
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
	if 'key' not in request.json or request.json['key'] != SECURE_DATABASE_KEY:
		return jsonify({"error": "You don't have admin priveleges to this endpoint."})
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
# Expects following in json dict: restaurants: list of restaurant ids, allergies: list of dietary restrictions, servings: list of serving ranges, sort: type of sort desired (popular, servings, price_low_to_high, price_high_to_low, or recent).
@app.route('/food/filter', methods = ['POST'])
def food_filter():
	if 'key' not in request.json or request.json['key'] != SECURE_DATABASE_KEY:
		return jsonify({"error": "You don't have admin priveleges to this endpoint."})
	restaurants = request.json['restaurants']
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
	if allergies is not []:
		food = food.filter(or_(Food.allergies.contains(a) for a in allergies))
	if ranges is not []:
		food = food.filter(or_(Food.quantity_fed >= int(r[0]) for r in ranges))
		food = food.filter(or_(Food.quantity_fed <= int(r[1]) for r in ranges))
	sort = request.json['sort']
	food = food.filter_by(active = True)
	if (sort == "popular"):
		result = food.order_by(Food.timesOrdered).all()
		result.reverse()
	if (sort == "servings"):
		result = food.order_by(Food.quantity_fed).all()
	if (sort == "price_low_to_high"):
		result = food.order_by(Food.price).all()
	if (sort == "price_high_to_low"):
		result = food.order_by(Food.price).all()
		result.reverse()
	if (sort == "recent"):
		result = food.order_by(Food.food_id).all()

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
	if 'key' not in request.json or request.json['key'] != SECURE_DATABASE_KEY:
		return jsonify({"error": "You don't have admin priveleges to this endpoint."})
	food = Food.query.get(food_id)

	db.session.delete(food)
	db.session.commit()
	return food_schema.jsonify(food)

# Endpoint to make food active or inactive
@app.route("/food/toggle_active/<food_id>", methods = ["POST"])
def food_toggle_active(food_id):
	if 'key' not in request.json or request.json['key'] != SECURE_DATABASE_KEY:
		return jsonify({"error": "You don't have admin priveleges to this endpoint."})
	food = Food.query.get(food_id)
	food.active = not food.active

	db.session.commit()
	return food_schema.jsonify(food)

@app.route("/food/image/<food_id>", methods=["POST"])
def food_update_image(food_id):
	if 'key' not in request.json or request.json['key'] != SECURE_DATABASE_KEY:
		return jsonify({"error": "You don't have admin priveleges to this endpoint."})
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
	stripeToken = db.Column(db.Unicode, unique = True)
	amount = db.Column(db.Unicode, unique = False)
	rating = db.Column(db.Integer, unique = False)
	delivery_instructions = db.Column(db.Unicode, unique=False)
	denied = db.Column(db.Boolean, unique = False)

	def __init__(self, user_id, food_items, restaurant_id, \
		date, order_time, location , delivery_time = None, \
		ordered = False, paid = False, delivery_in_process = False, \
		delivered = False, name = None, email = None, address = None, stripeToken=None,amount=None, rating=None, delivery_instructions=None, denied = False):
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
		self.rating = rating
		self.delivery_instructions = delivery_instructions

class OrderSchema(ma.Schema):
	class Meta:
		fields = ('order_id', 'user_id', 'food_items', 'restaurant_id', 'ordered', 'paid',  'delivery_in_process',  'delivered', 'date', 'order_time', 'delivery_time','location', 'name', 'email', 'address','stripeToken','amount', 'rating', 'delivery_instructions', 'denied')

order_schema = OrderSchema()
orders_schema = OrderSchema(many = True)

# Endpoint of restaurant approval
@app.route('/order/approval/<order_id>', methods = ["POST"])
def order_approval(order_id):
	if 'key' not in request.json or request.json['key'] != SECURE_DATABASE_KEY:
		return jsonify({"error": "You don't have admin priveleges to this endpoint."})
	order = Order.query.get(order_id)

	order.paid = True
	order.delivery_in_process = True

	db.session.commit()
	return order_schema.jsonify(order)


# Endpoint that they delivered the order
@app.route('/order/delivered/<order_id>', methods = ["POST"])
def order_delivered(order_id):
	if 'key' not in request.json or request.json['key'] != SECURE_DATABASE_KEY:
		return jsonify({"error": "You don't have admin priveleges to this endpoint."})
	order = Order.query.get(order_id)

	order.delivered = True
	order.delivery_in_process = False
	# order.delivery_time = request.json['delivery_time']
	db.session.commit()

	return order_schema.jsonify(order)

def cancel48(order_id):
	order = Order.query.get(order_id)

	user_email = order.email

	restaurant_email = Restaurant.query.get(order.restaurant_id).email

	if not order.delivery_in_process:
		db.session.delete(order)
		db.session.commit()


		print("PRINTING EMAILS ----------------------")
		print("User: %s" % (user_email))
		print("Restaurant: %s" % (restaurant_email))

		try:
			# Send an email to the user
			msg = Message('Your TigerMeals Delivery order was removed.',
			sender='tigermealsdelivery@gmail.com',
			recipients=[user_email],
			html=user_48hours_html())
			send_async_email(msg)
		except:
			print("Cannot send email")


		try:
			# Send email to restaurant
			msg = Message('Denied TigerMeals Delivery order request!',
			sender='tigermealsdelivery@gmail.com',
			recipients=[restaurant_email],
			html=restaurant_48hours_html())
			send_async_email(msg)
		except:
			print("Cannot send email")

		return order_schema.jsonify(order)

# Endpoint to place an order
@app.route('/order/ordered/<order_id>', methods = ["POST"])
def order_ordered(order_id):
	if 'key' not in request.json or request.json['key'] != SECURE_DATABASE_KEY:
		return jsonify({"error": "You don't have admin priveleges to this endpoint."})
	order = Order.query.get(order_id)

	order.ordered = True
	order.name = request.json['name']
	order.email = request.json['email']

	# increment timesOrdered field of all food items being ordered
	for item in order.food_items:
		food = Food.query.get(item['food_id'])
		food.timesOrdered += 1

	db.session.commit()

	#Delete after 48 hours if it doesn't get approved
	# 172800 seconds in 48 hours
	t = Timer(172800, cancel48, [order_id])
	t.start()

	return order_schema.jsonify(order)

# Endpoint to create new order
# To specify food_items in JSON format as a dictionary use the following syntax
# food_items: { "key1": "value1", "key2": "value2 "}, ...
#
# IMPORTANT: No extra steps are needed! No need to serialize before passing to
# this function as long as request type is JSON.
#

@app.route("/order/deny/<order_id>", methods = ["PUT"])
def order_denied(order_id):
	if 'key' not in request.json or request.json['key'] != SECURE_DATABASE_KEY:
		return jsonify({"error": "You don't have admin priveleges to this endpoint."})
	order = Order.query.get(order_id)

	order.denied = True

	db.session.commit()

	return order_schema.jsonify(order)

@app.route("/order", methods = ["POST"])
def order_add():
	if 'key' not in request.json or request.json['key'] != SECURE_DATABASE_KEY:
		return jsonify({"error": "You don't have admin priveleges to this endpoint."})
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
	if 'key' not in request.json or request.json['key'] != SECURE_DATABASE_KEY:
		return jsonify({"error": "You don't have admin priveleges to this endpoint."})
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

@app.route("/order/deliveryInfo/<order_id>", methods = ["POST"])
def order_deliveryInfo(order_id):
	if 'key' not in request.json or request.json['key'] != SECURE_DATABASE_KEY:
		return jsonify({"error": "You don't have admin priveleges to this endpoint."})
	order = Order.query.get(order_id)
	order.location = request.json['location']
	order.date = request.json['date']
	order.delivery_time = request.json['time']
	order.delivery_instructions = request.json['instructions']
	db.session.commit()
	return order_schema.jsonify(order)

@app.route('/order/addToken/<order_id>/<stripeToken>/<amount>', methods = ["POST"])
def order_orderedToken(order_id, stripeToken, amount):
	if 'key' not in request.json or request.json['key'] != SECURE_DATABASE_KEY:
		return jsonify({"error": "You don't have admin priveleges to this endpoint."})
	order = Order.query.get(order_id)

	order.ordered = True
	order.name = request.json['name']
	order.email = request.json['email']
	order.stripeToken = stripeToken
	order.amount = amount
	# increment timesOrdered field of all food items being ordered
	for item in order.food_items:
		food = Food.query.get(item['food_id'])
		food.timesOrdered += 1

	db.session.commit()

	return order_schema.jsonify(order)

# Endpoint to delete a food item from a particular order
@app.route("/order/delete/<order_id>", methods=["PUT"])
def order_food_delete(order_id):
	if 'key' not in request.json or request.json['key'] != SECURE_DATABASE_KEY:
		return jsonify({"error": "You don't have admin priveleges to this endpoint."})
	order = Order.query.get(order_id)
	food_items = request.json['food_items']
	order.food_items = food_items

	if food_items == []:
		order.restaurant_id = -1

	db.session.commit()
	return order_schema.jsonify(order)

@app.route('/order/rateExperience/<order_id>', methods = ["POST"])
def order_rateExperience(order_id):
	if 'key' not in request.json or request.json['key'] != SECURE_DATABASE_KEY:
		return jsonify({"error": "You don't have admin priveleges to this endpoint."})
	order = Order.query.get(order_id)
	order.rating = request.json['rating']

	db.session.commit()
	return order_schema.jsonify(order)

# Endpoint to delete order
@app.route("/order/<order_id>", methods = ["DELETE"])
def order_delete(order_id):
	if 'key' not in request.json or request.json['key'] != SECURE_DATABASE_KEY:
		return jsonify({"error": "You don't have admin priveleges to this endpoint."})
	order = Order.query.get(order_id)

	db.session.delete(order)
	db.session.commit()
	return order_schema.jsonify(order)
#
# db.create_all()
# db.session.commit()

if __name__ == '__main__':
	app.run(debug=True, host='0.0.0.0', port=os.environ.get("PORT", 5000))
