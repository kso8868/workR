# * 실습 결과를 R Script file로 제출
# * R Script file 이름은 "영문본인이름_제출일날짜.R" 부여하여 제출
# * R Script file의 처음에 주석으로 본인 이름과 작성일/제출일 기록

# 강승웅/20191217/20191217

# 
# 문1)
# trees 데이터셋에 대해 다음의 문제를 해결하는 R 코드를 작성하시오.
# 
# (1) 나무 둘레(Girth)와 나무의 키(Height)로 나무의 볼륨을 예측하는 다중선형 회귀
# 모델을 만드시오.
head(trees)
str(trees)
model1 <- lm(Volume ~ . , data = trees)
model1
#Volume = (-57.9877) + (4.7082*trees$Girth) + (0.3393*trees$Height)


# (2) 다중선형 회귀모델을 이용하여 trees 데이터셋의 나무 둘레(Girth)와 나무의 키
# (Height)로 나무의 볼륨을 예측하시오.

predict(model1)
 
# (3) (2)에서 예측한 볼륨과 실제 trees 데이터셋의 볼륨(Volume)이 얼마나 차이가
# 나는지 보이시오. (예측값, 실제값, 예측값-실제값을 나타낸다.)
fitted(model1)
residuals(model1)
deviance(model1)

# 문2)
# mtcars 데이터셋에서 다른 변수들을 이용하여 연비(mpg)를 예측하는 다중 회귀모델을 만드시오.
head(mtcars)
str(mtcars)

# (1) 전체 변수를 이용하여 연비(mpg)를 예측하는 회귀모델을 만들고 회귀식을 나타
# 내시오.
model_mt <- lm(mpg ~ . , data = mtcars)
model_mt

#mpg = (12.30337) + (-0.11144*mtcars$cyl) + (0.01334*mtcars$disp) + (-0.02148*mtcars$hp)+ (0.78711*mtcars$drat)
# + (-3.71530*mtcars$wt) + (0.82104*mtcars$qsec) + (0.31776*mtcars$vs) + (2.52023*mtcars$am) 
# + (0.65541*mtcars$gear) + (-0.19942*mtcars$carb)


# 
# (2) 연비(mpg)를 예측하는 데 도움이 되는 변수들만 사용하여 예측하는 회귀모델을
# 만들고 회귀식을 나타내시오.
model_mt1 <- stepAIC(model.mt)
model_mt1
#mpg = (9.618) + (-3.917*mtcars$wt) + (1.226*mtcars$qsec) + (2.936*mtcars$am)


# (3) (1), (2)에서 만든 예측모델의 설명력(Adjusted R-squared)을 비교하시오.
summary(model_mt)
summary(model_mt1)

# model_mt1(Adjusted R-squared:  0.8336)의 설명력이 model_mt(Adjusted R-squared:  0.8066)보다 좋다.

# 
# 문3) 
# UCLA 대학원의 입학 데이터를 불러와서 mydata에 저장한 후 다음 물음에 답하시오.

mydata <- read.csv( "https://stats.idre.ucla.edu/stat/data/binary.csv" )
head(mydata)
str(mydata)

# (1) gre, gpa, rank를 이용해 합격 여부(admit)를 예측하는 로지스틱 모델을 만드시오(0: 불합격, 1:합격).
mydata_model <- glm(admit~., data = mydata)
mydata_model
#admit = (-0.1824127) + (0.0004424*mydata$gre) + (0.1510402*mydata$gpa) + (-0.1095019*mydata$rank)

# (2) mydata에서 합격 여부(admit)를 제외한 데이터를 예측 대상 데이터로 하여 (1)에서 만든 모델에 입력하여 
# 합격 여부를 예측하고 실제값과 예측값을 나타내시오.
pred <-predict(mydata_model, mydata[,2:4])
pred
pred<- round(pred, 0)
pred

A <- mydata$admit
A
head(pred,20)

# (3) 만들어진 모델의 예측 정확도를 나타내시오.
ass <- mean(pred == A)
ass
