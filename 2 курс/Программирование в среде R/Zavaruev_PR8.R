# Графика в R

# Задание математических функций и построение графиков


# 1. Вычислить синус для целых 1...100
sin(1:100)


# 2. Построить график функции sign(x) на [-2, 2]
sqnc2 = seq(-2, 2, .05)
plot(sqnc2, sign(sqnc2), type='l')


# 3. Объявить ф-ю Separate(x), возвращающую целую
# и дробную части x. Построить их графики на [-3, 3]
Separate = function(x) {
  fl = floor(x)
  return(list(fl, x - fl))
}

sqnc3 = seq(-3, 3, .01)
res3 = Separate(sqnc3)

# График целой части
plot(sqnc3, res3[[1]], type='l', col='green')
# График дробной части
lines(sqnc3, res3[[2]], type='l', col='pink')
 

# 4. Объявить ф-ю [sin(x) / x],
# построить ее график на [-20, 20]
Sink = function(x) {
  return(sin(x) / x)
}
sqnc4 = seq(-20, 20, length.out = 401)
plot(sqnc4, Sink(sqnc4), type='l')
# На графике разрыва нет, но sin(x) / x, конечно,
# в нуле не определена

# 5. Объявить ф-ю W(x),
# построить ее график на [-10, 5]
W = function(x) {
  if (x >= 0) {
    return(x*x)
  } else {
    return(sin(2*x))
  }
}
sqnc5 = seq(-10, 5, .05)
plot(sqnc5, sapply(sqnc5, W), 'l')
