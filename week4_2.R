#다중선형 회귀분석(multiple linear regression analysis)

#다중선행 회귀모델 : 여러개의 독립변수를 다루는 회귀모델

#회귀식
#y = B0 + B1X1 + B2X2 + B3X3 + ... +BnXn

#독립변수가 n개인 다중선형 회귀에서 주어진 자료를 이용해
#B0, B1, B2, B3,..., Bn의 값을 알아내는 회귀모델
library(tidyverse)
library(car)

str(Prestige)
head(Prestige)

newdata <- Prestige[ , c(1:4)]
head(newdata)
plot(newdata, pch=16, col= 'blue',
     main = 'Matrix Scatterplot')
# c<- data.frame(Prestige$education, Prestige$income, Prestige$women, Prestige$prestige)
# cor(c)

model <- lm(income~education + prestige + women, data = newdata)
model
coef(model)

#income = (-253.8) + (177.2*newdata$education) + 141.4*newdata$prestige) - (50.9*newdata$women)

fitted(model)
residuals(model)      
deviance(model)       #잔차
deviance(model) / length(newdata$education)   #평균 제곱 오차

summary(model)

newdata2 <- Prestige[ , c(1:5)]
model2 <- lm(income~., data=newdata2)             #'.'은 이하 모두 선택이란 뜻
summary(model2)

library(MASS)
model3 <- stepAIC(model2)

summary(model3)
summary(model2)


# Logistic Regression(로지스틱 회귀분석)
# 회귀모델에서 종속 변수의 값의 형태가 범주형인 경우
#   예측모델

# 주어진 data로붙 어떤 범주를 예측하는 분야를 회귀와 구분하여 분류(classification)이라고 한다.

# 로지스틱회귀도 기본적으로 회귀기법이기 때문에 종속변수는 숫자로 표현되어야 한다.
# 예) YES와 NO는 0과 1로 serosa, versicolor, virginica는 
# 1,2,3과 같이 숫자로 바꾼 후에 로지스틱 회귀 적용

iris.new <- iris
iris.new$Species <- as.integer(iris.new$Species)
head(iris.new)

iris_model <- glm(Species~., data=iris.new)
iris_model
coef(iris_model)
summary(iris_model)

unknown <- data.frame(rbind(c(5.1, 3.5, 1.4, 0.2)))
names(unknown) <- names(iris)[1:4]
unknown

pred <- predict(iris_model, unknown)
pred
round(pred, 0)

pred <- round(pred,0)
levels(iris$Species)[pred]

test <- iris[,1:4]

pred <- predict(iris_model, test)
pred <- round(pred,0)

answer <- as.integer(iris$Species)
pred == answer
acc <- mean(pred==answer)
acc

# plot(iris_model, pch=16, col= 'blue',
# main = 'Matrix Scatterplot')