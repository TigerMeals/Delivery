###
# starting_database.py
# Run "python starting_database.py" to automatically populate the
# database. Please only start the script if the database is empty.
###

import requests

## POST METHOD
def _postJSON(url, data):
    r = requests.post(url=url, json=data)
    if not r.ok:
    	r.raise_for_status()

    response = r.json()
    return response


def main():
	#####
	print("CREATING RESTAURANTS --------------------")
	DATABASE_URL = "http://localhost:5000"

	kungfu = {
	    "address": "26 Nassau St.",
	    "cuisine": "Chinese",
	    "description": "A Chinese restaurant for all of your cravings.",
	    "email": "kungfutea@kf.com",
	    "image": "",
	    "name": "Kung Fu Tea",
	    "phone": "9084371254",
	    "restaurant_id": 1,
	    "servingSize": 150,
	    "website": "kungfutea.com",
	    "password": "extremepanda",
	    "primaryFirstName": "PrimKung",
	    "primaryLastName": "PrimFu",
	    "primaryEmail": "PrimEm",
	    "primaryPhone": "6054125789",
	    "secondaryFirstName": "",
	    "secondaryLastName": "",
	    "secondaryEmail": "",
	    "secondaryPhone": "",
	    "hours": ""
	}

	add_rest_url = DATABASE_URL + "/restaurant"
	res = _postJSON(add_rest_url, kungfu)

	print("KUNGFU ADDED ------------------------------")

	tacoria = {
	    "address": "36 Nassau St.",
	    "cuisine": "Mexican",
	    "description": "A Mexican restaurant for all of your cravings.",
	    "email": "tacoria@tf.com",
	    "image": "",
	    "name": "Tacoria",
	    "phone": "90843712594",
	    "restaurant_id": 2,
	    "servingSize": 100,
	    "website": "tacoria.com",
	    "password": "extremetaco",
	    "primaryFirstName": "PrimTaco",
	    "primaryLastName": "PrimRia",
	    "primaryEmail": "PrimEm",
	    "primaryPhone": "4561237546",
	    "secondaryFirstName": "",
	    "secondaryLastName": "",
	    "secondaryEmail": "",
	    "secondaryPhone": "",
	    "hours": ""
	}

	res = _postJSON(add_rest_url, tacoria)

	print("TACORIA ADDED ------------------------------")
	print("CREATING FOOD ------------------------------")

	add_food_url = DATABASE_URL + '/food'

	bubbleTea = {
	    "allergies": "Dairy",
	    "cuisine": "Chinese",
	    "description": "100 ct Bubble Tea for all of your cravings.",
	    "image": "",
	    "price": 359.99,
	    "quantity_fed": 100,
	    "restaurant_id": 1,
	    "timesOrdered": 0,
	    "title": "100 ct Bubble Tea"
	}

	res = _postJSON(add_food_url, bubbleTea)

	print("BUBBLE TEA CREATED --------------------------")

	tacos = {
	    "allergies": "Dairy, Gluten",
	    "cuisine": "Mexican",
	    "description": "50 ct Tacos for all of your cravings.",
	    "image": "",
	    "price": 209.99,
	    "quantity_fed": 50,
	    "restaurant_id": 2,
	    "timesOrdered": 0,
	    "title": "50 ct Taco Set"
	}

	res = _postJSON(add_food_url, tacos)

	print("TACOS CREATED --------------------------------")

	print("FINISHED -------------------------------------")


if __name__ == "__main__":
	main()