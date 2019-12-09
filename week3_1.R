#10일차
#3주 1일차

#install.packages("ggplot2")
#install.packages("tidyverse")
library(ggplot2)
library(dplyr)
library(tidyverse)

dim(mpg)
str(mpg)
head(mpg)
View(mpg)

ggplot(data=mpg) +
  geom_point(mapping=aes(x=displ, y=hwy))

#오후수업
month <- c(1,2,3,4,5,6)
rain <- c(55,50,45,50,60,70)
df <- data.frame(month,rain)
df

ggplot(data=df, mapping=aes(x=month, y=rain))+
  geom_bar(stat = "identity",
           width=0.7,
           fill="steelblue")

ggplot(data=df, mapping=aes(x=month, y=rain))+
  geom_bar(stat = "identity",
           width=0.7,
           fill="steelblue")+
ggtitle("월별 강수량")+
theme(plot.title = element_text(size = 25,
                                face="bold",
                                colour = "steelblue"))+
labs(x="월",y="강수량")+
  coord_flip()

iris
ggplot(iris, aes(x=Petal.Length))+
  geom_histogram(binwidth = 1.0)


ggplot(iris, aes( x = Sepal.Width, fill = Species,
                color = Species ))+
  geom_histogram(binwidth = 0.5, position = "dodge")+
  theme(legend.position="top")

#ggplot2 Scatter chart
ggplot(data=iris, mapping=aes(x=Petal.Length,
                              y= Petal.Width))+
  geom_point()

ggplot(data=iris)+
  geom_point(mapping=aes(x=Petal.Length,
                         y= Petal.Width))

ggplot(data=iris, mapping=aes(x=Petal.Length,
                              y= Petal.Width,
                              color=Species,
                              shape=Species))+
  geom_point(size=3)+
  ggtitle("꽃잎의 길이와 폭")+
  theme(plot.title = element_text(size=25,
                                  face="bold",
                                  colour="red"))          #산점도

#gglot box plot
ggplot(data=iris, mapping = aes(y=Petal.Length))+
  geom_boxplot(fill="yellow")                             #상자수염

ggplot(data=iris, mapping = aes(y=Petal.Length,
                                fill=Species))+
  geom_boxplot()  

#ggplot Line chart
year <- 1937:1960
cnt <- as.vector(airmiles)
df <- data.frame(year,cnt)
head(df)

ggplot(df,aes(x=year,y=cnt))+
  geom_line(col="red")

#ggplot 작성 그래프 꾸미기(공통)

str(economics)

#사선
ggplot(economics, aes(x=date, y=psavert))+
  geom_line() +
  geom_abline(intercept=12.18671,
              slope = -0.0005444)
#intercept : y 절편값
#slope :기울기

#평행선
ggplot(economics, aes(x=date,y=psavert))+
  geom_line() +
  geom_hline(yintercept = mean(economics$psavert))

#수직선
x_inter <- filter(economics,
            psavert == min(economics$psavert))$date
ggplot(economics, aes(x=date,y=psavert))+
  geom_line() +
  geom_vline(xintercept = x_inter)

#텍스트 추가
ggplot(airquality, aes(x=Day, y=Temp))+
  geom_point()+
  geom_text(aes(label=Temp,
                vjust=0,
                hjust=0))                         #텍스트 넣기

#영역 지정 및 화살표 표시
ggplot(mtcars, aes(x=wt,y=mpg))+
  geom_point()+                                   #산점도
  annotate("rect",
           xmin=3,
           xmax=4,
           ymin=12,
           ymax=21,
           alpha=0.5,
           fill="skyblue")+                       #범위지정
  annotate("segment", x=2.5,xend = 3.7,
           y=10, yend = 17,color="red",
           arrow=arrow())+                        #화살표 넣기
  annotate("text",x=2.5,y=10,
           label="point")                         #텍스트 넣기

#treemap
install.packages("treemap")
library(treemap)

data("GNI2014")
dim(GNI2014)
str(GNI2014)
View(GNI2014)

treemap(GNI2014,
        index = c("continent","iso3"),      
        vSize = "population",               
        vColor="GNI",                       
        type="value",
        bg.labels = "yellow",
        title = "World's GNI")

# treemap(GNI2014,
#         index = c("continent","iso3"),    계층 구조  
#         vSize = "population",             타일 크기  
#         vColor="GNI",                     타일 컬러
#         type="value",                     타일 컬러링 방법  
#         bg.labels = "yellow",             레이블 배경색
#         title = "World's GNI")            제목

st <- data.frame(state.x77)
st <- data.frame(st,stname=rownames(st))
treemap(st,
        index = c("stname"),      
        vSize = "Area",               
        vColor="Income",                       
        type="value",
        title = "미국 주별 수입")

#산점도에 Bubble추가(버블차트)

symbols(st$Illiteracy,st$Murder,
        circles= st$Population,
        inches=0.3,
        fg="white",
        bg="lightgray",
        lwd=1.5,
        xlab="rate of Illiteracy",
        ylab="crime(merder) rate",
        main="Illiteracy and Crime")
text(st$Illiteracy,st$Murder,
     rownames(st),
     cex = 0.6,
     col="brown")

# symbols(st$Illiteracy,st$Murder,            원의 x,y좌표
#         circles= st$Population,             원의 반지름
#         inches=0.3,                         원크기 조절값
#         fg="white",                         원 테두리 색
#         bg="lightgray",                     원 바탕색
#         lwd=1.5,                            원 테두리선 두께
#         xlab="rate of Illiteracy",
#         ylab="crime(merder) rate",
#         main="Illiteracy and Crime")
# text(st$Illiteracy,st$Murder,               텍스트출력 좌표
#      rownames(st),                          출력할 텍스트
#      cex = 0.6,                             폰트 크기
#      col="brown")                           폰트컬러


##코드 긁어옴
# Libraries

library(ggplot2)
library(dplyr)
library(plotly)
library(viridis)
library(hrbrthemes)

# The dataset is provided in the gapminder library
library(gapminder)
data <- gapminder %>% filter(year=="2007") %>% dplyr::select(-year)

# Interactive version
p <- data %>%
  mutate(gdpPercap=round(gdpPercap,0)) %>%
  mutate(pop=round(pop/1000000,2)) %>%
  mutate(lifeExp=round(lifeExp,1)) %>%
  
  # Reorder countries to having big bubbles on top
  arrange(desc(pop)) %>%
  mutate(country = factor(country, country)) %>%
  
  # prepare text for tooltip
  mutate(text = paste("Country: ", country, "\nPopulation (M): ", pop, "\nLife Expectancy: ", lifeExp, "\nGdp per capita: ", gdpPercap, sep="")) %>%
  
  # Classic ggplot
  ggplot( aes(x=gdpPercap, y=lifeExp, size = pop, color = continent, text=text)) +
  geom_point(alpha=0.7) +
  scale_size(range = c(1.4, 19), name="Population (M)") +
  scale_color_viridis(discrete=TRUE, guide=FALSE) +
  theme_ipsum() +
  theme(legend.position="none")

# turn ggplot interactive with plotly
pp <- ggplotly(p, tooltip="text")
pp

