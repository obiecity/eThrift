###
# Main application interface
###

# import the create app function 
# that lives in src/__init__.py
from src import create_app

# create the app object
app = create_app()

app.register_blueprint(customers, url_prefix='/customers')
app.register_blueprint(products, url_prefix='/products')

@app.route('/hello/<firstName>')
def hello_guest(firstName):
    return f'<h1>Hello, {firstName}! Welcome to eThrift, the best option for online thrifting!<h1>'

if __name__ == '__main__':
    # we want to run in debug mode (for hot reloading) 
    # this app will be bound to port 4000. 
    # Take a look at the docker-compose.yml to see 
    # what port this might be mapped to... 
    app.run(debug = True, host = '0.0.0.0', port = 4000)
