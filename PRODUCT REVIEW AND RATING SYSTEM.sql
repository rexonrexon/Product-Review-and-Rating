

CREATE DATABASE OnlineStore;
USE OnlineStore;


CREATE TABLE Customer (
    Customer_ID INT PRIMARY KEY,
    Customer_Name VARCHAR(50)
);

CREATE TABLE Product (
    Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(50)
);

CREATE TABLE Review (
    Review_ID VARCHAR(10) PRIMARY KEY,
    Customer_ID INT,
    Product_ID INT,
    Rating INT NOT NULL CHECK(Rating BETWEEN 1 AND 5),
    Review_Text VARCHAR(255),
    Review_Date DATE NOT NULL,
    FOREIGN KEY(Customer_ID) REFERENCES Customer(Customer_ID),
    FOREIGN KEY(Product_ID) REFERENCES Product(Product_ID)
);

INSERT INTO Customer VALUES
(1,'Rahul'),(2,'Sneha'),(3,'Kavin'),(4,'Meena');

INSERT INTO Product VALUES
(201,'Smart Watch'),(202,'Tablet'),
(203,'Camera'),(204,'Speaker');

INSERT INTO Review VALUES
('RV01',1,201,5,'Excellent features','2026-11-01'),
('RV02',2,202,4,'Good display','2026-11-02'),
('RV03',3,201,4,'Nice product','2026-11-03'),
('RV04',4,203,3,'Average camera','2026-11-04'),
('RV05',1,204,5,'Amazing sound','2026-11-05');

UPDATE Review
SET Review_Text='Very good display'
WHERE Review_ID='RV02';

DELETE FROM Review
WHERE Review_ID='RV04';

SELECT Product_Name, Rating, Review_Text
FROM Product JOIN Review
ON Product.Product_ID=Review.Product_ID;

SELECT Customer_Name, Review_Text, Rating
FROM Customer JOIN Review
ON Customer.Customer_ID=Review.Customer_ID;

SELECT * FROM Review
ORDER BY Review_Date DESC;

SELECT * FROM Review
WHERE Rating>4;

SELECT Product_ID, AVG(Rating) AS Average_Rating
FROM Review GROUP BY Product_ID;

SELECT Product_ID, COUNT(*) AS Total_Reviews
FROM Review GROUP BY Product_ID;

SELECT Product_ID, AVG(Rating) AS Average_Rating
FROM Review
GROUP BY Product_ID
ORDER BY Average_Rating DESC;

SELECT Product_ID, AVG(Rating) AS Average_Rating
FROM Review
GROUP BY Product_ID
HAVING AVG(Rating)>4;

SELECT Product_Name,
COUNT(Review_ID) AS Total_Reviews,
AVG(Rating) AS Average_Rating
FROM Product LEFT JOIN Review
ON Product.Product_ID=Review.Product_ID
GROUP BY Product.Product_ID, Product_Name;

SELECT Product_Name, COUNT(Review_ID) AS Total_Reviews
FROM Product JOIN Review
ON Product.Product_ID=Review.Product_ID
GROUP BY Product.Product_ID, Product_Name
ORDER BY Total_Reviews DESC;

SELECT Product_ID, AVG(Rating) AS Average_Rating
FROM Review
GROUP BY Product_ID
HAVING AVG(Rating)<3;

SELECT Rating, COUNT(*) AS Total
FROM Review
GROUP BY Rating;


SELECT * FROM Review;