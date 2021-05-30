#!python3

import psycopg2, sys

def print_usage():
    usage = '''
        -------------- Expense Tracker --------------
        Usage:

        Add a new expense entry
        expenses add <amount> <category> <comment> 
    '''
    print(usage)

def add_expense(db):
    # User does not have a commment
    if len(sys.argv) == 4:
        amount = sys.argv[2]
        cat = sys.argv[3]
        db.execute('INSERT INTO Expenses (amount, category) VALUES(%s, %s)', (amount, cat))
    # User does have a comment
    elif len(sys.argv) == 5:
        amount = sys.argv[2]
        cat = sys.argv[3]
        comment = sys.argv[4]
        db.execute('INSERT INTO Expenses (amount, category, comment) VALUES(%s, %s, %s)', (amount, cat, comment))
    else:
        raise ValueError('Incorrect number of arguments')

def main():
    conn = psycopg2.connect(database='postgres', user='postgres', password='postgres')
    db = conn.cursor()

    # Parse args
    if len(sys.argv) == 1:
        print_usage()
        sys.exit(0)

    cmd = sys.argv[1]
    if cmd == 'add':
        try:
            add_expense(db)
        except ValueError as e:
            print(e)
        else:
            conn.commit()
        sys.exit(0)

if __name__ == '__main__':
    main()