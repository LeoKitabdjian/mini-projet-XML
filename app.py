import http.server
import urllib.parse

from scenarios import xslrenderer


def statistiques(self):
    self.send_response(200)
    self.send_header("Content-type", "text/html")
    self.end_headers()
    self.wfile.write(xslrenderer.render('scenarios/statistiques/statistiques.xsl'))


def affectation(self):
    self.send_response(200)
    self.send_header("Content-type", "text/html")
    self.end_headers()
    self.wfile.write(xslrenderer.render('scenarios/affectation/affectation.xsl'))


def sejours(self):
    self.send_response(200)
    self.send_header("Content-type", "text/html")
    self.end_headers()
    self.wfile.write(xslrenderer.render('scenarios/sejours/sejours.xsl'))

def not_found(self):
    self.send_response(404)
    self.send_header("Content-type", "text/html")
    self.end_headers()
    self.wfile.write(b"404 Not Found")


def style(self, parsed_path):
    self.send_response(200)
    self.send_header("Content-type", "text/css")
    self.end_headers()
    with open('.' + parsed_path.path, 'rb') as f:
        self.wfile.write(f.read())


def main(port=8000):
    class ServerHandler(http.server.BaseHTTPRequestHandler):
        def do_GET(self):
            parsed_path = urllib.parse.urlparse(self.path)
            if parsed_path.path.startswith('/style/'):
                style(self, parsed_path)
            elif parsed_path.path == '/statistiques':
                statistiques(self)
            elif parsed_path.path == '/sejours':
                sejours(self)
            elif parsed_path.path == '/affectation':
                affectation(self)
            else:
                not_found(self)

    server_address = ('', port)
    httpd = http.server.HTTPServer(server_address, ServerHandler)
    print('Serveur en écoute sur le port ' + str(port) + ' ...')
    httpd.serve_forever()


if __name__ == '__main__':
    xslrenderer.generate()
    main(8000)
