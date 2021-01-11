# Управляющие конструкции. Функции. Векторизованные вычисления.


# Управляющие конструкции.

# 1. Оценка больше 3-х - "Молодец!", иначе - "Плохо"
exam = sample(1:5, 1)
if (exam > 3) {
  print('Молодец!')
} else {
  print('Плохо')
}

# 2. Кто сколько пьет кофе 
coffee = c(Ann = 2, Alice = 3, Rowena = 1, Nick = 0)
resp = sample(c( "Ann", "Alice", "Rowena", "Nick", "Louis", "Carl", "Bob", "Lena"), 1)
if (resp %in% names(coffee)) {
  print(coffee[[resp]])
} else {
  print('No such respondent')
}

# 3. Квадраты чисел от 1 до 15
for (i in (1:15)) {
  cat('Квадрат числа', i, 'равен', i^2, end='\n')
}

# 4. Выбрать файлы c подчеркиванием
mfiles = c("file01", "file_01", "file_02", "file03", "file05", "file_05", "file_09", "file10")
to.work = mfiles[grepl('_', mfiles)]


# Функции

# 1. Индекс массы тела
bmi = function() {
  m = as.integer(readline('Введите вес в килограммах:'))
  h = as.integer(readline('Введите рост в сантиметрах:')) / 100

  return (round(m / (h^2)))
}
cat('Индекс массы тела: ', bmi())

as.integer(readline('ll'))

# 2. Приветствие по имени
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


# Векторизированные вычисления

# 1. Даны баллы студентов за тесты:
dat = c(c(12.5, 40, 45.5, 48),
        c(25, 45, 30.5, 47),
        c(37.5, 28, 30, 45))
# 1.1 Запустите код mean(dat)
mean(dat)
# 1.2 Запустите код sapply(dat, mean)
sapply(dat, mean)
# 1.3 Выводы
  # Функция mean(x) применяется к множеству элементов x,
  # находящихся на наиболее глубоком уровне вложенности.
  # Функция sapply(x, f) применяет функцию f
  # к каждому элементу x.

# 2. Дан список кинотеатров:
kino = list(c(1, 'кинотеатр "Октябрь"'),
            c(2, 'кинотеатр "Пионер"'),
            c(3, 'кинотеатр "Балтика"'))
# Получить вектор: ПИОНЕР ОКТЯБРЬ БАЛТИКА
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
