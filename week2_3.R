#
# 2주3일차
#
#결측치 처리

#vector의 결측치 처리
z <- c(1,2,3,NA,5,NA,8)
sum(z)
is.na(z)              #항상 논리 값으로 나온다. 
sum(is.na(z))         #결측치의 수를 구해준다.
sum(z, na.rm = T)

#결측치 대체 및 제거
z1 <- z
z2 <- c(5,8,1,NA,3,NA,7)
    
    #단순대입법(적당한 값을 넣는다)
z1[is.na(z1)] <- 0                      
z1
    #Listwise delection(데이터 행 자체를 지우는 방식)
z3 <- as.vector(na.omit(z2))                              #결측치가 포함된 데이터를 삭제
z3

#Matrix / Data Frame 결측치 처리
x <- iris
x[1,2] <- NA
x[1,3] <- NA
x[2,3] <- NA
x[3,4] <- NA
head(x)

#Matrix/ Data Frame 열 별 결측치 확인
#for문 이용
x
for (i in 1:ncol(x)) {
  this.na <- is.na(x[,i])
  cat(colnames(x)[i],
      "\t", sum(this.na),
      "\n")
}

#apply()이용
col_na <- function(y){
  return(sum(is.na(y)))
}
na_count <- apply(x,2,col_na)
na_count

na_count <- apply(x,2,
    function(y)sum(is.na(y)))
na_count

barplot(na_count[na_count>0])





#install.packages("VIM")                      ##VIM패키지 (시각화 패키지)##
require(VIM)

#결측치 자료 조합 확인용 시각화 도구
aggr(x, prop=F,numbers=T)

#두개의 변수간의 결측치 관계 확인 시각화 도구 (결측치가 변수간 관계가 있나 확인)
marginplot(x[c("Sepal.Width", "Sepal.Length")],
           pch=20,
           col=c("darkgray","red","blue"))

#Matrix/ Data Frame의 행(data )별 결측치 확인
rowSums(is.na(x))
sum(rowSums(is.na(x))>0)

sum(is.na(x))

#결측치를 제외한 새로운 데이터셋 생성
head(x)
x[!complete.cases(x),]        #NA가 포함된 행출력
y <- x[complete.cases(x),]    #listwise 방식
head(y)

#특이값, 이상치(oulier)
st <- data.frame(state.x77)
summary(st$Income)
boxplot(st$Income)
boxplot.stats(st$Income)$out
head(st)

#특이값 처리
st

out.val <- boxplot.stats(st$Income)$out
st$Income[st$Income %in% out.val] <- NA             # %in%  A   : "A가 포함되어 있다면"
head(st)
newdata <- st[complete.cases(st),]
head(newdata)

#데이터 가공 & 데이터 정렬

#Vector정렬
v1 <- c(1,7,6,8,4,2,3)
order(v1)
v1 <- sort(v1)
v1
v2 <- sort(v1,decreasing = T)
v2

#Matrix/Data Frame 정렬
head(iris)
order(iris$Sepal.Length)
iris[order(iris$Sepal.Length), ]                 #ascending
iris[order(iris$Sepal.Length, decreasing=T), ]    #decreasing
iris.new <- iris[order(iris$Sepal.Length),]
head(iris.new)
iris[order(iris$Species,decreasing = T,
           iris$Sepal.Length), ]                  #정렬기준을 2개 설정

#데이터 분리
sp <- split(iris, iris$Species)
sp
summary(sp)
summary(sp$setosa)
sp$setosa

#데이터 선택
subset(iris, Species=="setosa")
subset(iris, Sepal.Length>7.5)
subset(iris, Sepal.Length>5.1&Sepal.Width>3.9)
subset(iris, Sepal.Length>7.6,
       select = c(Petal.Length,Petal.Width))


#데이터 sampling

#숫자를 임의로 추출(Vector)

x <- 1:100
y <- sample(x,size=10,replace=F)        #비복원추출
y

#행을 임의로 추출
idx <- sample(1:nrow(iris),size = 50,replace = F)
idx
iris.50 <- iris[idx, ]
dim(iris.50)
head(iris.50)


sample(1:20,size = 5)
sample(1:20,size = 5)
sample(1:20,size = 5)

set.seed(100)
sample(1:20,size = 5)
set.seed(100)
sample(1:20,size = 5)
set.seed(100)
sample(1:20,size = 5)

#데이터 조합
combn(1:5,3)

x=c("red", "green", "blue", "black", "white")
com <- combn(x,2)
com

for (i in 1:ncol(com)) {
  cat(com[,i],"\n")
}

#데이터 집계
agg <- aggregate(iris[,-5],
                 by=list(iris$Species),
                 FUN=mean)
agg

agg <- aggregate(iris[,-5],
                 by=list(iris$Species),
                 FUN=sd)
agg

head(mtcars)
agg <- aggregate(mtcars,
                 by=list(cyl=mtcars$cyl,vs=mtcars$vs),
                 FUN=max)
agg

#데이터 병합
x <- data.frame(name=c("a","b","c"),
                mat=c(90,80,40))
x
y <- data.frame(name=c("a","b","d"),
                korean=c(75,60,90))
y
z <- merge(x,y,by=c("name"))
z

merge(x,y)
merge(x,y,all.x=T)
merge(x,y,all.y=T)
merge(x,y,all=T)

x <- data.frame(name=c("a","b","c"),
                mat=c(90,80,40))
y <- data.frame(sname=c("a","b","d"),
                korean=c(75,60,90))

merge(x,y,by.x = c("name"),
      by.y = c("sname"))


#dplyr package


#install.packages("dplyr")              ##dplyr패키지 (파이프 연산자 패키지)##
library(dplyr)

# %>% : pipe 연산자 (왼쪽 컨트롤+쉬프트+m)

df <-  data.frame(var1=c(1,2,1),
                  var2=c(2,3,2))
df

#rename() : 이름변경
df <- rename(df, v1=var1, v2=var2)
df

#파생변수 추가
df$sum <- df$v1 + df$v2
df

df[2,1] <- 5
df

df <- data.frame(id=c(1,2,3,4,5,6),
                 class=c(1,1,1,1,2,2),
                 math=c(50,60,45,30,25,50),
                 english=c(98,97,86,98,80,89),
                 science=c(50,60,78,58,65,98))
df

#filter() : 행 추출
df %>% filter(class==1)
df %>% filter(class==2)
df %>% filter(!class==1)
df %>% filter(!class==2)

df %>% filter(science >70)
df %>% filter(math<50)

df %>% filter(class==1 & math<=50)
df %>% filter(math>=50 |english >=90)
df %>% filter(class %in% c(1,3,5) )               # %in%  A   : "A가 포함되어 있다면"

  class1 <- df %>% filter(class==1)
  class2 <- df %>% filter(class==2)
  class1 
  class2
  
#select() : 변수 추출
df %>% select(math)
df %>% select(science)

df %>% select(class,math, science)

df %>% select(-math)

#dplyr 함수 조합
df %>% 
  filter(class==1) %>% 
  select(science)

df %>% 
  select(id, science) %>% 
  head()

df %>% 
  select(id, science) %>% 
  sum()

df %>% 
  select(id, science) %>% 
  max()

#arrange():정렬
df %>% arrange(science)
df %>% arrange(desc(science))

#mutate(): 파생변수 추가
df %>% 
  mutate(total=math+english+science) %>% 
  head

df %>% 
  mutate(total=math+english+science,
         average=(math+english+science)/3) %>% 
  head

df %>% 
  mutate(grade=ifelse(science>=60,'pass', 'fail')) %>% 
  head

df %>% 
  mutate(total=math+english+science,
         average=(math+english+science)/3) %>% 
  mutate(grade=ifelse(average>=90, 'pass',
                      ifelse(average<60,'fail',
                             'normal'))) %>% 
  head

df.sort <- df %>% 
  mutate(total=math+english+science,
         average=(math+english+science)/3) %>% 
  arrange(desc(average))
df.sort

#summarise() : 집단별 요약
#group_by() : 집단별 나누기
df %>% summarise(mean_math =mean(math))

df %>% 
  group_by(class) %>% 
  summarise(mean_math=mean(math),
            mean_english=mean(english),
            mean_science=mean(science),
            n=n())

#install.packages("ggplot2")            ##ggplot2패키지 (자료 패키지)##
library(ggplot2)
str(ggplot2::mpg)                       #( ggplot::mpg ) 라이브러리 안치고 열기 가능 
mpg <- data.frame(ggplot2::mpg)
dim(mpg)
str(mpg)
head(mpg)
View(mpg)

mpg %>%
  group_by(manufacturer, drv) %>% 
  summarise(mean_cty=mean(cty)) %>% 
  head(10)

mpg %>%
  group_by(manufacturer) %>% 
  filter(class=='suv') %>% 
  mutate(tot=(cty+hwy)/2) %>% 
  summarise(mean_tot=mean(tot)) %>%
  arrange(desc(mean_tot)) %>% 
  head(5)

#데이티 합치기
#left_join() : 가로로 합치기(변수 추가)
#inner_join() : 가로로 합치기(변수 추가)
#full_join() :가로로 합치기기(변수 추가)
#bind_row() :세로로 합치기(데이터 추가)
df1 <- data.frame(id=c(1,2,3,4,5),
                  midterm=c(60,80,70,90,85))
df2 <- data.frame(id=c(1,2,3,4,5),
                  final=c(60,80,70,90,85))
total <- left_join(df1,df2,by="id")
total

df1 <- data.frame(id=c(1,2,3),
                  address=c("서울", "부산", "제주"),
                  stringFactots=F)
df1

df2 <- data.frame(id=c(1,2,4),
                  gender= c("남","여","남"))
df2

#데이터 합치기 실습
df_left <- left_join(df1,df2,by='id')
df_left
df_inner <-  inner_join(df1,df2, by='id')
df_inner
df_full <- full_join(df1,df2,by='id')
df_full

df1 <- data.frame(id=c(1,2,3,4,5),
                  test=c(60,80,70,90,85))
df2 <- data.frame(id=c(1,2,3,4,5),
                  test=c(60,80,70,90,85))
df_all <-bind_rows(df1,df2) 
df_all

#install.packages("psych")              ##psych패키지 (describe 함수 패키지)##
library(psych)

summary(mtcars)
describe(mtcars)

#install.packages("descr")             ##descr패키지 (freq 함수 있는 패키지)##
library(descr)

df <- data.frame(id=c(1,2,4),
                  gender= c("남","여","남"))
table(df$gender)

freq(df$gender)
freq(df$gender, plot=F)     #plot=F 막대그래프는 안그림