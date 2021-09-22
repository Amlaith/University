from _thread import *
import time

def side_thread():
    for i in range(10):
        print(f'Side thread says {i}')
        time.sleep(1)


start_new_thread(side_thread, ())
time.sleep(0.5)

for i in range(10):
    print(f'Main thread says {i}')
    time.sleep(1)

