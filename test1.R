# R 프로그래밍 1일차

# first.R

# 작성자:강승웅

#최초작성일 : 2019.11.26

print("Hello, World!!")


number <- 10
number2 = 100

number3 <- number

numberValue <- 1                #camel 표기법
str_value <-"R language"        #snake 표기법
booleanvalue <- TRUE

numberValue <- 1
print(numberValue)
print(str_value)
print(booleanvalue)


cat("Numeric number :", numberValue,"\n")
cat("string :", str_value, "\n")
cat("Boolean value : ", booleanvalue,"\n")

numberValue <- scan()
cat("Numeric number : ", numberValue, "\n")

number1 <- 10
number2 <- 20
resultAdd <-  number1 + number2
resultSub <-  number1 - number2
resultMul <-  number1 * number2
resultDiv <-  number1 / number2
resultRem <-  number2 %% number1
resultSec <-  number2 ** 5

print(resultAdd)
print(resultSub)
print(resultMul)
print(resultDiv)
print(resultRem)
print(resultSec)



number1 <- 0
number1 <- number1 + 10
number1

number1 <- number1 + 10
number1

number1 <- number1 + 10
number1

number2 <- 100
number1 <- number2 + 10
number1
number2

print(number1+10*number2/2)

number300 <- 10
number300 <- number300 +10
number300

number301 <- number300*2
number301

number1 <- 10.5
number2 <- 10
print(number1>number2)
print(number1>=number2)
print(number1<number2)
print(number1<=number2)
print(number1==number2)
print(number1!=number2)

print(number1>10 & number2>10)  #and
print(number1>10 | number2>10)  #or
print(!(number1>10))            #not

number <- "100"
str <- "R Language"
result = nuber + str
print(result)

#제어구조 -선택구조

job.type <- 'A'

if (job.type == 'B') {
  bonus <- 200        #참일때
} else {
  bonus <- 100        #거짓일때
}
cat("joy type : " ,job.type,"\t\tbonus : ", bonus )


job.type <- 'B'

if(job.type == 'A'){
  bonus <- 200
}
cat("joy type : ", job.type,"\t\tbonus : ", bonus)



score <- 85

if (score >= 90) {
  grade <- 'A'        
} else if (score >= 80) {
  grade <- 'B'       
} else if (score >= 70) {
  grade <- 'C'       
} else if (score >= 60) {
  grade <- 'D'       
} else {
  grade <- 'F' 
}
cat("score : " , score,"\t\tgrade : ", grade )


number <- 15

if (number %% 2 == 0){
  cat("number", number ,"는 짝수이다")
} else {
  cat("number", number ,"는 홀수이다")}



a <- 5
b <- 20

if ( a > 5 & b> 5){
  cat(a,"> 5 and ", b, " >5 ")
} else {
  cat(a," <= 5 or", b, " <=5")
}


a <- 10
b <- 20

if ( a > b ){
  c <- a
} else {
  c <- b
}
cat("a = ", a, "\tb = ", b, "\tc = ", c)

c <- ifelse( a > b, a, b)
cat("a = ", a, "\tb = ", b, "\tc = ", c)



a <- 10
b <- 5
c <- 8

max <- ifelse(c<a,ifelse(a>b, ifelse( a > b, a, b), ifelse( b > c, b, c)),c)
print(max)


a <- 10
b <- 5
c <- 8
max <- a

if ( b > max ) {
  max=b
}
if ( c > max ) {
  max = c
}
cat("a = ", a, "b = ", b,"c = ", c, "max = ", max )


#반복구조
#for문

for ( i in 1:10 ) {
  print( i )
}



multiple = 2
for (i in 2:9) {
  cat( multiple, ' X ', i, ' = ', multiple * i, '\n' )
}

#while

i <- 1
while ( i <= 10 ) {
  print( i )
  i <- i + 1
}


multiple <-  2
i <- 2
while ( i <= 9 ) {
  cat( multiple, ' X ', i, ' = ', multiple * i, '\n')
  i <-  i + 1
}

#2
for ( i in 1:100 ) {
  cat(i, ' ' )
  if ( i %% 10 == 0 ) {
    print( '\n' )
  }
}

#1
lineCount <- 1              #초기화
for ( i in 1:100 ){
  cat(i, ' ' )
  lineCount <- lineCount + 1
  if ( lineCount > 10 ) {
    print( '\n' )
    lineCount <- 1          #reset
  }
}


#1~1000까지 3의 배수와 5의 배수를 한줄에 10개씩 출력하고 마지막에 개수를 출력

check <-0
sum<-0

for(i in 1:1000){
  if( i%%3==0 | i%%5==0 ){
  cat(i," ")
  check <- check + 1
  sum <-  sum + i
}
  if (check%%10==0){
      cat('\n')
}
  check
  sum
  