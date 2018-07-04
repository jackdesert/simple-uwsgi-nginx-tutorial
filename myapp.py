from wsgiref.simple_server import make_server

def helloworld_app(environ, start_response):

    """Simple web application which return Hello World to browser"""

    status = '200 OK'

    response_headers = [('Content-type', 'text/plain')]

    start_response(status, response_headers)

    return [b"Hello World !"]

if __name__ == '__main__':

    # start the server

    server = make_server('', 5000, helloworld_app)

    server.serve_forever()
