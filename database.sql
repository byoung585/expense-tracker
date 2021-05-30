-- Create table
DROP TABLE IF EXISTS Expenses;
CREATE TABLE Expenses (
    id SERIAL PRIMARY KEY,
    amount numeric,
    category varchar(64) CHECK(category IN ('rent', 'groceries', 'food', 'entertaintment', 'misc')),
    comment varchar(128)
);