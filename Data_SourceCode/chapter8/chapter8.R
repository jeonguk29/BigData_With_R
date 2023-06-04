# 데이터 준비

install.packages('HSAUR') #패키지설치
library(HSAUR)

# 포브스에서 선정 2004년 세계 2000대 기업 리포트
data("Forbes2000") #Forbes2000데이터 사용

ds <- Forbes2000
ds[!complete.cases(ds),] # 결측값이 있는 경우 출력

# 완전하지 않은 행만 출력



# 데이터 내용확인 
str(ds) #변수명과 데이터형 출력
head(ds)





# 국가별 기업 통계 

table(ds$country) # ds의 country변수의 빈도수를 계산

tmp <- sort(table(ds$country), decreasing=T) #counttry수 내림차순 정렬

top.10.contry <- tmp[1:10]

top.10.contry # 우수기업을 포함하고 있는 상위 10개국 출력

par(mar=c(5,4,4,2)) # 그래프 내부 여백 조정
# par(oma=c(5,4,4,2)) 그래 외부 여백 

barplot(top.10.contry,
        main='기업수 상위 10개국',
        col=rainbow(10), # 레인보우 팔레트(막대의 색을 10가지색으로 지정)
        las=2 # x축 레벨 방향 설정(세로)
)






# 업종별 기업 분포
table(ds$category)
tmp <- sort(table(ds$category), decreasing=T) # 업종별수로 내림차순으로 정렬
top.10.category <- tmp[1:10]
top.10.category # 상위 10개 업종

par(mar=c(5,4,4,2)) # 그래프 내부 여백 조정

barplot(top.10.category,main="기업수 상위 10개 업종",
        
        col="pink", las=2)




# 이론1_%in% 연산자 연습

a <- c(1, 2, 3)
b <- c(2, 3, 4)
a %in% b #a의 각 요소가 b에 있는가?(a기준에서 출력함)
# [1] FALSE  TRUE  TRUE

GenderK <- c('A', 'M', 'F')
GenderA <- c( 'M', 'F')
GenderA

tmp<-GenderK[ GenderK %in% GenderA ] # ‘M’, ‘F’만 같으므로 GenderK 중 ‘M’, ‘F’ 값만 tmp에 저장
tmp # "M" "F"
GenderK 



top.10.category
# 업종별 기업자산 분포
tmp <- ds[ds$category %in% names(top.10.category),] #상위10개의 품목을 가진 기업
top.10.category
head(tmp)

par(mar=c(5,4,4,2)) # 그래프 여백 조정
boxplot(assets~factor(category), data=tmp, # 품목별 자신 분포
        ylim=c(0,100),
        xlab='상위10대품목',
        las=2)





# 기업 가치 상위 10대 기업

tmp <- ds[order(ds$marketvalue, decreasing=T),] #기업가치순으로 내림차순정렬

tmp[1:10,c('name', 'country','category','marketvalue')] #1~10등까지 출력

# 4개의 열만 출력 





# 한국 기업 정보 

korea <- subset(ds, country=='South Korea') #한국기업만을 선정해서 부분집합으로 구성

korea[, c('rank', 'name', 'category','marketvalue')] #한국기업만을 출력





# 기업 가치와 타 변수와의 상관관계 

tmp <- ds[,5:8] #5열에서 8열까지 추출(sales,profits,assets,marketvalue)

head(tmp)

tmp <- tmp[complete.cases(tmp),] # 결측값 제거

tmp

plot(tmp, lower.panel=NULL) # 산점도(lower.panel=NULL:하삼각, upper.panel=NULL:상삼각)

cor(tmp) # 상관계수






# 1. 대기오염 측정 데이터 분석

# 데이터 준비

files <- c('ds.2015.csv', 'ds.2016.csv','ds.2017.csv',
           
           'ds.2018.csv','ds.2019.csv') #현재 폴더에 있는 파일들의 이름을 벡터로 지정

ds <- NULL #ds에 NULL 배정

for (f in files) { #파일을 하나씩 읽어서 ds에 누적시킴
  
  tmp <- read.csv(f, header=T)
  
  ds <- rbind(ds, tmp) #파일들 행기준으로 계속 누젹
  
  print(f)
  
}




# 데이터 확인

str(ds)

head(ds)

range(ds$mdate) # 측정 기간

# 열별 결측값 확인

for (i in 3:8) {
  
  cat(names(ds)[i], sum(is.na(ds[,i])),
      
      sum(is.na(ds[,i]))/nrow(ds), '\n')
  
}

ds <- ds[,-8] # PM25 열 제거 : 결측률이 18프로를 초과하므로 8열은 제외사캄
ds <- ds[complete.cases(ds),] # 결측값 포함하고 있는 행 제거



# 그룹 정보 추가 

mdate <- as.character(ds$mdate) # 측정날짜를 문자로 변환
head(mdate)
ds$year <- as.numeric(substr(mdate, 1,4)) # 연도
ds$month <- as.numeric(substr(mdate, 5,6)) # 월
ds$hour <- as.numeric(substr(mdate, 9,10)) # 시간

ds



ds$locname <- NA # locname 열을 추가
ds$locname[ds$loc==111123] <- '서울' # 도시
ds$locname[ds$loc==336111] <- '목포' # 도시
ds$locname[ds$loc==632132] <- '강릉' # loc==632132면 ‘강릉’이 추가됨
head(ds)



# 지역별 PM10 농도 분포

boxplot(PM10~locname, data=ds, #지역별 미세먼지농도
        main='미세먼지 농도 분포')

boxplot(PM10~locname, data=ds, #두번째 상자그림 미세먼지 농도 범위를 100이하로 제한하여 작성
        
        main='미세먼지 농도 분포',
        
        ylim=c(1,100))
# 범위를 100까지로 줄임



# 6. 연도별, 지역별 PM10 농도 추이

library(ggplot2)

#연도별(year=ds$year), 지역별(ds$locname) 그룹으로 묶어서 PM10의 평균을 구함

tmp.year <- aggregate(ds[,7], by=list(year=ds$year,loc=ds$locname), FUN='mean')



# tmp.year$loc(지역) 중 공백인 대기정보 SKIP

tmp.year$loc = as.factor(tmp.year$loc)

head(tmp.year)



#모든 데이터를 loc를 기준으로 그룹으로 구분하여 농도 추이 그래프를 그림

ggplot(tmp.year, aes(x=year,y=x, colour=loc, group=loc))+
  
  geom_line( )+
  
  geom_point(size=6, shape=19, alpha=0.5)+
  
  ggtitle('연도별 PM10 농도 변화')+
  
  ylab('농도')




# 연도별, 지역별 PM10 농도 추이
#month=ds$month:월별,loc=ds$locname:지역별
#기본함수 - aggregate 데이터의 특정 컬럼을 기준으로 통계량을 구해주는 함수

tmp.month <- aggregate(ds[,7], by=list(month=ds$month,loc=ds$locname),
                       
                       FUN='mean')
# 같은 달(month=ds$month)끼리 그룹으로 묶어서 7열(PM10)의 평균(mean)을 구함

tmp.month$loc = as.factor(tmp.month$loc) #월별데이타가 없을 경우 해당월 제거
head(tmp.month)



ggplot(tmp.month, aes(x=month,y=x, colour=loc, group=loc))+
  
  geom_line( )+
  
  geom_point(size=3, shape=19, alpha=0.5)+
  
  ggtitle('월별 PM10 농도 변화')+
  
  ylab('농도')





#hour=ds$hour:시간별,loc=ds$locname:지역별

tmp.hour <- aggregate(ds[,7],
                      
                      by=list(hour=ds$hour,loc=ds$locname), FUN='mean')

tmp.hour$loc = as.factor(tmp.hour$loc)

head(tmp.hour)

ggplot(tmp.hour, aes(x=hour, y=x, colour=loc, group=loc))+ #
  
  geom_line( )+
  
  geom_point(size=3, shape=19, alpha=0.5)+
  
  ggtitle('시간별 PM10 농도 변화')+
  
  ylab('농도')





# 9. 오염물질 농도 간의 상관관계

tmp <- ds[,3:7]
tmp <- tmp[complete.cases(tmp),] # 결측값 제거
plot(tmp[1:10000,], lower.panel=NULL) # 산점도(데이터가 많아서 시간이 많이 걸리므로 10000개만 대상
cor(tmp) # 5개변수간의 상관관계





# 10. 미세먼지 최고점과 최저점 확인
#년별, 달별, 지역별 미세먼지 농도를 구함
tmp.yml <- aggregate(ds[,7], by=list(year=ds$year,month=ds$month,
                                     loc=ds$locname), FUN='mean')

tmp.yml
# 가장 미세먼지가 많았던 달
idx <- which(tmp.yml$x==max(tmp.yml$x)) #max(tmp.yml$x): tmp.yml$x중 최대값을 갖는 대기정보번호
tmp.yml[idx,] #idx(번호)의 대기정보를 출력

# 가장 미세먼지가 적었던 달

idx <- which(tmp.yml$x==min(tmp.yml$x)) #min(tmp.yml$x): tmp.yml$x중 최소값을 갖는 대기정보번호
tmp.yml[idx,]

###############################################


# 문제 1

# 1-1

install.packages('HSAUR') #패키지설치
library(HSAUR)
data("Forbes2000") #Forbes2000데이터 사용
ds201912047 <- Forbes2000



str(ds201912047) #변수명과 데이터형 출력
head(ds201912047)



# 1-2

table(ds201912047$country) # ds학번의 country변수의 빈도수를 계산
tmp <- sort(table(ds201912047$country), decreasing=T) #counttry수 내림차순 정렬
top.5.contry <- tmp[1:5]
top.5.contry # 우수기업을 포함하고 있는 상위 5개국 출력

par(mar=c(5,4,4,5)) # 그래프 내부 여백 조정
barplot( top.5.contry ,
         
         main='기업수 상위 5개국(자기이름)',
         
         col=rainbow(5), # 레인보우 팔레트(막대의 색을 5가지색으로 지정)
         
         las=2 # x축 레벨 방향 설정(세로)
         
)



# 1-3

# 업종별 기업 분포

table(ds201912047$category)

tmp <- sort(table(ds201912047$category), decreasing=T)

top.5.category <- tmp[1:5]

top.5.category # 상위 5개 업종

par(mar=c(5,4,4,2)) # 그래프 여백 조정

barplot(top.5.category,
        
        main='상위 5개 업종(자기이름)',
        
        col="blue",
        
        las=2)



# 1-4

# 업종별 기업자산 분포

tmp <- ds201912047[ds201912047$category %in% names(top.5.category),]

top.5.category

head(tmp)



par(mar=c(5,4,4,2)) # 그래프 여백 조정

boxplot(assets~category, data=tmp,
        ylim=c(0,100),
        xlab='자기이름',
        las=2)



# 1-5
#문제I-5 ds학번의 기업가치를 오름차순으로 정렬하고 기업가치가 높은 상위 5개 기업을 
#출력하도록 (가), (나)를 채우시오.

tmp <- ds201912047[order(ds201912047$marketvalue,  decreasing=F),]
tmp[1:5,c('name', 'country','category','marketvalue')]



# 1-6

Austria <- subset(ds201912047, country=='Austria')

# 오스트리아내의 기업만을 선정해서 부분집합으로 구성

Austria[,c('rank', 'name', 'category','marketvalue')]

#오스트리아 기업만을 출력





# 1-7
# ds학번데이터의 sales, profits, assets변수에 해당하는 데이터를 추출하여 
# 이중에 포함된 결측치를 제거하고 상삼각모양의  산점도를 그리도록 (가), (나)를 채우시오

tmp <- ds201912047[,5:7] #5열에서 7열까지 추출(sales,profits,assets)
head(tmp)
tmp <- tmp[complete.cases(tmp),] # 결측값 제거

plot(tmp,upper.panel=NULL) # 산점도( upper.panel=NULL:상삼각)
cor(tmp) # 상관계수







# 2번 



# 2-1

# 데이터 준비

files <- c('ds.2017.csv','ds.2018.csv','ds.2019.csv') #현재 폴더에 있는 파일들의 이름을 벡터로 지정

ds201912047 <- NULL #ds에 NULL 배정

for (f in files) { #파일을 하나씩 읽어서 ds에 누적시킴
  
  tmp <- read.csv(f, header=T)
  
  ds201912047 <- rbind(ds201912047, tmp) #파일들 행기준으로 계속 누젹
  
  print(f)
  
}



# 2-2



str(ds201912047)

head(ds201912047)

range(ds201912047$mdate) # 측정 기간

# 열별 결측값 확인

for (i in 4:6 ) {
  
  cat(names(ds201912047)[i], sum(is.na(ds201912047[,i])),sum(is.na(ds201912047[,i]))/nrow(ds201912047), '\n')
  
}

ds201912047 <- ds201912047[complete.cases(ds201912047),] # 결측값 포함 행 제거



# 2-3

# 그룹 정보 추가 

mdate <- as.character(ds201912047$mdate) # 측정날짜를 문자로 변환
head(mdate)
ds201912047$year <- as.numeric(substr(mdate, 1,4)) # 연도
ds201912047$month <- as.numeric(substr(mdate, 5,6)) # 월
ds201912047$day <- as.numeric(substr(mdate, 7,8)) 
ds201912047$day



# 2-4

ds201912047$locname <- NA # locname 열을 추가

ds201912047$locname[ds201912047$loc==111123] <- '부산' # 도시

ds201912047$locname[ds201912047$loc==336111] <- '목포' # 도시

ds201912047$locname[ds201912047$loc==632132] <- '강릉' # loc==632132면 ‘강릉’이 추가됨

head(ds201912047)



# 2-5

#ds학번 데이터에서 지역별 O3 농도 분포(0.2보다 작음)를 그래프로 출력하도록 
#(가), (나)를 채우시오.

boxplot(O3~loc, data=ds201912047, #지역별 미세먼지농도
        
        main='미세먼지 농도 분포')

boxplot(O3~loc, data=ds201912047, #두번째 상자그림 미세먼지 농도 범위를 100이하로 제한하여 작성
        
        main='미세먼지 농도 분포',
        
        ylim=c(0.0,0.2))



# 2-6

# library(ggplot2)

#연도별(year=ds$year), 지역별(ds$locname) 그룹으로 묶어서 O3 평균값을 구하도록

tmp.year <- aggregate(ds201912047[,5], by=list(year=ds201912047$year,loc=ds201912047$locname), FUN='mean')

# tmp.year$loc(지역) 중 공백인 대기정보 SKIP

tmp.year$loc = as.factor(tmp.year$loc)

head(tmp.year)




# 2-7



#모든 데이터를 loc를 기준으로 그룹으로 구분하여 농도 추이 그래프를 그림

ggplot(tmp.year, aes(x=year,y=x, colour=loc, group=loc))+
  
  geom_line( )+
  
  geom_point(size=6, shape=19, alpha=0.5)+
  
  ggtitle('연도별 PM10 농도 변화')+
  
  ylab('농도')





# 2-8
# 데이터에서 날짜별  O3 평균값을 이용하여그림과 같이 그래프를 그리도록  (가),(나)를 채우시오.


tmp.day <- aggregate(ds201912047[,5], by=list(day=ds201912047$day,loc=ds201912047$locname),FUN='mean')

tmp.day$loc = as.factor(tmp.day$loc)

head(tmp.day)

ggplot(tmp.day, aes(x=day,y=x, colour=loc, group=loc))+
  
  geom_line()+
  
  geom_point(size=3, shape=19, alpha=0.5)+
  
  ggtitle('날짜별 오존 변화')+
  
  ylab('농도')



# 2-9

# 9. 오염물질 농도 간의 상관관계

tmp <- ds201912047[,3:5]

tmp <- tmp[complete.cases(tmp),] # 결측값 제거

plot(tmp[1:20000,], lower.panel=NULL) # 산점도(데이터가 많아서 시간이 많이 걸리므로 10000개만 대상

cor(tmp) # 3개변수간의 상관관계





# 2-10



tmp.yml <- aggregate(ds201912047[,5], by=list(year=ds201912047$year,
                                              
                                              month=ds201912047$month,
                                              
                                              day=ds201912047$day,
                                              
                                              loc=ds201912047$locname), FUN='mean')

tmp.yml

# ds학번 데이터에서 오존(O3)의 최고치와 최저치를 나타내는 날짜를 알아내도록 (가),(나)를 채우시오. 

idx <- which(tmp.yml$x==max(tmp.yml$x)) 
#max(tmp.yml$x): tmp.yml$x중 최대값을 갖는 대기정보번호
tmp.yml[idx,] #idx(번호)의 대기정보를 출력

# 가장 미세먼지가 적었던 달

idx <- which(tmp.yml$x==min(tmp.yml$x)) #min(tmp.yml$x): tmp.yml$x중 최소값을 갖는 대기정보번호

tmp.yml[idx,]

