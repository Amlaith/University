from _thread import *
import time

A = [
    [1, 2],
    [3, 4],
    [5, 6]
]

B = [
    [9, 8, 7],
    [6, 5, 4],
]


def worker(a, b):
    global res
    size = len(a)
    for i in range(size):
        for j in range(size):
            if res[i][j] == None:
                res_num = 0
                for k in range(len(b)):
                    res_num += a[i][k] * b[k][j]
                
                res[i][j] = res_num
                
    return

def writer(path, matrix):
    with open(path, mode="w", encoding="utf-8") as f:
        for line in matrix:
            f.write(" ".join(map(str, line)) + '\n')


def mul(a, b): 
    global res
    size = len(a)
    res = [[None for _ in range(size)] for _ in range(size)]
    
    for _ in range(3):
        start_new_thread(worker, (a, b))
    
    time.sleep(2)
    
    start_new_thread(writer, ('log.txt', res))
    
    return res


print(mul(A, B))