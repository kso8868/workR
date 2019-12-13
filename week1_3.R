# Matrix 생성

z <- matrix(1:20, nrow = 4)
z

z <- matrix(1:20, ncol = 4)
z

z <- matrix(1: 20, nrow =4 , ncol=5)
z

# =>열 우선 방식 : 열을 먼저 채움(default값)


z <- matrix(1:20, nrow = 4, ncol = 5, byrow = T)
z

# => 행 우선 방식


# 벡터로 maxtrix 만들기
x <- 1:4
x

y <- 5:8
y

z <- matrix(1:20, nrow =4 , ncol = 5)
z

#x,y가 변수(column)가 됨
ml <- cbind(x, y)
m1

#x,y가 관측치(row)가 됨
m2 <- rbind(x, y)
m2

m3<- rbind(m2, x)
m3

m4 <- cbind(z ,x)
m4



# Maxtrix에서 cell의 값 추출출
z[ 2, 3]
z[ 1,4]
z[2,]
z[,4]

z[2,1:3]
z[1,c(1,2,4)]
z[1:2,]
z[, c(1,4)]
z[17]


# matrix에서 행/열에 이름 지9정
 score <- matrix( c(90,85, 69, 78,
                    85, 96 ,49, 95,
                    90, 80, 70, 70),
                  nrow = 4, ncol = 3)
score
rownames(score) <- c("Hong",'Kim',"Lee","Yoo")
colnames(score) <- c("English",'Math',"Science")
score

score['Hong','Math']
score['Kim', c('Math',"Science")]
score['Lee',]
score[,'English']
rownames(score)
colnames(score)
colnames(score)[2]

#Data Frame 생성

city <- c( "Seoul","Tokyo",'washington')
rank <- c(1,3,2)
city_info <- data.frame(city, rank)
city_info

name <- c("Hong","Kim","Lee")
age <- c(22,20,25)
gender <- factor(c("M","F","M"))
blood_type <- factor(c("A","O","B"))
person_info <- data.frame(name, age, gender, blood_type)
person_info

person2_info <- data.frame(name = c("Hong","Kim","Lee"),
                           age =c(22,20,25),
                           gender =factor(c("M","F","M")),
                           blood_type = factor(c("A","O","B")))
person2_info

city_info
city_info[1,1]
city_info[1,]
city_info[,1]
city_info[city_info$city,]
city_info[,"rank"]
person_info
person_info$name
person_info[person_info$name == "Hong",]
person_info[person_info$name == "Hong", c("name","age")]

data()

iris

iris[,c(1:2)]
iris[,c(1,3,5)]
iris[,c("Sepal.Length","Species")]
iris[1:5,]
iris[1:5,c(1,3)]


#Matrix와 Data Frame에서 사용하는 함수
person_info

dim( person_info)               #
nrow(person_info)
m3
nrow(m3)
ncol(person_info)
ncol(m3)
head(iris)                      #
tail(iris)                      # 
str(iris)                       # 요약
iris[,5]
unique(iris[,5])
table(iris[,"Species"])         # 종류별 카운트
#-> 자주 사용하는 함수
dim(iris)
person_info
table(person_info[,"blood_type"])
table(person_info[,"gender"])




#Matrix / Data Frame 사용 함수
#행별/ 열별 합계와 평균 계산

colSums(iris[, -5])  #5번 컬럼을 제외하고 합산(factor형) 
apply(iris[, 1:4], 2, sum)   #2번째 인수 1:row / 2:column   #3번째인수 : 동작 

colMeans(iris[,-5])
apply(iris[, 1:4], 2, mean)

rowSums(iris[,-5])
apply(iris[, -5], 1, sum)

rowMeans(iris[,-5])
apply(iris[, -5], 1, mean)

apply(iris[,-5],2,median) #중앙값





#행/열 방향 전환
z<- matrix(1:20, nrow = 4, ncol = 5)
z
t(z)


#조건에 맞는 행과 열의 값추출(Data Frame만 가능)
IR_1 <- subset(iris , Species == "setosa")
IR_1

IR_2 <- subset(iris, Sepal.Length > 5.0 & Sepal.Width > 4.0)
IR_2
IR_2[,c(2,4)]


# Matrix/Data Frame 산술연산
a <- matrix(1:20, 4, 5)
a

b <- matrix(21:40, 4, 5)
b

2 * a
b - 5
2*a + 3*b

a+b
b-a
b/a
a*b


# Matrix/DataFrame 자료구조 확인/변환

class(iris)
str(iris)
class(state.x77)
str(state.x77)
is.matrix(iris)
is.data.frame(iris)
is.matrix(state.x77)
is.data.frame(state.x77)

st <- data.frame(state.x77)
str(st)
head(st)
class(st)
dim(st)
iris.m <- as.matrix(iris[,1:4])  #형변환 -> iris데이터의 1:4열을 matrix로 변환 
head(iris.m)
class(iris.m)
str(iris.m)


head(st)
Population
Area
attach(st)      #변수 이름을 벡터로 직접쓸 수 있음
Population
Area
detach(st)      #취소
Population      



# csv 내용 읽기
setwd("D:/WorkR") #경로변경 함수 ( 현재 디렉토리와 일치하면 할 필요 없음)
air <- read.csv("airquality.csv", header = T)
class(air)
str(air)
head(air)
tail(air)
dim(air)


name <- c("Hong","Kim","Lee")
age <- c(22,20,25)
gender <- factor(c("M","F","M"))
blood_type <- factor(c("A","O","B"))
person_info <- data.frame(name, age, gender, blood_type)
person_info

setwd("D:/WorkR")
write.csv(person_info,"person_info.csv", row.names = F)



