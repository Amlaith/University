# ����������� �����������. �������. ��������������� ����������.


# ����������� �����������.

# 1. ������ ������ 3-� - "�������!", ����� - "�����"
exam = sample(1:5, 1)
if (exam > 3) {
  print('�������!')
} else {
  print('�����')
}

# 2. ��� ������� ���� ���� 
coffee = c(Ann = 2, Alice = 3, Rowena = 1, Nick = 0)
resp = sample(c( "Ann", "Alice", "Rowena", "Nick", "Louis", "Carl", "Bob", "Lena"), 1)
if (resp %in% names(coffee)) {
  print(coffee[[resp]])
} else {
  print('No such respondent')
}

# 3. �������� ����� �� 1 �� 15
for (i in (1:15)) {
  cat('������� �����', i, '�����', i^2, end='\n')
}

# 4. ������� ����� c ��������������
mfiles = c("file01", "file_01", "file_02", "file03", "file05", "file_05", "file_09", "file10")
to.work = mfiles[grepl('_', mfiles)]


# �������

# 1. ������ ����� ����
bmi = function() {
  m = as.integer(readline('������� ��� � �����������:'))
  h = as.integer(readline('������� ���� � �����������:')) / 100

  return (round(m / (h^2)))
}
cat('������ ����� ����: ', bmi())

as.integer(readline('ll'))

# 2. ����������� �� �����
hello = function(){
  my_name = 'ivan'
  input_name = readline('May I have your name, please:')
  if (tolower(input_name) == my_name) {
    cat(input_name, ', welcome to R! I missed you', sep="")
  } else {
    print('Sorry, R is not available now')
  }
}
hello()


# ����������������� ����������

# 1. ���� ����� ��������� �� �����:
dat = c(c(12.5, 40, 45.5, 48),
        c(25, 45, 30.5, 47),
        c(37.5, 28, 30, 45))
# 1.1 ��������� ��� mean(dat)
mean(dat)
# 1.2 ��������� ��� sapply(dat, mean)
sapply(dat, mean)
# 1.3 ������
  # ������� mean(x) ����������� � ��������� ��������� x,
  # ����������� �� �������� �������� ������ �����������.
  # ������� sapply(x, f) ��������� ������� f
  # � ������� �������� x.

# 2. ��� ������ �����������:
kino = list(c(1, '��������� "�������"'),
            c(2, '��������� "������"'),
            c(3, '��������� "�������"'))
# �������� ������: ������ ������� �������
sapply(kino, (
  function(cinema)
    toupper(
      gsub( 
        "\"", "", unlist(
          strsplit(cinema[2], ' ')
          )[2]
        )
      )
    )
  )
