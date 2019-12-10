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
st1 <- Rtsne(st, dim=2, perplexity=10)
st1

df.st <- data.frame(st1$Y)
head(df.st)

ggplot(df.st, aes(x=X1,y=X2))+
  geom_point(size=2)

#3차
library(car)
library(rgl)
library(mgcv)

st2 <- Rtsne(st,dims=3, perplexity=10)
df.st2 <- data.frame(st2$Y)
head(df.st2)

scatter3d(x=df.st2$X1, y=df.st2$X2, z=df.st2$X3)

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
seoul <- geocode(enc2utf8("서울시청"))           
cen1 <- as.numeric(seoul)                       
map1 <- get_googlemap(center = cen1,          #지도 중심점 좌표
                     zoom = 12,             #지도 확대 정도  
                     size = c(600,600),     #지도 크기
                     maptype = "roadmap")   #지도 유형('roadmap'일반, 'satellite'위성, 'terrain'입체)
ggmap(map1)

# (2) 금강산 지역을 근방으로 지도 크기는 500x500, 지도 유형은 hybrid, zoom은 8
# 인 지도를 출력하시오.
mount <- geocode(enc2utf8("금강산"))           
cen2 <- as.numeric(mount)                       
map2 <- get_googlemap(center = cen2,          #지도 중심점 좌표
                     zoom = 8,             #지도 확대 정도  
                     size = c(500,500),     #지도 크기
                     maptype = "hybrid")   #지도 유형('roadmap'일반, 'satellite'위성, 'terrain'입체)
ggmap(map2)

# (3) 강남역 근방으로 지도 크기는 640x640, 지도 유형은 roadmap, zoom은 16인 지
# 도를 출력하시오.
gang <- geocode(enc2utf8("강남역"))           
cen3 <- as.numeric(gang)                       
map3 <- get_googlemap(center = cen3,          #지도 중심점 좌표
                     zoom = 16,             #지도 확대 정도  
                     size = c(640,640),     #지도 크기
                     maptype = "roadmap")   #지도 유형('roadmap'일반, 'satellite'위성, 'terrain'입체)
ggmap(map3)

# (4) 지도 유형은 roadmap, zoom은 9인 경도 127.397692, 위도 36.337058 지역의 지
# 도를 출력하시오.

cen4 <- c(127.397692, 36.337058)
map4 <- get_googlemap(center = cen4,
                     zoom = 9,
                     maptype = "roadmap")
ggmap(map4)

# (5) 지도 유형은 roadmap, zoom은 10인 경도 135.502330, 위도 34.693594 지역의
# 지도를 출력하시오.
cen5 <- c(135.502330, 34.693594)
map5 <- get_googlemap(center = cen5,
                     zoom = 10,
                     maptype = "roadmap")
ggmap(map5)

# 문4)
# R을 이용하여 서울시 한강 이남의 구청들의 위치에 마커와 구청 이름을
# 지도 위에 표시하시오.
add_gu <- c("강서구청", "양천구청",
          "구로구청", "영등포구청",
          "동작구청", "금천구청",
          "관악구청", "서초구청",
          "강남구청", "송파구청",
          "강동구청")
gu <- geocode(enc2utf8(add_gu))
gu
df.gu<- data.frame(lon= gu$lon,
                 lat=gu$lat)
df.gu
cen6 <- c(mean(df.gu$lon), mean(df.gu$lat))
map6 <- get_googlemap(center = cen6,
                     maptype = "roadmap",
                     zoom = 11,
                     size = c(640,640),
                     markers = gu)
ggmap(map6)

# 문5)
# R을 이용하여 대한민국의 광역시를 지도 위에 출력하시오. 단, 마커와 광
# 역시 이름을 함께 표시하시오.

add_big_city <- c("인천광역시", "대전광역시",
                  "광주광역시", "대구광역시",
                  "울산광역시", "부산광역시")
big_city <- geocode(enc2utf8(add_big_city))
big_city
df.city <- data.frame(name=add_big_city, lon= big_city$lon,
                 lat=big_city$lat)
df.city

cen7 <- c(mean(df.city$lon), mean(df.city$lat))
map7 <- get_googlemap(center = cen7,
                     maptype = "roadmap",
                     zoom = 7,
                     size = c(640,640),
                     markers = big_city)
ggmap(map7)

gmap <- ggmap(map7)
gmap+
  geom_text(data=df.city,                         #데이터셋
            aes(x=lon,y=lat),                     #텍스트 위치
            size=5,                               #텍스트 크기
            label=df.city$name)                   #텍스트 이름


# 문6)
# R을 이용하여 서울, 경기, 강원 지역의 국립공원 위치를 지도 상에 마커로
# 시하되 국립공원의 이름을 함께 표시하시오.

add_mount <- c("북한산", "설악산",
          "오대산", "치악산","태백산")
nat <- geocode(enc2utf8(add_mount))
nat
df.nat <- data.frame(name=add_mount, lon= nat$lon,
                 lat=nat$lat)
df.nat

cen8 <- c(mean(df.nat$lon), mean(df.nat$lat))
map8 <- get_googlemap(center = cen8,
                     maptype = "roadmap",
                     zoom = 8,
                     size = c(640,640),
                     markers = nat)
ggmap(map8)

gmap1 <- ggmap(map8)
gmap1+
  geom_text(data=df.nat,                         #데이터셋
            aes(x=lon,y=lat),                    #텍스트 위치
            size=5,                              #텍스트 크기
            label=df.nat$name)                   #텍스트 이름

# 문7) 
# ‘2018년도 시군구별 월별 교통사고 자료’로부터 서울시의 각 구별 1년 교
# 통사고 발생건수를 지도상에 원의 크기로 나타내시오.
library(rJava)
library(xlsx)
library(dplyr)
setwd("c:/workR/homeworkData")
acc <- read.xlsx(file="2018년도_시군구별_월별_교통사고_자료.xlsx",sheetIndex=1, encoding="UTF-8", header=T)
acc
str(acc)                    #'시군수' 자료가 펙터타입임.
ac<- as.character(acc$시군구)   #'시군구' Factor타입을 문자타입으로 전환
ac

traffic <-geocode(enc2utf8(ac))
traffic

df.traffic <- data.frame(acc,lon = traffic$lon,
                 lat = traffic$lat)
df.traffic

cen9 <- c(126.983191,37.528566)         #서울을 센터로 잡음

map9 <- get_googlemap(center = cen9,
                     maptype = "roadmap",
                     zoom=11)
gmap2<- ggmap(map9)
gmap2+
  geom_point(data=df.traffic,
             aes(x=lon,y=lat,size=X2018),
             alpha=0.5, col="blue")+
  scale_size_continuous(range = c(1,14))
# 문8)
# 7번과 동일한 자료를 이용하여 제주시 1년 교통사고 발생건수를 지도상에 원의 크기로 나타내시오.

cen10 <- c(126.527739, 33.383749)      #제주도를 센터로 잡음

map10 <- get_googlemap(center = cen10,
                     maptype = "roadmap",
                     zoom=10)
gmap3<- ggmap(map10)
gmap3+
  geom_point(data=df.traffic,
             aes(x=lon,y=lat,size=X2018),
             alpha=0.5, col="blue")+
  scale_size_continuous(range = c(4,14))