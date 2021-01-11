users.before <- 125
user.after <- 138

user.after>users.before
user.after -users.before >=10
user.after -users.before == 0
user.after -users.before != 0

user.after > users.before & user.after < 150

users.before > user.after | users.before >=100

# xor()
xor (users.before > user.after, users.before>=100)

temps <- c(17, 20, 21, 24, 18, 16, 14)

mt <- mean(temps)
mt
 temps > mt
sum(temps > mt) 

length((temps[temps > mt]))

st1 <- c(4,5,5,4)
st2 <- c(4,3,4,5)

st1 == st2

cities <- c("Мурманск", "Киров", "Пермь")
to.check <- c("Омск", "Москва", "Киров", "Калиниград", "Пермь")

for (i in to.check) {
  if (i %in% cities) {
    print ("No need to add")
  } else {
    cities <- c(cities, i)
  }
  
}
cities

err <- 0.1
while (err >=0.05) {
  print ("model trainning")
  err <- err -0.0005
  print(err)
}

### function

round(4.6)
fraud <- function(v){
  n <- length(v[v %% 5 == 0])
  print ("Cheking...")
  return(n)
}
fraud(c(4, 5, 15, 6, 17, 24, 10))


my.test <- function(x,y){
  res1 <- x**y
  res2 <- y**x
  return(c(res1, res2))
}
my.test(2,4)
my.test (3,4)

#### v

round (c(2.4, 6.7, 8.1))
income <- list(c(30,55,45), c(40, 25,30))
max(income)

lapply(income, max)
sapply(income, max)

v <- c("www.champ.info/apples ", "www.champ.info/blue_screen ", "www.champ.info/code_monsters")

strsplit(v, "/")

strsplit(v[2], "/")[[1]][2]

res1<-trimws(strsplit(v[2], "/")[[1]][2])

strsplit(res1, "_")
res2 <- unlist (strsplit(res1, "_"))

res3 <- paste(res2, collapse = " ")

final<-tools::toTitleCase(res3)
my_trans <- function(s) {
  res1<-trimws(strsplit(v[2], "/")[[1]][2])
  res2 <- unlist (strsplit(res1, "_"))
  res3 <- paste(res2, collapse = " ")
  final<-tools::toTitleCase(res3)
  
}
teams <- sapply(v, my_trans)
unname(teams)

