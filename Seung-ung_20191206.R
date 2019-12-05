#자료(DATA) 정제 / 전처리
library(rJava)
library(xlsx)
library(dplyr)
setwd("c:/workR/homeworkData")
grdp <- read.xlsx(file="도시별성장률.xlsx",sheetIndex=1, encoding="UTF-8", header=T)
grdp
str(grdp)
View(grdp)
year <- c(2011:2017)
grdp1<- grdp[,2:8]

# plot(year, grdp1[18,], main='도시별 성장률',
#      type='l', lty=1, lwd=1,
#      xlab='연도', ylab="성장률",col="red")
# lines(year, grdp1[1,], type = "l", lty=1, lwd=1, col="blue")
# lines(year, grdp1[2,], type = "l", lty=1, lwd=1, col="blue")
# lines(year, grdp1[3,], type = "l", lty=1, lwd=1, col="blue")
# lines(year, grdp1[4,], type = "l", lty=1, lwd=1, col="blue")
# lines(year, grdp1[5,], type = "l", lty=1, lwd=1, col="blue")
# lines(year, grdp1[6,], type = "l", lty=1, lwd=1, col="blue")
# lines(year, grdp1[7,], type = "l", lty=1, lwd=1, col="blue")
# lines(year, grdp1[8,], type = "l", lty=1, lwd=1, col="blue")
# lines(year, grdp1[9,], type = "l", lty=1, lwd=1, col="blue")
# lines(year, grdp1[10,], type = "l", lty=1, lwd=1, col="blue")
# lines(year, grdp1[11,], type = "l", lty=1, lwd=1, col="blue")
# lines(year, grdp1[12,], type = "l", lty=1, lwd=1, col="blue")
# lines(year, grdp1[13,], type = "l", lty=1, lwd=1, col="blue")
# lines(year, grdp1[14,], type = "l", lty=1, lwd=1, col="blue")
# lines(year, grdp1[15,], type = "l", lty=1, lwd=1, col="blue")
# lines(year, grdp1[16,], type = "l", lty=1, lwd=1, col="blue")
# lines(year, grdp1[17,], type = "l", lty=1, lwd=1, col="blue")
plot(year, grdp1[18,], main='GRDP(%,제주 RED)',
           type='l', lty=1, lwd=3,
           xlab='연도', ylab="성장률",col="red")

lines(year, grdp1[1,], type = "l", lty=1, lwd=3, col="blue") #전국
lines(year, grdp1[2,], type = "l", lty=1, lwd=2, col="green") #서울
lines(year, grdp1[3,], type = "l", lty=1, lwd=2, col="black") #부산
lines(year, grdp1[4,], type = "l", lty=1, lwd=2, col="navy") #대구
lines(year, grdp1[5,], type = "l", lty=1, lwd=2, col="violet") #인천

barplot(grdp1$X2012,main ='2012 GRDP 성장률',xlab = "성장률%", ylab = "도시")

par(mfrow=c(2,3))              #1x3가상화면 분할

barplot(grdp1$X2012,main ='2012 GRDP 성장률',xlab = "성장률%", ylab = "도시")
barplot(grdp1$X2013,main ='2013 GRDP 성장률',xlab = "성장률%", ylab = "도시")
barplot(grdp1$X2014,main ='2014 GRDP 성장률',xlab = "성장률%", ylab = "도시")
barplot(grdp1$X2015,main ='2015 GRDP 성장률',xlab = "성장률%", ylab = "도시")
barplot(grdp1$X2016,main ='2016 GRDP 성장률',xlab = "성장률%", ylab = "도시")
barplot(grdp1$X2017,main ='2017 GRDP 성장률',xlab = "성장률%", ylab = "도시")

par(mfrow=c(1,1))               #가상화면 분할 해제



setwd("c:/workR/homeworkData")
invest<- read.xlsx(file="산업통상자원부_지자체별외국인투자현황.xlsx",sheetIndex=1,encoding="UTF-8", header=T)
invest
str(invest)
View(invest)
  in1 <- invest[50:56,]                #2011년 전의 데이터 제거, 2018년 데이터 제거(반기 수치임)
  in1
View(in1)
  in1_j <- in1$제주_신고금액+in1$제주_도착금액      #각 년도에 금액을 모두 더해서 사용함
  in1_j
  
  in1_b <- in1$부산_신고금액+in1$부산_도착금액
  in1_b
  
  in1_d <- in1$대구_신고금액+in1$대구_도착금액
  in1_d
  
  in1_I <- in1$인천_신고금액+in1$인천_도착금액
  in1_I
  
plot(year, in1_j, main='지자체별외국인투자현황(단위:백만달러)',
     type='b', lty=1, lwd=2,
     xlab='연도', ylab="금액",col="red")  #제주
lines(year, in1_b, type = "b", lty=1, lwd=2, col="black") #부산
lines(year, in1_d, type = "b", lty=1, lwd=2, col="navy")  #대구
lines(year, in1_I, type = "b", lty=1, lwd=2, col="violet") #인천

year <- c(2011:2017)
지역GDP <- c(12207092, 13193136, 13960947, 15147843, 
           16946709, 18719373, 19981072 ) #백만원
소비자물가지수 <- c(95.76, 96.93, 98.27, 99.37, 100.00, 101.29, 103.62 )
농가인구 <- c(114062, 113298, 11174, 109510, 93404, 88385, 86463 )  # 명
농가소득 <- c(11266, 12005, 10037, 9001, 7713, 8198, 13302 )    #단위: 천원

감귤생산량 <- c(588054, 668610, 672267, 696762, 635032, 599642, 576722 )
수출금액 <- c(99735, 107942, 103285, 106415, 121068, 128994, 155362 )
사업체수 <- c(47144, 49252, 51727, 53897, 55155, 57791, 60063 )
관광객수 <- c(8740976, 9691703, 10851265, 12273917, 13664395, 15852980, 14753236 )

jeju_eco<- data.frame(year,지역GDP,소비자물가지수,농가인구,농가소득,
           감귤생산량,수출금액,사업체수,관광객수)

str(jeju_eco)
pairs(jeju_eco, main= "multi plots")

cor(jeju_eco)

plot(jeju_eco$사업체수, jeju_eco$소비자물가지수, main = "사업체수-소비자물가지수",
     xlab='사업체수', ylab='소비자물가지수',
     col="red", pch=19)
res <- lm(jeju_eco$소비자물가지수~jeju_eco$사업체수, data= jeju_eco)    #회귀식
res
abline(res)

plot(jeju_eco$사업체수, jeju_eco$소비자물가지수, main = "사업체수-소비자물가지수",
     xlab='사업체수', ylab='소비자물가지수',
     col="red", pch=19)
res <- lm(jeju_eco$소비자물가지수~jeju_eco$사업체수, data= jeju_eco)    #회귀식
res
abline(res)