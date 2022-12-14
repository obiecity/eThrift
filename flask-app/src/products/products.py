from flask import Blueprint, request, jsonify, make_response
import json
from src import db

products = Blueprint('products', __name__)

# show all products
@products.route('/products')
def get_products():
    cursor = db.get_db().cursor()
    cursor.execute('select sellerID, name, price, quantity, size, category from Clothes')
    column_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))
    return jsonify(json_data)

# return the 25 cheapest products
@products.route('/cheapproducts')
def get_cheap_products():
    cursor = db.get_db().cursor()
    query = '''
        SELECT itemID, name, size, category, price
        FROM Clothes
        GROUP BY itemID, name
        ORDER BY price DESC;
        LIMIT 25;
    '''
    cursor.execute(query)
    column_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))
    return jsonify(json_data)

# return the top 10 highest rated products
@products.route('/top10products')
def get_top_10_products():
    cursor = db.get_db().cursor()
    query = '''
        SELECT name, size, quantity, price
        FROM Clothes c JOIN Seller s on c.sellerID = s.sellerID
        GROUP BY name, price
        ORDER BY avgRating DESC
        LIMIT 10;
    '''
    cursor.execute(query)
    column_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))
    return jsonify(json_data)

# list a new item for sale
@products.route('/products/list', methods=['POST'])
def add_buyer():
    current_app.logger.info(request.form)
    cursor = db.get_db().cursor()
    itemID = request.form['itemID']
    sellerID = request.form['sellerID']
    name = request.form['name']
    quantity = request.form['quantity']
    price = request.form['price']
    size = request.form['size']
    category = request.form['category']
    query = f'INSERT INTO Clothes(itemID, sellerID, name, quantity, price, size, category) VALUES(\"{itemID}\", \"{sellerID}\", \"{name}"\, \"{quantity}\", \"{price}\", \"{size}\", \"{category}\")'
    cursor.execute(query)
    d.get_db().commit()
    return "Done!"
