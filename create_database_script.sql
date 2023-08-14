CREATE TABLE customer (
	customer_id SERIAL PRIMARY KEY,
	name_ VARCHAR(50)
);

CREATE TABLE salesperson (
	salesperson_id SERIAL PRIMARY KEY,
	name_ VARCHAR(50)
);

CREATE TABLE mechanic (
	mechanic_id SERIAL PRIMARY KEY,
	name_ VARCHAR(50)
);

CREATE TABLE car (
	car_id SERIAL PRIMARY KEY,
	name_ VARCHAR(50),
	description VARCHAR,
	price NUMERIC(5,2)
);

CREATE TABLE invoice (
	invoice_id SERIAL PRIMARY KEY,
	car_id INTEGER NOT NULL,
	customer_id INTEGER NOT NULL,
	salesperson_id INTEGER NOT NULL,
	FOREIGN KEY (car_id) REFERENCES car(car_id),
	FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
	FOREIGN KEY (salesperson_id) REFERENCES salesperson(salesperson_id)
);

CREATE TABLE ticket (
	ticket_id SERIAL PRIMARY KEY,
	car_id INTEGER NOT NULL,
	customer_id INTEGER NOT NULL,
	mechanic_id INTEGER NOT NULL,
	FOREIGN KEY (car_id) REFERENCES car(car_id),
	FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
	FOREIGN KEY (mechanic_id) REFERENCES mechanic(mechanic_id)
);

CREATE PROCEDURE add_customer(
	@named varchar(50)
)
AS
BEGIN
	INSERT INTO customer(name_)
	VALUES(@named)
END;

EXEC add_customer @named = 'John Johnson';
EXEC add_customer @named = 'Barb Barbrason';