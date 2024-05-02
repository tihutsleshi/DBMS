from flask import Flask, render_template, request, redirect, url_for
import mysql.connector

app = Flask(__name__)

config = {
    'host': 'localhost',
    'user': 'root',
    'password': '121922',
    'database': 'testDB'
}

@app.route('/')
def index():
    return render_template('login.html')

@app.route('/login', methods=['POST'])
def login():
    username = request.form['username']
    password = request.form['password']
    conn = mysql.connector.connect(**config)
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM users WHERE username = %s AND password = %s", (username, password))
    user = cursor.fetchone()
    cursor.execute("SELECT * FROM users WHERE userType = 'user'")
    users = cursor.fetchall()
    cursor.close()
    conn.close()


    if user:
        user_type = user[3]
        if user_type == "user":
            conn = mysql.connector.connect(**config)
            cursor = conn.cursor()
            cursor.execute("SELECT * FROM loans WHERE username = %s", (user[0],))
            loans = cursor.fetchall()
            cursor.execute("SELECT * FROM expenses WHERE username = %s", (user[0],))
            expenses = cursor.fetchall()
            cursor.execute("SELECT * FROM budget WHERE username = %s", (user[0],))
            budgets = cursor.fetchall()
            cursor.execute("SELECT * FROM transaction WHERE username = %s", (user[0],))
            transactions = cursor.fetchall()
            cursor.execute("SELECT * FROM income WHERE username = %s", (user[0],))
            incomes = cursor.fetchall()
            return render_template("user_view.html", loans=loans, expenses=expenses, budgets=budgets, transactions=transactions, incomes=incomes)
        else:
            return render_template('index.html', users=users)
    else:
        return render_template("login.html")


@app.route('/search', methods=['GET', 'POST'])
def search():
    username = request.form.get('data') if request.method == 'POST' else request.args.get('username')
    if not username:
        return redirect(url_for('index'))

    conn = mysql.connector.connect(**config)
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM loans WHERE username=%s", (username,))
    loans = cursor.fetchall()
    cursor.execute("SELECT * FROM expenses WHERE username=%s", (username,))
    expenses = cursor.fetchall()
    cursor.execute("SELECT * FROM budget WHERE username=%s", (username,))
    budgets = cursor.fetchall()
    cursor.execute("SELECT * FROM transaction WHERE username = %s", (username,))
    transactions = cursor.fetchall()
    cursor.execute("SELECT * FROM income WHERE username = %s", (username,))
    incomes = cursor.fetchall()
    cursor.close()
    conn.close()
    return render_template('searchUser.html', loans=loans, expenses=expenses, budgets=budgets, username=username, transactions=transactions, incomes=incomes)

@app.route('/add', methods=['POST'])
def add():
    data = request.form['data']
    conn = mysql.connector.connect(**config)
    cursor = conn.cursor()
    cursor.execute("INSERT INTO users (username, password, email, userType) VALUES (%s, %s, %s, %s)", (data, "pass", "email", "user"))
    conn.commit()
    cursor.close()
    conn.close()
    return redirect(url_for('index'))

@app.route('/delete', methods=['POST'])
def delete():
    username = request.form['username']
    conn = mysql.connector.connect(**config)
    cursor = conn.cursor()
    cursor.execute("DELETE FROM users WHERE username = %s", (username,))
    conn.commit()
    cursor.close()
    conn.close()
    return redirect(url_for('index'))

@app.route('/update', methods=['POST'])
def update_email():
    username = request.form['username']
    new_email = request.form['new_email']
    conn = mysql.connector.connect(**config)
    cursor = conn.cursor()
    cursor.execute("UPDATE users SET email = %s WHERE username = %s", (new_email, username))
    conn.commit()
    cursor.close()
    conn.close()
    return redirect(url_for('index'))

@app.route('/addUserLoan', methods=['POST'])
def addUserLoan():
    username = request.form['username']
    loanType = request.form['loanType']
    loanAmount = request.form['loanAmount']
    interest = request.form['interest']
    balanceRemaining = request.form['balanceRemaining']
    startDate = request.form['startDate']
    endDate = request.form['endDate']
    conn = mysql.connector.connect(**config)
    cursor = conn.cursor()
    cursor.execute("INSERT INTO loans (username, loanType, loanAmount, interest, balanceAmount, startDate, endDate) VALUES (%s, %s, %s, %s, %s, %s, %s)",
                   (username, loanType, loanAmount, interest, balanceRemaining, startDate, endDate))
    conn.commit()
    cursor.close()
    conn.close()
    return redirect(url_for('search', username=username))

@app.route('/editUserLoan', methods=['POST'])
def editUserLoan():
    username = request.form['username']
    loanType = request.form['loanType']
    loanID = request.form['loanID']
    loanAmount = request.form['loanAmount']
    interest = request.form['interest']
    balanceAmount = request.form['balanceRemaining']
    conn = mysql.connector.connect(**config)
    cursor = conn.cursor()
    cursor.execute("UPDATE loans SET loanType = %s, loanAmount = %s, interest = %s, balanceAmount = %s WHERE loanID = %s", (loanType, loanAmount, interest, balanceAmount, loanID))
    conn.commit()
    cursor.close()
    conn.close()
    return redirect(url_for('search', username=username))

@app.route('/editUserExpense', methods=['POST'])
def editUserExpense():
    expenseID = request.form['expenseID']
    date = request.form['date']
    category = request.form['category']
    amount = request.form['amount']
    username = request.form['username']
    conn = mysql.connector.connect(**config)
    cursor = conn.cursor()
    cursor.execute("UPDATE expenses SET date = %s, amount = %s, expenseCategory = %s WHERE expenseID = %s", (date, amount, category, expenseID))
    conn.commit()
    cursor.close()
    conn.close()
    return redirect(url_for('search', username=username))

@app.route('/editUserBudget', methods=['POST'])
def editUserBudget():
    budgetID = request.form['budgetID']
    username = request.form['username']
    total = request.form['total']
    budgetCategory = request.form['budgetCategory']
    conn = mysql.connector.connect(**config)
    cursor = conn.cursor()
    cursor.execute("UPDATE budget SET total = %s, budgetCategory = %s WHERE budgetID = %s", (total, budgetCategory, budgetID))
    conn.commit()
    cursor.close()
    conn.close()
    print(username)
    return redirect(url_for('search', username=username))

@app.route('/editUserTransaction', methods=['POST'])
def editUserTransaction():
    transactionID = request.form['transactionID']
    username = request.form['username']
    date = request.form['date']
    amount = request.form['amount']
    method = request.form['methodOfPayment']
    conn = mysql.connector.connect(**config)
    cursor = conn.cursor()
    cursor.execute("UPDATE transaction SET date = %s, amount = %s, method = %s WHERE transactionID = %s", (date, amount, method, transactionID))
    conn.commit()
    cursor.close()
    conn.close()
    print(username)
    return redirect(url_for('search', username=username))

@app.route('/editUserIncome', methods=['POST'])
def editUserIncome():
    incomeID = request.form['incomeID']
    username = request.form['username']
    source = request.form['source']
    amount = request.form['iAmount']
    conn = mysql.connector.connect(**config)
    cursor = conn.cursor()
    cursor.execute("UPDATE income SET source = %s, amount = %s WHERE incomeID = %s", (source, amount, incomeID))
    conn.commit()
    cursor.close()
    conn.close()
    print(username)
    return redirect(url_for('search', username=username))






if __name__ == '__main__':
    app.run(debug=True)
