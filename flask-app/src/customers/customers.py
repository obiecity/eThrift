from flask import Blueprint, request, jsonify, make_response
import json
from src import db

customers = Blueprint('customers', __name__)

@customers.route('/customers', methods=['GET'])
def get_customers():
    cursor = db.get_db().cursor()
    cursor.execute('select buyerID, firstName,\
        lastName from Buyer')
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

@customers.route('/customers/<userID>', methods=['GET'])
def get_customer(userID):
    cursor = db.get_db().cursor()
    cursor.execute('select * from Buyer where buyerID = {0}'.format(userID))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

@customers.route('/customers/new', methods=['POST'])
def add_buyer():
    current_app.logger.info(request.form)
    cursor = db.get_db().cursor()
    buyerID = request.form['buyerID']
    firstName = request.form['firstName']
    lastName = request.form['lastName']
    query = f'INSERT INTO Buyer(buyerID, firstName, lastName) VALUES(\"{buyerID}\", \"{firstName}\", \"{lastName}"\)'
    cursor.execute(query)
    d.get_db().commit()
    return "Done!"
