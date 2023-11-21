# app.py
from flask import Flask, jsonify
import csv  

app = Flask(__name__)

@app.route('/power/europe')
def get_co2_emission():
    with open('data.csv', 'r') as csv_file:
        try:
            latest_co2_emission = csv_file.readlines()[-1].split(',')[5]
            return jsonify({"latest_co2_emission": latest_co2_emission})
        except ValueError:
            return jsonify({"error": "Error fetching"}), 500

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)
