-- Create table
DROP TABLE IF EXISTS Expenses;
CREATE TABLE Expenses (
    id SERIAL PRIMARY KEY,
    amount numeric,
    category varchar(64) CHECK(category IN ('rent', 'groceries', 'food', 'entertainment', 'misc')),
    comment varchar(128),
    date_added date
);

CREATE OR REPLACE FUNCTION set_date()
RETURNS trigger AS
$$
BEGIN
    NEW.date_added = current_date;
    RETURN NEW;
END;
$$ LANGUAGE PLPGSQL;

CREATE TRIGGER set_date_trigger
BEFORE INSERT ON Expenses
FOR EACH ROW
EXECUTE FUNCTION set_date();