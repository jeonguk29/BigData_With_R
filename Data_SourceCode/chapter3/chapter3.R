# 연산자 

# 2. 할당연산자
#R에서도 =를 사용할 수 있지만, <-를 주로 사용
#R에서는 <-가 =보다 우선순위가 높음

C = D <- 5
C
D

# G <- E = 10
# 오류 발생
# - 객체 G를 찾을 수 없다는 오류
# - 10이 아직 변수 E에 할당되지 않아 변수가 비어있는데,
# E의   값을 G로 할당하는 것이 먼저 수행되어서 변수 G가 
# 생성되지 않았기 때문


# 3. 산술연산자
C + D # 더하기 
C - D # 빼기
C * D # 곱하기 
C / D # 나누기 
C%/%D # 몫
C%%D # 나머지 
C**D # 제곱수 
C^D  # 제곱수 


# 4. 관계연산자


C>D       # 크다
#[1] FALSE

C>=D      # 크거나 작다
#[1] TRUE

C<D       # 작다 
#[1] FALSE

C<=D      # 작거나 같다 
#[1] TRUE

C==D      # 같다 
#[1] TRUE

C!=D      # 같지 않다 
#[1] FALSE

!C       # 아니다 
#[1] FALSE


# 5. 논리연산자
# & 그리고 (and)
# | 또는 (or)

x <- 1:3  # 변수 x에 1, 2, 3을 할당
y <- 3:1  # 변수 y에 3, 2, 1을 할당
(x > 0) & (y > 1)            # 각 원소 값을 하나씩 대입해서 비교 
# [1]  TRUE  TRUE FALSE
(x > 0) | (y > 1)           
# [1] TRUE TRUE TRUE


# 조건문 

job.type <- 'B' 
bonus <- 100 
if(job.type == 'A') { 
	bonus <- 200 	# 직무 유형이 A일 때 실행 
} 
print(bonus)
# [1] 100 



job.type <- 'A'
if (job.type == 'B') {
  bonus <- 200
} else { 		# 정상 실행됨.  : else는 반드시 if문의 코드블록이 끝나는 부분에 있는 }와 같은 줄에 작성해야 함
  bonus <- 100
}
bonus
# [1] 100 

# 조건문으로 짝수 홀수 구분하기
a <- 10
if(a %% 2 == 0) {
  print("짝수입니다")
} else {
  print("홀수입니다")
}

# [1] "짝수입니다"


# 조건문으로 학점 분류하기
b <- 80
if(b >= 90) {
  print("A 학점입니다") 
} else if (b >= 80) {
  print("B 학점입니다") 
} else {
  print("c 학점입니다") 
}

# [1] "B 학점입니다"



# 조건문에서 논리 연산자의 사용

a <- 10
b <- 20
if(a>5 & b>5) { 		# and 사용
  print (a+b)
}
# [1] 30

if(a>5 | b>30) { 		# or 사용
  print (a*b)
}
# [1] 200


a <- 10
b <- 20

if (a>b) {
  c <- a
} else {
  c <- b
}
print(c)
# [1] 20


# ifelse문 실습
a <- 10
b <- 20
c <- ifelse(a>b, a, b) # a가 b보다 크면 c에는  a가, 그러지 않으면 b 저장됨
print(c)




# 반복문 
# for( ) 함수로 구구단 2단 출력하기
for(i in 1:9) {
  a <- 2*i
  print(a)
}

#[1] 2
#[1] 4
#[1] 6
#[1] 8
#[1] 10
#[1] 12
#[1] 14
#[1] 16
#[1] 18

# for( ) 함수로 구구단 2단부터 9단까지 출력하기
for(i in 2:9) {
  for(j in 1:9) {
    print(paste(i, " * ", j, " = ", i*j))
  }
}

#[1] "2 * 1 = 2"
#[1] "2 * 2 = 4"
#[1] "2 * 3 = 6“
#[1] "2 * 4 = 8"
#... (중략) ...
#[1] "9 * 6 = 54"
#[1] "9 * 7 = 63"
#[1] "9 * 8 = 72"
#[1] "9 * 9 = 81

for(i in 1:5) {
  print('*')
}
for(i in 1:5) {
  cat('*')# * cat( ) 함수:print( ) 함수와 같이 출력 함수    띄어 쓰기 없음
}

# *****


for(i in 1:9) {
  cat('2 *', i,'=', 2*i,'\n')
}


# for문 안에서 if문의 사용

for(i in 1:20) {
  if(i%%2==0) { 		# 짝수인지 확인
    print(i)  # 짝수만 출력함 
  }
}

# * 1~100 사이의 숫자의 합 출력
sum <- 0
for(i in 1:100) {
  sum <- sum + i 		# sum에 i 값을 누적
}
print(sum)
#[1] 5050



# 3. while문

sum <- 0
i <- 1
while(i <=100) {
  sum <- sum + i 	# sum에 i 값을 누적
  i <- i + 1 	# i 값을 1 증가시킴
}
print(sum)
#[1] 5050



# break와 next
sum <- 0
for(i in 1:10) {
  sum <- sum + i
  if (i>=5) break
}
sum
# [1] 15


sum <- 0
for(i in 1:10) {
  if (i%%2==0) next
  sum <- sum + i # 홀수만 더함 
}
sum
# [1] 25





# 내장함수 
# 내장 함수: 별도의 패키지를 설치하지 않고 사용할 수 있는 함수- 예: print(), sum(), Sys.Date( ) 함수

x <- sum(10, 20)
x

# Hello World 문자 출력하기
print("Hello World")

# 1부터 100까지 더한 값을 출력하기
a <- sum(1:100)
a

# 오늘 날짜 출력하기
Sys.Date()

#print( ) 함수 cat( ) 함수
#print( ) 함수와 cat( ) 함수는 둘 다 출력 함수이지만, 쓰임새에 차이가 있음

# 여러 숫자 출력
print(1, 2, 3)              # 첫번째 숫자만 출력
#[1] 1
cat(1, 2, 3)                # 모든 숫자가 출력
# 1 2 3


# 숫자, 문자열 출력
print(1, 2, 3, "hello")
#[1] 1
cat(1, 2, 3, "hello")
#1 2 3 hello


# 3. 조건에 맞는 데이터의 위치 찾기

score <- c(76, 84, 69, 50, 95, 60, 82, 71, 88, 84)
which(score==69) 		# 성적이 69인 학생은 몇 번째에 있나
#[1] 3
which(score>=85) 		# 성적이 85 이상인 학생은 몇 번째에 있나
#[1] 5 9

max(score) 	 	          # 최고 점수는 몇 점인가
#[1] 95
which.max(score) 		# 최고 점수는 몇 번째에 있나
#[1] 5

min(score) 		          # 최저 점수는 몇 점인가
#[1] 50
which.min(score) 		# 최저 점수는 몇 번째에 있나
#[1] 4

score <- c(76, 84, 69, 50, 95, 60, 82, 71, 88, 84)
idx <- which(score<=60) 		# 성적이 60 이하인 값들의 인덱스
idx
# [1] 4 6
score[idx] <- 61 	                              # 성적이 60 이하인 값들은 61점으로 성적 상향 조정
score 		 		          # 상향 조정된 성적 확인
# [1] 76 84 69 61 95 61 82 71 88 84

idx <- which(score>=80) 		# 성적이 80 이상인 값들의 인덱스
score.high <- score[idx] 	          # 성적이 80 이상인 값들만 추출하여 저장
score.high 		                              # score.high의 내용 확인
# [1] 84 95 82 88 84





# V. 파생변수 생성
# 파생변수란? 기존의 변수를 변경해 만든 변수

df <- data.frame(var1 = c(4, 3, 8), var2 = c(2, 6, 1))
df

#var1, var2 변수의 값을 더한 var_sum이라는 파생변수를 만들어 df에 추가
#->데이터 프레임명에 $을 붙여 새로 만들 변수명을 입력
df$var_sum <- df$var1 + df$var2  # var_sum 파생변수 생성
df

##   var1 var2 var_sum
## 1    4    2       6
## 2    3    6       9
## 3    8    1       9

df$var_mean <- (df$var1 + df$var2)/2  # var_mean 파생변수 생성
df
##   var1 var2 var_sum var_mean
## 1    4    2       6      3.0
## 2    3    6       9      4.5
## 3    8    1       9      4.5



#mpg 통합 연비 변수 만들기
# install.packaes("ggplot2")
# library(ggplot2) 

# ggplot2의 mpg 데이터를 데이터 프레임 형태로 불러오기
mpg <- as.data.frame(ggplot2::mpg)

# cty, hwy 변수를 더해 2로 나눠 도로 유형을 통합한 연비 변수를 만들기
# ->데이터 일부를 출력->total변수 확인

mpg$total <- (mpg$cty + mpg$hwy)/2  # 통합 연비 변수 생성
head(mpg)

# 변수추가 후 통합 연비 변수를 평균을 구할 수 있음
mean(mpg$total)
## [1] 20.14957

#합격 여유를 판단할 기준을 결정-> 변수의 요약 통계량을 이용하여 total의 평균(mean)과 중앙값(median)을 확인
summary(mpg$total)  # 요약 통계량 산출
hist(mpg$total)     # 히스토그램 생성

# total이 20 이상이면  “pass”, 그렇지 않으면  “fail” 부여하여  test에 저장
mpg$test <- ifelse(mpg$total >= 20, "pass", "fail")

head(mpg, 5) # 데이터 확인

# 5.3 빈도표로 합격 판정 자동차 수 살펴보기
#빈도표: 변수의 각 값들이 몇 개씩 존재하는지, 데이터의 개수를 나타낸 표
#table()을 이용해 빈도표를 작성

table(mpg$test)  # 연비 합격 빈도표 생성
## 
## fail pass 
##  106  128


#5.4 막대 그래프로 빈도 표현하기
# 막대 그래프: 각 항목의 빈도가 얼마나 되는지 파악 가능
# ggplot2패키지에 내장된 qplot()는 값의 개수를 막대의 길이로 표현하는 기능
library(ggplot2)  # ggplot2 로드
qplot(mpg$test)   # 연비 합격 빈도 막대 그래프 생성

dev.off()                           # 에러가 날 경우 plot창을 초기화
qplot(mpg$test)  # 창 지우고 다시 생성 



# 6.1 조건문으로 합격 판정 변수 만들기

#total이 30이상이면 A,
#20~29이면 B,
#20미만이면 C등급


# total을 기준으로 A, B, C 등급 부여
mpg$grade <- ifelse(mpg$total >= 30, "A", ifelse(mpg$total >= 20, "B", "C"))
# [유의] ifelse()가 두 번 반복되므로 열리는 괄호와 닫히는 괄호가 각각 두 개, 쉼표도 각각 두 개
head(mpg, 5)  # 데이터 확인

#manufacturer model displ year cyl      trans drv cty hwy fl   class total test grade
#1         audi    a4   1.8 1999   4   auto(l5)   f  18  29  p compact  23.5 pass     B
#2         audi    a4   1.8 1999   4 manual(m5)   f  21  29  p compact  25.0 pass     B
#3         audi    a4   2.0 2008   4 manual(m6)   f  20  31  p compact  25.5 pass     B
#4         audi    a4   2.0 2008   4   auto(av)   f  21  30  p compact  25.5 pass     B
#5         audi    a4   2.8 1999   6   auto(l5)   f  16  26  p compact  21.0 pass     B

table(mpg$grade) # 등급 빈도표 생성
## 
##   A   B   C 
##  10 118 106
qplot(mpg$grade) # 등급 빈도 막대 그래프 생성




# 응용1 
x <- 4:6
y <- 5:7
(x > 2) & (y > 5)
# [1] FALSE  TRUE  TRUE
(x > 5) | (y > 1)
# [1] TRUE TRUE TRUE



# 응용2
x <- 2:4
y <- 1:3
x>=y
# [1] TRUE TRUE TRUE
!x
# [1] FALSE FALSE FALSE
x<=y
# [1] FALSE FALSE FALSE


# 응용3

a <- 10
if(a %% 3 == 0) {
  print("3의 배수입니다")
} else {
  print("3의 배수가 아닙니다")
}

# [1] "3의 배수가 아닙니다"


# 응용4
job <- "KA" 
if(job ==  "KB") { 	
  bonus <- 1   	                 # job이 “AK”이면 2그렇지 않을 경우 1을 출력
} else {
  bonus <- 2 
}         # 직무 유형이K B가 아닌 나머지 경우 실행 
print(bonus)
# [1] 2

# 응용5

hak <- 3.4
if(hak >= 4.0) {
  print("최우수") 
} else if (hak >= 3.5) {
  print("우수")
} else if (hak >= 3.0) {
  print("평범")
} else {
  print("노력필요") 
}

# [1] "평범"


# 응용6
a <- 7
b <- 14
if(a>1 & b>0) { 		# and 사용
  print (a/b)                    #0.5결과
}
if(a>3 | b>20) { 		# or 사용
  print (b%%a)               #0의 결과
}

# 응용7
a <- 10
b <- 20

if (a<=b) {
  d <- b
} else {
  d <- a
}
print(d)
# [1] 20
a <- 10
b <- 20

c <- ifelse(a==b, a, b)
print(c)
# [1] 20


# 응용8
for(i in 3:4) {
  for(j in 1:4) {
    print(paste(i, " * ", j, " = ", i*j))
  }
}

#[1] "3  *  1  =  3"
#[1] "3  *  2  =  6"
#[1] "3  *  3  =  9"
#[1] "3  *  4  =  12"
#[1] "4  *  1  =  4"
#[1] "4  *  2  =  8"
#[1] "4  *  3  =  12"
#[1] "4  *  4  =  16

# 응용9

#cat( ) 함수:print( ) 함수와 같이 출력 함수
#cat( ) 함수의 출력시 개행하지 않음
#개행을 하기위해서 “\n”사용

for(i in 1:5) {
  for(j in 1:i){
    cat('*')
  }
  cat('\n')
}

#*
#**
#***
#****
#*****


# 응용 10번 
for(i in 1:9) {
  cat('12 *', i,'=', 12*i,'\n')
}


#12 * 1 = 12 
#12 * 2 = 24 
#12 * 3 = 36 
#12 * 4 = 48 
#12 * 5 = 60 
#12 * 6 = 72 
#12 * 7 = 84 
#12 * 8 = 96 
#12 * 9 = 108 


# 응용 11번 
gop <- 1
for(i in 1:50) {
  gop <- gop * i 		# gop에 i 값을 누적해서 곱합
}
print(gop)
#[1] 3.041409e+64



#응용 12번 
gop <- 1
i <- 20
while(i <=50) {
  gop <- gop *i 	# gop에 i 값을 누적하여 곱함
  i <- i + 1 	# I 값을 1 증가시킴
}
print(gop)
# [1] 2.500232e+47


# 응용 13번 
scorejjk <- c(70, 80, 69, 50, 95, 60, 82, 71, 88, 84)
which(scorejjk==71) 		# 성적이 71인 학생은 몇 번째에 있나
which(scorejjk>=60) 		# 성적이 60 이상인 학생은 몇 번째에 있나
max(scorejjk) 	 	          # 최고 점수는 몇 점인가
which.max(scorejjk) 		# 최고 점수는 몇 번째에 있나


# 응용 14번 

idx <- which(scorejjk>=90) 		# 성적이 90 이상인 값들의 인덱스
Scorejjk.high <- scorejjk[idx] 	 # 성적이 90 이상인 값들만 추출하여 저장
Scorejjk.high 		                              # score.high의 내용 확인


# 응용 15번 
mpg$grade <- ifelse(mpg$total >= 40, "A", ifelse(mpg$total >= 30, "B", "C"))
head(mpg, 5)  # 데이터 확인
table(mpg$grade) 
qplot(mpg$grade) 
