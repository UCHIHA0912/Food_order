import pymysql

# Establishing connection to the database
connection = pymysql.connect(
    host="localhost", #your local SQL server host
    user="root",      #your local SQL server user  
    password="#P9GLJR8UY",#your local SQL server pasword
    database="foodnestDB" #your local SQL server the database name where all the data is being stored
)
#its a one time thing you just have to write it in the code that's it
cursor = connection.cursor()

def get_restaurants_by_cuisine(cuisine):
    # Query the database for restaurants based on the provided cuisine
    query = "SELECT resto_name FROM restrodata WHERE cuisine LIKE %s"
    cursor.execute(query, ('%' + cuisine + '%',))
    result = cursor.fetchall()
    
    # Extract the restaurant names
    restaurants = [row[0] for row in result]
    
    return restaurants

def display_restaurants(restaurants):
    # Display numbered list of restaurants
    for i, restro_name in enumerate(restaurants, 1):
        print(f"{i}. {restro_name}")

def display_menu(restro_name):
    # Query the database for the menu and prices of the specified restaurant
    query = "SELECT menu, price FROM restrodata WHERE resto_name = %s"
    cursor.execute(query, (restro_name,))
    result = cursor.fetchone()
    
    if result:
        menu = str(result[0])  # Convert Decimal to string
        prices = str(result[1])  # Convert Decimal to string
        
        # Debug print statements
        print("Menu fetched from the database:", menu)
        print("Prices fetched from the database:", prices)
        
        # Display menu and prices
        print(f"Menu at {restro_name}:")
        menu_items = menu.split(',')
        prices_list = prices.split(',')
        for i, (item, price) in enumerate(zip(menu_items, prices_list), 1):
            print(f"{i}. {item.strip()}: ₹{price.strip()}")

def take_order(restro_name):
    while True:
        display_menu(restro_name)
        choice = input("Enter the number of the menu item to place an order, or 'back' to select a different restaurant: ").strip().lower()
        
        if choice == 'back':
            return  # Exit the function to select a different restaurant
        elif choice.isdigit():
            choice = int(choice)
            # Retrieve menu and prices of the selected restaurant
            query = "SELECT menu, price FROM restrodata WHERE resto_name = %s"
            cursor.execute(query, (restro_name,))
            result = cursor.fetchone()
            
            if result:
                menu = str(result[0])  # Convert Decimal to string
                prices = str(result[1])  # Convert Decimal to string
                
                menu_items = menu.split(',')
                prices_list = prices.split(',')
                
                # Debug print statements
                print("Menu items:", menu_items)
                print("Prices:", prices_list)
                
                if 1 <= choice <= len(menu_items):
                    menu_item = menu_items[choice - 1].strip()
                    price = float(prices_list[choice - 1].strip())
                    quantity = int(input("Enter quantity: "))
                    
                    # Insert order into the database
                    add_order = ("INSERT INTO orders (restro_name, menu, quantity, price) VALUES (%s, %s, %s, %s)")
                    order_data = (restro_name, menu_item, quantity, price)
                    
                    try:
                        cursor.execute(add_order, order_data)
                        connection.commit()
                        print("Order added successfully!")
                        
                        # Retrieve the last inserted order ID
                        cursor.execute("SELECT LAST_INSERT_ID()")
                        order_id = cursor.fetchone()[0]
                        print("Order ID:", order_id)
                        
                        # Update final_bill based on price and quantity
                        update_final_bill = "UPDATE orders SET final_bill = price * quantity WHERE id = %s"
                        cursor.execute(update_final_bill, (order_id,))
                        connection.commit()
                        print("Final bill updated successfully!")
                        
                    except pymysql.Error as err:
                        print("Error adding order:", err)
                        connection.rollback()
                        
                    return  # Exit the function after placing the order
                else:
                    print("Invalid menu item number.")
            else:
                print("Menu not found for the selected restaurant.")
        else:
            print("Invalid input. Please enter a number or 'back'.")

def print_final_bill(order_id):
    # Query the database for the final bill of the specified order
    query = "SELECT final_bill FROM orders WHERE id = %s"
    cursor.execute(query, (order_id,))
    result = cursor.fetchone()

    if result:
        final_bill = result[0]
        print(f"Final Bill for Order ID {order_id}: ${final_bill:.2f}")
    else:
        print(f"Order with ID {order_id} not found.")

# Options for cuisine
cuisine_options = ['Lucknowi', 'Dessert', 'Mughlai', 'Punjabi', 'North Indian', 'Awadhi', 'Kabbabs', 'Bakery', 'Vegetarian', 'Indian', 'Continental', 'Italian', 'European']

# Prompt the user to enter their preferred cuisine
user_cuisine = input(f"Enter your preferred cuisine from the options ({', '.join(cuisine_options)}): ").strip().title()

# Check if the entered cuisine is one of the options
if user_cuisine in cuisine_options:
    # Retrieve restaurants based on the entered cuisine
    restaurants = get_restaurants_by_cuisine(user_cuisine)
    if restaurants:
        print(f"The {user_cuisine} restaurants available are:")
        display_restaurants(restaurants)
        
        # Let user select a restaurant
        while True:
            choice = input("Enter the number of the restaurant to view menu and place an order: ").strip().lower()
            if choice.isdigit():
                choice = int(choice)
                if 1 <= choice <= len(restaurants):
                    restro_name = restaurants[choice - 1]
                    take_order(restro_name)
                    break
                else:
                    print("Invalid restaurant number.")
            else:
                print("Invalid input. Please enter a number.")
    else:
        print(f"Sorry, there are no {user_cuisine} restaurants available.")
else:
    print("Invalid cuisine. Please enter a valid cuisine from the provided options.")

# Prompt the user to enter the order ID to print the final bill
order_id = int(input("Enter the order ID to print the final bill: "))
print_final_bill(order_id)

# Close the database connection
cursor.close()
connection.close()
