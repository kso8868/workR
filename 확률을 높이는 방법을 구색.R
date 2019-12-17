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
