#!/usr/bin/env python3

import sys
from http.server import HTTPServer, BaseHTTPRequestHandler

if len(sys.argv)-1 != 2:
    print(f"""
Usage: {sys.argv[0]} <port_number> <url>
    """)
    sys.exit()

class Redirect(BaseHTTPRequestHandler):
    def do_GET(self):
        # if self.path == "/hello.txt":
            print("GET", self.path)
            self.send_response(200)
            self.send_header("Content-Type", "text/plain")
            self.send_header("Content-Disposition", 'attachment; filename="filename.jpg"')
            self.end_headers()
            self.wfile.write(b"hello world!")
        # else:
        #     self.send_response(302)
        #     self.send_header("Location", sys.argv[2])
        #     self.end_headers()

HTTPServer(("", int(sys.argv[1])), Redirect).serve_forever()