
#강승웅/20191202

# 문1) 
# >score
# m  f
# [1,] 10 21
# [2,] 40 60
# [3,] 60 70
# [4,] 20 30
# 
# 1. 위와 같은 내용의 matrix score를 생성
score <- matrix(c(10,40,60,20,21,60,70,30), nrow =4 , ncol=2) 
colnames(score) <- c('m','f')
score

# 2. score의 열 이름을 각각 male, female로 바꾸시오
colnames(score) <- c('male','female')
score

# 3. 2행에 있는 모든 값을 출력
score[2, ]

# 4. female의 모든 값을 출력
score[ ,'female']

# 5. 3행 2열의 값을 출력
score[ 3, 2 ]

# 문2)
# R에서 제공하는 state.x77 데이터셋을 이용하여 작성
data()

state.x77
# 1. state.x77을 변환하여 st에 data frame으로 작성
st <- data.frame(state.x77)
class(st)                   #확인절차

# 2. st의 내용을 출력
st

# 3. st의 열 이름 출력
colnames(st)

# 4. st의 행 이름 출력
rownames(st)

# 5. st의 행의 개수와 열의 개수 출력
dim(st)           #방법1

ncol(st)          #방법2
nrow(st)

# 6. st의 요약 정보 출력
str(st)
summary(st)

# 7. st의 행별 합계와 평균 출력
apply(st, 1, sum)     #방법1
apply(st, 1, mean)

rowSums(st)           #방법2
rowMeans(st)
# 8. st의 열별 합계와 평균 출력
apply(st, 2, sum)
apply(st, 2, mean)

# 9. Florida 주의 모든 정보 출력
st['Florida', ]

# 10. 50개 주의 수입(Income) 정보만 출력
st$Income        #방법1
st[ ,'Income']   #방법2     

# 11. Texas 주의 면적(Area)을 출력
st['Texas','Area']

# 12. Ohio 주의 인구(Population)와 수입(Income) 출력
st['Ohio',c('Population','Income')]

# 13. 인구가 5,000 이상인 주의 데이터만 출력
subset(st, Population >= 5000)

# 14. 수입이 4,500 이상인 주의 인구, 수입, 면적을 출력
A<- subset(st, Income >= 4500)
A[ ,c('Population','Income','Area')]

# 15. 수입이 4,500 이상인 주는 몇 개인지 출력
B<- dim(A)
B[1]

nrow(A)       #방법2

# 16. 전체 면적(Area)이 100,000 이상이고, 결빙일수(Frost)가 120 이상인 주의 정보 출력
subset(st, Area >= 100000 & Frost >= 120)

# 17. 인구(Population)가 2,000 미만이고, 범죄율(Murder)이 12미만인 주의 정보 출력
subset(st, Population < 2000 & Murder < 12)

# 18. 문맹률(Illiteracy)이 2.0 이상인 주의 평균 수입은 얼마인지 출력
C<- subset(st, Illiteracy >= 2.0)
mean(C[,'Income'])

# 19. 문맹률(Illiteracy)이 2.0 미만인 주와 2.0 이상인 주의 평균 수입의 차이 출력
C<- subset(st, Illiteracy >= 2.0)
D<- subset(st, Illiteracy < 2.0)
abs(mean(C[,'Income'])-mean(D[,'Income']))

# 20. 기대수명(Life Exp)이 가장 높은 주는 어디인지 출력
E<-st[ ,'Life.Exp']
max(E)



# 21 Pennsylvania 주보다 수입(Income)이 높은 주들 출력 
G<- st['Pennsylvania', 'Income']
rownames(subset(st, G < st$Income))

# 문3)
# R에서 제공하는 mtcars 데이터셋은 자동차 모델에 대한 제원 정보를 담고 있다.
# 
# 1. 이 데이터셋의 자료구조 출력
class(mtcars)

# 2. 이 데이터셋의 행의 개수와 열의 개수 출력
dim(mtcars)

# 3. 이 데이터셋 열들의 자료형 출력
str(mtcars)

# 4. 연비(mpg)가 가장 좋은 자동차 모델 출력
mt1<- max(mtcars[,'mpg'])
rownames(subset(mtcars , mpg ==mt1 ))                            

# 5. gear가 4인 자동차 모델 중 연비가 가장 낮은 모델 출력
head(mtcars)
I<- subset(mtcars, gear==4)
mt2 <- min(I$mpg)
rownames(subset(mtcars , mpg ==mt2 ))

# 6. Honda Civic의 연비(mpg)와 gear 수 출력
mt1 <- mtcars['Honda Civic', ]
mt1[,c('mpg','gear')]

# 7. Pontiac Firebird 보다 연비가 좋은 자동차 모델 출력
mt2 <-mtcars['Pontiac Firebird','mpg']
subset(mtcars,mt2<mtcars$mpg)

# 8. 자동차 모델들의 평균 연비 출력
mean(mtcars$mpg)

# 9. gear의 수 종류 출력
unique(mtcars$gear)


# 문4)
# R에서 제공하는 airquality 데이터셋은 일별로 대기의 질을 측정한 정보를 담고 있다.

air<- airquality
# 
# 1. 이 데이터셋의 자료구조 출력
class(air)
# 2. 이 데이터셋의 앞쪽 일부분 내용만 출력
head(air,10)

# 3. 기온(Temp)이 가장 높은 날은 언제인지 월(Month)과 일(Day) 출력
air1<- max(air$Temp)
air[rownames(subset(air,Temp==air1)),c('Month','Day')]

# 4. 6월달에 발생한 가장 강한 바람(Wind)의 세기 출력
air2<- subset(air,Month==6)
max(air2$Wind)

# 5. 7월 달의 평균 기온(Temp) 출력
air3 <- subset(air,Month==7)
mean(air3$Temp)

# 6. 오존(Ozone) 농도가 100을 넘는 날은 며칠이나 되는지 출력
air4<- dim(subset(air,Ozone>100))
air4[1]

# 문5)
# 1. R에서 제공하는 state.x77 데이터셋에서 수입(Income)이 5,000 이상인 주의 데이터에서
#수입(Income), 인구(Population), 면적(Area) 열의 값들만 추출하여 rich_state.csv에 저장
str(state.x77)
st1<- data.frame(state.x77)
str(st1)
st2<- subset(st1,Income>5000)
rich_state<- st2[,c('Income','Population','Area')]

setwd("D:/WorkR")
write.csv(rich_state,"rich_state.csv", row.names = T)


# 2. 1.에서 만든 rich_state.csv파일을 읽어서 ds 변수에 저장한 후 ds 내용 출력
setwd("D:/WorkR")
ds<- read.csv("rich_state.csv", header = T)
ds