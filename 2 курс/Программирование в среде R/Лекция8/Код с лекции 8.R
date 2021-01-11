res <- sample(x = -5:21, size = 30, replace = TRUE)
plot(x=res)

abline(v=seq(1,30,1), col = 'blue')

abline(h=seq(-5,21,1), col = 'green')
colors()

x2 <- seq(-2,25, length.out = 37)
y2 <- -2+x2/3 *sin(x2/0.9)
plot(x=x2)
plot (x=y2, type = "l")

w <- rnorm(n=50, mean = 15, sd = 5)
hist(w, breaks = 20, freq = FALSE, col = "green",
xlab = "Переменная w",
ylab = "Плотность вероятности",
main = "Гистограмма, совмещенная с кривой плотности")
lines(density(w), col = "red", lwd = 4)

# primer f
f <- function(x) {(x^3+3*x^2-1)/(x^2+1)}
dx = 0.0001
x <- seq(-4, 2, by=dx)
plot(x, f(x), type = "l", lwd = 3, col = "blue", main = "График функции f(x)")
abline(h=0, v=0, col = "gray40")

# primer 2

r <- function(x,y) {x^2-y^2}
x <- seq(-10,10, by = 0.5)
y <- seq(-10,10, by = 0.5)
z <- outer(x, y, r)
persp(x, y, z, theta = 30, phi = 10, col = "green", main = "Гиперболический параболоид")










