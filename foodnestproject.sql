-- Create database if not exists
CREATE DATABASE IF NOT EXISTS foodnestDB;

-- Switch to your database
USE foodnestDB;
DROP TABLE userdata;

-- Create userdata table
CREATE TABLE userdata (
	customername VARCHAR(255) PRIMARY KEY,
    dob DATE,
    email VARCHAR(255),
    address VARCHAR(255),
    delivery_location_tag VARCHAR(50),
    food_choices VARCHAR(50),
    food_preferences VARCHAR(255),
    health_conditions VARCHAR(255),
    non_veg_days VARCHAR(50),
    gender VARCHAR(10)
);



-- Create restrodata table
CREATE TABLE restrodata (
    resto_id INT AUTO_INCREMENT PRIMARY KEY,
    resto_name VARCHAR(100) NOT NULL,
    menu TEXT,
    portion_sizing VARCHAR(100),
    price DECIMAL(10, 2),
    dish_pic LONGBLOB, -- assuming storing image as LONGBLOB
    address VARCHAR(255),
    google_pin_location VARCHAR(100),
    branch_addresses TEXT,
    branch_google_pins TEXT 
);
INSERT INTO userdata (customername, dob, email, address, delivery_location_tag, food_choices, food_preferences, health_conditions, non_veg_days, gender) VALUES
('Akash Gupta', '1998-01-01', 'akash.gupta@email.com', 'Hazratganj Rd (Office)', 'Office', 'Veg', 'North Indian, Italian', 'None', 'Sundays only', 'Male'),
('Priya Singh', '1995-07-15', 'priya.singh@email.com', 'Jankipuram Rd (Hostel)', 'Hostel', 'Non-Veg', 'Lucknowi, Chinese', 'Lactose Intolerant', 'Tuesdays & Fridays', 'Female'),
('Rahul Kapoor', '2002-03-29', 'rahul.kapoor@email.com', 'Aliganj (PG)', 'PG', 'Veg', 'South Indian, Continental', 'None', 'None (Vegetarian)', 'Male'),
('Shreya Verma', '1999-11-12', 'shreya.verma@email.com', 'Gomti Nagar (Home)', 'Home', 'Non-Veg', 'Mughlai, Seafood', 'None', 'Mondays, Wednesdays, Saturdays', 'Female'),
('Aditya Mishra', '2000-05-06', 'aditya.mishra@email.com', 'Kanpur Rd (College)', 'College', 'Veg', 'Street Food, Healthy Options', 'Peanut Allergy', 'None (Vegetarian)', 'Male'),
('Isha Khan', '1997-09-21', 'isha.khan@email.com', 'Indira Nagar (Office)', 'Office', 'Veg', 'Jain Food, Vegan Options', 'High Blood Pressure', 'None (Vegetarian)', 'Female'),
('Aman Joshi', '1996-02-04', 'aman.joshi@email.com', 'Indira Nagar (Home)', 'Home', 'Non-Veg', 'Anything Spicy, Local Delicacies', 'None', 'All days', 'Male'),
('Riya Saxena', '2001-12-25', 'riya.saxena@email.com', 'Aliganj (Hostel)', 'Hostel', 'Veg', 'North Indian, Salads', 'None', 'Weekends only', 'Female'),
('Sameer Khan', '1999-04-10', 'sameer.khan@email.com', 'Hazratganj Rd (PG)', 'PG', 'Non-Veg', 'Mughlai, Biryani', 'None', 'Fridays only', 'Male'),
('Sonia Agarwal', '1997-08-18', 'sonia.agarwal@email.com', 'Gomti Nagar (Home)', 'Home', 'Veg', 'South Indian, Continental', 'Diabetes', 'None (Vegetarian)', 'Female'),
('Kavita Singh', '2003-10-21', 'kavita.singh@email.com', 'Aliganj (PG)', 'PG', 'Veg', 'Awadhi, Fast Food', 'None', 'Weekdays (Non-Veg)', 'Female'),
('Vikas Chandra', '1994-06-12', 'vikas.chandra@email.com', 'Hazratganj Rd (Office)', 'Office', 'Non-Veg', 'Lucknowi, Kebabs', 'Gluten Intolerance', 'None', 'Male'),
('Neha Sharma', '1999-02-07', 'neha.sharma@email.com', 'Indira Nagar (Home)', 'Home', 'Veg', 'Healthy Options, Global Cuisine', 'None', 'None (Vegetarian)', 'Female'),
('Rohit Malhotra', '1998-05-18', 'rohit.malhotra@email.com', 'Kanpur Rd (College)', 'College', 'Non-Veg', 'Chinese, Seafood', 'High Cholesterol', 'Fridays & Saturdays', 'Male'),
('Anjali Gupta', '2001-09-09', 'anjali.gupta@email.com', 'Gomti Nagar (Home)', 'Home', 'Veg', 'South Indian, Desserts', 'None', 'None (Vegetarian)', 'Female'),
('Raj Kumar', '1995-01-25', 'raj.kumar@email.com', 'Aliganj (PG)', 'PG', 'Non-Veg', 'Biryani, Rolls', 'None', 'All days', 'Male'),
('Priyanka Verma', '2000-07-04', 'priyanka.verma@email.com', 'Hazratganj Rd (Office)', 'Office', 'Veg', 'Jain Food, Italian', 'None', 'None (Vegetarian)', 'Female');
-- Inserting data into the restrodata table
INSERT INTO restrodata (resto_name, menu, price, address, google_pin_location, branch_addresses, branch_google_pins) VALUES
('Tunday Kabab', 'Tunday Kebab, Shami Kebab, Nahari, Rumali Roti', '175', '20 Aminabad Rd, Lucknow, Uttar Pradesh 226018', '26.8984° N, 80.9069° E', NULL, NULL),
('Royal Café', 'Kulfi Falooda, Basket Chaat, Kulfi, Batashe (Pani puri)', '1500', 'Latouche Rd, Lucknow, Uttar Pradesh 226001', '26.8512° N, 80.9260° E', 'Hazratganj Rd, Lucknow, Uttar Pradesh 226001', '26.8512° N, 80.9260° E'),
('Idris ki Biryani', 'Biryani, Kakori Kebab, Shahi Tukda', '800', 'Chowk, Lucknow, Uttar Pradesh 226003', '26.8592° N, 80.9353° E', NULL, NULL),
('Main land china', 'Manchurian, Hakka Noodles, Fried Rice, Chilli Chicken, Sweet and Sour Chicken', '600', 'Nishatganj Rd, Lucknow, Uttar Pradesh 226007', '26.8652° N, 80.9470° E', 'Aliganj, Lucknow, Uttar Pradesh 226002', '26.8652° N, 80.9470° E'),
('Sharma ji chai', 'Cutting Chai, bun makkan (bun butter), Samosa', '50', 'Aminabad Rd, Lucknow, Uttar Pradesh 226018', '26.8984° N, 80.9069° E', 'Hazratganj Rd, Lucknow, Uttar Pradesh 226001', '26.8984° N, 80.9069° E');
INSERT INTO restrodata (resto_name, menu, price, address, google_pin_location, branch_addresses, branch_google_pins, dish_pic, cuisine) VALUES
('The Chocolate Room', 'Desserts, Shakes, Beverages', '500', 'Hazratganj, Lucknow', '26.8466° N 80.9460° E', '', '', 'https://www.zomato.com/lucknow/the-chocolate-room-hazratganj/photos', 'Dessert'),
('Royal Cafe', 'Kebabs, Biryanis, Mughlai Dishes', '800', 'Aminabad, Lucknow', '26.8503° N 80.9198° E', '', '', 'https://magicpin.in/Lucknow/Hazratganj/Restaurant/Royal-Cafe/store/124213/photos/?img=Store-Images&id=30', 'Lucknowi'),
('Idrees ki Bakery', 'Rusk, Khari, Toast, Biscuits', ' 300', 'Chowk, Lucknow', '26.8472° N 80.9178° E', '', '', 'https://www.instagram.com/garden.bakery/?hl=en', 'Dessert'),
('The Clay Oven', 'Tandoori Chicken, Butter Chicken, Dal Makhani', ' 1000', 'Hazratganj, Lucknow', '26.8488° N 80.9480° E', '', '', 'https://www.justdial.com/Lucknow/Ovenstory-Pizza-Bagh-Hayathnagar-Mandal-First-Floor-Above-Heritage-Fresh-Hazratganj/0522PX522-X522-191127193557-V5B5_BZDET', 'North Indian'),
('Moti Mahal', 'Rogan Josh, Kakori Kebab, Tehri', ' 1200', 'Sadar Bazaar, Lucknow', '26.8426° N 80.9307° E', '', '', 'https://www.zomato.com/lucknow/moti-mahal-delux-tandoori-trail-aliganj/photos', 'Awadhi'),
('Janab-e-Azam', 'Shami Kebab, Nihari, Kulfi', '1500', 'Aliganj, Lucknow', '26.8803° N 80.9808° E', '', '', 'https://www.facebook.com/HGMAUPS/posts/our-students-got-newspaper-navbharat-chidiya-ghar-competetion-prize/577668125741341/', 'Mughlai'),
('Kulfi Corner', 'Falooda, Kulfi, Rabdi', '400', 'Chowk, Lucknow', '26.8458° N 80.9192° E', '', '', 'https://www.justdial.com/Lucknow/Kulfi-Shops-in-Lucknow-Chowk/nct-12103515', 'Dessert'),
('The Kababi House', 'Galouti Kebabs, Seekh Kebabs, Rolls', ' 700', 'Indira Nagar, Lucknow', '26.8333° N 80.9272° E', '', '', 'https://www.zomato.com/lucknow/house-of-kabab-indira-nagar/book', 'Kababs'),
('La Martiniere Bakery', 'Cakes, Pastries, Breads', '600', 'Hazratganj, Lucknow', '26.8450° N 80.9440° E', '', '', 'https://timesofindia.indiatimes.com/city/lucknow/city-bakeries-warm-up-to-usher-in-yuletide-cheer/articleshow/88173942.cms', 'Bakery'),
('Awadh Bhojnalaya', 'Dal Makhani, Paneer Tikka Masala, Malai Kofta', '800', 'Aliganj, Lucknow', '26.8780° N 80.9783° E', '', '', 'https://www.justdial.com/Lucknow/Swaad-Bhojnalaya-Aliganj/0522PX522-X522-200331201600-I7I4_BZDET', 'Vegetarian'),
('Royal Vega', 'Dosa, Chole Bhature, Rajma Chawal', ' 400', 'Gomti Nagar, Lucknow', '26.8203° N 80.9412° E', '', '', 'https://www.zomato.com/lucknow/royal-vega-gomti-nagar/photos', 'Vegetarian'),
('Chhappan Bhog', 'Indian Thali, Kebabs, Biryanis', '2000',  'Hazratganj, Lucknow', '26.8478° N 80.9472° E', '', '', 'https://www.theluxurytraveller.com/india/lucknow/hotels/taj-mahal-lucknow/dining/chhappan-bhog/', 'Indian'),
('Prakash Ki Paan Shop', 'Paan, Kulfi Falooda, Shahi Tukda', ' 250', 'Aminabad, Lucknow', '26.8483° N 80.9222° E', '', '', 'https://www.outlookindia.com/magazine/story/lucknow-ki-tehzeeb-the-citys-culinary-delights/312227', 'Dessert'),
('Lucknow Lucknow', 'Chakna, Galouti Kebabs, Warqi Paratha', ' 1100', 'Indira Nagar, Lucknow', '26.8358° N 80.9247° E', '', '', 'https://www.zomato.com/lucknow/lucknow-lucknow-indira-nagar/photos', 'Lucknowi');
INSERT INTO restrodata (resto_name, menu, price, address, google_pin_location, branch_addresses, branch_google_pins, dish_pic, cuisine) VALUES
('Continental Palace', 'Grilled Salmon, Caesar Salad, Steak', '800', '123 Continental Avenue, Hazratganj, Lucknow', '26.8543° N, 80.9482° E', NULL, NULL, 'https://example.com/continental_palace_dishes.jpg', 'Continental'),
('Bella Italia', 'Margherita Pizza, Spaghetti Carbonara, Tiramisu', '700', '456 Via Italia, Aminabad, Lucknow', '26.8507° N, 80.9191° E', NULL, NULL, 'https://example.com/bella_italia_dishes.jpg', 'Italian'),
('Punjab Da Dhaba', 'Butter Chicken, Naan, Rajma Masala', '600', '789 Punjabi Street, Chowk, Lucknow', '26.8476° N, 80.9165° E', NULL, NULL, 'https://example.com/punjab_da_dhaba_dishes.jpg', 'Punjabi'),
('European Delight', 'Chicken Schnitzel, Ratatouille, Apple Strudel', '850', '321 European Plaza, Gomti Nagar, Lucknow', '26.8206° N, 80.9469° E', NULL, NULL, 'https://example.com/european_delight_dishes.jpg', 'European'),
('Ciao Bella', 'Ravioli al Funghi, Caprese Salad, Panna Cotta', '750', '567 Bella Avenue, Indira Nagar, Lucknow', '26.8325° N, 80.9338° E', NULL, NULL, 'https://example.com/ciao_bella_dishes.jpg', 'Italian'),
('Punjab Grill', 'Tandoori Platter, Sarson Ka Saag, Lassi', '650', '910 Punjabi Lane, Aliganj, Lucknow', '26.8784° N, 80.9765° E', NULL, NULL, 'https://example.com/punjab_grill_dishes.jpg', 'Punjabi'),
('Taste of Tuscany', 'Bruschetta, Risotto, Gelato', '700', '753 Tuscan Terrace, Sadar Bazaar, Lucknow', '26.8420° N, 80.9291° E', NULL, NULL, 'https://example.com/taste_of_tuscany_dishes.jpg', 'Italian'),
('Sorrento Bistro', 'Seafood Linguine, Margherita Pizza, Tiramisu', '750', '234 Sorrento Street, Latouche Road, Lucknow', '26.8521° N, 80.9254° E', NULL, NULL, 'https://example.com/sorrento_bistro_dishes.jpg', 'Italian'),
('Pind Di Rasoi', 'Paneer Tikka Masala, Amritsari Kulcha, Chaas', '600', '987 Punjabi Market, Nishatganj, Lucknow', '26.8503° N, 80.9418° E', NULL, NULL, 'https://example.com/pind_di_rasoi_dishes.jpg', 'Punjabi'),
('Trattoria Italia', 'Fettuccine Alfredo, Margherita Pizza, Cannoli', '750', '678 Trattoria Terrace, Chowk, Lucknow', '26.8452° N, 80.9213° E', NULL, NULL, 'https://example.com/trattoria_italia_dishes.jpg', 'Italian'),
('Continental Delights', 'Chicken Alfredo, Grilled Vegetables, Chocolate Mousse', '800', '564 Continental Circle, Alambagh, Lucknow', '26.8489° N, 80.9485° E', NULL, NULL, 'https://example.com/continental_delights_dishes.jpg', 'Continental'),
('Punjab Tadka', 'Chole Bhature, Punjabi Thali, Gajar Halwa', '650', '741 Punjabi Market, Hazratganj, Lucknow', '26.8496° N, 80.9420° E', NULL, NULL, 'https://example.com/punjab_tadka_dishes.jpg', 'Punjabi'),
('Italiano Trattoria', 'Lasagna, Pesto Pasta, Tiramisu', '750', '365 Italiano Street, Gomti Nagar, Lucknow', '26.8220° N, 80.9482° E', NULL, NULL, 'https://example.com/italiano_trattoria_dishes.jpg', 'Italian'),
('Continental Bistro', 'Grilled Chicken Sandwich, Caesar Salad, Chocolate Fondant', '700', '147 Continental Road, Aliganj, Lucknow', '26.8764° N, 80.9761° E', NULL, NULL, 'https://example.com/continental_bistro_dishes.jpg', 'Continental'),
('Mamma Mia', 'Spaghetti Carbonara, Margherita Pizza, Cannoli', '750', '234 Mia Avenue, Hazratganj, Lucknow', '26.8513° N, 80.9436° E', NULL, NULL, 'https://example.com/mamma_mia_dishes.jpg', 'Italian'),
('Pind Express', 'Butter Chicken, Garlic Naan, Lassi', '600', '567 Punjab Road, Aminabad, Lucknow', '26.8473° N, 80.9179° E', NULL, NULL, 'https://example.com/pind_express_dishes.jpg', 'Punjabi');



ALTER TABLE restrodata
ADD COLUMN cuisine VARCHAR(255);
UPDATE restrodata
SET cuisine =   	
    CASE 
        WHEN resto_name = 'Tunday Kabab' THEN 'Lucknowi'
        WHEN resto_name = 'Royal Café' THEN 'Street Food'
        WHEN resto_name = 'Idris ki Biryani' THEN 'Mughlai'
        WHEN resto_name = 'Main land china' THEN 'Chinese'
        WHEN resto_name = 'Sharma ji chai' THEN 'Indian Street Food'
    END;
UPDATE restrodata
SET dish_pic = 
    CASE 
        WHEN resto_name = 'Tunday Kabab' THEN 'https://www.google.com/imgres?imgurl=https%3A%2F%2Fimages.herzindagi.info%2Fimage%2F2019%2FMay%2Ftunday-kabab.jpg&tbnid=T1FmRsS1EPz8XM&vet=12ahUKEwi6-M-kmJKFAxUwcGwGHZ7QAssQMygHegQIARB5..i&imgrefurl=https%3A%2F%2Fwww.herzindagi.com%2Frecipe-tips%2Flucknow-special-tundey-kabab-secret-recipe-where-to-eat-article-107640&docid=xlcdU26t6rheEM&w=660&h=535&q=tunday%20kababi%20lucknow&ved=2ahUKEwi6-M-kmJKFAxUwcGwGHZ7QAssQMygHegQIARB5'
        WHEN resto_name = 'Royal Café' THEN 'https://www.google.com/imgres?imgurl=https%3A%2F%2Fmedia-cdn.tripadvisor.com%2Fmedia%2Fphoto-p%2F12%2Fa8%2Faf%2F6a%2Fphoto0jpg.jpg&tbnid=BsYxUwKgKM0c-M&vet=12ahUKEwiO0M-cmJKFAxW9bGwGHfsfCaAQMygBegQIARAy..i&imgrefurl=https%3A%2F%2Fwww.tripadvisor.in%2FRestaurant_Review-g297684-d8125544-Reviews-Royal_Cafe-Lucknow_Lucknow_District_Uttar_Pradesh.html&docid=Jac9NlcMSawHMM&w=550&h=550&q=royal%20cafe%20lucknow%20basket%20chaat%20price&ved=2ahUKEwiO0M-cmJKFAxW9bGwGHfsfCaAQMygBegQIARAy'
        WHEN resto_name = 'Idris ki Biryani' THEN 'https://www.google.com/imgres?imgurl=https%3A%2F%2Fmedia-cdn.tripadvisor.com%2Fmedia%2Fphoto-s%2F14%2F75%2F12%2Fca%2Fphoto0jpg.jpg&tbnid=kLJcwKgeU_I2nM&vet=12ahUKEwjJwtCSmJKFAxWtcmwGHYSpBK4QMygBegQIARAy..i&imgrefurl=https%3A%2F%2Fwww.tripadvisor.in%2FRestaurant_Review-g297684-d7909201-Reviews-Idris_Biryani-Lucknow_Lucknow_District_Uttar_Pradesh.html&docid=t5FPMAXDg29_DM&w=450&h=450&q=idris%20ki%20biryani%20lucknow&ved=2ahUKEwjJwtCSmJKFAxWtcmwGHYSpBK4QMygBegQIARAy'
        WHEN resto_name = 'Main land china' THEN 'https://www.google.com/imgres?imgurl=https%3A%2F%2Fmedia-cdn.tripadvisor.com%2Fmedia%2Fphoto-s%2F12%2F7a%2F35%2Ff9%2Fphoto1jpg.jpg&tbnid=Fe6dKKfun5GxuM&vet=12ahUKEwj_5eOvmJKFAxXUfWwGHRmUAZoQMygAegQIARBL..i&imgrefurl=https%3A%2F%2Fwww.tripadvisor.in%2FRestaurant_Review-g297684-d2392032-Reviews-Mainland_China-Lucknow_Lucknow_District_Uttar_Pradesh.html&docid=uJmSemkdMYxzcM&w=450&h=450&q=main%20land%20china%20lucknow&ved=2ahUKEwj_5eOvmJKFAxXUfWwGHRmUAZoQMygAegQIARBL'
        WHEN resto_name = 'Sharma ji chai' THEN 'https://www.google.com/imgres?imgurl=https%3A%2F%2Fmedia-cdn.tripadvisor.com%2Fmedia%2Fphoto-s%2F1d%2F04%2F6b%2F7a%2Fchai-and-bun-maska.jpg&tbnid=DFk7f9SlTT-vvM&vet=12ahUKEwjwi5SOmJKFAxXicWwGHX4cAnUQMygBegQIARBV..i&imgrefurl=https%3A%2F%2Fwww.tripadvisor.in%2FRestaurant_Review-g297684-d15477367-Reviews-Sharma_Ji_KI_Chai-Lucknow_Lucknow_District_Uttar_Pradesh.html&docid=R9dfFl4cQ7YEaM&w=550&h=309&q=sharma%20ji%20ki%20chai&ved=2ahUKEwjwi5SOmJKFAxXicWwGHX4cAnUQMygBegQIARBV'
    END;



DELETE FROM restrodata
WHERE resto_id BETWEEN 1 AND 5;


SELECT * FROM foodnestDB.userdata;
SELECT * FROM foodnestDB.restrodata;
DELETE FROM userdata WHERE customername = 'Akash Gupta';use  userdata;
SELECT *
FROM userdata
WHERE food_choices = 'veg';
SELECT *
FROM foodnestDB.customerdata
WHERE user_name = 'hemant';
-- Add the new column final_bill to the orders table
ALTER TABLE orders
ADD COLUMN final_bill DECIMAL(10, 2);

-- Update the final_bill column with the calculated values
UPDATE orders
SET final_bill = price * quantity;

select * from orders;


