#!/usr/bin/env python3

# See https://github.com/Nakiami/MultithreadedSimpleHTTPServer/blob/master/MultithreadedSimpleHTTPServer.py

# Python 3.x
import sys
import os

from socketserver import ThreadingMixIn
from http.server import SimpleHTTPRequestHandler, HTTPServer


class ThreadingSimpleServer(ThreadingMixIn, HTTPServer):
    pass


if sys.argv[1:]:
    port = int(sys.argv[1])
else:
    port = 8000

if sys.argv[2:]:
    os.chdir(sys.argv[2])

server = ThreadingSimpleServer(("", port), SimpleHTTPRequestHandler)
server.daemon_threads = True
print(f"Starting server on 0.0.0.0:{port}")
try:
    server.serve_forever()
except KeyboardInterrupt:
    print("Finished")
