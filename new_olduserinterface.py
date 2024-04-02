import mysql.connector

# Establish database connection
try:
    connection = mysql.connector.connect(
        host="hostname",    #your local SQL hostname
        user="username",    #your local userrname
        password="password",    #your local SQL server password
        database="foodnestDB"    # your database where the actions are being taken
    )
    connection.autocommit = True
except mysql.connector.Error as e:
    print(f"Error connecting to database: {e}")
    exit()

def create_customer_record(connection):
    cursor = connection.cursor()
    try:
        customername = input("Enter your name: ")
        dob = input("Enter your date of birth (YYYY-MM-DD): ")
        email = input("Enter your email address: ")
        address = input("Enter your address: ")
        delivery_location_tag = input("Enter your delivery location tag: ")
        food_choices = input("Enter your food choices: ")
        food_preferences = input("Enter your food preferences: ")
        health_conditions = input("Enter your health conditions: ")
        non_veg_days = input("Enter your non-vegetarian days: ")
        gender = input("Enter your gender: ")
            #this will be the query for SQL
        cursor.execute("""
            INSERT INTO userdata 
            (customername, dob, email, address, delivery_location_tag, food_choices, 
            food_preferences, health_conditions, non_veg_days, gender)
            VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
        """, (customername, dob, email, address, delivery_location_tag, food_choices, 
            food_preferences, health_conditions, non_veg_days, gender))
        
        print("Customer record created successfully!")
    except mysql.connector.Error as e:
        print(f"Error creating customer record: {e}")
    finally:
        cursor.close()

def display_user_details(connection, username):
    cursor = connection.cursor()
    try:
        cursor.execute("""
            SELECT * FROM userdata WHERE customername = %s
        """, (username,))
        user_details = cursor.fetchone()
        if user_details:
            print("User Details:")
            print("Name:", user_details[0])
            print("Date of Birth:", user_details[1])
            print("Email:", user_details[2])
            print("Address:", user_details[3])
            print("Delivery Location Tag:", user_details[4])
            print("Food Choices:", user_details[5])
            print("Food Preferences:", user_details[6])
            print("Health Conditions:", user_details[7])
            print("Non-Vegetarian Days:", user_details[8])
            print("Gender:", user_details[9])
        else:
            print("User not found.")
    except mysql.connector.Error as e:
        print(f"Error displaying user details: {e}")
    finally:
        cursor.close()

# Main loop
while True:
    print("\n1. Start")
    print("2. Exit")

    choice = input("Enter your choice: ")

    if choice == "1":
        is_new_user = input("Are you a new user? (yes/no): ").lower()
        if is_new_user == "yes":
            create_customer_record(connection)
        else:
            username = input("Enter your username: ")
            display_user_details(connection, username)
    elif choice == "2":
        print("Exiting...")
        break
    else:
        print("Invalid choice. Please enter either 1 or 2.")
