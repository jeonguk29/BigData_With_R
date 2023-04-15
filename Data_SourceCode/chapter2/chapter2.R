# Chapter2. 데이터프레임과 데이터 분석 기초

# II. 데이터 프레임 만들기
english <- c(90, 80, 60, 70)  # 영어 점수 변수 생성
english
math <- c(50, 60, 100, 20)    # 수학 점수 변수 생성
math

df_midterm <- data.frame(english, math)
df_midterm

# 학생의 반에 대한 정보가 추가된 데이터 프레임
class <- c(1, 1, 2, 2)
class


# 학생4명의 영어, 수학, 반 정보가 담긴 데이터 프레임 완성

df_midterm <- data.frame(english, math, class)
df_midterm

# 분석하기 
# df_midterm의 english로 평균 산출
mean(df_midterm$english)

# df_midterm의 math로 평균 산술
mean(df_midterm$math)


# 6. 데이터 프레임 한 번에 만들기
# df_midterm을 data.frame()안에 변수와 값을 나열해서 한 번에 만드는 방법

df_midterm <- data.frame(english = c(90, 80, 60, 70), math = c(50, 60, 100, 20), class = c(1, 1, 2, 2))
df_midterm


# III. 외부 데이터 이용

# readxl 패키지: 엑셀 파일을 불러오는 기능을 제공하는 패키지 
# readxl 패키지 설치 install.packages("readxl")
# readxl 패키지 로드 library(readxl)

df_exam <- read_excel("excel_exam.xlsx")  # 엑셀 파일을 불러와서 df_exam에 할당
df_exam                                   # 출력

#=>직접 경로 지정 방법 
#df_exam약자 <- read_excel(“d:/a약자/excel_exam.xlsx")


# 엑셀 파일을 불러와서 영어점수와 과학점수의 평균을 구하기
mean(df_exam$english)
## [1] 84.9
mean(df_exam$science)
## [1] 59.45


# 5. 엑셀 파일 첫 번째 행이 변수명이 아니라면?

df_exam_novar <- read_excel("excel_exam_novar.xlsx", col_names = F)
df_exam_novar
# T 면 첫번째 행을 변수명으로 잡아버림 F면 임의로 생성해줌


# 6. 엑셀 파일에 시트가 여러 개 있다면?
df_exam_sheet <- read_excel("excel_exam_sheet.xlsx",sheet = 3) # 3번재 시트를 불러옴
df_exam_sheet


# 7. csv 파일 불러오기

df_csv_exam <- read.csv("csv_exam.csv")
df_csv_exam

#첫쨰 행에 변수명이 없는 csv 파일

#첫번째 행에 변수명이 없는 파일을 불러올 때는 header = F
df_csv_exam <- read.csv("csv_exam2.csv", header = F )
df_csv_exam 

# 8. 데이터 프레임을 CSV 파일로 저장하기

df_midterm <- data.frame(english = c(90, 80, 60, 70), math = c(50, 60, 100, 20), class = c(1, 1, 2, 2))
df_midterm
##   english math class
## 1      90   50     1
## 2      80   60     1
## 3      60  100     2
## 4      70   20     2

write.csv(df_midterm, file = "df_midtermjjk.csv")
#가장 왼쪽 열의 자료 1,2,3,4 도 같이 저장됨 

# 8.3 한글이 저장된 프레임 만들기
City_kor<- data.frame(city = c('서울', '경기', '인천', '부산'), code = c(1,2,3,4))
City_kor
##   city code
## 1 서울   1
## 2 경기   2
## 3 인천   3
## 4 부산   4

# 한글이 저장된 csv 파일은 패키지 설치가 필요함 
#install.packages("readr")
#library(readr)
write.csv(City_kor, 'jjk_city.csv', row.names=F, fileEncoding = 'cp949')
# 가장 왼쪽 열의 자료도 CSV파일에 저장하고 싶을 경우 row.names=T    디폴트가 T임


# 8.5 한글이 저장된 CSV 파일 불러오기

data_test <- read_csv("jjk_city.csv",locale=locale('ko',encoding='cp949'))
data_test


# 9. RData 파일 활용하기

#RData 파일로 저장하기
#saveRDS()를 이용하여 데이터 프레임을 [.rds]파일로 저장
saveRDS(df_midterm, file = "df_midtermjjk.rds")

df_midterm <- readRDS("df_midtermjjk.rds")
df_midterm
##   english math class
## 1      90   50     1
## 2      80   60     1
## 3      60  100     2
## 4      70   20     2

# 9.3 rds 파일 삭제
rm(df_midterm)
#df_midterm # 파일이 삭제되어 존재하지 않으므로 출력할 데이터가 없음->에러 발생



#데이터 파악 

#[csv_exam.csv]파일이 프로젝트폴더[약자_chapter2]에 존재하는가를 확인한 후 exam프레임에 할당
exam <- read.csv("csv_exam.csv")
exam

# head() - 데이터 앞부분 확인하기
head(exam)      # 앞에서부터 6행까지 출력
head(exam, 3)  # 앞에서부터 3행까지 출력

# tail() - 데이터 뒷부분 확인하기

tail(exam)      # 뒤에서부터 6행까지 출력
tail(exam, 10)  # 뒤에서부터 10행까지 출력

# View() - 뷰어 창에서 데이터 확인하기: [유의] View()에서 맨 앞의 V는 대문자
View(exam) 

#dim() - 몇 행 몇 열로 구성되는지 알아보기
dim(exam)  # 행, 열 출력
## [1] 20  5

# str() - 속성 파악하기
str(exam)  # 데이터에 들어 있는 변수들의 속성 확인

## 'data.frame':    20 obs. of  5 variables:=>20행 5열
##  $ id     : int  1 2 3 4 5 6 7 8 9 10 ...=> 정수형 데이터
##  $ class  : int  1 1 1 1 2 2 2 2 3 3 ...=> 정수형 데이터
##  $ math   : int  50 60 45 30 25 50 80 90 20 50 ...=> 정수형 데이터
##  $ english: int  98 97 86 98 80 89 90 78 98 98 ...=> 정수형 데이터
##  $ science: int  50 60 78 58 65 98 45 25 15 45 ...=> 정수형 데이터


# summary() - 요약통계량 산출하기
summary(exam)  #  각 변수의 요약통계량 출력

# 대략적으로 아래와 같이 판단 해볼수 있음
#수학시험 점수 평균은 57.45(Mean)
#수학시험점수가 가장 낮은 학생은 20점, 가장 높은 학생은 90점
#학생들의 수학 점수가 54점을 중심으로 45.75점에서 75.75점 사이에 몰려 있다 


#mpg 데이터 파악하기
# ggplot2의 mpg 데이터를 데이터 프레임 형태로 불러오기
mpg <- as.data.frame(ggplot2::mpg)
mpg
#as.data.frame() : 데이터 속성을 데이터 프레임 형태로 바꾸는 함수
#ggplot2::mpg  :  ggplot2에 들어 있는 mpg데이터를 지칭하는 코드

head(mpg)    # mpg Raw 데이터 앞부분 확인
tail(mpg)    # mpg Raw 데이터 뒷부분 확인
View(mpg)    # mpg Raw 데이터 뷰어 창 확인
dim(mpg)     # [1] 234  11
str(mpg)     # 데이터 속성 확인
summary(mpg)  # 요약통계량 출력

# 기존 mpg 데이터 변수이름 변경하기 

# year의 이름을 year약자로 수정
#mpg1 <- rename(mpg, c("변경전변수이름" = "변경 후 변수이름")) 

#install.packages("plyr") 
#library(plyr)                         패키지 설치후 해야함 
mpg1 <- rename(mpg, c("year" = "yearjjk"))
str(mpg1) 

# 새로운이름으로 기본의 프레임을 복사
# 새로운프레임 <- 기존프레임
mpg10 <- mpg1
mpg10



# 실습 1
salesWoogie = data.frame(fruif = c("사과", "딸기", "수박"), price = c(1800, 1500, 3000), volume = c(24, 38, 13))
salesWoogie

# 실습 2
mean(salesWoogie$price)
#[1] 2100
mean(salesWoogie$volume)
#[1] 25


# 실습 3
woogiempg <- as.data.frame(ggplot2::mpg)
woogiempg_new <- woogiempg
woogiempg_new

# 실습 4
woogiempg_new <- rename(woogiempg_new, c("cty" = "woogiecity"))
woogiempg_new <- rename(woogiempg_new, c("hwy" = "woogiehwy"))

# 실습 5
head(woogiempg_new)


# 실습 6
#install.packages("readxl")
#library(readxl)                            설치 하고 진행
woogie_rain1 <- read_excel("excel_rain_woogie.xlsx")
woogie_rain1


# 실습 7
# install.packages("readr")
# library(readr)                            설치 하고 진행
write.csv(woogie_rain1, "excel_rain_woogie.csv", fileEncoding = 'cp949')


# 실습 8
woogie_rain2 <- read_csv("excel_rain_woogie.csv", locale = locale('ko', encoding = 'cp949'))
woogie_rain2


# 실습 9
saveRDS(woogie_rain2, file = "excel_rain_woogie.rds")

# 실습 10
head(woogie_rain2, 3)
tail(woogie_rain2, 3)
dim(woogie_rain2)
summary(woogie_rain2)