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

CREATE PROCEDURE add_customer(named VARCHAR(50))
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO customer(name_)
	VALUES(named);
END;
$$;

CALL add_customer('John Johnson');
CALL add_customer('Barb Barbrason');

CREATE PROCEDURE add_salesperson(named VARCHAR(50))
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO salesperson(name_)
	VALUES(named);
END;
$$;

CALL add_salesperson('Dan Danman');
CALL add_salesperson('Sue Sued');

CREATE PROCEDURE add_mechanic(named VARCHAR(50))
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO mechanic(name_)
	VALUES(named);
END;
$$;

CALL add_mechanic('Marge Martin');
CALL add_mechanic('Bob Banker');

INSERT INTO car(name_, description, price)
VALUES
('2005 Chevy', 'Blue, new, etc.', 150),
('2004 Honda', 'Red, broken tailight, etc.', 150);

INSERT INTO invoice(car_id, customer_id, salesperson_id)
VALUES
(1,1,1),
(2,2,1);

INSERT INTO ticket(car_id, customer_id, mechanic_id)
VALUES
(1,1,1),
(2,2,1);