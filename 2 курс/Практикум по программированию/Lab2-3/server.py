import socket
from _thread import *
from email.utils import formatdate
# TODO: deprecated file types
# TODO: binary files support


def threaded_client(conn, addr, src):

    print("Connected", addr)
    data = conn.recv(8192)
    msg = data.decode()
    print('msg:', msg)
    path = src + msg.split('\n')[0].split(' ')[1][1:]
    print("File: ", path)

    try:
        with open(path) as f:
            body = f.read()
            resp = "HTTP/1.1 200 OK\n" +\
                f"Date: {formatdate(timeval=None, localtime=False, usegmt=True)}\n" +\
                f"Content-Type: {'text-html'}\n" +\
                f"Server: {'Python HTTP Server'}\n" +\
                f"Content-length: {len(body.encode())}\n" +\
                "Connection: close\n\n" +\
                body

    except FileNotFoundError:
        body = "<h1>File Not Found</h1>"
        resp = "HTTP/1.1 404 Not Found\n" + \
           f"Date: {formatdate(timeval=None, localtime=False, usegmt=True)}\n" + \
           f"Content-Type: {'text-html'}\n" + \
           f"Server: {'Python HTTP Server'}\n" + \
           f"Content-length: {len(body.encode())}\n" + \
           "Connection: close\n\n" + \
           body
    conn.send(resp.encode())


    exit()


with open("cfg.txt", "r", encoding="utf-8") as cfg:
    HOST = int(cfg.readline()[5:])
    src = cfg.readline()[4:]

sock = socket.socket()
try:
    sock.bind(('', HOST))
except OSError:
    sock.bind(('', 8080))
sock.listen(5)
while True:
    conn, addr = sock.accept()
    print('Connected to: ' + addr[0] + ':' + str(addr[1]))
    start_new_thread(threaded_client, (conn, addr, src))



conn.close()
