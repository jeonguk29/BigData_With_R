w <- read.csv("사고유형별_교통사고_20230528170712.csv", header = TRUE)
head(w)
str(w)

# 차대사람 상관 분석 실시 
w_n <- w[c(1,2,3,4,5), c(2,4,5,6)]
w_n
head(w_n)

# 사건 건수만 뽑아 보기
car_and_people = w_n[,2:4]
str(car_and_people)
w_cor <- cor(car_and_people)
w_cor

#           사건 건수 
# 사망자수  0.9342759 상관도를 미침 
# 부상자수  0.9999659 상관도를 미침 


# 사건건수에 영향을 미치는 요소 확인을 위한 상관분석
par(family = "AppleGothic") # Mac에서 Plot 그릴때 한글 깨짐 해결책
plot(car_and_people)

