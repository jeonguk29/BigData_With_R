# 원시 데이터 입력하기 

# 직접 데이터 입력하기
ID <- c(1, 2, 3, 4, 5)
ID
Gender <- c("F", "M", "F", "M", "F")
Gender
DATA <- data.frame(ID = ID, GENDER = Gender)
View(DATA)

# 외부 데이터 가져오기:TXT 파일

# TXT 파일 가져오기
# ex_data <- read.table("C:/Rstudy/약자_chapter4/data_ex.txt", encoding = "EUC-KR", fileEncoding = "UTF-8") #절대 경로로 가져오기
ex_data <- read.table("data_ex.txt", encoding = "EUC-KR", fileEncoding = "UTF-8")
ex_data # 변수 명이 임의로 지정됨 

#V1     V2  V3   V4
#1  ID GENDER AGE AREA
#2   1      F  50 서울
#3   2      M  40 경기
#4   3      F  28 제주
#5   4      M  50 서울
#6   5      M  27 서울
#7   6      F  23 서울
#8   7      F  56 경기
#9   8      F  47 서울
#10  9      M  20 인천
#11 10      F  38 경기

View(ex_data)


# TXT 파일 가져오기
ex_data<-read.table("data_ex.txt", header= TRUE, nrows= 2, encoding= "EUC-KR", fileEncoding = "UTF-8")
ex_data

# 1행을 변수명이라고 지정하고 2줄 가져오기 
#ID GENDER AGE AREA
#1  1      F  50 서울
#2  2      M  40 경기






ex_data<-read.table("data_ex.txt", header= TRUE, skip= 2, nrows= 5, encoding= "EUC-KR", fileEncoding = "UTF-8") 
ex_data
# 두번째 줄까지 스킵하고, 총 5줄을 출력

#X2 M X40 경기
#1  3 F  28 제주
#2  4 M  50 서울
#3  5 M  27 서울
#4  6 F  23 서울
#5  7 F  56 경기


#header 옵션- 원시 데이터 1행이 변수명인지 아닌지 판단하는 옵션
#header = TRUE 옵션을 추가하여 원시 데이터 1행이 변수명임을 지정하고 ex_data1로 저장


# 변수명 지정하기
ex_data1 <- read.table("data_ex.txt", encoding = "EUC-KR",  fileEncoding = "UTF-8", header = TRUE)
View(ex_data1) #원시 데이터의 1행이 변수명으로 지정



# 변수명으로 사용할 행이 없을 때
varname <- c("A", "B", "C", "D")
ex1_data <- read.table("data_ex.txt", encoding = "EUC-KR", fileEncoding = "UTF-8", col.names = varname)
ex1_data
View(ex1_data)

#A      B   C    D
#1  ID GENDER AGE AREA
#2   1      F  50 서울
#3   2      M  40 경기
#4   3      F  28 제주
#5   4      M  50 서울
#6   5      M  27 서울
#7   6      F  23 서울
#8   7      F  56 경기
#9   8      F  47 서울
#10  9      M  20 인천
#11 10      F  38 경기


#skip 옵션 - 데이터 전체가 아니라 옵션에 지정한 특정 행까지 제외하고 그 이후 행부터 가져옴
#데이터를 두 줄 건너뛰고 가져와 변수 ex_data2로 저장

ex_data2 <- read.table("data_ex.txt", encoding = "EUC-KR", fileEncoding = "UTF-8", header = TRUE, skip = 2)
ex_data2
View(ex_data2)


#nrows 옵션- 몇 개의 행을 불러올지 지정
#불러올 행 개수를 7개로 지정한 후 변수 ex_data3으로 저장

ex_data3 <- read.table("data_ex.txt", encoding = "EUC-KR", fileEncoding = "UTF-8", header = TRUE, nrows = 7)
ex_data3
View(ex_data3)

#ID GENDER AGE AREA
#1  1      F  50 서울
#2  2      M  40 경기
#3  3      F  28 제주
#4  4      M  50 서울
#5  5      M  27 서울
#6  6      F  23 서울
#7  7      F  56 경기



# 데이터 구분자 지정하여 가져오기

#sep 옵션 - 데이터 구분자를 지정
#쉼표(,)로 값이 구분된 data_ex1.txt 데이터를 가져오기 - 구분자가 쉼표(,)이므로 sep 옵션을 sep = ","로 지정

ex_data4 <- read.table("data_ex1.txt", encoding = "EUC-KR",fileEncoding = "UTF-8", header = TRUE, sep = ",")
ex_data4

#ID GENDER AGE AREA
#1   1      F  50 서울
#2   2      M  40 경기
#3   3      F  28 제주
#4   4      M  50 서울
#5   5      M  27 서울
#6   6      F  23 서울
#7   7      F  56 경기
#8   8      F  47 서울
#9   9      M  20 인천
#10 10      F  38 경기
View(ex_data4)



# 외부 데이터 가져오기: CSV 파일
# CSV 파일 가져오기
# CSV 파일을 가져올 때는 read.csv( ) 함수를 사용하며 read.table( ) 함수와 사용법이 유사

ex_data <- read.csv("data_ex.csv")
ex_data
View(ex_data)


#5. 외부 데이터 가져오기: 엑셀 파일

# 엑셀 파일 가져오기

# readxl 패키지 설치 및 로드하기
#install.packages('readxl')
#library(readxl)

excel_data_ex <- read_excel("data_ex.xlsx")
excel_data_ex # 첫 번째 행을 변수명으로 가져옴
View(excel_data_ex)


# 엑셀 파일에 시트 탭이 여러 개일 때
#read_excel( ) 함수는 기본값으로 첫 번째 시트 탭의 데이터를 가져옴
#만약 시트 탭이 여러 개여서 첫 번째 외의 다른 탭 시트 데이터를 가져오려면 sheet 옵션을 사용
excel_data_ex <- read_excel("data_ex.xlsx", sheet = 2)
excel_data_ex

# 6. 외부 데이터 가져오기: XML, JSON 파일
# XML 패키지 설치 및 로드하기
#install.packages("XML")
#library(XML)


xml_data <- xmlToDataFrame("data_ex.xml")
xml_data
View(xml_data)

#ID GENDER AGE
#1  1      F  50
#2  2      M  40
#3  3      F  28
#4  4      M  50
#5  5      M  27




# jsonlite 패키지 설치 및 로드하기
#install.packages("jsonlite")
#library(jsonlite)


# JSON 파일 가져오기
json_data <- fromJSON("data_ex.json")
str(json_data)
#실행 결과는 View( ) 함수가 아닌 str ( ) 함수로 데이터 구조 살펴보기





#II. 데이터 구조를 관측하는 방법

# 데이터 다루기 

data("iris")
iris #data( ) 함수에 불러올 데이터 세트 이름 iris를 넣어 실행하면 내장된 데이터 세트를 변수로 저장하여 가져옴
 

str(iris) # 데이터 구조 확인하기
#str( ) 함수는 전체적인 데이터 구조를 파악할 수 있음

#'data.frame':	150 obs. of  5 variables:
#  $ Sepal.Length: num  5.1 4.9 4.7 4.6 5 5.4 4.6 5 4.4 4.9 ...
#$ Sepal.Width : num  3.5 3 3.2 3.1 3.6 3.9 3.4 3.4 2.9 3.1 ...
#$ Petal.Length: num  1.4 1.4 1.3 1.5 1.4 1.7 1.4 1.5 1.4 1.5 ...
#$ Petal.Width : num  0.2 0.2 0.2 0.2 0.2 0.4 0.3 0.2 0.2 0.1 ...
#$ Species     : Factor w/ 3 levels "setosa","versicolor",..: 1 1 1 1 1 1 1 1 1 1 ...


ncol(iris) # 데이터 프레임 컬럼(열) 개수를 확인

nrow(iris) # 데이터 프레임 관측치(행) 개수를 확인

dim(iris) # 데이터 프레임 컬럼(열) 및 관측치(행) 개수를 확인


#length( ) 함수
data <- c(1,2,3,4,5)

length(data)

length(iris) # 열 개수 : iris 데이터 세트 열의 개수를 확인
length(iris$Species) #해당열 행 개수 : iris 데이터 세트 Species 열의 데이터 개수를 확인



#데이터 세트 컬럼명 확인하기
ls(iris)      # ls( ) 함수는 컬럼명을 확인할 때 사용
# [1] "Petal.Length" "Petal.Width"  "Sepal.Length" "Sepal.Width"  "Species"     


head(iris) # 데이터 앞부분 값 확인하기

tail(iris, n = 3) # tail( ) 함수를 이용해 뒷부분 값 3개를 출력

#    Sepal.Length Sepal.Width Petal.Length Petal.Width   Species
#148          6.5         3.0          5.2         2.0 virginica
#149          6.2         3.4          5.4         2.3 virginica
#150          5.9         3.0          5.1         1.8 virginica



# 6. 기술통계량 확인하기
#mean( ) 함수: 평균
#median( ) 함수: 중앙값

mean(iris$Sepal.Length)
#[1] 5.843333

median(iris$Sepal.Length)
#[1] 5.8


# 7. 최솟값, 최댓값과 범위
#min( ) 함수: 최솟값
#max( ) 함수: 최댓값
#range( ) 함수: 최댓값에서 최솟값의 범위

min(iris$Sepal.Length)
#[1] 4.3
 
max(iris$Sepal.Length)
#[1] 7.9
 
range(iris$Sepal.Length)
#[1] 4.3 7.9


# 8. 분위수 
#분위수(quantile): 전체 데이터를 크기 순으로 정렬하여 n개로 나누었을 때 그 경계에 해당하는 값
#사분위수(quartile): 데이터를 4등분 한 지점의 관측값
#제1사분위수(Q1): 제0.25분위수, 하위 25%에 해당하는 값
#제2사분위수(Q2): 제0.50분위수, 50%에 해당하는 값
#제3사분위수(Q3): 제0.75분위수, 하위 75% 혹은 상위 25%에 해당하는 값
#제4사분위수(Q4): 제1분위수, 100%에 해당하는 값


quantile(iris$Sepal.Length) # 사분위수 구하기
#0%  25%  50%  75% 100% 
#4.3  5.1  5.8  6.4  7.9 

quantile(iris$Sepal.Length, probs = 0.25) #제1사분위수
#25% 
#5.1 

quantile(iris$Sepal.Length, probs = 0.50) #제2사분위수
#50% 
#5.8 

quantile(iris$Sepal.Length, probs = 0.75) #제3사분위수
#75% 
#6.4 

quantile(iris$Sepal.Length, probs = 1.0) #제4사분위수
#100% 
#7.9 

quantile(iris$Sepal.Length, probs = 0.80) #제0.8분위수
#80% 
#6.52 



# 10. 분산과 표준편차
#분산과 표준편차: 데이터가 대푯값에서 어느 정도 흩어져 있는지 산포도를 판단하는 통계량
#분산(variance): 데이터가 평균으로부터 퍼진 정도를 설명하는 통계량 - 값이 클수록 평균에서 데이터 값이 퍼진 정도가 넓음
#표준편차(standard deviation): 데이터 값이 퍼진 정도를 설명하는 통계량 - 값이 클수록 데이터 값이 넓게 퍼짐을 의미

#var( ) 함수: 분산
#sd( ) 함수: 표준편차
#Sepal.Length 변수의 분산과 표준편차

# 분산과 표준편차 구하기
var(iris$Sepal.Length) # [1] 0.6856935
sd(iris$Sepal.Length) # [1] 0.8280661




# 11. 첨도와 왜도
#첨도와 왜도는 데이터의 비대칭도를 파악하는 기술통계량
#첨도(kurtosis): 데이터 분포가 정규분포 대비 뾰족한 정도를 설명하는 통계량으로 데이터가 어느 정도로 
#중심에 몰려 있는지를 파악
#왜도(skewness)는 데이터 분포의 비대칭성을 설명하는 통계량으로 데이터가 어느 방향으로 치우쳐 있는지 
#또는 대칭을 띄고 있는지 파악

#kurtosi( ) 함수: 첨도
#skew( ) 함수: 왜도


# psych 패키지 설치 및 로드하기
install.packages("psych")
library(psych)

kurtosi(iris$Sepal.Length)
# [1] -0.6058125
skew(iris$Sepal.Length)
# [1] 0.3086407

#첨도는 -0.6058125로 0보다 작으므로 데이터가 정규분포 대비 완만한 분포를 띄고 있음을 의미
#왜도는 양수 0.3086407로 0보다 크므로 오른쪽으로 긴 꼬리를 가지는 분포 형태를 가짐





# 12. 데이터 빈도분석하기
#빈도분석(frequency analysis): 데이터의 항목별 빈도 및 빈도 비율을 나타내는 방법
#- 빈도분석에는 주로 freq( ) 함수를 사용

# descr 패키지 설치 및 로드하기
install.packages("descr")
library(descr)

freq_test <- freq(iris$Sepal.Length, plot = F)
freq_test
#plot = F 옵션: 막대 그래프 출력을 제외




#III. 데이터를 탐색하여 그래프로 구현

# 막대그래프 그리기

# descr 패키지 설치 및 로드하기
install.packages("descr")
library(descr)
library(readxl)


exdatal <- read_excel("Sample1.xlsx")
exdatal
#정상적으로 데이터가 출력되는 것을 확인한 후 GENDER 변수 빈도 분포를 출력
#- freq( ) 함수에 plot = T 옵션을 설정하고 main 옵션에는 그래프 제목을 기입
freq(exdatal$GENDER, plot = T, main = '성별(barplot)')



#barplot( ) 함수
#barplot( ) 함수는 별도의 패키지를 설치하지 않아도 막대 그래프를 그릴 수 있음
#하지만 빈도분포를 구하는 기능이 없기 때문에 table( ) 함수를 함께 사용


dist_GENDER <- table(exdatal$GENDER)
dist_GENDER

barplot(dist_GENDER)




# ylim 옵션으로 0~12까지 있는 y축 범위를 변경하고, 
#그래프 제목과 축 제목, 컬럼 제목을 지정하여 그래프를 좀 더 보기 좋게 다듬기

barplot(dist_GENDER, ylim = c(0, 14), main = "BARPLOT", xlab = "GENDER", ylab = "FREQUENCY", names = c("Female", "Male"))



# 색상 변경

barplot(dist_GENDER, ylim = c(0, 14), main = "BARPLOT", xlab = "GENDER", ylab = "FREQUENCY", names = c("Female", "Male"), col = c("pink", "navy"))



# 2. 상자 그림 그리기
boxplot(exdatal$Y21_CNT, exdatal$Y20_CNT)





boxplot(exdatal$Y21_CNT, exdatal$Y20_CNT,
        
        ylim = c(0, 60), main = "boxplot",
        
        names = c("21년건수", "20년건수"))





# 상자 그림 색상 변경하기

boxplot(exdatal$Y21_CNT, exdatal$Y20_CNT,
        
        ylim = c(0, 60), main = "boxplot",
        
        names = c("21년건수", "20년건수"),
        
        col = c("green", "yellow"))





# 히스토그램 그리기

hist(exdatal$AGE, xlim = c(0, 60), ylim = c(0, 7), main = "AGE분포")





# 4. 파이차트 그리기
data(mtcars)
x <- table(mtcars$gear)
pie(x)



# 산점도 그리기

data(iris)

plot(x = iris$Sepal.Length, y = iris$Petal.Width)



# 산점도 행렬 그리기

data(iris)

pairs(iris)


#psych 패키지의 pairs.panel( ) 함수로 산점도 행렬 그리기
#- 사용 형식은 pairs( )함수와 동일하지만, 함수 실행 전에 psych 패키지 설치와 로드가 필요
# psych 패키지로 산점도 행렬 그리기
install.packages("psych")
library(psych)

data(iris)
pairs.panels(iris)




# 응용 
# 3번
exam <- read.table("jjkexam_1.txt", nrows = 3, encoding = "EUC-KR", fileEncoding = "UTF-8")
View(exam)



# 4번
exam2 <- read.table("G:/201912047/Rstudy2023/Woogie_chapter4/jjkexam_2.txt", 
                    sep = "|", encoding = "EUC-KR", fileEncoding = "UTF-8")
View(exam2)



# 5번
install.packages('readxl')
library(readxl)







# 6번
read_excel("G:/201912047/Rstudy2023/Woogie_chapter4/jjkdata_1", sheet = 2)



# 7번

install.packages("jsonlite")

library(jsonlite)



# 데이터 관측 
# 1번 
data (iris)



# 2번 
ls (iris)
#[1] "Petal.Length" "Petal.Width"  "Sepal.Length" "Sepal.Width"  "Species"     

nrow (iris)
#[1] 150




# 3번 
quantile(iris$Sepal.Length, probs = 0.25 )
quantile(iris$Sepal.Length, probs = 1 )







# C 그래프 그리기!!!!!!!!!!!!!!!





# 1번

y1 <- c(10, 15, 20, 30, 40, 50, 55, 66, 77, 80, 90, 100, 200, 225)

boxplot(y1)



# 2번

pie(y1)



# 3번

plot(y1)









# D 종합



# 1번

examjjk<- read_excel("JJKdata_1.xlsx", sheet = 2) 
examjjk 



# 2번

ncol(examjjk)

nrow(examjjk)

dim(examjjk)



# 3번 분산과 표준편차 구하기

var(examjjk$Age)

sd(examjjk$Age)



# 4첨도와 왜도 구하기

kurtosi(examjjk$Age)

skew(examjjk$Age)

# 5 빈도 분포를 구하고 막대 그래프 그리기
dist_GENDER <- table(examjjk$Age)
dist_GENDER
barplot(dist_GENDER)


# 6
hist(examjjk$Age) 

#7
plot(x = examjjk$Tel, y = examjjk$Age) 



