#문제1

#(170-100)^2 + (0.9 - 1.5)^2

# 수정전 √(0.875 - 0)^2 + (0-1)^2      =>  1.338

#가장 거리가 가까운 학생은 A와 C이다 

# 시험은 0.25 정도 나올수 있음





문제2 

mydata <- iris[,1:3] # 데이터 준비

# mydata를 2개의 군집으로 군집화

fit <- kmeans(x=mydata, centers=2)

fit$cluster # 각 데이터에 대한 군집 번호

fit$centers # 각 군집의 중심점 좌표





#문제 3



clusplot(mydata, fit$cluster, color=TRUE, shade=FALSE, labels=1, lines=1)



#문제 4



# 훈련용 데이터와 테스트용 데이터 준비

tr.idx <- c(1:5) # 훈련용 데이터의 인덱스(1행~5행)
ds.tr <- iris[tr.idx, 1:4] # 1행~5행:훈련용 데이터셋  (1부터 4열 사용)
ds.ts <- iris[-tr.idx, 1:4] # 6행:테스트용 데이터셋
cl.tr <- factor(iris[tr.idx, 5]) # 훈련용 데이터셋의 그룹(품종) 정보

cl.ts <- factor(iris[-tr.idx, 5]) # 테스트용 데이터셋의 그룹(품종) 정보
# 기존꺼 빼서 비교할 대상임 


#문제5

predict1 <- knn(ds.tr, ds.ts, cl.tr,  k=4, prob=TRUE ) # 분석해서 알려줌 k=4 바꾼것중 가장 확률높은걸로 사용

# 문제6
acc <- mean( predict1 == cl.ts) # 예측 정확도 (기존에 추출 한것과 비교)







# 문제 7
# wing_length와 tail_length를 사용하여
# breeds를 예측하도록 (가)를 쓰시오.

 c_train <- read.csv(“a.csv", header = TRUE) # 훈련용 데이터셋 불러오기
 c_test read.csv(“b.csv", header = TRUE) # 테스트용 데이터셋 불러오기

# 병아리 품종을 종속변수로 두고 나머지 변수 전체를 독립변수 설정, k = 2으로 해봄

c_knn3 <- kNN(breeds ~ wing_length+ tail_length, c_train, c_test, k = 2)







# 문제 8

acc <- mean( c_test$breeds == c_test$pred2 ) # 예측 정확도



###############

# 실습

# iris데이터 k-평균 군집화

mydata <- iris[,1:4] # 데이터 준비
fit <- kmeans(x=mydata, centers=3) # 3은 군집의 개수
fit

fit$cluster # 각 데이터에 대한 군집 번호
fit$centers # 각 군집의 중심점 좌표



# 차원 축소 후 군집 시각화

library(cluster)

# 데이터, 군집 번호  
clusplot(mydata, fit$cluster, color=TRUE, shade=TRUE, labels=2, lines=0)

# 데이터에서 두 번째 군집의 데이터만 추출
subset(mydata, fit$cluster==2)




#  대상 데이터 표준화 후 군집화
# 변수 A의 값들을 0~1 사이로 표준화하는 공식
std <- function(X) { # 표준화 함수
  
  return((X-min(X)) /(max(X)-min(X)))
  
}

mydata <- apply(iris[,1:4], 2, std) # 표준화된 데이터 준비

fit <- kmeans(x=mydata, centers=3)

fit
fit$cluster # 각 데이터에 대한 군집 번호
fit$centers # 각 군집의 중심점 좌표



# 차원 축소 후 군집 시각화
library(cluster)
clusplot(mydata, fit$cluster, color=TRUE, shade=TRUE, labels=2, lines=0)




# 효과적인 사육을 위한 사육환경 분리 기준 탐색을 위한 k-평균 군집

cl <- read.csv("ch6-3.csv", header = TRUE) # 데이터 셋 불러오기
str(cl) # 데이터 셋 형태 확인
summary(cl)



cl_kmc <- kmeans(cl[,2:3], 3) # k-means 군집 실시, k=3
cl_kmc



cl$cluster <- cl_kmc$cluster # 군집결과 기존 데이터 셋에

head(cl) # 데이터 확인
#breeds weight food cluster
#1      a   2765  217       1
#2      a   2843  235       3
#3      a   2678  207       1
#4      a   2595  204       2
#5      a   2734  226       1
#6      a   2616  197       1

# 산점도를 이용해 군집결과 확인, cluster에 따라 3가지 색상부여
plot(cl$food, cl$weight, col = c("red", "blue", 
                                 
                                 "green")[cl$cluster])


# k-평균 군집 결과 확인
library(cluster)
# clusplot 함수를 이용해 더 보기 쉽게 군집 표현, col.p 옵션을통해 군집에 따른 색상지정
#cluster 패키지의 clusterplot() 함수를 이용할 경우 군집 표시에 더 효과적임

#통해 군집에 따른 색상지정
clusplot(cl[,2:3], cl$cluster, col.p = cl$cluster)



#K-최근접 이웃 분류
# k-최근접 이웃 분류를 이용한 꽃의 종 분류
library(class)

# 훈련용 데이터와 테스트용 데이터 준비

tr.idx <- c(1:25,51:75, 101:125) # 훈련용 데이터의 인덱스
ds.tr <- iris[tr.idx, 1:4] # 훈련용 데이터셋
ds.ts <- iris[-tr.idx, 1:4] # 테스트용 데이터셋
cl.tr <- factor(iris[tr.idx, 5]) # 훈련용 데이터셋의 그룹(품종) 정보
cl.tr

cl.ts <- factor(iris[-tr.idx, 5]) # 테스트용 데이터셋의 그룹(품종) 정보
# 계산 한후 얼마나 정확한지 볼것임 

pred <- knn(ds.tr, ds.ts, cl.tr, k=3, prob=TRUE)
pred
acc <- mean(pred==cl.ts) # 예측 정확도
acc

table(pred,cl.ts) # 예측값과 실제값 비교 통계


# k-최근접 이웃 분류를 이용한 병아리 품종 분류


# 병아리 품종을 종속변수로 두고 나머지 변수 전체를 독립변수 설정, k = 3으로 해봄
install.packages("DMwR2") # k-NN 수행을 위한 패키지 설치
library(DMwR2)

c_train <- read.csv("ch6-2_train.csv", header = TRUE) # 훈련용 데이터셋 불러오기
c_test <- read.csv("ch6-2_test.csv", header = TRUE) # 테스트용 데이터셋 불러오기

c_knn3 <- kNN(breeds ~ wing_length+ tail_length+ comb_height, c_train, c_test, k = 3)
c_test$pred3 <- c_knn3 # 예측값을 c_test 데이터셋에 pred3열을 만들어서 입력
head(c_test) # 데이터 확인



acc<- mean(c_test$breeds== c_test$pred3) # 예측 정확도

acc
table(c_test$breeds,c_test$pred3) # 예측값과 실제값 비교 통계



# k-최근접 이웃 실시(k=5)
# k=3과 k=5가 어떤 차이가 있는가를 실습

c_train <- read.csv("ch6-2_train.csv", header = TRUE) # 훈련용 데이터셋 불러오기
c_test <- read.csv("ch6-2_test.csv", header = TRUE) # 테스트용 데이터셋 불러오기


# 병아리 품종을 종속변수로 두고 나머지 변수 전체를 독립변수 설정, k = 5으로 해봄
c_knn5 <- kNN(breeds ~ wing_length+ tail_length+ comb_height, c_train, c_test, k = 5)
c_test$pred5 <- c_knn5 # 예측값을 c_test 데이터셋에 pred3열을 만들어서 입력
head(c_test) # 데이터 확인


acc<- mean(c_test$breeds== c_test$pred5) # 예측 정확도
acc

table(c_test$breeds,c_test$pred5) # 예측값과 실제값 비교 통계


##################


# 응용 1
# 유사한 점수분포의 학생들을 군집하기 위한 k-평균 군집

cl_jjk <- read.csv("csv_exam.csv", header = TRUE) # 데이터 셋 불러오기
cl_kmcjjk <- kmeans(cl_jjk[,1:3], centers=3) # 3개의 과목에 대해 k-means 군집 실시, k=3
cl_kmcjjk

cl_kmcjjk$cluster # 각 학생의 군집번호
cl_kmcjjk$centers # 각 군집의 중심점 좌표 



# 응용 2


cl_jjk$cluster <- cl_kmcjjk$cluster  # 군집번호를 기존 데이터 셋에 추가
head(cl_jjk) # 데이터 확인



# 응용 3



library(cluster)

# clusplot 함수를 이용해 더 보기 쉽게 군집 표현

clusplot(cl_jjk, cl_jjk$cluster, color=TRUE, shade=TRUE, labels=2, lines=0)



#응용 4



library(class)

# [cl약자]훈련용 데이터와 테스트용 데이터 준비

tr.idx <- c(1:15) # 1~15행까지 훈련용 데이터의 인덱스

ds.tr <- cl_jjk[tr.idx, 3:5] # 훈련용 데이터셋(math, English, science)

ds.ts <- cl_jjk[-tr.idx, 3:5] # 테스트용 데이터셋 (math, English, science)

cl.tr <- factor(cl_jjk[tr.idx, 6]) # 훈련용 데이터셋의 그룹 정보


cl.ts <- cl_jjk[-tr.idx, 6] # 테스트용 데이터셋의 그룹 정보

predjjk <- knn(ds.tr, ds.ts, cl.tr, k=3, prob=TRUE) #k-최근접 이웃 분류

predjjk #16번부터 20번까지의 군집 번호


Acc <- mean(predjjk==cl.ts) # 예측 정확도를 구함
Acc # 예측 정확도는 0.8

table(predjjk,cl.ts) # 예측값과 실제값 비교 통계














# 친구를 찾기 위한 k-평균 군집
# 응용2



#응용5

favoritecsvjjk <- read.csv("2023_favorite.csv", header = TRUE) # 데이터 셋 불러오기

favoritejjk <- kmeans(favoritecsvjjk[,3:7], centers=3) # k-means 군집 실시, k=3

favoritejjk

favoritejjk$cluster # 각 학생의 군집번호

favoritejjk$centers # 각 군집의 중심점 좌표 





#응용6

favoritecsvjjk$cluster<-  favoritejjk$cluster  # 군집결과 기존 데이터 셋에 입력
head(favoritecsvjjk) # 데이터 확인





#응용7

library(cluster)

# clusplot 함수를 이용해 더 보기 쉽게 군집 표현, col.p 옵션을통해 군집에 따른 색상지정

clusplot(favoritecsvjjk, favoritecsvjjk$cluster, color=TRUE, 
         
         shade=FALSE, labels=2, lines=1)





#응용8

library(class)

# 훈련용 데이터와 테스트용 데이터 준비

tr.idx <- c(1:20)  # 1~20행까지 훈련용 데이터의 인덱스

ds.tr <- favoritecsvjjk[tr.idx, 3:7] # 훈련용 데이터셋

ds.ts <- favoritecsvjjk[-tr.idx, 3:7] # 나머지는 테스트용 데이터셋

cl.tr <- factor(favoritecsvjjk[tr.idx,8]) # 훈련용 데이터셋의 그룹 정보

cl.ts <- factor(favoritecsvjjk[-tr.idx,8]) # 테스트용 데이터셋의 그룹 정보

predfavoritejjk <- knn(ds.tr, ds.ts, cl.tr, k=3, prob=TRUE)

predfavoritejjk

Acc <- mean(predfavoritejjk==cl.ts) # 예측 정확도

Acc

table(predfavoritejjk,cl.ts) # 예측값과 실제값 비교 통계












