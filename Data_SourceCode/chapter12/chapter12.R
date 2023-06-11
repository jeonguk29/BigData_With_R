# 문제1

w1 <- 20

w2 <- 40

w3 <- 50

b <- 1000





#문제2



가 mod1 <- lm(weight ~ egg_weight + food, data=Mw_n)

나 1.745x1 + 1.595x2 + 3.664





#문제3 

가 3.664

나 1.745

다 1.595





#문제4



2980





#문제5



-0.04299*x1 - 0.01183*x2 + 0.08036*x3 + 0.13993*x4 + 0.17516*x5 + 0.18082



#문제6

ksj <- data.frame(rbind(c(10, 10, 10)))

# 소괄호, 대괄호 주의 



#문제7

1.9



2





#######################



#2.1 데이터 준비

w <- read.csv("ch5-1.csv", header = TRUE)

w_n <- w[,2:5] 

head(w_n)



# 2.2 선형관계확인

# 몸무게와 종란무게, 먹는양은 상관도가 높음->이동량(movement)는 제외

Mw_n<- w_n[, c(1,2,4)]

head(Mw_n)



# 산점도를 통해 선형 관계 확인

plot(Mw_n, col="red")





# 회귀 모델 구하기

MW_nmodel <- lm(weight~egg_weight+food, Mw_n) # 회귀모델 구하기

MW_nmodel



# 2.4 회귀식 구하기

coef(MW_nmodel)[1] # b 값 출력

coef(MW_nmodel)[2] # W1 값 출력

coef(MW_nmodel)[3] # W2 값 출력



# 닭의 몸무게 예측

b <- coef(MW_nmodel)[1] # b=-3.664

W1 <- coef(MW_nmodel)[2] #W1=1.745

W2 <- coef(MW_nmodel)[3] #W2=1.595



egg_weight <- 71 # 종란무게(egg_weight )=71

food <- 15 # 먹는양(food )=15

weight <- W1*egg_weight+W2*food+ b

weight # 닭의 몸무게

#egg_weight 
#151.5138 




# 로지스틱 회귀분석

iris.new <- iris

iris.new$Species <- as.integer(iris.new$Species) # 범주형 자료를 정수로변환

head(iris.new)



# 로지스틱 회귀모델 도출 

mod.iris <- glm(Species ~Sepal.Length+Sepal.Width+Petal.Length+Petal.Width, data= iris.new)

mod.iris





# 예측 대상 데이터 생성(데이터프레임)

unknown <- data.frame(rbind(c(5.1, 3.5, 1.4, 0.2)))

unknown



names(unknown) <- names(iris)[1:4] # 새로운 데이터에 변수이름 부여

unknown # 예측 대상 데이터에 변수이름이 부여된 결과



# 새로운 데이터 품종 예측

pred <- predict(mod.iris, unknown) # 품종 예측

pred # 예측 결과 출력



round(pred,0) # 예측 결과 출력(소수 첫째 자리에서 반올림)



unknown$Species <- round(pred,0) #unknown에 Species추가

unknown


# unknown
#Sepal.Length Sepal.Width Petal.Length Petal.Width Species
#1          5.1         3.5          1.4         0.2       1
















# 응용



install.packages("car")

library(car)

head(Prestige)

newdata <- Prestige[,c(1:4)] # 회귀식 작성을 위한 데이터 준비

head(newdat)



plot(newdata, col="blue") # 산점도를 통해 변수 간 관계 확인



mod1 <- lm(income ~ education + prestige + women, data=newdata)

mod1



coef(mod1)[1] 

coef(mod1)[2] 

coef(mod1)[3] 

coef(mod1)[4] 



b <- coef(mod1)[1] #y = 177.2x1+141.4x2-50.9x3-253.8

W1 <- coef(mod1)[2] #y = 177.2x1+141.4x2-50.9x3-253.8

W2 <- coef(mod1)[3] #y = 177.2x1+141.4x2-50.9x3-253.8

W3 <- coef(mod1)[4] #y = 177.2x1+141.4x2-50.9x3-253.8



education <- 12 # 교육정도

Prestige <- 63 # 평판

women <- 12 #여성 비율

income<- W1*education + W2*Prestige + W3*women + b 

# y = 177.2X12 + 141.4X63 - 50.9X12 - 253.8

income # 소득 



# 응용2



Fjjk <- read.csv("favoriteC.csv", header = TRUE) # CSV파일을 [F약자]의 이름으로 저장

head(Fjjk)

FCjjk <- Fjjk[, 3:8] 



modjjk <- glm(cluster ~Hamburger+Pizza+Cat+Dog+Summer, data= FCjjk) 

# 로지스틱 회귀모델 도출> mod약자 # 회귀모델의 상세 내용 확인



ksj <- data.frame(rbind(c(7, 6, 5, 10, 8))) 

# 고수정 설문 결과

ksj



names(ksj) <- names(FCjjk)[1:5] # 새로운 데이터에 변수이름 부여

ksj # 예측 대상 데이터



pred <- predict(modjjk , ksj) # 고수정 군집 예측

pred # 예측 결과 출력



round(pred,0) # 예측 결과 출력(소수 첫째 자리에서 반올림)

#3.011273을 반올림하면(가)



ksj$cluster <- round(pred,0) #ksj의 cluster에 예측 결과 대입

ksj