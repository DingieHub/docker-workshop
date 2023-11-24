# app.py
from flask import Flask, request, jsonify

app = Flask(__name__)

@app.route('/')
def hello():
    return 'Hello, this is your API!'

@app.route('/health', methods=['GET'])
def health():
    return 'I am healthy'

@app.route('/data', methods=['POST'])
def create_data():
    data = request.get_json()
    # Assuming the request body contains JSON data
    # Perform any processing or validation as needed
    # For now, just echoing the received data
    return jsonify(data), 201

@app.route('/data/<id>', methods=['PUT'])
def update_data(id):
    data = request.get_json()
    # Assuming the request body contains JSON data
    # Perform any processing or validation as needed
    # For now, just echoing the received data along with the provided ID
    return jsonify({'id': id, 'data': data}), 200

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5001)
