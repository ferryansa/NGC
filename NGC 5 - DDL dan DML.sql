CREATE TABLE Customers (
	customer_id SERIAL PRIMARY KEY,
	customer_name VARCHAR(100),
	city VARCHAR(100)
);

CREATE TABLE Orders (
	order_id SERIAL PRIMARY KEY,
	customer_id SERIAL REFERENCES Customers(customer_id),
	order_date DATE,
	total_amount DECIMAL
);

INSERT INTO Customers (customer_name, city)
VALUES
	('John Doe', 'New York'),
	('Jane Smith', 'Los Angeles'),
	('David Johnson', 'Chicago');

INSERT INTO Orders (customer_id, order_date, total_amount)
VALUES
	(1, '2022-01-10', 100.00),
	(1, '2022-02-15', 150.00),
	(2, '2022-03-20', 200.00),
	(3, '2022-04-25', 50.00);

SELECT * FROM Customers;
SELECT * FROM Orders;

SELECT customer_name, 
	COUNT(Orders.order_id)
FROM Customers
	LEFT JOIN Orders ON Customers.customer_id = Orders.customer_id
	GROUP BY Customers.customer_name;

