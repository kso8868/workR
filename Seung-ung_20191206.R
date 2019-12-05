#자료(DATA) 정제 / 전처리
library(rJava)
library(xlsx)
library(dplyr)
setwd("D:/test1/workR/homeworkData")
grdp <- read.xlsx(file="도시별성장률.xlsx",sheetIndex=1,encoding="UTF-8", header=T)
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
plot(year, grdp1[18,], main='제주 GRDP률(빨간선)',
           type='l', lty=1, lwd=3,
           xlab='연도', ylab="성장률",col="red")
lines(year, grdp1[1,], type = "ㅣ", lty=1, lwd=3, col="blue") #전국
lines(year, grdp1[2,], type = "l", lty=1, lwd=1, col="green") #서울
lines(year, grdp1[3,], type = "l", lty=1, lwd=1, col="black") #부산
lines(year, grdp1[4,], type = "l", lty=1, lwd=1, col="navy") #대구
lines(year, grdp1[5,], type = "l", lty=1, lwd=1, col="violet") #인천

setwd("D:/test1/workR/homeworkData")
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


