from flask import Flask, request, jsonify
from flask_sqlalchemy import SQLAlchemy
from werkzeug.security import generate_password_hash
from datetime import datetime
import os

# Initialize Flask app and configure PostgreSQL database
app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://username:password@localhost/your_database'  # Replace with actual credentials
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

# Initialize database
db = SQLAlchemy(app)

# Define the Signup model (table structure)
class Signup(db.Model):
    __tablename__ = 'signup'
    id = db.Column(db.Integer, primary_key=True)
    first_name = db.Column(db.String(50), nullable=False)
    family_name = db.Column(db.String(50), nullable=False)
    email = db.Column(db.String(100), unique=True, nullable=False)
    phone_number = db.Column(db.String(15), nullable=False)
    date_of_birth = db.Column(db.Date, nullable=False)
    password = db.Column(db.String(100), nullable=False)  # Storing hashed passwords

# Create the signup route
@app.route('/signup', methods=['POST'])
def signup():
    data = request.json  # Get JSON data from Flutter app

    # Extract fields from JSON data
    first_name = data.get('first_name')
    family_name = data.get('family_name')
    email = data.get('email')
    phone_number = data.get('phone_number')
    date_of_birth_str = data.get('date_of_birth')
    password = data.get('password')
    repeat_password = data.get('repeat_password')

    # Basic validation
    if not all([first_name, family_name, email, phone_number, date_of_birth_str, password, repeat_password]):
        return jsonify({"error": "Please fill all the fields"}), 400
    if password != repeat_password:
        return jsonify({"error": "Passwords do not match"}), 400

    # Convert date of birth to date format
    try:
        date_of_birth = datetime.strptime(date_of_birth_str, '%Y-%m-%d').date()
    except ValueError:
        return jsonify({"error": "Invalid date format"}), 400

    # Hash the password before storing it in the database
    hashed_password = generate_password_hash(password)

    # Create a new Signup object
    new_user = Signup(
        first_name=first_name,
        family_name=family_name,
        email=email,
        phone_number=phone_number,
        date_of_birth=date_of_birth,
        password=hashed_password
    )

    # Add to the session and commit to save to the database
    try:
        db.session.add(new_user)
        db.session.commit()
        return jsonify({"message": "User signed up successfully"}), 201
    except Exception as e:
        db.session.rollback()
        return jsonify({"error": str(e)}), 500

# Run the Flask app
if __name__ == '__main__':
    app.run(debug=True)
