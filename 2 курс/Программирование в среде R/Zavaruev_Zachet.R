# �������� ����
# ��19-1�
# ������� 8

# ������� 1.
x = 2
a = 3

d = (sin(x^3) - cos(x^3)) / (2 * x)

b = (3 * a + x ^ (3 / 2)) / 2


# ������� 2.
a = 3.1
b = 4.2
c = .5
d = 5.3

# ������� x:
if (a < b) {
  x = (a * b) ^ (1 / 2)
} else {
  x = (a + b) ^ (1 / 2)
}

# ������� z:
absx = abs(x)
if (absx < d) {
  z  = (a * x + 1) ^ (1 / 3)
} else if  (absx == d) {
  z = sin(b * x + 1)
} else {
  z = cos(c * x + 1)
}


# ������� 3.
x = seq(-1, 1, .2)

y = (a ^ 4) / ((a + x) ^ 2)

plot(x, y)


# ������� 4.
otlichniki = c(5, 6, 3, 2, 3, 7, 6, 1, 4, 6, 7)

max_otlichnikov = (which(otlichniki == max(otlichniki)))


# ������� 5.
foo = function(sq) {
  bar = function(x) {
    return((sin(x^3) - cos(x^3)) / (2 * x))
  }
  plot(sq, bar(sq))
}

sq5 = seq(-5, 5, .2) 
foo(sq5)

