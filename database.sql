CREATE OR REPLACE FUNCTION validate_category(cat varchar(64))
RETURNS bool AS
$$
BEGIN
    RETURN cat IN ('rent', 'utilities', 'groceries', 'food', 'entertainment', 'gas', 'home items', 'donations', 'misc');
END;
$$ LANGUAGE PLPGSQL;

-- Create table
DROP TABLE IF EXISTS Expenses;
CREATE TABLE Expenses (
    id SERIAL PRIMARY KEY,
    amount numeric,
    category varchar(64) CHECK(validate_category(category)),
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