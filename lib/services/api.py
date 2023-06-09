import pymongo
from flask import Flask, jsonify, request
from flask_cors import CORS, cross_origin

app = Flask(__name__)
CORS(app)
class ProductAPI:
    def __init__(self, db_uri, db_name, collection_name):
        self.client = pymongo.MongoClient(db_uri)
        self.db = self.client[db_name]
        self.collection = self.db[collection_name]

    def create_product(self, product):
        self.collection.insert_one(product)

    def get_product_by_id(self, product_id):
        return self.collection.find_one({"id": product_id} , {"_id" : 0})

    def update_product(self, product_id, update_fields):
        self.collection.update_one({"id": product_id}, {"$set": update_fields})

    def delete_product(self, product_id):
        self.collection.delete_one({"id": product_id})

    def search_products(self, search_query):
        return self.collection.find(search_query , {"_id" : 0})

class InvoiceAPI:
    def __init__(self, db_uri, db_name, collection_name):
        self.client = pymongo.MongoClient(db_uri)
        self.db = self.client[db_name]
        self.collection = self.db[collection_name]

    def create_invoice(self, invoice):
        self.collection.insert_one(invoice)

    def get_invoice_by_id(self, invoice_id):
        return self.collection.find_one({"id": invoice_id} , {"_id" : 0})

    def get_all_invoices(self):
            return self.collection.find({}, {"_id" : 0})

invoice_api = InvoiceAPI(db_uri="mongodb://localhost:27017/", db_name="convinentIllusion", collection_name="invoices")
api = ProductAPI(db_uri="mongodb://localhost:27017/", db_name="convinentIllusion", collection_name="products")

@app.route('/invoices', methods=['POST'])
def create_invoice():
    invoice = request.get_json()
    invoice_api.create_invoice(invoice)
    return jsonify({'success': True}), 201

@app.route('/invoices/<invoice_id>', methods=['GET'])
def get_invoice(invoice_id):
    invoice = invoice_api.get_invoice_by_id(invoice_id)
    if invoice:
        return jsonify(invoice), 200
    else:
        return jsonify({'error': 'Invoice not found'}), 404

@app.route('/invoices', methods=['GET'])
def get_all_invoices():
    invoices = invoice_api.get_all_invoices()
    return jsonify(list(invoices)), 200

@app.route('/products', methods=['POST'])
def create_product():
    product = request.get_json()
    api.create_product(product)
    return jsonify({'success': True}), 201

@app.route('/products/<product_id>', methods=['GET'])
def get_product(product_id):
    product = api.get_product_by_id(product_id)
    if product:
        return jsonify(product), 200
    else:
        return jsonify({'error': 'Product not found'}), 404

@app.route('/products/<product_id>', methods=['PUT'])
def update_product(product_id):
    update_fields = request.get_json()
    api.update_product(product_id, update_fields)
    return jsonify({'success': True}), 200

@app.route('/products/<product_id>', methods=['DELETE'])
def delete_product(product_id):
    api.delete_product(product_id)
    return jsonify({'success': True}), 200

@app.route('/products/search', methods=['POST'])
def search_products():
    search_query = request.get_json()
    results = api.search_products(search_query)
    return jsonify(list(results)), 200

if __name__ == '__main__':
    app.run(debug=True)