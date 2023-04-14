# 변수 만들기


a <- 1
rm(a) # 변수 삭제
a <- 1

b <- 2
b
c <- 3
c

d <- 3.5
d


# 변수로 연산하기 
a + b
a + b + c
4/b
5*b

# 4. 여러 값으로 구성된 변수 만들기
var1 <- c(1, 2, 5, 7, 8) 
var1
## [1] 1 2 5 7 8
var2 <- c(1:5)
var2
## [1] 1 2 3 4 5


var3 <- seq(1, 5)
var3
## [1] 1 2 3 4 5

var4 <- seq(1, 10, by = 2) 
var4
## [1] 1 3 5 7 9

var5 <- seq(1, 10, by = 3)
var5
## [1]  1  4  7 10

# 5. 연속값 변수로 연산하기
var1
## [1] 1 2 5 7 8
var1+2
# [1]  3  4  7  9 10    # 보면 모든 인덱스에다 더한걸 알 수 있음 
var1
## [1] 1 2 5 7 8
var2
## [1] 1 2 3 4 5
var1+var2             # 각각의 인덱스 끼리 값을 더함 
## [1]  2  4  8 11 13


# 6. 문자로 된 변수 만들기

str1 <- "a"
str1
## [1] "a"

str2 <- "text"
str2
## [1] "text"

str3 <- "Hello World!"
str3
## [1] "Hello World!"


# 7. 연속 문자 변수 만들기

str4 <- c("a", "b", "c")
str4
## [1] "a" "b" "c"

str5 <- c("Hello!", "World", "is", "good!")
str5
## [1] "Hello!" "World"  "is"     "good!"

#문자로 된 변수로는 연산할 수 없다
# str1 + 2 


# 8. 자료형 사이의 변환방법
# as.numeric() : 숫자형 벡터로 변환
# as.integer() : 정수형 벡터로 변환
# as.complex() : 복소수형 벡터로 변환
# as.character() : 문자형 벡터로 변환
# as.logical() : 논리형 벡터로 변환
# as.null : null형 벡터로 변환

a<-1 
a1<-c(1:5) 
a2<- as.numeric(a1) # int 형을 num 형으로 변환시켜 저장 
a2 
##[1] 1 2 3 4 5 


# 함수 

# 2. 숫자를 다루는 함수 이용하기

x <- c(1, 2, 3)
x
## [1] 1 2 3
mean(x)       # 평균값
## [1] 2
max(x)        # 최대값
## [1] 3
min(x)        # 최소값 
## [1] 1


# 3. 문자를 다루는 함수 이용하기

str5
## [1] "Hello!" "World"  "is"     "good!"
paste(str5, collapse = ",")     # 쉼표를 구분자로 str5의 단어들 하나로 합치기
## [1] "Hello!,World,is,good!“
paste(str5, collapse = " ")     # 공백을 구분자로 str5의 단어들 하나로 합치기
## [1] "Hello! World is good!"



# 4. 함수의 옵션 설정하기 - 파라미터
# 함수의 결과로 새 변수 만들기 
x_mean <- mean(x)
x_mean
## [1] 2




# 패키지 
# 2. 패키지 설치하기
# install.packages("ggplot2")


# ggplot2 패키지 로드(방법1)_Console창에 직접 입력하는 방법
library(ggplot2)

# ggplot2 패키지 로드(방법2)_Packages 메뉴를 이용하는 방법->ggplot2의 체크박스를 클릭

# 4. 패키지 함수 사용하기

x <- c("a", "a", "b", "c")
x
## [1] "a" "a" "b" "c"
qplot(x)     # 빈도 그래프 출력 


# 응용1

testjjk <- 100
testjjk
strjjk <- "정정욱"
strjjk
array1jjk <- c('010','7339','2128')
array1jjk

# 응용2

varjjk <- seq(10,20)
varjjk
varjjk1 <- seq(10,20, by=4)
varjjk1

varjjk1 + 5


# 응용3

scorejjk <- c(80, 60, 70, 50, 90)
scorejjk
mean(scorejjk)
meanjjk <- mean(scorejjk)
meanjjk
max(scorejjk)
min(scorejjk)

# 응용4

studentjjk <- c(80, 50, 70, 60, 90, 100, 50, 80)
#library(ggplot2)
qplot(studentjjk) 
