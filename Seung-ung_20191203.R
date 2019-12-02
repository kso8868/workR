# * 실습 결과를 R Script file로 제출
# * R Script file 이름은 "영문본인이름_제출일날짜.R" 부여하여 제출
# * R Script file의 처음에 주석으로 본인 이름과 작성일/제출일 기록

#강승웅/2019.12.03 

# 문1) 
# 어떤 학급의 성별이 다음과 같을 때 주어진 문제를 해결하기 위한 R 코드를 작성하시오.
# 
# F F F M M F F F M M
# 
# 1. 위의 자료를 gender 벡터에 저장하시오.
gender <- c('F', 'F', 'F', 'M', 'M', 'F', 'F', 'F', 'M', 'M')
gender

# 2. gender에 있는 값들에 대해 도수분포표를 작성하여 출력하시오.
gen1<- table(gender)
gen1

# 3. gender에 있는 값들에 대해 막대그래프를 작성하여 출력하시오.
barplot(gen1,main = 'gender')

# 4. gender에 있는 값들에 대해 원그래프를 작성하여 출력하시오.
pie(gen1, main=  'gender')
# 
# 문2)
# 좋아하는 계절에 대한 조사 결과가 다음과 같을 때 주어진 문제를 해결하기 위한 R 코드를 작성하시오.
# 
# 여름 겨울 봄 가을 여름 가을 겨울 여름 여름 가을
# 
# 1. 위의 자료를 season 벡터에 저장하시오.
season <- c('여름', '겨울', '봄', '가을', '여름', '가을', '겨울', '여름', '여름', '가을')
season

# 2. season에 있는 값들에 대해 도수분포표를 작성하여 출력하시오.
se1 <- table(season)
se1
# 3. season에 있는 값들에 대해 막대그래프를 작성하여 출력하시오.
barplot(se1,main = 'season')

# 4. season에 있는 값들에 대해 원그래프를 작성하여 출력하시오.
pie(se1, main=  'season')

# 문3)
# 학생 A의 과목별 성적이 다음과 같을 때 각 문제를 해결하기 위한 R 코드를 작성하시오.
# 
# KOR ENG ATH HIST SOC MUSIC BIO EARTH PHY ART
# 90 	85 	73 	80 	 85  65    78  50    68  96
# 
# 1. 위 데이터를 score 벡터에 저장하시오(과목명은 데이터 이름으로 저장).
score <- c(90, 85, 73, 80, 85, 65, 78, 50, 68, 96)
names(score) <- c('KOR', 'ENG', 'ATH', 'HIST', 'SOC', 'MUSIC', 'BIO', 'EARTH', 'PHY', 'ART')
score

# 2. score 벡터의 내용을 출력하시오.
score

# 3. 전체 성적의 평균과 중앙값을 각각 구하시오.
mean(score)
median(score)

# 4. 전체 성적의 표준편차를 출력하시오.
var(score)

# 5. 가장 성적이 높은 과목의 이름을 출력하시오.
which.max(score)

# 6. 성적에 대한 상자그림을 작성하고, 이상치에 해당하는 과목이 있으면 출력하시오.
boxplot(score)
boxplot.stats(score)$out

# 7. 다음 조건을 만족하는 위 성적에 대한 히스토그램을 작성하시오.
# (그래프 제목: 학생 성적, 막대의 색: 보라색)
hist(score, main ='학생 성적', 
     xlab='성적', ylab='빈도수',col='violet')
# 
# 문4)
# R에서 제공하는 mtcars 데이터셋에 대해 다음 문제를 해결하기 위한 R코드를 작성하시오.
class(mtcars)
head(mtcars)
# 
# 1. 중량(wt)의 평균값, 중앙값, 절사평균값(절사범위: 15%), 표준편차를 각각 구하시오.
mean(mtcars$wt)
median(mtcars$wt)
mean(mtcars$wt, trim=0.15)
sd(mtcars$wt)

# 2. 중량(wt)에 대해 summary( ) 함수의 적용 결과를 출력하시오.
summary(mtcars$wt)

# 3. 실린더수(cyl)에 대해 도수분포표를 출력하시오.
cyl1<- table(mtcars$cyl)
cyl1

# 4. 앞에서 구한 도수분포표를 막대그래프로 출력하시오.
barplot(cyl1,main = 'cyl')

# 5. 중량(wt)의 히스토그램을 출력하시오.
hist(mtcars$wt,main = "중량",xlab = 'wt',ylab ='빈도' )

# 6. 중량(wt)에 대해 상자그림을 출력하시오.(단, 상자그림으로부터 관찰할 수 있는정보를 함께 출력하시오.)
A<- boxplot(mtcars$wt,xlab='중량',ylab='범위')
text(rep(1,NROW(A$out)),A$out,labels = A$out, pos = c(1,3))   #그래프에 이상치를 넣어봄 
boxplot.stats(mtcars$wt)

# 7. 배기량(disp)에 대한 상자그림을 출력하시오.(단, 상자그림으로부터 관찰할 수 있는 정보를 함께 출력하시오.)
boxplot(mtcars$disp,xlab='배기량',ylab='범위')
boxplot.stats(mtcars$disp)

# 8. 기어수(gear)를 그룹 정보로 하여 연비(mpg) 자료에 대해 상자그림을 작성작성하고,
# 각 그룹의 상자그림을 비교하여 관찰할 수 있는 것이 무엇인지 나타내시오.
boxplot(mtcars$mpg~mtcars$gear,
        main='기어별 연비')


#결론: 기어별로 연비가 4단이 가장 효율적이며 다음은 5단,3단 순으로 효율이 좋다.
#3단은 연비 범위가 좁고 2사분위와 3사분위가 좁게 형성 되어있어 값의 연관성이 높고,
#5단의 경우 상자의 범위가 넓어서 대표성이 떨어지긴 하지만 대체로 4단보다 연비가 낮아지는걸 볼 수 있다.
#(5단, 4단의 2사분위 3분위를 비교하여 알 수 있음, 중앙값의 비교도 3단<5단<4단)