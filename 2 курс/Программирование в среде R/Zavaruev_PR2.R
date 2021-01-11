install.packages("dplyr")
library(dplyr)
glimpse(cars)  
print(cars)

# ?????????????? 1
a1 <- factorial(7) + choose(32, 11)
b1 <- 1 + atan(1 / (1 + 0.2345))
c1 <- sin(a1)**3 / sqrt(b1)
d1 <- 2**(-3) + c1
x1 <- log(d1, 48.23)
print(x1)

# ?????????????? 2
a2 <- log(256 / 1809.43, 13.76)
b2 <- abs(a2) + pi / 2 - atan(7**(-3))
c2 <- cos(12)**3 * exp(1)**(-1/4.8)
d2 <- c2 / sqrt(b2)
e2 <- .3532**(-1/3) - d2
x2 <- cos(e2)**(-1)
print(round(x2, 3))

# ?????????????? 3
avgDist <- mean(cars$dist)
print(avgDist * .3048)

# ?????????????? 4
print(typeof(29))
print(typeof(23i))
print(typeof(-34L))
print(typeof(2/3))
print(typeof(4/2))
print(typeof(0xA))
print(typeof(0XbL - 120L))
print(typeof(0XbL - 120))
print(typeof(0XbL * 17))

# ?????????????? 5
print(3/7)
print(3/7 - 1.571429)

# ?????????????? 6
print(sqrt(2) * sqrt(2))
print(sqrt(2) * sqrt(2) - 2)