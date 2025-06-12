from flask import Flask, request, render_template_string
import sqlite3

app = Flask(__name__)

def init_db():
    conn = sqlite3.connect('myCyber.db')
    c = conn.cursor()
    c.execute('''CREATE TABLE IF NOT EXISTS users (id INTEGER PRIMARY KEY, username TEXT, password TEXT)''')
    c.execute("INSERT INTO users (username, password) VALUES ('admin', 'admin123')")
    conn.commit()
    conn.close()

init_db()

@app.route('/')
def index():
    return '''
        <h1>Login</h1>
        <form action="/login" method="POST">
            Username: <input type="text" name="username"><br>
            Password: <input type="password" name="password"><br>
            <input type="submit" value="Login">
        </form>
    '''

@app.route('/login', methods=['POST'])
def login():
    username = request.form['username']
    password = request.form['password']

    query = f"SELECT * FROM users WHERE username = '{username}' AND password = '{password}'"
    
    conn = sqlite3.connect('myCyber.db')
    c = conn.cursor()
    c.execute(query)
    user = c.fetchone()
    conn.close()

    if user:
        return f"<h1>Welcome, {user[1]}!</h1>"
    else:
        return "<h1>Login failed</h1>"

if __name__ == '__main__':
    app.run(debug=True)