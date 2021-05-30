-- Create tables

CREATE TABLE Categories (
    id serial PRIMARY KEY,
    name varchar(64)
);

CREATE TABLE Expenses (
    id SERIAL PRIMARY KEY,
    amount numeric,
    category_id int REFERENCES Categories,
    comment varchar(128)
);

-- Enter starting data
INSERT INTO Categories(name) VALUES('Rent');
INSERT INTO Categories(name) VALUES('Groceries');
INSERT INTO Categories(name) VALUES('Food');
INSERT INTO Categories(name) VALUES('Entertainment');
INSERT INTO Categories(name) VALUES('Misc');