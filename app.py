from flask import Flask, jsonify, request

app = Flask(__name__)

@app.route('/')
def home():
    return jsonify({"message": "Hello from Flask!"})

@app.route('/data', methods=['POST'])
def get_data():
    data = request.json
    return jsonify({"received_data": data})

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)  # Run on port 5000
