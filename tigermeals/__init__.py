from flask import Flask

app = Flask(__name__)

import tigermeals.restaurant
import tigermeals.delivery
import tigermeals.api
