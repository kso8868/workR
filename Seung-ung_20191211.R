# * 실습 결과를 R Script file로 제출
# * R Script file 이름은 "영문본인이름_제출일날짜.R" 부여하여 제출
# * R Script file의 처음에 주석으로 본인 이름과 작성일/제출일 기록

# 강승웅/20191210/20191211 


# 문1)
# R에서 제공하는 state.x77 데이터셋을 차원 축소하여 2차원 산점도와 3
# 차원 산점도를 작성하시오. (state.x77은 매트릭스 타입이기 때문에 데이터프레임
# 으로 변환하여 실습한다.)
st<- data.frame(state.x77)
str(st)
library(Rtsne)
library(ggplot2)
which(duplicated(st))

#2차
tsne <- Rtsne(st, dim=2, perplexity=10)
tsne

df.tens <- data.frame(tsne$Y)
head(df.tens)

ggplot(df.tens, aes(x=X1,y=X2))+
  geom_point(size=2)

#3차
library(car)
library(rgl)
library(mgcv)

tsne <- Rtsne(st,dims=3, perplexity=10)
df.tsne <- data.frame(tsne$Y)
head(df.tsne)

scatter3d(x=df.tsne$X1, y=df.tsne$X2, z=df.tsne$X3)

# 문2)
# R에서 제공하는 swiss 데이터셋을 차원 축소하여 2차원 산점도와 3차원
# 산점도를 작성하시오.

str(swiss)

which(duplicated(swiss))

#2차
sw <- Rtsne(swiss, dim=2, perplexity=10)
sw

df.sw <- data.frame(sw$Y)
head(df.sw)

ggplot(df.sw, aes(x=X1,y=X2))+
  geom_point(size=2)

#3차
sw1 <- Rtsne(swiss,dims=3, perplexity=10)
df.sw1 <- data.frame(sw1$Y)
head(df.sw1)

scatter3d(x=df.sw1$X1, y=df.sw1$X2, z=df.sw1$X3)

# 문3) 
# R을 이용하여 지도를 출력하시오.
library(ggmap)
register_google(key='AIzaSyDlmljbgzrqBC-ug1Mr1Q1Y4gvEOkOcR_g')  #키등록
# (1) 서울시청을 중심으로 지도 크기는 600x600, 지도 유형은 roadmap인 지도를 출력
# 하시오.

gc <- geocode(enc2utf8("서울시청"))           
cen <- as.numeric(gc)                       
map <- get_googlemap(center = cen,          #지도 중심점 좌표
                     zoom = 12,             #지도 확대 정도  
                     size = c(600,600),     #지도 크기
                     maptype = "roadmap")   #지도 유형('roadmap'일반, 'satellite'위성, 'terrain'입체)
ggmap(map)

# (2) 금강산 지역을 근방으로 지도 크기는 500x500, 지도 유형은 hybrid, zoom은 8
# 인 지도를 출력하시오.
gc <- geocode(enc2utf8("금강산"))           
cen <- as.numeric(gc)                       
map <- get_googlemap(center = cen,          #지도 중심점 좌표
                     zoom = 8,             #지도 확대 정도  
                     size = c(500,500),     #지도 크기
                     maptype = "hybrid")   #지도 유형('roadmap'일반, 'satellite'위성, 'terrain'입체)
ggmap(map)

# (3) 강남역 근방으로 지도 크기는 640x640, 지도 유형은 roadmap, zoom은 16인 지
# 도를 출력하시오.
gc <- geocode(enc2utf8("강남역"))           
cen <- as.numeric(gc)                       
map <- get_googlemap(center = cen,          #지도 중심점 좌표
                     zoom = 16,             #지도 확대 정도  
                     size = c(640,640),     #지도 크기
                     maptype = "roadmap")   #지도 유형('roadmap'일반, 'satellite'위성, 'terrain'입체)
ggmap(map)
# (4) 지도 유형은 roadmap, zoom은 9인 경도 127.397692, 위도 36.337058 지역의 지
# 도를 출력하시오.
cen <- c(127.397692, 36.337058)
map <- get_googlemap(center = cen,
                     zoom = 9,
                     maptype = "roadmap")
ggmap(map)

# (5) 지도 유형은 roadmap, zoom은 10인 경도 135.502330, 위도 34.693594 지역의
# 지도를 출력하시오.
cen <- c(135.502330, 34.693594)
map <- get_googlemap(center = cen,
                     zoom = 10,
                     maptype = "roadmap")
ggmap(map)

# 문4)
# R을 이용하여 서울시 한강 이남의 구청들의 위치에 마커와 구청 이름을
# 지도 위에 표시하시오.
addr <- c("강서구청", "양천구청",
          "구로구청", "영등포구청",
          "동작구청", "금천구청",
          "관악구청", "서초구청",
          "강남구청", "송파구청",
          "강동구청")
gc <- geocode(enc2utf8(addr))
gc
df <- data.frame(lon= gc$lon,
                 lat=gc$lat)
df
cen <- c(mean(df$lon), mean(df$lat))
map <- get_googlemap(center = cen,
                     maptype = "roadmap",
                     zoom = 11,
                     size = c(640,640),
                     markers = gc)
ggmap(map)

# 문5)
# R을 이용하여 대한민국의 광역시를 지도 위에 출력하시오. 단, 마커와 광
# 역시 이름을 함께 표시하시오.
library(dplyr)
addr <- c("인천광역시", "대전광역시",
          "광주광역시", "대구광역시",
          "울산광역시", "부산광역시")
gc <- geocode(enc2utf8(addr))
gc
df <- data.frame(name=addr, lon= gc$lon,
                 lat=gc$lat)
df

cen <- c(mean(df$lon), mean(df$lat))
map <- get_googlemap(center = cen,
                     maptype = "roadmap",
                     zoom = 7,
                     size = c(640,640),
                     markers = gc)
ggmap(map)

gmap <- ggmap(map)
gmap+
  geom_text(data=df,                         #데이터셋
            aes(x=lon,y=lat),                #텍스트 위치
            size=5,                          #텍스트 크기
            label=df$name)                   #텍스트 이름


# 문6)
# R을 이용하여 서울, 경기, 강원 지역의 국립공원 위치를 지도 상에 마커로
# 시하되 국립공원의 이름을 함께 표시하시오.
library(dplyr)
addr <- c("북한산", "설악산",
          "오대산", "치악산")
gc <- geocode(enc2utf8(addr))
gc
df <- data.frame(name=addr, lon= gc$lon,
                 lat=gc$lat)
df

cen <- c(mean(df$lon), mean(df$lat))
map <- get_googlemap(center = cen,
                     maptype = "roadmap",
                     zoom = 8,
                     size = c(640,640),
                     markers = gc)
ggmap(map)

gmap <- ggmap(map)
gmap+
  geom_text(data=df,                         #데이터셋
            aes(x=lon,y=lat),                #텍스트 위치
            size=5,                          #텍스트 크기
            label=df$name)                   #텍스트 이름

# 문7) 
# ‘2018년도 시군구별 월별 교통사고 자료’로부터 서울시의 각 구별 1년 교
# 통사고 발생건수를 지도상에 원의 크기로 나타내시오.
library(rJava)
library(xlsx)
library(dplyr)
setwd("D:/workR/homeworkData")
acc <- read.xlsx(file="2018년도_시군구별_월별_교통사고_자료.xlsx",sheetIndex=1, encoding="UTF-8", header=T)
acc
ac<- as.character(acc$시군구)
ac
gc1 <- geocode(enc2utf8(ac))
gc1

df1 <- data.frame(acc,lon= gc1$lon,
                 lat=gc1$lat)
df1

View(df1)
str(df1)
cen <- c(126.983191,37.528566)

map <- get_googlemap(center = cen,
                     maptype = "roadmap",
                     zoom=11)
gmap<- ggmap(map)
gmap+
  geom_point(data=df1,
             aes(x=lon,y=lat,size=X2018),
             alpha=0.5, col="blue")+
  scale_size_continuous(range = c(1,14))
# 문8)
# 7번과 동일한 자료를 이용하여 제주시 1년 교통사고 발생건수를 지도상에 원의 크기로 나타내시오.
cen <- c(126.527739, 33.383749)

map <- get_googlemap(center = cen,
                     maptype = "roadmap",
                     zoom=10)
gmap<- ggmap(map)
gmap+
  geom_point(data=df1,
             aes(x=lon,y=lat,size=X2018),
             alpha=0.5, col="blue")+
  scale_size_continuous(range = c(6,14))