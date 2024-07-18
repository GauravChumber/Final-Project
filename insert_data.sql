#location table
INSERT INTO location_table (city, state) VALUES
('brantford', 'ontario'),
('brampton', 'mumbai'),
('halifax', 'nova scotia'),
('vancouver', 'british columbia'),
('warman', 'saskatchewan'),
('whitehorse', 'yukon'),
('winnipeg', 'manitoba'),
('inuvik', 'northwest territories'),
('moncton', 'new brunswick'),
('jalandhar', 'punjab');

#pet_breed table
INSERT INTO pet_breed (info_id, species, breed) VALUES
(1, 'Dog', 'Labrador'),
(2, 'Cat', 'Siamese'),
(3, 'Dog', 'Bulldog'),
(4, 'Bird', 'Parrot'),
(5, 'Cat', 'Persian'),
(6, 'Dog', 'Poodle'),
(7, 'Hamster', 'Syrian'),
(8, 'Rabbit', 'Holland'),
(9, 'Fish', 'Goldfish'),
(10, 'Dog', 'Beagle');

-- Insert data into customer table
INSERT INTO customer_table (cus_id, cus_name, visit_date, ordered_pets)
 VALUES
(1, 'Bob Brown', '2023-01-15', 2),
(2, 'Amy Green', '2023-02-20', 4),
(3, 'John Doe', '2023-03-25', 5),
(4, 'Jane Smith', '2023-04-20', 4),
(5, 'Sarah Jones', '2023-05-18', 1),
(6, 'David Lee', '2023-07-05', 1),
(7, 'Maria Garcia', '2023-07-30', 1),
(8, 'Kim Lee', '2023-08-20', 3),
(9, 'Nguyen Tran', '2023-09-10', 3),
(10, 'Emily Clark', '2023-10-25', 1);

-- Insert data into the health table
INSERT INTO health_table (report_id, health_report) VALUES
(1, 'Good'),
(2, 'Excellent'),
(3, 'Good'),
(4, 'Fair'),
(5, 'Good'),
(6, 'Excellent'),
(7, 'Excellent'),
(8, 'Good'),
(9, 'Fair'),
(10, 'Excellent');


-- Insert data into the product table
INSERT INTO product_table (product_id, product_name, product_price, product_stock, expire_date, manufacture_date) 
VALUES
(1, 'Dog Food', 20, 10, '2024-06-01', '2023-12-15'),
(2, 'Cat Food', 15, 8, '2024-07-01', '2023-11-20'),
(3, 'Dog Treats', 10, 15, '2024-09-01', '2023-12-31'),
(4, 'Cat Litter', 25, 5, '2025-01-01', '2023-03-10'),
(5, 'Hamster Food', 5, 20, '2024-12-01', '2023-04-20'),
(6, 'Bird Seed', 8, 10, '2024-03-01', '2023-06-01'),
(7, 'Fish Food', 3, 30, '2024-08-01', '2023-07-10'),
(8, 'Rabbit Food', 12, 15, '2024-10-01', '2023-08-15'),
(9, 'Dog Shampoo', 18, 10, '2025-02-01', '2023-09-10'),
(10, 'Lion Toy', 50, 5, '2024-11-01', '2023-10-25');

-- Insert data into the trainer table
INSERT INTO trainer_table (trainer_id, trainer_name, trainer_age, trainer_joining_date, trainer_fees) VALUES
(1, 'John', 30, '2023-01-05', '$50/hr'),
(2, 'Shakila', 28, '2023-02-10', '$60/hr'),
(3, 'Ashwin', 35, '2023-03-20', '$55/hr'),
(4, 'Shubham', 32, '2023-04-25', '$45/hr'),
(5, 'Kamal', 27, '2023-05-15', '$55/hr'),
(6, 'Dhaliwal', 31, '2023-06-30', '$65/hr'),
(7, 'Jessica', 29, '2023-07-25', '$50/hr'),
(8, 'Yagnik', 33, '2023-08-10', '$55/hr'),
(9, 'Olivia', 26, '2023-09-05', '$60/hr'),
(10, 'Sophia', 30, '2023-10-20', '$50/hr');

-- Insert data into the supplier table
INSERT INTO supplier_table (supplier_id, supplier_name, received_pets, reviews, sup_secondary_phone, sup_primary_phone, supplier_address, location_table_city) VALUES
(1, 'Pet Foods Co.', 7, 4.3, '777-888-9992', '111-222-3033', '89 Cayuga St.', 'brantford'),
(2, 'Healthy Pets', 7, 4.8, null, '444-555-6166', '456 Sas St.', 'brampton'),
(3, 'Pet Treats Inc.', 12, 4.5, null, '777-888-9299', '789 Elm St.', 'halifax'),
(4, 'Kitty Litter Co.', 6, 4, null, '222-333-4344', '321 Cedar St.', 'vancouver'),
(5, 'Pet Food Mart', 5, 4.2, null, '888-999-0400', '456 Oak St.', 'warman'),
(6, 'Bird Supplies', 2, 4.6, null, '333-444-1555', '789 Pine St.', 'whitehorse'),
(7, 'Aquatic Pets', 3, 4.7, null, '555-666-7677', '123 Nelson St.', 'winnipeg'),
(8, 'Bunny Treats', 6, 4.4, null, '666-777-8788', '789 Maple St.', 'inuvik'),
(9, 'Pet Groomers', 9, 4.3, null, '999-000-1811', '456 Colborne St.', 'moncton'),
(10, 'Lion King Inc.', 2, 4.9, null, '000-111-2922', '789 Data St.', 'jalandhar');


-- Insert data into the pet table
INSERT INTO pet_table (pet_id, pet_name, age, stock, selling_price, date_of_purchase, trainer_table_trainer_id, pet_breed_info_id, product_table_product_id) VALUES
(1, 'Fluffy', 3, 5, 100, '2023-01-05', 1, 1, 1),
(2, 'Whiskers', 2, 3, 80, '2023-02-10', 2, 2, 2),
(3, 'Max', 4, 7, 120, '2023-03-20', 3, 3, 3),
(4, 'Mittens', 1, 2, 90, '2023-04-15', 4, 4, 4),
(5, 'Spike', 2, 4, 30, '2023-05-12', 5, 5, 5),
(6, 'Tweety', 1, 1, 50, '2023-06-30', 6, 6, 6),
(7, 'Nemo', 1, 2, 15, '2023-07-25', 7, 7, 7),
(8, 'Snowball', 2, 3, 70, '2023-08-10', 8, 8, 8),
(9, 'Shadow', 3, 6, 110, '2023-09-05', 9, 9, 9),
(10, 'Simba', 5, 1, 500, '2023-10-20', 10, 10, 10);



-- Insert data into the doctor table
INSERT INTO doctor_table (doctor_id, doctor_name, primary_contact, secondary_contact, address, pet_table_pet_id, pet_table_trainer_table_trainer_id, pet_table_pet_breed_info_id, health_table_report_id) VALUES
(1, 'Dr. Smith', '123-456-7890', '988-634-3210', '123 Main St.', 1 ,1, 1, 1),
(2, 'Dr. Johnson', '987-654-3210', null, '456 Elm St.', 2, 2 ,2, 2),
(3, 'Dr. Williams', '555-123-4567', '313-404-5515', '789 Oak St.',3,3,3, 3),
(4, 'Dr. Lee', '555-987-6543', '411-505-6123', '321 Pine St.',4,4,4,4),
(5, 'Dr. Brown', '111-222-3333', null, '456 Maple St.',5,5,5,5),
(6, 'Dr. Patel', '444-555-6666', '766-234-9119', '789 Cedar St.',6,6,6,6),
(7, 'Dr. Garcia', '777-888-9999', null, '123 Elm St.',7,7,7,7),
(8, 'Dr. Kim', '222-333-4444', '422-231-6006', '789 Pine St.',8,8,8,8),
(9, 'Dr. Nguyen', '888-999-0000', null, '456 Oak St.',9,9,9,9),
(10, 'Dr. Clark', '333-444-5555', '122-200-3131', '789 Elm St.',10,10,10,10);


-- Insert data into customer_table_has_pet_table 
INSERT INTO customer_table_has_pet_table (customer_table_cus_id, pet_table_pet_id, pet_table_trainer_table_trainer_id, pet_table_pet_breed_info_id, pet_table_product_table_product_id)
VALUES
(1, 1, 1, 1, 1),
(2, 2, 2, 2, 2),
(3, 3, 3, 3, 3),
(4, 4, 4, 4, 4),
(5, 5, 5, 5, 5),
(6, 6, 6, 6, 6),
(7, 7, 7, 7, 7),
(8, 8, 8, 8, 8),
(9, 9, 9, 9, 9),
(10, 10, 10, 10, 10);

-- Insert data into supplier_table_has_pet_table;
INSERT INTO supplier_table_has_pet_table (supplier_table_supplier_id, pet_table_pet_id, pet_table_trainer_table_trainer_id, pet_table_pet_breed_info_id)
VALUES
(1, 1, 1, 1),
(2, 2, 2, 2),
(3, 3, 3, 3),
(4, 4, 4, 4),
(5, 5, 5, 5),
(6, 6, 6, 6),
(7, 7, 7, 7),
(8, 8, 8, 8),
(9, 9, 9, 9),
(10, 10, 10, 10);

