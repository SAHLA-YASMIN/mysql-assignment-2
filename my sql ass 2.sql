CREATE DATABASE Sales123;
Use Sales123;
CREATE TABLE Orders (

    Order_Id INT AUTO_INCREMENT,
    Customer_name VARCHAR(100) NOT NULL,
    Product_Category VARCHAR(50) NOT NULL,
    Ordered_item VARCHAR(100) NOT NULL,
    Contact_No VARCHAR(15) NOT NULL,
    PRIMARY KEY (Order_Id),
    UNIQUE (Contact_No)
);
desc Orders;
ALTER TABLE ORDERS
 ADD order_quantity INT NOT NULL;
 ALTER TABLE Orders 
RENAME TO sales123_orders;
INSERT INTO SALES123_ORDERS (Order_Id, Customer_name, Product_Category, Ordered_item, Contact_No, order_quantity)
VALUES 
(1, 'SAHLA', 'ELECTRONICS', 'LAPTOP', '6789302498', 2),
(2, 'YASMIN', 'CLOTHING', 't shirt', '9876543210', 5),
(3, 'SAFLA', 'Books', 'Novel', '2345678901', 2),
(4, 'SAMSI', 'Groceries', 'Apples', '3456789012', 10),
(5, 'YAKOOB', 'Electronics', 'Smartphone', '4567890123', 1),
(6, 'SIBIN', 'Clothing', 'Jeans', '5678901234', 2),
(7, 'ABIN', 'Books', 'Notebook', '6789012345', 3),
(8, 'SHAHEED', 'Groceries', 'Bananas', '7890123456', 7),
(9, 'SAALIN', 'Electronics', 'Tablet', '8901234567', 1),
(10, 'Thomas', 'Clothing', 'Jacket', '9012345678', 2);

SELECT Customer_name, Ordered_item FROM Sales123_Orders;

UPDATE Sales123_Orders
SET Ordered_item = 'tv'
WHERE Order_Id = 1;

DROP TABLE Sales123_Orders;




