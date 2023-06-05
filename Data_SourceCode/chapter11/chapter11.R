#독립변수는 여러개 가능 종속변수는 하나
#원인은 여러개 결과는 하나
#밥 많이 먹으면 화장실, 상한음식 먹으면 화장실



문제1 

0.9



문제2

food(섭취량)



문제3

가 

W_model <- lm(weight~egg_weight, w_n)

나, 다,라,마

2.337 + -14.548



문제 4

text(x = 15, y = 90, label = 'Y = 3.96X - 17.57') 

# 회귀직선 텍스트로 표시, x와 y값은 그래프 상의 빈



문제 5

376

#########################

# 상관분석
w <- read.csv("ch5-1.csv", header = TRUE) # 엑셀파일을 불러와서 w에 저장
head(w)

w_n <- w[,2:5] # w 데이터 셋에서 2~5열 데이터만 가져오기
head(w_n) # 첫번째 열은 제외됨


# 병아리의 성장(몸무게)에 영향을 미치는 요소 확인을 위한 상관분석

w_cor <- cor(w_n) # w_n 데이터 셋으로 상관분석한 결과를 w_cor 변수에 넣음
w_cor # w_cor 상관분석 결과 확인
# 상관분석 결과 : 몸무게와 상관관계가 가장 높은 변수는 종란 무게

# 상관 분석 셜과 표현
plot(w_n) 





install.packages("corrplot") # corrplot 패키지 설치
library(corrplot) # corrplot 패키지 불러오기

corrplot(w_cor) # 상관분석 결과인 w_cor을 corrplot 패키지로 실행



corrplot(w_cor, method = "ellipse",
         type = "lower",
         addCoef.col = "white")



# II. 단순선형 회귀분석


#선형관계확인

head(cars)

# 속도와 제동거리의 선형관계를 확인함(산점도)

plot(dist~speed, data=cars) # 산점도를 통해 선형 관계 확인(x축:speed, y축:dist)


# 종속 변수 - 독립변수 순서로 지정해야함!!!!!
# 즉 결과예측 하고 싶은걸 먼저 , 원인을 두 번째( 갑 바꿔서 예측할)
model <- lm(dist~speed, cars) # 회귀모델 구하기(lm)
model

abline(model) # 회귀선을 산점도 위에 표시

# 회귀식 구하기
coef(model)[1] # -17.57909 
coef(model)[2] # 3.932409 



text(x = 15, y = 90, label = 'Y = 3.93X - 17.57') # 회귀직선 텍스트로 표시, x와 y값은 그래프 상의 빈 공간에임의의 점을 선정했음




# 주행속도에 따른 제동거리 예측
b <- coef(model)[1] #b=-17.57
W <- coef(model)[2] #W=3.93

speed <- 50 # 주행속도(speed=50)

dist <- W*speed + b #거리(dist)=W50+b

dist
#   speed 
#179.0413 





#응용
# 초미세먼지에 영향을 미치는 요소는 무엇인가?

wA <- read.csv("2019Atmosphere.csv", header = TRUE) # 2019Atmosphere.csv를 데이터셋으로 불러옴
head(wA)
str(wA)



#응용1
w_nA <-  wA[,3:8] # w 데이터 셋에서 3~8열 데이터만 가져오기
head(w_nA)


#응용2
w_corA <- cor(w_nA) # w_nA 데이터 셋으로 상관분석한 결과를 w_corA 변수에 넣음
w_corA # w_corA 상관분석 결과 확인



#응용3

corrplot(w_corA)

corrplot(w_corA, method = "circle",
         
         type = "upper",
         
         addCoef.col = "white")



# 응용4
#초미세먼지량과 가장 상관도가 높았던 요소(PM25)
#미세먼지(PM10)


w <- read.csv("2019Atmosphere.csv", header = TRUE) 
w_nA <-  wA[,3:8]
head(w_nA)



#응용5
head(w_nA)
plot(PM25~PM10, data=w_nA) # 산점도를 통해 선형 관계 확인(x축:speed, y축:dist)



#응용6
# 단순선형 회귀분석을 이용한 초미세먼지량 예측

W_nAmodel <- lm(PM25~PM10, w_nA)
W_nAmodel



#응용7

abline(W_nAmodel) # 회귀선을 산점도 위에 표시



#응용8

coef(W_nAmodel)[1] #  6.637705
coef(W_nAmodel)[2] # 0.2973959 







#응용9

text(x = 120, y = 60 , label = 'Y = 0.2974X +6.6377') 
# 회귀직선 텍스트로 표시, x와 y값은 그래프 상의 빈 공간에





#응용10



b <- coef(W_nAmodel)[1] #b=-17.57
W <- coef(W_nAmodel)[2] #W=3.93


# 미세먼지가 60이면 초미세먼지는 24.48일 것이다
# 회귀식에 의하여 미세먼지량을 입력하면 초미세먼지량을 예측할 수 있음

pm10 <- 60 # pm10=60
pm25<- W*pm10 + b #PM25=W*pm10+b

pm25

#    PM10 
#24.48146 







