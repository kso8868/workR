# * 실습 결과를 R Script file로 제출
# * R Script file 이름은 "영문본인이름_제출일날짜.R" 부여하여 제출
# * R Script file의 처음에 주석으로 본인 이름과 작성일/제출일 기록
#
#강승웅/20191211/20191212

library(wordcloud)
library(wordcloud2)
library(KoNLP)
library(RColorBrewer)

library(dplyr)
library(ggplot2)

useSejongDic()

# 문1)
# 20대 국회 개원 여·야 3당 대표 국회연설문에 대해 각각 워드클라우드를
# 작성하시오.
# 예제소스 파일은 ‘ex_10-1.txt’, ‘ex_10-2.txt’, ‘ex_10-3.txt’이다.
setwd('D:/workR/teacher')
text1 <- readLines('ex_10-1.txt', encoding = 'UTF-8')
text1
text2 <- readLines('ex_10-2.txt', encoding = 'UTF-8')
text2
text3 <- readLines('ex_10-3.txt', encoding = 'UTF-8')
text3

buildDictionary(ext_dic = 'woorimalsam')  #우리말씀 한글사전 로딩
pal2 <- brewer.pal(8, 'Dark2')            #색상 팔레트 생성

noun1 <- sapply(text1, extractNoun, USE.NAMES = F)  #명사추출 
noun1

noun2 <- sapply(text2, extractNoun, USE.NAMES = F)  
noun2

noun3 <- sapply(text3, extractNoun, USE.NAMES = F)  
noun3

noun1 <- unlist(noun1)            #list <- vector로 변환
noun2 <- unlist(noun2)
noun3 <- unlist(noun3)

noun1 <- noun1[nchar(noun1)>=2]   #글자 두글자 이상
noun2 <- noun2[nchar(noun2)>=2]
noun3 <- noun3[nchar(noun3)>=2]

coun1<- table(noun1)
coun2<- table(noun2)
coun3<- table(noun3)

sort.noun1 <- sort(coun1, decreasing = T)[1:10]
sort.noun1

sort.noun2 <- sort(coun2, decreasing = T)[1:10]
sort.noun2

sort.noun3 <- sort(coun3, decreasing = T)[1:10]
sort.noun3

sort.noun1 <- sort.noun1[-1]
sort.noun2 <- sort.noun2[-1]
sort.noun3 <- sort.noun3[-1]

wordcloud(names(coun1),                 #단어
          freq = coun1,                 #단어 빈도
          scale = c(6, 0.7),           #단어폰트크기(최대, 최소)
          random.order = F,             #단어출력위치
          rot.per = .1,                 #90도 회전 단어 비율
          colors = pal2)                #단어색
wordcloud(names(coun2),                 
          freq = coun2,                 
          scale = c(6, 0.7),            
          main.freq=3,                  
          random.order = F,             
          rot.per = .1,                 
          colors = pal2)

#3번째는 'wordcloud2'를 사용하여 그렸음
library(wordcloud2)
wordcloud2(coun3,
           color = 'random-light',size = 1.2)


# 문2)
# 스티브 잡스의 스탠포드 대학 졸업식 연설문에 대해 워드클라우드를 작성
# 하시오.
# Tip. 예제소스 파일은 ‘ex_10-4.txt’이다.
setwd('D:/workR/teacher')
text4 <- readLines('ex_10-4.txt', encoding = 'UTF-8')
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
# 문3) 
# 오바마 대통령의 데통령 당선 연설문에 대해 워드클라우드를 작성하시오
# Tip. 예제소스 파일은 ‘ex_10-5.txt’이다.
setwd('D:/workR/teacher')
text5 <- readLines('ex_10-5.txt', encoding = 'UTF-8')
text5

noun5 <- sapply(text5, extractNoun, USE.NAMES = F)  
noun5

noun5 <- unlist(noun5)            #list <- vector로 변환

noun5 <- noun5[nchar(noun5)>=2]   
noun5

coun5<- table(noun5)

sort.noun5 <- sort(coun5, decreasing = T)[1:10]
sort.noun5

wordcloud2(coun5,
           color = 'random-light',size = 1.6, shape='star')
