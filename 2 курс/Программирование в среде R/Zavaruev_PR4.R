# ������� �������� � ������

# 1. ���������� � ������� �� ����� ������ a,
# ���������� 50 ���������� ���������, ������ 3.
a = rep(3, 50)
print(a)

# 2. ���������� � ������� �� ����� ������ b,
# ���������� 100 ��������� 1,2,..,100.
b = 1:100
print(b)

# 3. ���������� ���������� ������� A, ��������� ��
# ������������������ ����� 1,2,�,16, ������� ��������� �������
# a) �� ��������;
A <- matrix(1:16, 16, 16)
print(A)
# b) �� �������.
A <- matrix(1:16, 16, 16, byrow = T)
print(A)

# 4. ������ ���������� ���������� 1�3 � �������
# MS Excel � ������ ������.

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

# 5. ���������� � ������� �� ����� ������� ������� ��������� G
# ������� (10x10), �������� ������� ����� �����
# ��������������� ������ � �������: G(i, j)=i+j;
G = array(0, dim = c(10, 10))
for (i in 1:10) {
  for (j in 1:10) {
    G[i, j] = i + j  
  }
}
print(G)

# 6. ���������� � R ��������� ������� ������� (40x40)
# � ��������� �� ����� ����� ������ � excel-�������
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

