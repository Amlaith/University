# Работа с датафреймами

# 1. Создать датафрейм из векторов
v1 = c(1, 2.5, "organic")
v2 = c(2, 1.5, "organic")
v3 = c(3, 0.9, "conventional")

test = data.frame(v1, v2, v3)

# 2. Транспонировать датафрейм
trans.test = data.frame(t(test))

# 3. Проверить типы столбцов
sapply(trans.test, typeof)
trans.test = transform(trans.test,
                       X1 = as.numeric(X1),
                       X2 = as.numeric(X2))
sapply(trans.test, typeof)

# 4. Загрузить данные из файла polit.csv
polit = read.csv('polit.csv')

# 5. Вывести структуру и описательные статистики
str(polit)
summary(polit)

# 6. Переименовать столбцы
names(polit) # "CNT"            "CPI.score.2019" "FH.score.2019" 
names(polit)[names(polit) == "CPI.score.2019"] = "CPI"
names(polit)[names(polit) == "FH.score.2019"] = "FH"
names(polit) # "CNT" "CPI" "FH" 

# 7. Загрузить данные из файла Orange.csv
# orange = read.csv("Orange.csv", sep=";")
orange = Orange

# 8. Создать папку test, поместить туда файлы.
#   Вывести их названия и число строк/столбцов.
dir.create('test')

files = list.files(pattern="file0[1-5].csv")
file.copy(files, 'test')

setwd('test')

for (file in files) {
  opened = read.csv(file)
  cat(file, dim(opened), end="\n")
}

# file01.csv 32 12 
# file02.csv 578 5 
# file03.csv 60 4 
# file04.csv 43 13 
# file05.csv 11 9