# Задание векторов и матриц

# 1. Образовать и вывести на экран вектор a,
# содержащий 50 одинаковых координат, равных 3.
a = rep(3, 50)
print(a)

# 2. Образовать и вывести на экран вектор b,
# содержащий 100 координат 1,2,..,100.
b = 1:100
print(b)

# 3. Образовать квадратную матрицу A, состоящую из
# последовательности чисел 1,2,…,16, которая заполняет матрицу
# a) по столбцам;
A <- matrix(1:16, 16, 16)
print(A)
# b) по строкам.
A <- matrix(1:16, 16, 16, byrow = T)
print(A)

# 4. Решить предыдущие упражнения 1–3 с помощью
# MS Excel и буфера обмена.

# 4.1
Data = read.table("clipboard", h=FALSE, dec=",", sep = "\t")
a = as.matrix.data.frame(Data)
print(a)

# 4.2
Data = read.table("clipboard", h=FALSE, dec=",", sep = "\t")
b = as.matrix.data.frame(Data)
print(b)

# 4.3
# a)
Data = read.table("clipboard", h=FALSE, dec=",", sep = "\t")
A = as.matrix.data.frame(Data)
print(A)
# b)
Data = read.table("clipboard", h=FALSE, dec=",", sep = "\t")
A = as.matrix.data.frame(Data)
print(A)

# 5. Образовать и вывести на экран консоли матрицу Гильберта G
# размера (10x10), элементы которой равны сумме
# соответствующих строки и столбца: G(i, j)=i+j;
G = array(0, dim = c(10, 10))
for (i in 1:10) {
  for (j in 1:10) {
    G[i, j] = i + j  
  }
}
print(G)

# 6. Образовать в R единичную матрицу размера (40x40)
# и перенести ее через буфер обмена в excel-таблицу
e = array(0, dim = c(40, 40))
for (i in 1:40) {
  for (j in 1:40) {
    if(i == j) {
      e[i, j] = 1
    }
  }
}
print(e)
write.table(e,"clipboard",quote=FALSE, col.names = FALSE, row.names = FALSE, sep = "\t", dec=",")

