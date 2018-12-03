from flask import Flask, request, jsonify, render_template, redirect
import requests
import json
import os

app = Flask(__name__)
DATABASE_URL = "http://localhost:5000"

currentSort = ""
currRestaurantFilters = []
currCuisineFilters = []
currAllergenFilters = []
currSizeFilters = []

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

    """for food_item in order['food_items']:
        print (food_item['food_id'])
        food = _getJSON(DATABASE_URL + '/food/' + str(food_item['food_id']))

        food_prices.append(food['price'])
        food_descriptions.append(food['description'])
        food_titles.append(food['title'])
        food_quantity_feds.append(food['quantity_fed'])
        food_images.append(food['image'])
        food_subtotals.append(food_item['subtotal'])
        food_multiplier.append(food_item['quantity'])
        food_ids.append(food_item['food_id'])"""

    if user_id is None:
        # Redirect to login screen if the cookie is None
        pass

    #print (food_prices)
    #print (food_descriptions)
    #print (food_titles)
    #print (food_quantity_feds)
    #print (food_images)

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

    #print (data)
    return (data)

## POST METHOD
def _postJSON(url, data):
    r = requests.post(url=url, data=data)

    response = r.json()
    return response



##### SIMPLE SCREEN NAVIGATION ------------------------------------------------
@app.route("/")
@app.route("/home")
def home():
    print("home template requested -----------------------------")
    user_id = 1

    food_prices, food_descriptions, food_titles, food_quantity_feds,\
        food_images, length_cart, food_subtotals, total, food_multiplier, food_ids = _getCart(user_id)

    resp = (render_template('home.tpl', user_id=user_id, food_prices=food_prices,\
        food_descriptions=food_descriptions, food_titles=food_titles,\
        food_quantity_feds=food_quantity_feds, food_images=food_images,\
        length_cart=length_cart, food_subtotals=food_subtotals, total=total, id=user_id))


    print("User Id: " + str(user_id))
    if user_id is None:
        # Redirect to login screen if the cookie is None
        pass



    return resp

@app.route("/cart")
def cart():
    print("cart template requested -----------------------------")
    user_id = 1

    food_prices, food_descriptions, food_titles, food_quantity_feds,\
        food_images, length_cart, food_subtotals, total, food_multiplier, food_ids = _getCart(user_id)


    return render_template('cart.tpl', user_id=user_id, food_prices=food_prices,\
        food_descriptions=food_descriptions, food_titles=food_titles,\
        food_quantity_feds=food_quantity_feds, food_images=food_images,\
        length_cart=length_cart, food_subtotals=food_subtotals, total=total, food_multiplier = food_multiplier, id=user_id)

@app.route("/about")
def about():
    print("about template requested -----------------------------")
    user_id = 1

    food_prices, food_descriptions, food_titles, food_quantity_feds,\
        food_images, length_cart, food_subtotals, total, food_multiplier, food_ids = _getCart(user_id)

    return render_template('about.tpl', user_id=user_id, food_prices=food_prices,\
        food_descriptions=food_descriptions, food_titles=food_titles,\
        food_quantity_feds=food_quantity_feds, food_images=food_images,\
        length_cart=length_cart, food_subtotals=food_subtotals, total=total, id=user_id)

@app.route("/checkout")
def checkout():
    print("checkout template requested -----------------------------")
    user_id = 1

    food_prices, food_descriptions, food_titles, food_quantity_feds,\
        food_images, length_cart, food_subtotals, total, food_multiplier, food_ids = _getCart(user_id)

    email, name, phone, address, netid, allergies = _getUser(user_id)

    name = name.split()

    current_order_url = DATABASE_URL + "/order/current/" + str(user_id)
    res = requests.get(current_order_url)
    if not res.ok:
        res.raise_for_status()
    else:
        order_id = json.loads(res.content)['order_id']

    return render_template('checkout.tpl', user_id=user_id, food_prices=food_prices,\
        food_descriptions=food_descriptions, food_titles=food_titles,\
        food_quantity_feds=food_quantity_feds, food_images=food_images,\
        length_cart=length_cart, food_subtotals=food_subtotals, total=total, food_multiplier=food_multiplier,\
        email=email, name=name, phone=phone,address=address, netid=netid, id=user_id, order_id=order_id)

@app.route("/account")
def account():
    print("account template requested -----------------------------")
    user_id = 1

    email, name, phone, address, netid, allergies = _getUser(user_id)

    food_prices, food_descriptions, food_titles, food_quantity_feds,\
        food_images, length_cart, food_subtotals, total, food_multiplier, food_ids = _getCart(user_id)

    return render_template('account.tpl', name=name, email=email,\
        phone=phone, address=address, allergies=allergies, netid=netid, user_id=user_id, food_prices=food_prices,\
        food_descriptions=food_descriptions, food_titles=food_titles,\
        food_quantity_feds=food_quantity_feds, food_images=food_images,\
        length_cart=length_cart, food_subtotals=food_subtotals, total=total, id=user_id)

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
def checkFilters():
    #res = requests.get(orders_url)
    kfTea = request.args.get('KungFuTea')
    panera = request.args.get('Panera')
    tacoria = request.args.get('Tacoria')

    asian = request.args.get('Asian')
    american = request.args.get('American')
    drinks = request.args.get('Drinks')
    healthy = request.args.get('Healthy')

    glFree = request.args.get('GLFree')
    kosher = request.args.get('Kosher')
    vegan = request.args.get('Vegan')
    vegetarian = request.args.get('Vegetarian')

    size025 = request.args.get('serving025')
    size2550 = request.args.get('serving2550')
    size5075 = request.args.get('serving5075')
    size75100 = request.args.get('serving75100')
    size100 = request.args.get('serving100')

    #print("gluten free" + str(request.form.getlist('glFree')))
    global currRestaurantFilters
    global currCuisineFilters
    global currAllergenFilters
    global currSizeFilters

    currRestaurantFilters = []
    currCuisineFilters = []
    currAllergenFilters = []
    currSizeFilters = []

    if kfTea is not None:
        currRestaurantFilters.append('Kung Fu Tea')
    if panera is not None:
        currRestaurantFilters.append('Panera')
    if tacoria is not None:
        currRestaurantFilters.append('Tacoria')
    if asian is not None:
        currCuisineFilters.append('Asian')
    if american is not None:
        currCuisineFilters.append('American')
    if drinks is not None:
        currCuisineFilters.append('Drinks')
    if healthy is not None:
        currCuisineFilters.append('Healthy')
    if glFree is not None:
        currAllergenFilters.append('Gluten Free')
    if kosher is not None:
        currAllergenFilters.append('Kosher')
    if vegetarian is not None:
        currAllergenFilters.append('Vegetarian')
    if vegan is not None:
        currAllergenFilters.append('Vegan')
    if size025 is not None:
        currSizeFilters.append(25)
    if size2550 is not None:
        currSizeFilters.append(50)
    if size5075 is not None:
        currSizeFilters.append(75)
    if size75100 is not None:
        currSizeFilters.append(100)
    if size100 is not None:
        currSizeFilters.append(1000000)


def filterItems(meals):
    mealsEdited = []
    for meal in meals:
            restaurantID = meal['restaurant_id']
            restaurant_url = DATABASE_URL + "/restaurant/" + str(restaurantID)
        
            res = requests.get(restaurant_url)
            if not res.ok:
                res.raise_for_status()
            else:
                meal['restaurant_name'] = json.loads(res.content)['name']
            addAllergen = True
            addSize = True
            if len(currRestaurantFilters) != 0:
                if str(meal['restaurant_name']) not in currRestaurantFilters:
                    continue
            if len(currCuisineFilters) != 0:
                if str(meal['cuisine']) not in currCuisineFilters:
                    continue
            if len(currAllergenFilters) != 0:
                
                allergenList = meal['allergies'].split()
                addAllergen = False
                for x in allergenList:
                    if x in currAllergenFilters:
                        addAllergen = True
            if len(currSizeFilters) != 0:
                quantity = int(meal['quantity_fed'])
                addSize = False
                if quantity < 25 and 25 in currSizeFilters:
                    addSize = True
                if quantity < 50 and quantity >= 25 and 50 in currSizeFilters:
                    addSize = True
                if quantity < 75 and quantity >= 50 and 75 in currSizeFilters:
                    addSize = True
                if quantity < 100 and quantity >= 75 and 100 in currSizeFilters:
                    addSize = True
                if quantity < 1000000 and quantity >= 100 and 1000000 in currSizeFilters:
                    addSize = True
            
            if addAllergen == True and addSize == True:
                mealsEdited.append(meal)

    return mealsEdited

@app.route("/meals/servingLowHighSort")
def mealsServingSortLowHigh():
    global currentSort
    currentSort = "/food/sort/servings/low-high"

    orders_url = DATABASE_URL + "/food/sort/servings/low-high"
    # have to change this URL based on what was clicked in meals.tpl
    user_id = 1
    food_prices, food_descriptions, food_titles, food_quantity_feds,\
    food_images, length_cart, food_subtotals, total, food_multiplier, food_ids = _getCart(user_id)
    

    
    res = requests.get(orders_url)
    if not res.ok:
        res.raise_for_status()
    else:
        meals = json.loads(res.content)
        mealsEdited = filterItems(meals)
            
        # For logging purposes
        for meal in mealsEdited:
            # Make additional request to get restaurant name
            restaurantID = meal['restaurant_id']
            restaurant_url = DATABASE_URL + "/restaurant/" + str(restaurantID)

            res = requests.get(restaurant_url)
            # Splice allergies into a list
            if meal['allergies'] is "":
                meal['allergies'] = []
            else:
                meal['allergies'] = meal['allergies'].split(",")
            if not res.ok:
                res.raise_for_status()
            else:
                meal['restaurant'] = json.loads(res.content)['name']
            # For logging purposes
            #for key in meal:
                #print (key + " : " + str(meal[key]))
            #print()



    return render_template('meals.tpl', meals=mealsEdited, \
        id=request.args.get('id'), food_prices = food_prices, \
        food_subtotals = food_subtotals, food_titles = food_titles, \
        length_cart = length_cart, total=total, food_images= food_images)

@app.route("/meals/servingHighLowSort")
def mealsServingSortHighLow():
    global currentSort
    currentSort = "/food/sort/servings/high-low"

    orders_url = DATABASE_URL + "/food/sort/servings/high-low"
    # have to change this URL based on what was clicked in meals.tpl
    user_id = 1
    food_prices, food_descriptions, food_titles, food_quantity_feds,\
    food_images, length_cart, food_subtotals, total, food_multiplier, food_ids = _getCart(user_id)

    res = requests.get(orders_url)
    if not res.ok:
        res.raise_for_status()
    else:
        meals = json.loads(res.content)
        mealsEdited = filterItems(meals)
        # For logging purposes
        for meal in mealsEdited:
            # Make additional request to get restaurant name
            restaurantID = meal['restaurant_id']
            restaurant_url = DATABASE_URL + "/restaurant/" + str(restaurantID)
            res = requests.get(restaurant_url)
            # Splice allergies into a list
            if meal['allergies'] is "":
                meal['allergies'] = []
            else:
                meal['allergies'] = meal['allergies'].split(",")
            if not res.ok:
                res.raise_for_status()
            else:
                meal['restaurant'] = json.loads(res.content)['name']
            # For logging purposes
            for key in meal:
                print (key + " : " + str(meal[key]))
            print()

    return render_template('meals.tpl', meals=mealsEdited, \
        id=request.args.get('id'), food_prices = food_prices, \
        food_subtotals = food_subtotals, food_titles = food_titles, \
        length_cart = length_cart, total=total, food_images= food_images)

@app.route("/meals/popularitySort")
def mealsPopualritySort():
    global currentSort
    currentSort = "/food/sort/popularity"

    orders_url = DATABASE_URL + "/food/sort/popularity"
    # have to change this URL based on what was clicked in meals.tpl
    user_id = 1
    food_prices, food_descriptions, food_titles, food_quantity_feds,\
    food_images, length_cart, food_subtotals, total, food_multiplier, food_ids = _getCart(user_id)

    res = requests.get(orders_url)
    if not res.ok:
        res.raise_for_status()
    else:
        meals = json.loads(res.content)
        mealsEdited = filterItems(meals)
        # For logging purposes
        for meal in mealsEdited:
            # Make additional request to get restaurant name
            restaurantID = meal['restaurant_id']
            restaurant_url = DATABASE_URL + "/restaurant/" + str(restaurantID)
            res = requests.get(restaurant_url)
            # Splice allergies into a list
            if meal['allergies'] is "":
                meal['allergies'] = []
            else:
                meal['allergies'] = meal['allergies'].split(",")
            if not res.ok:
                res.raise_for_status()
            else:
                meal['restaurant'] = json.loads(res.content)['name']
            # For logging purposes
            for key in meal:
                print (key + " : " + str(meal[key]))
            print()

    return render_template('meals.tpl', meals=mealsEdited, \
        id=request.args.get('id'), food_prices = food_prices, \
        food_subtotals = food_subtotals, food_titles = food_titles, \
        length_cart = length_cart, total=total, food_images= food_images)

@app.route("/meals/priceHighLowSort")
def mealsPriceHighLow():
    global currentSort
    currentSort = "/food/sort/price/high-to-low"

    orders_url = DATABASE_URL + "/food/sort/price/high-to-low"
    # have to change this URL based on what was clicked in meals.tpl
    user_id = 1
    food_prices, food_descriptions, food_titles, food_quantity_feds,\
    food_images, length_cart, food_subtotals, total, food_multiplier, food_ids = _getCart(user_id)

    res = requests.get(orders_url)
    if not res.ok:
        res.raise_for_status()
    else:
        meals = json.loads(res.content)
        mealsEdited = filterItems(meals)
        # For logging purposes
        for meal in mealsEdited:
            # Make additional request to get restaurant name
            restaurantID = meal['restaurant_id']
            restaurant_url = DATABASE_URL + "/restaurant/" + str(restaurantID)
            res = requests.get(restaurant_url)
            # Splice allergies into a list
            if meal['allergies'] is "":
                meal['allergies'] = []
            else:
                meal['allergies'] = meal['allergies'].split(",")
            if not res.ok:
                res.raise_for_status()
            else:
                meal['restaurant'] = json.loads(res.content)['name']
            # For logging purposes
            for key in meal:
                print (key + " : " + str(meal[key]))
            print()

    return render_template('meals.tpl', meals=mealsEdited, \
        id=request.args.get('id'), food_prices = food_prices, \
        food_subtotals = food_subtotals, food_titles = food_titles, \
        length_cart = length_cart, total=total, food_images= food_images)

@app.route("/meals/mostRecentlyAddedSort")
def mealsMostRecentlyAddedSort():
    global currentSort
    currentSort = "/food/sort/most-recent"

    orders_url = DATABASE_URL + "/food/sort/most-recent"
    # have to change this URL based on what was clicked in meals.tpl
    user_id = 1
    food_prices, food_descriptions, food_titles, food_quantity_feds,\
    food_images, length_cart, food_subtotals, total, food_multiplier, food_ids = _getCart(user_id)

    res = requests.get(orders_url)
    if not res.ok:
        res.raise_for_status()
    else:
        meals = json.loads(res.content)
        mealsEdited = ""
        # For logging purposes
        for meal in mealsEdited:
            # Make additional request to get restaurant name
            restaurantID = meal['restaurant_id']
            restaurant_url = DATABASE_URL + "/restaurant/" + str(restaurantID)
            res = requests.get(restaurant_url)
            # Splice allergies into a list
            if meal['allergies'] is "":
                meal['allergies'] = []
            else:
                meal['allergies'] = meal['allergies'].split(",")
            if not res.ok:
                res.raise_for_status()
            else:
                meal['restaurant'] = json.loads(res.content)['name']
            # For logging purposes
            for key in meal:
                print (key + " : " + str(meal[key]))
            print()

    return render_template('meals.tpl', meals=mealsEdited, \
        id=request.args.get('id'), food_prices = food_prices, \
        food_subtotals = food_subtotals, food_titles = food_titles, \
        length_cart = length_cart, total=total, food_images= food_images)

@app.route("/meals/filterCaterings")
def mealsFilterCaterings2():
    checkFilters()


    orders_url = DATABASE_URL + currentSort
    # have to change this URL based on what was clicked in meals.tpl
    user_id = 1
    food_prices, food_descriptions, food_titles, food_quantity_feds,\
    food_images, length_cart, food_subtotals, total, food_multiplier, food_ids = _getCart(user_id)

    res = requests.get(orders_url)
    if not res.ok:
        res.raise_for_status()
    else:
        meals = json.loads(res.content)
        # For logging purposes
        mealsEdited = filterItems(meals)
        for meal in mealsEdited:
            # Make additional request to get restaurant name
            restaurantID = meal['restaurant_id']
            restaurant_url = DATABASE_URL + "/restaurant/" + str(restaurantID)
            res = requests.get(restaurant_url)
            # Splice allergies into a list
            if meal['allergies'] is "":
                meal['allergies'] = []
            else:
                meal['allergies'] = meal['allergies'].split(",")
            if not res.ok:
                res.raise_for_status()
            else:
                meal['restaurant'] = json.loads(res.content)['name']
            # For logging purposes
            for key in meal:
                print (key + " : " + str(meal[key]))
            print()

    return render_template('meals.tpl', meals=mealsEdited, \
        id=request.args.get('id'), food_prices = food_prices, \
        food_subtotals = food_subtotals, food_titles = food_titles, \
        length_cart = length_cart, total=total, food_images= food_images)

@app.route("/filterCaterings")
def mealsFilterCaterings():
    
    checkFilters()

    orders_url = DATABASE_URL + currentSort
    # have to change this URL based on what was clicked in meals.tpl
    user_id = 1
    food_prices, food_descriptions, food_titles, food_quantity_feds,\
    food_images, length_cart, food_subtotals, total, food_multiplier, food_ids = _getCart(user_id)

    res = requests.get(orders_url)
    if not res.ok:
        res.raise_for_status()
    else:
        meals = json.loads(res.content)
        # For logging purposes
        mealsEdited = filterItems(meals)
        for meal in mealsEdited:
            # Make additional request to get restaurant name
            restaurantID = meal['restaurant_id']
            restaurant_url = DATABASE_URL + "/restaurant/" + str(restaurantID)
            res = requests.get(restaurant_url)
            # Splice allergies into a list
            if meal['allergies'] is "":
                meal['allergies'] = []
            else:
                meal['allergies'] = meal['allergies'].split(",")
            if not res.ok:
                res.raise_for_status()
            else:
                meal['restaurant'] = json.loads(res.content)['name']
            # For logging purposes
            for key in meal:
                print (key + " : " + str(meal[key]))
            print()

    return render_template('meals.tpl', meals=mealsEdited, \
        id=request.args.get('id'), food_prices = food_prices, \
        food_subtotals = food_subtotals, food_titles = food_titles, \
        length_cart = length_cart, total=total, food_images= food_images)
@app.route("/meals/leastRecentlyAddedSort")
def mealsLeastRecentlyAddedSort():
    global currentSort
    currentSort = "/food/sort/least-recent"
    orders_url = DATABASE_URL + "/food/sort/least-recent"
    # have to change this URL based on what was clicked in meals.tpl
    user_id = 1
    food_prices, food_descriptions, food_titles, food_quantity_feds,\
    food_images, length_cart, food_subtotals, total, food_multiplier, food_ids = _getCart(user_id)

    res = requests.get(orders_url)
    if not res.ok:
        res.raise_for_status()
    else:
        meals = json.loads(res.content)
        mealsEdited = filterItems(meals)
        # For logging purposes
        for meal in mealsEdited:
            # Make additional request to get restaurant name
            restaurantID = meal['restaurant_id']
            restaurant_url = DATABASE_URL + "/restaurant/" + str(restaurantID)
            res = requests.get(restaurant_url)
            # Splice allergies into a list
            if meal['allergies'] is "":
                meal['allergies'] = []
            else:
                meal['allergies'] = meal['allergies'].split(",")
            if not res.ok:
                res.raise_for_status()
            else:
                meal['restaurant'] = json.loads(res.content)['name']
            # For logging purposes
            for key in meal:
                print (key + " : " + str(meal[key]))
            print()

    return render_template('meals.tpl', meals=mealsEdited, \
        id=request.args.get('id'), food_prices = food_prices, \
        food_subtotals = food_subtotals, food_titles = food_titles, \
        length_cart = length_cart, total=total, food_images= food_images)

@app.route("/meals")
def meals():
    global currentSort
    orders_url = DATABASE_URL + "/food/sort/price/low-to-high"
    currentSort = "/food/sort/price/low-to-high"
    # have to change this URL based on what was clicked in meals.tpl
    user_id = 1
    food_prices, food_descriptions, food_titles, food_quantity_feds,\
    food_images, length_cart, food_subtotals, total, food_multiplier, food_ids = _getCart(user_id)

    res = requests.get(orders_url)
    if not res.ok:
        res.raise_for_status()
    else:
        meals = json.loads(res.content)
        mealsEdited = filterItems(meals)
        # For logging purposes
        for meal in mealsEdited:
            # Make additional request to get restaurant name
            restaurantID = meal['restaurant_id']
            restaurant_url = DATABASE_URL + "/restaurant/" + str(restaurantID)
            res = requests.get(restaurant_url)
            # Splice allergies into a list
            if meal['allergies'] is "":
                meal['allergies'] = []
            else:
                meal['allergies'] = meal['allergies'].split(",")
            if not res.ok:
                res.raise_for_status()
            else:
                meal['restaurant'] = json.loads(res.content)['name']
            # For logging purposes
            for key in meal:
                print (key + " : " + str(meal[key]))
            print()

    return render_template('meals.tpl', meals=mealsEdited, \
        id=request.args.get('id'), food_prices = food_prices, \
        food_subtotals = food_subtotals, food_titles = food_titles, \
        length_cart = length_cart, total=total, food_images= food_images)

@app.route("/cart/upload", methods=["POST"])
def upload_cart():
    id = request.args.get('id')
    current_order_url = DATABASE_URL + "/order/current/" + str(id)
    res = requests.get(current_order_url)
    if not res.ok:
        res.raise_for_status()
    else:
        order_id = json.loads(res.content)['order_id']
        old_food_items = json.loads(res.content)['food_items']
        if old_food_items is None:
            old_food_items = []

        food_id = request.form.get('food_id')
        get_food_url = DATABASE_URL + "/food/" + str(food_id)
        res = requests.get(get_food_url)
        if not res.ok:
            res.raise_for_status()
        else:
            food_details = json.loads(res.content)

            old_food_items.append(
            {"food_title": food_details['title'],
             "food_id": food_details['food_id'],
             "food_quantity_fed": food_details['quantity_fed'],
             "food_price": food_details['price'],
             "quantity": int(request.form.get('quantity')),
             "customization": "N/A",
             "subtotal": int(request.form.get('quantity')) * food_details['price']}
             )

            print (old_food_items)

            updatedOrder = {
                "user_id": id,
                "food_items": old_food_items,
                "restaurant_id": food_details['restaurant_id'],
                "ordered": False,
                "paid": False,
                "date": None,
                "order_time": None,
                "delivery_time": None,
                "location": None
            }
            update_order_url = DATABASE_URL + "/order/" + str(order_id)
            res = requests.put(update_order_url, json = updatedOrder)
    return redirect('/meals?id=' + id)


@app.route("/ordered", methods=["POST"])
def ordered():
    id = request.args.get('id')
    current_order_url = DATABASE_URL + "/order/current/" + str(id)
    res = requests.get(current_order_url)
    if not res.ok:
        res.raise_for_status()
    else:
        order_id = json.loads(res.content)['order_id']
        order_ordered_url = DATABASE_URL + "/order/ordered/" + str(order_id)
        res = requests.post(order_ordered_url)
    return redirect('/meals?id=' + id)

# @app.route("/test")
# def test():
#     orders_url = url + "/order/6"
#     res = requests.get(orders_url)
#     if not res.ok:
#         res.raise_for_status()
#     else:
#         meal = json.loads(res.content)
#         # For logging purposes
#         print ("Request Successful: ")
#         items = meal["food_items"]
#         for item in items:
#             for key in item:
#                 print (key + " : " + str(item[key]))
#             print()

if __name__ == '__main__':
    app.run(port = 8080)
