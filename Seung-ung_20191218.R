# * 실습 결과를 R Script file로 제출
# * R Script file 이름은 "영문본인이름_제출일날짜.R" 부여하여 제출
# * R Script file의 처음에 주석으로 본인 이름과 작성일/제출일 기록
# 
# 강승웅/20191218/20191218

# 문1)
# R에서 제공하는 state.x77 데이터셋에 대해 k-평균 군집화를 실시하고 결과를 그래프로 출력하시오.
st <- data.frame(state.x77)
str(st)
# • 군집의 수는 5로 한다.
# • state.x77은 각 변수(열)의 값들의 단위의 차이가 많이 나기 때문에 0~1 표준화를 실시한 후 군집화를 실행한다.
std <- function(x){
  return((x-min(x)) / (max(x)-min(x)) )
}
mydata <- apply(st, 2, std)
fit <- kmeans(x=mydata, centers = 5)
fit

library(cluster)            #차원축소 후 군집 시각화 패키지
clusplot(st,            # 군집대상
         fit$cluster,       # 군집번호
         color=T,           # 원의 색
         shade = T,         # 원의 빗금표시 유무
         labels=1,          # 관측값 출력 형태
         lines=0)           # 중심선 연결 표시
subset(st, fit$cluster==2)



# 문2)
# mlbench 패키지에서 제공하는 Sonar 데이터셋에 대해 k-평균 군집화를 실시하고 결과를 그래프로 출력하시오.
library(mlbench)
# • 군집의 수는 2로 한다.
# • Sonar 데이터셋에서 마지막에 있는 Class 열은 제외하고 군집화를 실행한다.
 
library( mlbench )
data( "Sonar" ) 			# 데이터셋 불러오기
Sonar

std <- function(x){
  return((x-min(x)) / (max(x)-min(x)) )
}
mydata <- apply(Sonar[ , 1:60], 2, std)
Sonar1<- kmeans(x=mydata, centers = 2)
Sonar1

clusplot(Sonar,            # 군집대상
         Sonar1$cluster,       # 군집번호
         color=T,           # 원의 색
         shade = T,         # 원의 빗금표시 유무
         labels=1,          # 관측값 출력 형태
         lines=0)           # 중심선 연결 표시

# 문3) 
# mlbench 패키지에서 제공하는 Sonar 데이터셋에 대해 k-최근접 이웃 알고리즘을 이용하여 모델을 만들고 예측 정확도를 측정하시오.
# 
# . Sonar 데이터셋에서 마지막에 있는 Class 열이 그룹 정보이다.
# . Sonar 데이터셋에서 홀수 번째 데이터(관측값)를 훈련용 데이터로 하고, 짝수번째 데이터(관측값)를 테스트용 데이터로 한다.
# . k-최근접 이웃에서 k를 3, 5, 7로 다르게 하여 예측 정확도를 비교한다.
library(class)
so<- Sonar

zz <- as.integer(rownames(so))

b <- subset(zz, zz %% 2 != 0)
b
dim(b)



ds.tr <- so[b, -61]                   #훈련용
ds.ts <- so[-b, -61]                    #테스트용
cl.tr <- factor(so[b, 61])                #훈련용 그룹정보
cl.ts <- factor(so[-b, 61])               #테스트용 그룹정보
pred <- knn(ds.tr, ds.ts, cl.tr, k=3, prob = T)
pred
acc <- mean(pred==cl.ts)
acc

pred <- knn(ds.tr, ds.ts, cl.tr, k=5, prob = T)
pred
acc <- mean(pred==cl.ts)
acc

pred <- knn(ds.tr, ds.ts, cl.tr, k=7, prob = T)
pred
acc <- mean(pred==cl.ts)
acc

# 문4) 
# mlbench 패키지에서 제공하는 Sonar 데이터셋에 대해 k-최근접 이웃 알고리즘을 이용하여 모델을 만들고 예측 정확도를 측정하시오.
# 
# . Sonar 데이터셋에서 마지막에 있는 Class 열이 그룹 정보이다.
# . k-최근접 이웃에서 k는 3으로 한다.
# . 5-fold 교차 검증 방법으로 예측 정확도를 측정한다.

library(cvTools)

k = 3
folds <-cvFolds(nrow(Sonar), K=k)

acc <- c()
for (i in 1:k) {
  ts.idx <- folds$which == i
  ds.tr <- so[b, -61]
  ds.ts <- so[-b, -61]
  cl.tr <- factor(so[b, 61])
  cl.ts <- factor(so[-b, 61])
  pred <- knn(ds.tr, ds.ts, cl.tr, k =3)
  acc[i] <- mean(pred == cl.ts)             #예측 정확도
}
acc                                         #폴드별 예측 정확도
mean(acc)                                   #폴드평균 예측 정확도