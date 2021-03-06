# ������� � R

# ������� �������������� ������� � ���������� ��������


# 1. ��������� ����� ��� ����� 1...100
sin(1:100)


# 2. ��������� ������ ������� sign(x) �� [-2, 2]
sqnc2 = seq(-2, 2, .05)
plot(sqnc2, sign(sqnc2), type='l')


# 3. �������� �-� Separate(x), ������������ �����
# � ������� ����� x. ��������� �� ������� �� [-3, 3]
Separate = function(x) {
  fl = floor(x)
  return(list(fl, x - fl))
}

sqnc3 = seq(-3, 3, .01)
res3 = Separate(sqnc3)

# ������ ����� �����
plot(sqnc3, res3[[1]], type='l', col='green')
# ������ ������� �����
lines(sqnc3, res3[[2]], type='l', col='pink')
 

# 4. �������� �-� [sin(x) / x],
# ��������� �� ������ �� [-20, 20]
Sink = function(x) {
  return(sin(x) / x)
}
sqnc4 = seq(-20, 20, length.out = 401)
plot(sqnc4, Sink(sqnc4), type='l')
# �� ������� ������� ���, �� sin(x) / x, �������,
# � ���� �� ����������

# 5. �������� �-� W(x),
# ��������� �� ������ �� [-10, 5]
W = function(x) {
  if (x >= 0) {
    return(x*x)
  } else {
    return(sin(2*x))
  }
}
sqnc5 = seq(-10, 5, .05)
plot(sqnc5, sapply(sqnc5, W), 'l')
