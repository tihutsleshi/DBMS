from flask import Flask, render_template, request, redirect, url_for
import mysql.connector

app = Flask(__name__)

config = {
    'host': 'localhost',
    'user': 'root',
    'password': '#Security.11',
    'database': 'testDB'
}


@app.route('/')
def index():
    return render_template('login.html')


@app.route('/login', methods=['POST'])
def login():
    username = request.form['username']
    password = request.form['password']

    # Assuming there's a table named 'users' with columns 'username' and 'password'
    conn = mysql.connector.connect(**config)
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM users WHERE username = %s AND password = %s", (username, password))
    user = cursor.fetchone()
    cursor.close()
    conn.close()

    if user:
        user_type = user[3]
        if user_type == "user":
            return render_template("user_view.html")
        else:
            return render_template("admin_view.html")
    else:
        return render_template("login.html")

@app.route('/create_user', methods=['POST'])
def create_user():
    new_username = request.form['new_username']
    new_password = request.form['new_password']
    new_email = request.form['new_email']
    conn = mysql.connector.connect(**config)
    cursor = conn.cursor()
    cursor.execute("INSERT INTO users (username, password, email, userType) VALUES (%s, %s, %s, %s)",
                   (new_username, new_password, new_email, "usertype"))
    conn.commit()
    cursor.close()
    conn.close()
    return render_template("login.html")


@app.route('/search', methods=['GET', 'POST'])
def search():
    username = request.form.get('data') if request.method == 'POST' else request.args.get('username')
    if not username:
        return redirect(url_for('admin_view'))

    conn = mysql.connector.connect(**config)
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM loans WHERE username=%s", (username,))
    loans = cursor.fetchall()
    cursor.execute("SELECT * FROM expenses WHERE username=%s", (username,))
    expenses = cursor.fetchall()
    cursor.execute("SELECT * FROM budget WHERE username=%s", (username,))
    budgets = cursor.fetchall()
    cursor.close()
    conn.close()
    return render_template('searchUser.html', loans=loans, expenses=expenses, budgets=budgets, username=username)

@app.route('/add', methods=['POST'])
def add():
    data = request.form['data']
    conn = mysql.connector.connect(**config)
    cursor = conn.cursor()
    cursor.execute("INSERT INTO users (username, password, email, userType) VALUES (%s, %s, %s, %s)", (data, "pass", "email", "user"))
    conn.commit()
    cursor.close()
    conn.close()
    return redirect(url_for('admin_view'))

@app.route('/delete', methods=['POST'])
def delete():
    username = request.form['username']
    conn = mysql.connector.connect(**config)
    cursor = conn.cursor()
    cursor.execute("DELETE FROM users WHERE username = %s", (username,))
    conn.commit()
    cursor.close()
    conn.close()
    return redirect(url_for('admin_view'))

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
    return redirect(url_for('admin_view'))

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
if __name__ == '__main__':
    app.run(debug=True)
