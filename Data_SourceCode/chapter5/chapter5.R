
# Chapter5. 그래프를 이용한 데이터 탐색


# 1. 단일변수 범주형 데이터의 탐색!!!

#2. 도수분포표의 작성
favorite <- c('WINTER', 'SUMMER', 'SPRING', 'SUMMER', 'SUMMER', 'FALL', 'FALL', 'SUMMER', 'SPRING', 'SPRING')


favorite 			   	         # favorite의 내용 출력
#  [1] "WINTER" "SUMMER" "SPRING" "SUMMER" "SUMMER" "FALL"   "FALL"   "SUMMER" "SPRING" "SPRING"

table(favorite) 			         # 도수분포표 계산
#favorite
#FALL SPRING SUMMER WINTER 
#   2      3      4      1 

table(favorite)/length(favorite) 	# 비율 = 해당갯수/전체갯수

#favorite
# FALL SPRING SUMMER WINTER 
# 0.2    0.3    0.4    0.1 


# 3. 막대그래프
ds <- table(favorite)
ds
barplot(ds, main='favorite season')        

# 4. 원그래프
pie(ds, main='favorite seasion')




# 숫자로 표현된 범주형 데이터 
# 학생 15명이 선호하는 색깔을 조사한 데이터
# (1=초록, 2=빨강, 3=파랑)
favorite.color <- c(2, 3, 2, 1, 1, 2, 2, 1, 3, 2, 1, 3, 2, 1, 2)
ds <- table(favorite.color)
ds

#favorite.color
#1 2 3 
#5 7 3 


barplot(ds, main='favorite color')


colors <- c('green', 'red', 'blue') # 자료값 1,2,3을 green, red, blue로 변경 
names(ds) <- colors
ds

#green   red  blue 
#    5     7     3 

barplot(ds, main='favorite color', col=colors) # 색 지정 막대그래프

pie(ds, main='favorite color', col=colors) # 색 지정 원그래프 





### 단일변수 연속형 데이터 탐색

#연속형 데이터는 관측값들이 크기를 가지기 때문에 범주형 데이터에 비해 다양한 분석 방법이 존재
#평균, 중앙값 : 전체 데이터를 대표할 수 있는 값
#중앙값(median) : 데이터의 값들을 크기순으로 일렬로 줄 세웠을 때, 가장 중앙에 위치하는 값
#절사평균(trimmed mean)은 데이터의 관측값들 중에서 작은 값들의 하위 n%와 큰 값들의 상위 n%를 제외하고 중간에 있는 나머지 값들만 가지고 평균을 계산


weight <- c(60, 62, 64, 65, 68, 69)

weight.heavy <-c(weight, 120)

weight
# [1] 60 62 64 65 68 69
weight.heavy
# [1]  60  62  64  65  68  69 120


mean(weight)# 평균
# [1] 64.66667
mean(weight.heavy) # 평균
# [1] 65


median(weight) # 중앙값
# [1] 64.5
median(weight.heavy) # 중앙값
# [1] 65




mean(weight, trim=0.2) # 절사평균(상하위 20% 제외)
# [1] 64.75
mean(weight.heavy, trim=0.2) # 절사평균(상하위 20% 제외)
# [1] 65.6




# 2. 사분위수
#사분위수(quatile)란 주어진 데이터에 있는 값들을 크기순으로 나열했을 때 이것을 4등분하는 지점에 있는 값들을 의미
#데이터에 있는 값들을 4등분하면 등분점이 3개 생기는데, 앞에서부터 ‘제1사분위수(Q1)’, ‘제2사분위수(Q2)’, ‘제3사분위수(Q3)’라고 부르며, 
#제2사분위수(Q2)는 중앙값과 동일 전체 데이터를 4개로 나누었기 때문에 4개의 구간에는 각각 25%의 데이터가 존재

mydata <- c(60,62,64,65,68,69,120)

quantile(mydata)  # 평균 사분위 값
#0%   25%   50%   75%  100% 
#60.0  63.0  65.0  68.5 120.0 

quantile(mydata, (0:10)/10) # 10% 단위로 구간을 나누어 계산
#0%   10%   20%   30%   40%   50%   60%   70%   80%   90%  100% 
#60.0  61.2  62.4  63.6  64.4  65.0  66.8  68.2  68.8  89.4 120.0 

summary(mydata)
#Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#60.00   63.00   65.00   72.57   68.50  120.00 



## 산포 : 산포(distribution)란 주어진 데이터에 있는 값들이 퍼져 있는 정도(흩어져 있는 정도)



mydata <- c(60,62,64,65,68,69,120)

var(mydata) # 분산
# [1] 447.2857

sd(mydata) # 표준편차
# [1] 21.14913

range(mydata) # 값의 범위
# [1]  60 120

diff(range(mydata)) # 최댓값, 최솟값의 차이
# [1] 60



# 4. 히스토그램
#히스토그램(histogram)은 외관상 막대그래프와 비슷한 그래프=> 연속형 데이터의 분포를 시각화할 때 사용
#막대그래프를 그리려면 값의 종류별로 개수를 셀 수 이어야 하는데, 키와 몸무게 등의 데이터는 값의 종류라는 개념이 없어서 
#종류별로 개수를 셀 수 없음
#대신에 연속형 데이터에서는 구간을 나누고 구간에 속하는 값들의 개수를 세는 방법을 사용


cars

dist <- cars[,2] # 두번째 번수인 자동차 제동거리만 dist에 저장

hist(dist, # 데이터(data)
     
     main="Histogram for 제동거리", # 제목
     
     xlab ="제동거리", # x축 레이블
     
     ylab="빈도수", # y축 레이블
     
     border="blue", # 막대 테두리색
     
     col="green", # 막대 색
     
     las=0) 





# 5. 상자그림
#상자그림(box plot): 상자 수염 그림(box and whisker plot)으로도 부르며, 
#사분위수를 시각화하여 그래프 형태로 나타낸 것
#하나의 그래프로 데이터의 분포 형태를 포함한 다양한 정보를 전달하기 때문에 단일변수 수치형 데이터를 파악하는 데 자주 사용



dist <- cars[,2] # 자동차 제동거리(단위: 피트)

boxplot(dist, main="자동차 제동거리")



# 6. 그룹이 있는 데이터 상자그림
boxplot(Petal.Length~Species, data=iris, main="품종별 꽃잎의 길이")
# 품종별 꽃잎의 길이에 따른 품종별 차이를 분석
# ~ 라고해서 ~부터 ~ 까지가 아니라 딱 2개 선택 하는 것임 



# 한 화면에 그래프 여러 개 출력하기
par(mfrow=c(1,3))

boxplot(Petal.Length~Species, data=iris, main="품종별 꽃잎의 길이")

boxplot(Petal.Length~Species, data=iris, main="품종별 꽃잎의 길이")

boxplot(Petal.Length~Species, data=iris, main="품종별 꽃잎의 길이")

par(mfrow=c(1,1)) # 가상 화면 분할 해제 












# 다중변수 자료의 탐색_산점도 산점도 



wt <- mtcars$wt

mpg <- mtcars$mpg

plot(wt, mpg, main="중량-연비 그래프",
     
     xlab="중량",
     
     ylab="연비(MPG)",
     
     col="red",
     
     pch=19
     
)
# 중량이 증가할수록 연비는 감소하는 경향을 확인



#wt <-mtcars$wt 			# 중량 데이터
#mpg <- mtcars$mpg 		# 연비 데이터
#plot(wt, mpg, 			# 2개 변수(x축, y축)
#     main="중량-연비 그래프", 	# 제목
#     xlab="중량", 		# x축 레이블
#     ylab="연비(MPG)", 	# y축 레이블
#     col="red", 		          # point의 color
#     pch=19) 			# point의 종류 






# 대상변수로 4개만을 지정하여 실습
vars <- c("mpg","disp","drat","wt") # 대상 변수

target <- mtcars[,vars]

head(target)

#                    mpg disp drat    wt
#Mazda RX4         21.0  160 3.90 2.620
#Mazda RX4 Wag     21.0  160 3.90 2.875
#Datsun 710        22.8  108 3.85 2.320
#Hornet 4 Drive    21.4  258 3.08 3.215
#Hornet Sportabout 18.7  360 3.15 3.440
#Valiant           18.1  225 2.76 3.460

pairs(target, # 대상 데이터
      
      main="Multi Plots")




# 3. 그룹 정보가 있는 두 변수의 산점도
#iris
iris.2 <- iris[,3:4] # 데이터 준비
#iris.2
point <- as.numeric(iris$Species) # 점의 모양
point           # point 내용 출력



color <- c("red","green","blue") # 점의 컬러

plot(iris.2,
     
     main="Iris plot",
     
     pch=c(point),
     
     col=color[point])




# V. 다중변수 자료의 탐색_ 상관분석

# 상관계수의 계산 

beers = c(5,2,9,8,3,7,3,5,3,5)              # 데이터 입력 음주

bal <- c(0.1,0.03,0.19,0.12,0.04,0.0095,0.07, # 데이터 입력 알콜농도
         
         0.06,0.02,0.05)

tbl <- data.frame(beers,bal)            # 데이터프레임 생성
tbl


plot(bal~beers,data=tbl)                      # 산점도

res <- lm(bal~beers,data=tbl)                     # 회귀식 도출(둘간의 관계식)
abline(res)                               # 회귀선 그리기(두 변수간의 관계선 그리기)

cor(beers,bal)                               # 상관계수 계산
# [1] 0.6797025


cor(iris[,1:4]) 		# 4개 변수 간 상관성 분석

#               Sepal.Length Sepal.Width Petal.Length Petal.Width
#Sepal.Length    1.0000000  -0.1175698    0.8717538   0.8179411
#Sepal.Width    -0.1175698   1.0000000   -0.4284401  -0.3661259
#Petal.Length    0.8717538  -0.4284401    1.0000000   0.9628654
#Petal.Width     0.8179411  -0.3661259    0.9628654   1.0000000






# VI. 다중변수 자료의 탐색_ 선그래프


#월별 지각하는 학생수 데이터
month = 1:12 # 데이터 입력
late = c(5,8,7,9,4,6,12,13,8,6,6,4) 	# 데이터 입력(지각하는 학생수)

plot(month, 			# x data
     late, 			# y data
     main="지각생 통계", 	# 제목
     type= "l", 		          # 그래프의 종류 선택(알파벳)
     lty=1, 			# 선의 종류(line type) 선택
     lwd=1, 			# 선의 굵기 선택
     xlab="Month", 		# x축 레이블
     ylab="Late cnt" 		# y축 레이블
)




# 복수의 선그래프의 작성   
# 2.1 여러 학급의 월별 지각생 통계
month = 1:12
late1 = c(5,8,7,9,4,6,12,13,8,6,6,4)
late2 = c(4,6,5,8,7,8,10,11,6,5,7,3)
plot(month, 			# x data
     late1, 			# y data
     main="Late Students",
     type= "b", 		         # 그래프의 종류 선택(알파벳)
     lty=1, 			# 선의 종류(line type) 선택
     col="red", 		          # 선의 색 선택 
     xlab="Month ", 		# x축 레이블
     ylab="Late cnt", 		# y축 레이블
     ylim=c(1, 15) 		# y축 값의 (하한, 상한)
)

lines(month, 			# x data
      late2, 			# y data
      type = "b", 		# 선의 종류(line type) 선택
      col = "blue") 		# 선의 색 선택



## A



favorite.foodjjk <-c('햄버거', '피자', '피자', '치킨', '치킨', '파스타')

favorite.foodjjk

table(favorite.foodjjk) # 가 : 통계



table(favorite.foodjjk)/length(favorite.foodjjk) # 나 : 비율 







ds.foodjjk <- table(favorite.foodjjk)

ds.foodjjk

# 다
barplot(ds.foodjjk, main='자기가 좋아하는 음식 통계')  #다 
# 라 
pie(ds.foodjjk, main='자기가 좋아하는 음식 통계 (원') # 라 




# 마 
colorsjjk <- c('pink','blue','red', 'gray' ) #마

names(ds.foodjjk) <- colorsjjk



#바 

barplot(ds.foodjjk, main='색을 넣음 막대 그래프', col=colorsjjk) # 색 지정 막대그래프

#사

pie(ds.foodjjk, main='색을 넣음 막대 그래프', col=colorsjjk) # 색 지정 원그래프 





## 문제 B



mydatajjk <- c(50, 60, 62, 64, 65, 68, 70, 80, 90, 100)

mean(mydatajjk, trim=0.3) #가



#나

quantile(mydatajjk)  # 평균 사분위 값 



#다

quantile(mydatajjk, (0:5)/5) # 20% 단위로 구간을 나누어 계산





mydatajjk <-c(50, 60, 62, 64, 65, 68, 70, 80, 90, 100)

#라

var(mydatajjk) # 분산

#마

sd(mydatajjk) # 표준편차

#바

range(mydatajjk) # 값의 범위

#사

diff(range(mydatajjk)) # 최댓값, 최솟값의 차이







mydatajjk <-c(50, 60, 62, 64, 65, 68, 70, 80, 90, 100)



#아

hist(mydatajjk, # 데이터(data)
     
     main="자기이름 점수 분포", # 제목
     
     xlab ="점수", # x축 레이블
     
     ylab="빈도수", # y축 레이블
     
     border="yellow", # 막대 테두리색
     
     col="pink", # 막대 색
     
     las=1) 


# las=1 처럼 글씨 방향, 출력 이름 잘 보고 풀기 


#자

boxplot(Petal.Width~Species, data=iris, main="품종별 꽃잎의 길이")





### 문제 C



#가

iris.jjk <- iris[,1:2] # 데이터 준비

point <- as.numeric(iris$Species) # 점의 모양

point           # point 내용 출력



##나

color <- c("gray","red","blue") # 점의 컬러

#다 

plot(iris.jjk,
     
     main="꽃받침과 꽃의 종과의 관계",
     
     pch=c(point),
     
     col=color[point])





######D





piejjk = c(3,1,4,5,3)              # 먹은 초코파이수

wjjk <-  c(70.3,67.2,76.2,80.3,70.6)   # 체중



#가

pie_wjjk <- data.frame(piejjk,wjjk)            # 데이터프레임 생성

pie_wjjk



#나

plot(wjjk~piejjk,data=pie_wjjk)                      # 산점도



#다

resjjk <- lm(wjjk~piejjk,data=pie_wjjk)                     # 회귀식 도출(둘간의 관계식)

#라

abline(resjjk)                               # 회귀선 그리기(두 변수간의 관계선 그리기

#마

cor(piejjk,wjjk)                               # 상관계수 계산



########## E



#월별 A반과 B반의 커피 소비수 비교

month = 1:12
Aclassjjk = c(10,20,30,11,15,16,18,16,3,26,10,11)
Bclassjjk = c(13,22,20,31,25,6,28,13,16,20,10)
plot(month, Aclassjjk, main = "월별 커피 소비수 비교", type="b", lty=1, col="blue", xlab ="월", ylab =" 커피소비수", ylim=c(1,30))

 lines(month, 			# x data
       Bclassjjk, 			# y data
      type = "b", 		# 선의 종류(line type) 선택
      col = "green") 		# 선의 색 선택


 
 
 
 

