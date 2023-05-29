# CSV 파일 읽기
w <- read.csv("사고유형별_교통사고_20230528170712.csv", header = TRUE)

# 데이터 확인
head(w)
str(w)

# 차대사람, 차대차, 차량단독 상관 분석 실시 
w_n <- w[, c(2, 4, 5, 6)]
w_n
head(w_n)

# 사건 건수, 사망자수, 부상자수만 추출
car_and_people <- w_n[, 2:4]
str(car_and_people)

# 상관 계수 구하기
w_cor <- cor(car_and_people)
w_cor

# 사건 건수와 사망자수 간의 상관 관계: 0.7582690 (유의미한 상관 관계)
# 사건 건수와 부상자수 간의 상관 관계: 0.9955893 (유의미한 상관 관계)

# 사건 건수에 영향을 미치는 요소 확인을 위한 상관 분석 시각화
par(family = "AppleGothic")  # 한글 폰트 설정 (Mac에서 그래프 한글 깨짐 해결)


plot(car_and_people)
corrplot(w_cor)

# 단순 선형 회귀분석
plot(사망자수~사고건수, data = car_and_people)
# 사고건수와 사망자수는 상관관계가 있음

# 회귀 모델 구하기
model <- lm(사망자수~사고건수, car_and_people)
model

abline(model)  # 회귀선을 산점도 위에 표시

# 회귀식 출력
coef(model)[1]
coef(model)[2]

# 회귀식을 그래프 상에 표기
text(x = 40000, y = 500, label = 'Y = 0.00576X - 134.1851')
# x와 y값은 그래프 상의 빈 공간에 회귀직선 텍스트로 표시

# 교통사고 사건 건수에 대한 사망자 수 예측
b <- coef(model)[1]  # b = 134.1851 
W <- coef(model)[2]  # W = 0.00576773 
accident <- 8000

expected_number_of_deaths <- W * accident + b 
expected_number_of_deaths
# 사고건수가 8000번이면 예상 사망자 수는 약 180.327명



##################################################

# 부상자수와 사고건수 간의 관계 분석
plot(부상자수 ~ 사고건수, data = car_and_people)
# 사고건수와 부상자수는 상관관계가 있음

# 회귀 모델 구하기
model <- lm(부상자수 ~ 사고건수, car_and_people)
model

abline(model)  # 회귀선을 산점도 위에 표시

# 회귀식 출력
coef(model)[1]
coef(model)[2]

# 회귀식을 그래프 상에 표기
text(x = 40000, y = 80000, label = 'Y = 1.5347X - 1550.065')
# x와 y값은 그래프 상의 빈 공간에 회귀직선 텍스트로 표시

# 교통사고 사건 건수에 대한 부상자 수 예측
b <- coef(model)[1]  # b = -1550.065 
W <- coef(model)[2]  # W = 1.534778
accident <- 8000

Prediction_of_the_number_of_injured <- W * accident + b 
Prediction_of_the_number_of_injured
# 사고건수가 8000번이면 예상 부상자 수는 약 10728.16명





# 회귀식 y(사망자수) = x(사고건수)*(5.768e-03)+(1.342e+02)
# 회귀식 y(부상자수) = x(사고건수)*1.535-1550.065

# 상세적으로
# 회귀식 y(사망자수) = x(사고건수)*0.00576773+134.1851
# 회귀식 y(부상자수) = x(사고건수)*1.534778-1550.065
