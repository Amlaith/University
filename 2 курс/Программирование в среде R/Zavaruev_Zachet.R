# Заваруев Иван
# ПИ19-1в
# Вариант 8

# Задание 1.
x = 2
a = 3

d = (sin(x^3) - cos(x^3)) / (2 * x)

b = (3 * a + x ^ (3 / 2)) / 2


# Задание 2.
a = 3.1
b = 4.2
c = .5
d = 5.3

# Находим x:
if (a < b) {
  x = (a * b) ^ (1 / 2)
} else {
  x = (a + b) ^ (1 / 2)
}

# Находим z:
absx = abs(x)
if (absx < d) {
  z  = (a * x + 1) ^ (1 / 3)
} else if  (absx == d) {
  z = sin(b * x + 1)
} else {
  z = cos(c * x + 1)
}


# Задание 3.
x = seq(-1, 1, .2)

y = (a ^ 4) / ((a + x) ^ 2)

plot(x, y)


# Задание 4.
otlichniki = c(5, 6, 3, 2, 3, 7, 6, 1, 4, 6, 7)

max_otlichnikov = (which(otlichniki == max(otlichniki)))


# Задание 5.
foo = function(sq) {
  bar = function(x) {
    return((sin(x^3) - cos(x^3)) / (2 * x))
  }
  plot(sq, bar(sq))
}

sq5 = seq(-5, 5, .2) 
foo(sq5)

