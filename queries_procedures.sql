-- the breed of the pet 
UPDATE pet_breed
SET 
    breed = 'Bulldog'
WHERE
    info_id = '3';

-- find a doctor who make health reports for the specific pet
SELECT 
    doctor_name, pet_name, health_report
FROM
    doctor_table d
        JOIN
    health_table h ON d.doctor_id = h.report_id
        JOIN
    pet_table p ON d.doctor_id = p.pet_id
WHERE
    p.pet_id = 5;


-- telling the total ammount of the pet after the tax
SELECT 
    pet_id,
    pet_name,
    selling_price,
    selling_price * 1.1 AS price_with_tax
FROM
    pet_table
WHERE
    pet_id = 1;

-- finding the trainers who have age more than 30 having "s" in their name;
SELECT 
    trainer_id, trainer_name, trainer_age
FROM
    trainer_table
WHERE
    trainer_age > 30
        AND trainer_name LIKE '%s%';


-- the given procedure shows the pet id whose stock is about to empty and calculate the total expenses to renew the stock of pets then it show the supplier price for that pet and the supplier name of that pet:
DELIMITER //
CREATE PROCEDURE Showalert()
BEGIN
    -- Create a temporary table to store the results
    CREATE TEMPORARY TABLE IF NOT EXISTS result_table (
        pet_id INT,
        selling_price DECIMAL(10,2),
        supplier_name VARCHAR(255),
        total_expenditure DECIMAL(10,2)
    );

    -- Pets with stock less than 3 and their price before tax and supplier names
    INSERT INTO result_table (pet_id, selling_price, supplier_name)
    SELECT p.pet_id, p.selling_price-5, s.supplier_name
    FROM pet_table p
    JOIN supplier_table s ON s.supplier_id = p.pet_id
    WHERE p.stock < 3;

    -- Total expenditure for pets with sufficient stock (stock greater than or equal to 3)
    INSERT INTO result_table (total_expenditure)
    SELECT SUM(p.selling_price-5) AS total_expenditure
    FROM pet_table p
    WHERE p.stock < 3;

    -- Select all the results and return them
    SELECT pet_id,
        selling_price as suplier_price,
        supplier_name ,
        total_expenditure
    FROM result_table;
END //

DELIMITER ;

call Showalert();
