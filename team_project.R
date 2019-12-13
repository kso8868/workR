library(wordcloud)
library(wordcloud2)
library(KoNLP)
library(RColorBrewer)

library(dplyr)
library(ggplot2)

setwd('D:/workR')
text4 <- readLines('text.txt', encoding = 'UTF-8')
text4

noun4 <- sapply(text4, extractNoun, USE.NAMES = F)  
noun4

noun4 <- unlist(noun4)            #list <- vector로 변환

noun4 <- noun4[nchar(noun4)>=2]   

coun4<- table(noun4)

sort.noun4 <- sort(coun4, decreasing = T)[1:10]
sort.noun4
sort.noun4 <- sort.noun1[-3]            #3번째가 공백임.

wordcloud2(coun4,
           color = 'random-light',size = 1)


#외국인 투자현황(중국자본 유입)
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