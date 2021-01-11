getwd()
setwd("C:/Users/Lenovo/OneDrive/Рабочий стол/S/M5")
getwd()
dat<-read.csv("C:/Users/Lenovo/OneDrive/Рабочий стол/S/M5/avocado.csv")
View(dat)
dat2<-read.csv("avocado2.csv", sep = ";")
dat2<-read.csv2("avocado2.csv")
dat3<-read.csv("avocado3.csv", sep =";", dec = ",")
str(dat3)
dat_cars <-read.table("cars.txt")
View(dat_cars)
dat_cars2 <-read.table("cars2.txt", header = TRUE)
View(dat_cars2)
dat_cars3 <-read.table("cars3.txt")
View(dat_cars3)
? read.table

install.packages("readxl")
library(readxl)


ex <- read_excel("C:/Users/Lenovo/OneDrive/Рабочий стол/S/M5/test.xlsx")
View(ex)
help ("read_excel")
mtcars

write.csv(mtcars, "mtcars.csv")
test1 <- read.csv("mtcars.csv")
View


write.csv2(mtcars, "mtcars2.csv")

dat <- cbind.data.frame(a = c(4, 6, 7), b = c(0,1,0))
View (dat)

data ()
class(mtcars)

AirPassengers
class(AirPassengers)
diff(AirPassengers, differences = 1)

plot(AirPassengers)

HairEyeColor
class(HairEyeColor)

dim(HairEyeColor)
margin.table(HairEyeColor, 2)

prop.table(HairEyeColor)*100

mycars <- mtcars
mycars
mycars [3,2]
mycars [3,2] <- 6
mycars [2, ]
mycars [ , 3]

mycars [2:4, ]
mycars [, 2:3]

mycars [c(2,5,8), ]
mycars [, c(2,4)]

t(mycars)

class(mycars)

avo <- read.csv("C:/Users/Lenovo/OneDrive/Рабочий стол/S/M5/avocado_new.csv")
str(avo)

summary(avo)

head(avo, 10)

tail(avo)
avo

avo <- na.omit(avo)

head(rownames(avo))


