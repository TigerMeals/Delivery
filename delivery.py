from flask import Flask, request, jsonify, render_template, redirect, make_response
import requests
import json
import os

app = Flask(__name__)
DATABASE_URL = "http://localhost:5000"


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

    resp = make_response((render_template('home.tpl', user_id=user_id, food_prices=food_prices,\
        food_descriptions=food_descriptions, food_titles=food_titles,\
        food_quantity_feds=food_quantity_feds, food_images=food_images,\
        length_cart=length_cart, food_subtotals=food_subtotals, total=total, id=user_id)))


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

    KungFuTea = False
    Panera = False
    Tacoria = False
    Asian = False
    American = False
    Drinks = False
    Healthy = False
    GLFree = False
    Kosher = False
    Vegetarian = False
    Vegan = False
    serving025 = False
    serving2550 = False
    serving5075 = False
    serving75100 = False
    serving100 = False

    #print("gluten free" + str(request.form.getlist('glFree')))
    

    currRestaurantFilters = []
    currCuisineFilters = []
    currAllergenFilters = []
    currSizeFilters = []

    if kfTea is not None:
        currRestaurantFilters.append('Kung Fu Tea')
        KungFuTea = True
    if panera is not None:
        currRestaurantFilters.append('Panera')
        Panera = True
    if tacoria is not None:
        currRestaurantFilters.append('Tacoria')
        Tacoria = True
    if asian is not None:
        currCuisineFilters.append('Asian')
        Asian = True
    if american is not None:
        currCuisineFilters.append('American')
        American = True
    if drinks is not None:
        currCuisineFilters.append('Drinks')
        Drinks = True
    if healthy is not None:
        currCuisineFilters.append('Healthy')
        Healthy = True
    if glFree is not None:
        currAllergenFilters.append('Gluten Free')
        GLFree = True
    if kosher is not None:
        currAllergenFilters.append('Kosher')
        Kosher = True
    if vegetarian is not None:
        currAllergenFilters.append('Vegetarian')
        Vegetarian = True
    if vegan is not None:
        currAllergenFilters.append('Vegan')
        Vegan = True
    if size025 is not None:
        currSizeFilters.append(25)
        serving025 = True
    if size2550 is not None:
        currSizeFilters.append(50)
        serving2550 = True
    if size5075 is not None:
        currSizeFilters.append(75)
        serving5075 = True
    if size75100 is not None:
        currSizeFilters.append(100)
        serving75100 = True
    if size100 is not None:
        currSizeFilters.append(1000000)
        serving100 = True

    return (currRestaurantFilters, currCuisineFilters, currAllergenFilters, currSizeFilters, KungFuTea, Panera,
    Tacoria, Asian, American, Drinks, Healthy, GLFree, Kosher, Vegetarian, Vegan, serving025, serving2550, serving5075,
    serving75100, serving100)

def filterItems(meals, currRestaurantFilters, currCuisineFilters, currAllergenFilters, currSizeFilters):
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
    
    KungFuTea = False
    Panera = False
    Tacoria = False
    Asian = False
    American = False
    Drinks = False
    Healthy = False
    GLFree = False
    Kosher = False
    Vegetarian = False
    Vegan = False
    serving025 = False
    serving2550 = False
    serving5075 = False
    serving75100 = False
    serving100 = False

    currRestaurantFilters = [] 
    currCuisineFilters = []
    currAllergenFilters = [] 
    currSizeFilters = []

    currRestaurantFilters, currCuisineFilters, currAllergenFilters, currSizeFilters, KungFuTea, Panera, Tacoria, Asian, American, Drinks, Healthy, GLFree, Kosher, Vegetarian, Vegan, serving025, serving2550, serving5075,serving75100, serving100 = getFiltersFromCookies()

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
        mealsEdited = filterItems(meals, currRestaurantFilters, currCuisineFilters, currAllergenFilters, currSizeFilters)

            
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
        length_cart = length_cart, total=total, food_images= food_images, KungFuTea = KungFuTea,
    Panera = Panera,
    Tacoria = Tacoria,
    Asian = Asian,
    American = American,
    Drinks = Drinks,
    Healthy = Healthy,
    GLFree = GLFree,
    Kosher = Kosher,
    Vegetarian = Vegetarian,
    Vegan = Vegan,
    serving025 = serving025,
    serving2550 = serving2550,
    serving5075 = serving5075,
    serving75100 = serving75100,
    serving100 = serving100)

@app.route("/meals/servingHighLowSort")
def mealsServingSortHighLow():
    #global currentSort
    KungFuTea = False
    Panera = False
    Tacoria = False
    Asian = False
    American = False
    Drinks = False
    Healthy = False
    GLFree = False
    Kosher = False
    Vegetarian = False
    Vegan = False
    serving025 = False
    serving2550 = False
    serving5075 = False
    serving75100 = False
    serving100 = False

    currRestaurantFilters = [] 
    currCuisineFilters = []
    currAllergenFilters = [] 
    currSizeFilters = []

    currRestaurantFilters, currCuisineFilters, currAllergenFilters, currSizeFilters, KungFuTea, Panera, Tacoria, Asian, American, Drinks, Healthy, GLFree, Kosher, Vegetarian, Vegan, serving025, serving2550, serving5075,serving75100, serving100 = getFiltersFromCookies()

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
        mealsEdited = filterItems(meals, currRestaurantFilters, currCuisineFilters, currAllergenFilters, currSizeFilters)

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

    resp = make_response(render_template('meals.tpl', meals=mealsEdited, \
        id=request.args.get('id'), food_prices = food_prices, \
        food_subtotals = food_subtotals, food_titles = food_titles, \
        length_cart = length_cart, total=total, food_images= food_images, KungFuTea = KungFuTea,
    Panera = Panera,
    Tacoria = Tacoria,
    Asian = Asian,
    American = American,
    Drinks = Drinks,
    Healthy = Healthy,
    GLFree = GLFree,
    Kosher = Kosher,
    Vegetarian = Vegetarian,
    Vegan = Vegan,
    serving025 = serving025,
    serving2550 = serving2550,
    serving5075 = serving5075,
    serving75100 = serving75100,
    serving100 = serving100))

    resp.set_cookie('sort', '/food/sort/servings/high-low')
    return resp
@app.route("/meals/popularitySort")
def mealsPopualritySort():
    #global currentSort
    KungFuTea = False
    Panera = False
    Tacoria = False
    Asian = False
    American = False
    Drinks = False
    Healthy = False
    GLFree = False
    Kosher = False
    Vegetarian = False
    Vegan = False
    serving025 = False
    serving2550 = False
    serving5075 = False
    serving75100 = False
    serving100 = False

    currRestaurantFilters = [] 
    currCuisineFilters = []
    currAllergenFilters = [] 
    currSizeFilters = []

    currRestaurantFilters, currCuisineFilters, currAllergenFilters, currSizeFilters, KungFuTea, Panera, Tacoria, Asian, American, Drinks, Healthy, GLFree, Kosher, Vegetarian, Vegan, serving025, serving2550, serving5075,serving75100, serving100 = getFiltersFromCookies()


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
        mealsEdited = filterItems(meals, currRestaurantFilters, currCuisineFilters, currAllergenFilters, currSizeFilters)

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

    resp = make_response(render_template('meals.tpl', meals=mealsEdited, \
        id=request.args.get('id'), food_prices = food_prices, \
        food_subtotals = food_subtotals, food_titles = food_titles, \
        length_cart = length_cart, total=total, food_images= food_images, KungFuTea = KungFuTea,
    Panera = Panera,
    Tacoria = Tacoria,
    Asian = Asian,
    American = American,
    Drinks = Drinks,
    Healthy = Healthy,
    GLFree = GLFree,
    Kosher = Kosher,
    Vegetarian = Vegetarian,
    Vegan = Vegan,
    serving025 = serving025,
    serving2550 = serving2550,
    serving5075 = serving5075,
    serving75100 = serving75100,
    serving100 = serving100))

    resp.set_cookie('sort', '/food/sort/popularity')
    return resp

@app.route("/meals/priceHighLowSort")
def mealsPriceHighLow():
    #global currentSort
    KungFuTea = False
    Panera = False
    Tacoria = False
    Asian = False
    American = False
    Drinks = False
    Healthy = False
    GLFree = False
    Kosher = False
    Vegetarian = False
    Vegan = False
    serving025 = False
    serving2550 = False
    serving5075 = False
    serving75100 = False
    serving100 = False


    currRestaurantFilters, currCuisineFilters, currAllergenFilters, currSizeFilters, KungFuTea, Panera, Tacoria, Asian, American, Drinks, Healthy, GLFree, Kosher, Vegetarian, Vegan, serving025, serving2550, serving5075,serving75100, serving100 = getFiltersFromCookies()

    orders_url = DATABASE_URL + '/food/sort/price/high-to-low'
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
        mealsEdited = filterItems(meals, currRestaurantFilters, currCuisineFilters, currAllergenFilters, currSizeFilters)
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


    resp = make_response(render_template('meals.tpl', meals=mealsEdited, \
        id=request.args.get('id'), food_prices = food_prices, \
        food_subtotals = food_subtotals, food_titles = food_titles, \
        length_cart = length_cart, total=total, food_images= food_images, KungFuTea = KungFuTea,
        Panera = Panera, Tacoria = Tacoria, Asian = Asian, American = American, Drinks = Drinks,
        Healthy = Healthy, GLFree = GLFree, Kosher = Kosher, Vegetarian = Vegetarian, Vegan = Vegan,
        serving025 = serving025, serving2550 = serving2550, serving5075 = serving5075, serving75100 = serving75100,
        serving100 = serving100))
    
    resp.set_cookie('sort', '/food/sort/price/high-to-low')
    return resp
def getFiltersFromCookies():
    currRestaurantFilters = [] 
    currCuisineFilters = []
    currAllergenFilters = [] 
    currSizeFilters = []

    
    if request.cookies.get('KungFuTea') == '1':
        KungFuTea = True
        currRestaurantFilters.append('Kung Fu Tea')
    else:
        KungFuTea = False

    if request.cookies.get('Panera') == '1':
        Panera = True
        currRestaurantFilters.append('Panera')
    else:
        Panera = False
    if request.cookies.get('Tacoria') == '1':
        currRestaurantFilters.append('Tacoria')
        Tacoria = True
    else:
        Tacoria = False
    if request.cookies.get('Asian') == '1':
        currCuisineFilters.append('Asian')
        Asian = True
    else:
        Asian = False
    
    if request.cookies.get('American') == '1':
        currCuisineFilters.append('American')
        American = True
    else:
        American = False

    if request.cookies.get('Drinks') == '1':
        Drinks = True
        currCuisineFilters.append('Drinks')
    else:
        Drinks = False

    if request.cookies.get('Healthy') == '1':
        Healthy = True
        currCuisineFilters.append('Healthy')
    else:
        Healthy = False

    if request.cookies.get('GLFree') == '1':
        GlFree = True
        currAllergenFilters.append('Gluten Free')
    else:
        GLFree = False

    if request.cookies.get('Kosher') == '1':
        currAllergenFilters.append('Kosher')
        Kosher = True
    else:
        Kosher = False

    if request.cookies.get('Vegetarian') == '1':
        currAllergenFilters.append('Vegetarian')
        Vegetarian = True
    else:
        Vegetarian = False

    if request.cookies.get('Vegan') == '1':
        currAllergenFilters.append('Vegan')
        Vegan = True
    else:
        Vegan = False

    if request.cookies.get('serving025') == '1':
        serving025 = True
        currSizeFilters.append(25)
    else:
        serving025 = False

    if request.cookies.get('serving2550') == '1':
        currSizeFilters.append(50)
        serving2550 = True
    else:
        serving2550 = False

    if request.cookies.get('serving5075') == '1':
        currSizeFilters.append(75)
        serving5075 = True
    else:
        serving5075 = False

    if request.cookies.get('serving75100') == '1':
        currSizeFilters.append(100)
        serving75100 = True
    else:
        serving75100 = False

    if request.cookies.get('serving100') == '1':
        currSizeFilters.append(1000000)
        serving100 = True
    else:
        serving100 = False

    return (currRestaurantFilters, currCuisineFilters, currAllergenFilters, currSizeFilters, KungFuTea, Panera,
    Tacoria, Asian, American, Drinks, Healthy, GLFree, Kosher, Vegetarian, Vegan, serving025, serving2550, serving5075,
    serving75100, serving100)

@app.route("/meals/mostRecentlyAddedSort")
def mealsMostRecentlyAddedSort():
    #global currentSort
    currRestaurantFilters, currCuisineFilters, currAllergenFilters, currSizeFilters, KungFuTea, Panera, Tacoria, Asian, American, Drinks, Healthy, GLFree, Kosher, Vegetarian, Vegan, serving025, serving2550, serving5075,serving75100, serving100 = getFiltersFromCookies()

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
        mealsEdited = filterItems(meals, currRestaurantFilters, currCuisineFilters, currAllergenFilters, currSizeFilters)

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

    resp = make_response(render_template('meals.tpl', meals=mealsEdited, \
        id=request.args.get('id'), food_prices = food_prices, \
        food_subtotals = food_subtotals, food_titles = food_titles, \
        length_cart = length_cart, total=total, food_images= food_images, KungFuTea = KungFuTea, Panera = Panera, Tacoria = Tacoria,
    Asian = Asian,
    American = American,
    Drinks = Drinks,
    Healthy = Healthy,
    GLFree = GLFree,
    Kosher = Kosher,
    Vegetarian = Vegetarian,
    Vegan = Vegan,
    serving025 = serving025,
    serving2550 = serving2550,
    serving5075 = serving5075,
    serving75100 = serving75100,
    serving100 = serving100))

    resp.set_cookie('sort', "/food/sort/most-recent")
    return resp

@app.route("/meals/filterCaterings")
def mealsFilterCaterings2():

    KungFuTea = False
    Panera = False
    Tacoria = False
    Asian = False
    American = False
    Drinks = False
    Healthy = False
    GLFree = False
    Kosher = False
    Vegetarian = False
    Vegan = False
    serving025 = False
    serving2550 = False
    serving5075 = False
    serving75100 = False
    serving100 = False

    currRestaurantFilters = [] 
    currCuisineFilters = []
    currAllergenFilters = [] 
    currSizeFilters = []

    currRestaurantFilters, currCuisineFilters, currAllergenFilters, currSizeFilters, KungFuTea, Panera, Tacoria, Asian, American, Drinks, Healthy, GLFree, Kosher, Vegetarian, Vegan, serving025, serving2550, serving5075,serving75100, serving100 = checkFilters()

    orders_url = DATABASE_URL + request.cookies.get('sort')
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
        mealsEdited = filterItems(meals, currRestaurantFilters, currCuisineFilters, currAllergenFilters, currSizeFilters)

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


    resp = make_response(render_template('meals.tpl', meals=mealsEdited, \
        id=request.args.get('id'), food_prices = food_prices, \
        food_subtotals = food_subtotals, food_titles = food_titles, \
        length_cart = length_cart, total=total, food_images= food_images, KungFuTea = KungFuTea,
    Panera = Panera,
    Tacoria = Tacoria,
    Asian = Asian,
    American = American,
    Drinks = Drinks,
    Healthy = Healthy,
    GLFree = GLFree,
    Kosher = Kosher,
    Vegetarian = Vegetarian,
    Vegan = Vegan,
    serving025 = serving025,
    serving2550 = serving2550,
    serving5075 = serving5075,
    serving75100 = serving75100,
    serving100 = serving100))

    if KungFuTea == True:
        resp.set_cookie('KungFuTea', '1')
    else:
        resp.set_cookie('KungFuTea', '0')

    if Panera == True:
        resp.set_cookie('Panera', '1')
    else:
        resp.set_cookie('Panera', '0') 

    if Tacoria == True:
        resp.set_cookie('Tacoria', '1')
    else:
        resp.set_cookie('Tacoria', '0') 
    
    if Asian == True:
        resp.set_cookie('Asian', '1')
    else:
        resp.set_cookie('Asian', '0')
    if American == True:
        resp.set_cookie('American', '1')
    else:
        resp.set_cookie('American', '0')
    if Drinks == True:
        resp.set_cookie('Drinks', '1')
    else:
        resp.set_cookie('Drinks', '0')
    if Healthy == True:
        resp.set_cookie('Healthy', '1')
    else:
        resp.set_cookie('Healthy', '0')
    if GLFree == True:
        resp.set_cookie('GLFree', '1')
    else:
        resp.set_cookie('GLFree', '0')
    if Kosher == True:
        resp.set_cookie('Kosher', '1')
    else:
        resp.set_cookie('Kosher', '0')
    if Vegan == True:
        resp.set_cookie('Vegan', '1')
    else:
        resp.set_cookie('Vegan', '0')
    if Vegetarian == True:
        resp.set_cookie('Vegetarian', '1')
    else:
        resp.set_cookie('Vegetarian', '0')
    if serving025 == True:
        resp.set_cookie('serving025', '1')
    else:
        resp.set_cookie('serving025', '0')
    if serving2550 == True:
        resp.set_cookie('serving2550', '1')
    else:
        resp.set_cookie('serving2550', '0')
    if serving5075 == True:
        resp.set_cookie('serving5075', '1')
    else:
        resp.set_cookie('serving5075', '0')
    if serving75100 == True:
        resp.set_cookie('serving75100', '1')
    else:
        resp.set_cookie('serving75100', '0')
    if serving100 == True:
        resp.set_cookie('serving100', '1')
    else:
        resp.set_cookie('serving100', '0')



    return resp

@app.route("/filterCaterings")
def mealsFilterCaterings():
    
    KungFuTea = False
    Panera = False
    Tacoria = False
    Asian = False
    American = False
    Drinks = False
    Healthy = False
    GLFree = False
    Kosher = False
    Vegetarian = False
    Vegan = False
    serving025 = False
    serving2550 = False
    serving5075 = False
    serving75100 = False
    serving100 = False

    currRestaurantFilters = [] 
    currCuisineFilters = []
    currAllergenFilters = [] 
    currSizeFilters = []

    currRestaurantFilters, currCuisineFilters, currAllergenFilters, currSizeFilters, KungFuTea, Panera, Tacoria, Asian, American, Drinks, Healthy, GLFree, Kosher, Vegetarian, Vegan, serving025, serving2550, serving5075,serving75100, serving100 = checkFilters()

    orders_url = DATABASE_URL + request.cookies.get('sort')
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
        mealsEdited = filterItems(meals, currRestaurantFilters, currCuisineFilters, currAllergenFilters, currSizeFilters)
        
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


    resp = make_response(render_template('meals.tpl', meals=mealsEdited, \
        id=request.args.get('id'), food_prices = food_prices, \
        food_subtotals = food_subtotals, food_titles = food_titles, \
        length_cart = length_cart, total=total, food_images= food_images, KungFuTea = KungFuTea,
    Panera = Panera,
    Tacoria = Tacoria,
    Asian = Asian,
    American = American,
    Drinks = Drinks,
    Healthy = Healthy,
    GLFree = GLFree,
    Kosher = Kosher,
    Vegetarian = Vegetarian,
    Vegan = Vegan,
    serving025 = serving025,
    serving2550 = serving2550,
    serving5075 = serving5075,
    serving75100 = serving75100,
    serving100 = serving100))

    if KungFuTea == True:
        resp.set_cookie('KungFuTea', '1')
    else:
        resp.set_cookie('KungFuTea', '0')

    if Panera == True:
        resp.set_cookie('Panera', '1')
    else:
        resp.set_cookie('Panera', '0') 

    if Tacoria == True:
        resp.set_cookie('Tacoria', '1')
    else:
        resp.set_cookie('Tacoria', '0') 
    
    if Asian == True:
        resp.set_cookie('Asian', '1')
    else:
        resp.set_cookie('Asian', '0')
    if American == True:
        resp.set_cookie('American', '1')
    else:
        resp.set_cookie('American', '0')
    if Drinks == True:
        resp.set_cookie('Drinks', '1')
    else:
        resp.set_cookie('Drinks', '0')
    if Healthy == True:
        resp.set_cookie('Healthy', '1')
    else:
        resp.set_cookie('Healthy', '0')
    if GLFree == True:
        resp.set_cookie('GLFree', '1')
    else:
        resp.set_cookie('GLFree', '0')
    if Kosher == True:
        resp.set_cookie('Kosher', '1')
    else:
        resp.set_cookie('Kosher', '0')
    if Vegan == True:
        resp.set_cookie('Vegan', '1')
    else:
        resp.set_cookie('Vegan', '0')
    if Vegetarian == True:
        resp.set_cookie('Vegetarian', '1')
    else:
        resp.set_cookie('Vegetarian', '0')
    if serving025 == True:
        resp.set_cookie('serving025', '1')
    else:
        resp.set_cookie('serving025', '0')
    if serving2550 == True:
        resp.set_cookie('serving2550', '1')
    else:
        resp.set_cookie('serving2550', '0')
    if serving5075 == True:
        resp.set_cookie('serving5075', '1')
    else:
        resp.set_cookie('serving5075', '0')
    if serving75100 == True:
        resp.set_cookie('serving75100', '1')
    else:
        resp.set_cookie('serving75100', '0')
    if serving100 == True:
        resp.set_cookie('serving100', '1')
    else:
        resp.set_cookie('serving100', '0')




    return resp
@app.route("/meals/leastRecentlyAddedSort")
def mealsLeastRecentlyAddedSort():
    KungFuTea = False
    Panera = False
    Tacoria = False
    Asian = False
    American = False
    Drinks = False
    Healthy = False
    GLFree = False
    Kosher = False
    Vegetarian = False
    Vegan = False
    serving025 = False
    serving2550 = False
    serving5075 = False
    serving75100 = False
    serving100 = False
    currRestaurantFilters = []
    currCuisineFilters = []
    currAllergenFilters = []
    currSizeFilters = []

    currRestaurantFilters, currCuisineFilters, currAllergenFilters, currSizeFilters, KungFuTea, Panera, Tacoria, Asian, American, Drinks, Healthy, GLFree, Kosher, Vegetarian, Vegan, serving025, serving2550, serving5075,serving75100, serving100 = getFiltersFromCookies()

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
        mealsEdited = filterItems(meals, currRestaurantFilters, currCuisineFilters, currAllergenFilters, currSizeFilters)

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

    resp = make_response(render_template(render_template('meals.tpl', meals=mealsEdited, \
        id=request.args.get('id'), food_prices = food_prices, \
        food_subtotals = food_subtotals, food_titles = food_titles, \
        length_cart = length_cart, total=total, food_images= food_images, KungFuTea = KungFuTea,
    Panera = Panera,
    Tacoria = Tacoria,
    Asian = Asian,
    American = American,
    Drinks = Drinks,
    Healthy = Healthy,
    GLFree = GLFree,
    Kosher = Kosher,
    Vegetarian = Vegetarian,
    Vegan = Vegan,
    serving025 = serving025,
    serving2550 = serving2550,
    serving5075 = serving5075,
    serving75100 = serving75100,
    serving100 = serving100)))

    resp.set_cookie('sort', "/food/sort/least-recent")

    return resp

@app.route("/meals")
def meals():
    KungFuTea = False
    Panera = False
    Tacoria = False
    Asian = False
    American = False
    Drinks = False
    Healthy = False
    GLFree = False
    Kosher = False
    Vegetarian = False
    Vegan = False
    serving025 = False
    serving2550 = False
    serving5075 = False
    serving75100 = False
    serving100 = False
    currRestaurantFilters = []
    currCuisineFilters = []
    currAllergenFilters = []
    currSizeFilters = []

    currRestaurantFilters, currCuisineFilters, currAllergenFilters, currSizeFilters, KungFuTea, Panera, Tacoria, Asian, American, Drinks, Healthy, GLFree, Kosher, Vegetarian, Vegan, serving025, serving2550, serving5075,serving75100, serving100 = getFiltersFromCookies()

    orders_url = DATABASE_URL + "/food/sort/price/low-to-high"
    #currentSort = "/food/sort/price/low-to-high"
    # have to change this URL based on what was clicked in meals.tpl
    user_id = 1
    food_prices, food_descriptions, food_titles, food_quantity_feds,\
    food_images, length_cart, food_subtotals, total, food_multiplier, food_ids = _getCart(user_id)

    res = requests.get(orders_url)
    if not res.ok:
        res.raise_for_status()
    else:
        meals = json.loads(res.content)
        mealsEdited = filterItems(meals, currRestaurantFilters, currCuisineFilters, currAllergenFilters, currSizeFilters)

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

    resp = make_response(render_template('meals.tpl', meals=mealsEdited, \
        id=request.args.get('id'), food_prices = food_prices, \
        food_subtotals = food_subtotals, food_titles = food_titles, \
        length_cart = length_cart, total=total, food_images= food_images, KungFuTea = KungFuTea,
    Panera = Panera,
    Tacoria = Tacoria,
    Asian = Asian,
    American = American,
    Drinks = Drinks,
    Healthy = Healthy,
    GLFree = GLFree,
    Kosher = Kosher,
    Vegetarian = Vegetarian,
    Vegan = Vegan,
    serving025 = serving025,
    serving2550 = serving2550,
    serving5075 = serving5075,
    serving75100 = serving75100,
    serving100 = serving100))

    resp.set_cookie('sort', "/food/sort/price/low-to-high")

    return resp

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
