# 1번

#한글이 불러오고 깨지기 때문에 encoding 옵션에 UTF-8 지정

jjktxt <- readLines("jjk.txt", encoding = "UTF-8")



# txt에서 명사만 뽑아서 n에 저장

n <- extractNoun(jjktxt)


배송 상품 



#2번 

df <- c('A', 'B', 'C', 'AB')

gsub('B', 'Y', df)



#3번 

4 5 6 2 3 4 5 10 20 30 40 50 60



#4번

c3 <- Filter(function(x) {nchar(x) > 4}, c2)



#5번

wordcnt <- table(c2)

sort(wordcnt, decreasing = F)





#6번

# RColorBrewer :다양한 색상을 적용하기 위한 패키지 설치

install.packages("RColorBrewer")

library(RColorBrewer)

# 팔레트 지정

Dark2 <- brewer.pal(6, "Dark2")



#7번



# 글자의 가로 세로 방향이
#반반씩 나오게 하고, 글자의
#크기가 가장 큰 값은 3, 가장
#작은 값은 0.2가 되도록
#수정하시오.



wordcloud(names(wordcount), # 단어들
          
          freq=wordcount, # 단어들의 빈도
          
          scale=c(3,0.2), # 단어의 폰트 크기(최대,최소)
          
          min.freq=3, # 단어의 최소 빈도
          
          random.order=F, # 단어의 출력 위치
          
          rot.per=0.5, # 90도 회전 단어 비율
          
          colors=pal2) # 단어의 색

#####################
install.packages("hash")
install.packages("rJava")
install.packages("tau")
install.packages("Sejong")
install.packages("RSQLite")
install.packages("devtools")

install.packages("multilinguer")
library(multilinguer)
Sys.setenv(JAVA_HOME="C:/Program Files/Amazon Corretto/jdk11.0.19_7") # JAVA가 설치된 경로



install.packages("remotes")
library(remotes)
install_github('haven-jeon/KoNLP', upgrade = "never", INSTALL_opts=c("--no-multiarch"))
library(KoNLP)



useSystemDic()
useSejongDic()
useNIADic()


# 세종사전 불러오기
useSejongDic() 


# 데이터 불러오기
txt <- readLines("ch8.txt", encoding = "UTF-8")
head(txt)

#[1] "닭이 너무 맛있어요 최고!! 육질이 살아있음"
#[2] "배송도 빠르고 상품도 좋습니다. ^^"
#[3] "기가막히게 맛있습니다. 사장님 감사합니다."
#[4] "닭이 너무 작아요! 양이 작은 편인데도 부족하네요. ><"
#[5] "완전 만족합니다. 재구매 각이네요."
#[6] "삼계탕에 넣었는데 양이 기대 이하네요..."


# # txt에서 명사만 뽑아서 n에 저장
n <- extractNoun(txt)
head(n) # 데이터 확인

#[[1]]
#[1] "닭" "최고" "육" "질" "살아있" "음"
#[[2]]
#[1] "배송" "상품" "좋습니" [[3]]
#[1] "기가막히게" "사장님" "감사"
#[[4]]
#[1] "닭" "양" "편" "부족" 






# 3.2 gsub() 함수를 이용해 텍스트 수정

# 텍스트 수정을 위해n의 내용을 unlist해서c에 저장함
c <- unlist(n)





# gsub 함수를 통해 텍스트 수정 실시

c2 <- gsub( "육","육질", c) # "육"은"육질"로 변경

c2 <- gsub("재구","재구매", c2) # "재구"는"재구매"로 변경

c2 <- gsub("에서","", c2) # "에서"는 제거

head(c2,30)

#[1] "닭" "최고" "육질" "질" "살아있"
#[6] "음" "배송" "상품" "좋습니" "기가막히게"
#[11] "사장님" "감사" "닭" "양" "편"
#[16] "부족" "완전" "만족" "재구매" "매"
#[21] "각이" "삼계탕" "양" "기대" "이하"
#[26] "배송" "아이스" "팩" "고생" "포장"



# c2에 저장된 명사 중 두 글자 이상이 되는 것만 필터링
c3 <- Filter(function(x) {nchar(x) >=2}, c2)
head(c3,30)

#[1] "최고" "육질" "살아있" "배송" "상품"
#[6] "좋습니" "기가막히게" "사장님" "감사" "부족"
#[11] "완전" "만족" "재구매" "각이" "삼계탕"
#[16] "기대" "이하" "배송" "아이스" "고생"
#[21] "포장" "냄비" "냄비" "아이스" "박스"
#[26] "비닐" "벗겨지고.." "구매" "다행" "기름제거"



# c3를 table 함수를 이용해 단어별 빈도수가 나오게 만들고, wordcnt에 저장
wordcnt <- table(c3)
# 내림차순으로 정렬해서 어떤 단어가 많이 나왔는지 확인
sort(wordcnt, decreasing = TRUE)

#만족 가격 마리 배송 아이스
# 6     4   3     3    3
#감사 구매 냄비 마트 박스
# 2     2   2     2    2
#삼계탕 신선 싱싱 요리 육질
# 2      2     2   2    2
# . 생략 





############## 4. 워드클라우드 그리기



# 다양한 색상을 적용하기 위해 RColorBrewer 패키지 설치

library(RColorBrewer)

# 팔레트 지정
Dark2 <- brewer.pal(8, "Dark2")

# 워드클라우드 패키지 설치 및 라이브러리 불러오기
install.packages("wordcloud")
library(wordcloud)

# 워드클라우드로 표현
wordcloud(names(wordcnt), freq=wordcnt, scale=c(4, 0.5), rot.per=0.25,
          
          min.freq=1, random.order=F, random.color=T, colors=Dark2)



#wordcloud(names(wordcount), # 단어들

#          freq=wordcount, # 단어들의 빈도

#          scale=c(6,0.7), # 단어의 폰트 크기

#          min.freq=3, # 단어의 최소 빈도

#          random.order=F, # 단어의 출력 위치

#          rot.per=.1, # 90도 회전 단어 비율

#          colors=pal2) # 단어의 색



# 팔레트 지정 &  워드클라우드 글자 크기 변경
# 최대:6
# 최소:0.1
# 워드클라우드 글자 위치 변경 random.order=T, 
# 빈도수가 가장 큰 단어가 정 중앙에 나타나지 않음(랜덤)

#워드클라우드 글자 방향 변경 rot.per=1로변경, 다음으로 rot.per=0으로 변경
# rot.per=1 모두 세로로 출력됨(단어)
# rot.per=0 모두 가로로 출력됨(단어)

Set1 <- brewer.pal(8, "Set1")
wordcloud(names(wordcnt), freq=wordcnt, scale=c(6, 0.1), rot.per=0, min.freq=1,
          random.order=T, random.color=T, colors=Set1)







# III. 대국민담화문 데이터 워드클라우드 시각화

Sys.setenv(JAVA_HOME="C:/Program Files/Amazon Corretto/jdk11.0.19_7") # JAVA가 설치된 경로

library(wordcloud) # 워드클라우드

library(KoNLP) # 한국어 처리

library(RColorBrewer) #색상 선택



# 데이터불러오기와 명사추출

buildDictionary(ext_dic = "woorimalsam") # '우리말씀' 한글사전 로딩

pal2 <- brewer.pal(8, "Accent") # 팔레트 생성



text <- readLines("mis_document.txt", encoding ="UTF-8" ) # 파일 읽기

noun <- extractNoun(text) # 명사 추출

noun # 추출된 명사 출력

# "1" , "여성", "가족" "부 "....




# 4. 빈도수 높은 단어를 막대그래프로 작성하기

noun2 <- unlist(noun) # 추출된 명사 통합
wordcount <- table(noun2) # 단어 빈도수 계산
temp <- sort(wordcount, decreasing=T)[1:10] # 빈도수 높은 단어 10개 추출
temp
#   등 불법 여성 한 촬영  ...
#42 27  27   24  23  21   ...

# 42의 빈도수를 가진 항목에 제목이 없음
temp <- temp[-1] # 공백 단어 제거
barplot(temp, # 막대그래프 작성
        names.arg = names(temp), # 막대 이름을 단어로 표시
        col ="lightblue", # 막대의 색상 지정
        main ="빈도수 높은 단어", ylab = "단어 빈도수")







wordcloud(names(wordcount), # 단어들
          
          freq=wordcount, # 단어들의 빈도
          
          scale=c(6,0.7), # 단어의 폰트 크기
          
          min.freq=3, # 단어의 최소 빈도
          
          random.order=F, # 단어의 출력 위치
          
          rot.per=.1, # 90도 회전 단어 비율
          
          colors=pal2) # 단어의 색


# 글자 수정해서 다시 워드 클라우드 만들기 
# 6. 데이터 가공하기 

noun2 <- unlist(noun)

# gsub 함수를 통해 텍스트 수정 실시
noun2_2 <- gsub("하게","", noun2)
noun2_2 <- gsub("정현백입니다","", noun2_2)
noun2_2 <- gsub("성평등한","성평등", noun2_2)
head(noun2_2,30)


# 글자 수 2개 이상인 단어만 선택
noun2_3 <- Filter(function(x) {nchar(x) >=2}, noun2_2)
head(noun2_3,30)
# "여성" "가족" "불법" "촬영" ..

wordcount <- table(noun2_2)





par(mar=c(3,3,3,3))

#워드클라우드가 잘 보이도록 여백 조정

wordcloud(names(wordcount), # 단어들
          
          freq=wordcount, # 단어들의 빈도
          
          scale=c(6,0.7), # 단어의 폰트 크기
          
          min.freq=3, # 단어의 최소 빈도
          
          random.order=F, # 단어의 출력 위치
          
          rot.per=.1, # 90도 회전 단어 비율
          
          colors=pal2) # 단어의 색




#그래프 수정하기

par(mar=c(3,3,3,3)) #그래프가 잘 보이도록 여백 조정
pal2 <- brewer.pal(8, "Accent") #막대색 변경
temp <- sort(wordcount, decreasing=T)[1:6] # 빈도수 높은 단어 5개 추출
# 공백 하나 지워서 6까지 
temp
temp <- temp[-1] # 공백 단어 제거
barplot(temp, # 막대그래프 작성
        names.arg = names(temp), # 막대 이름을 단어로 표시
        col =pal2, # 막대의 색상 지정
        main ="빈도수 높은 단어", ylab = "단어 빈도수")





################## 실습 3
# 인터넷 검색어 분석




jjk_txt <- readLines("jjk2.txt", encoding = "UTF-8")

head(jjk_txt)



# # txt에서 명사만 뽑아서 n에 저장

njjk <- extractNoun(jjk_txt)

head(njjk) # 데이터 확인



# 3.2 gsub() 함수를 이용해 텍스트 수정



# 텍스트 수정을 위해n의 내용을 unlist해서c에 저장함

cjjk <- unlist(njjk)





# gsub 함수를 통해 텍스트 수정 실시

cjjk3 <- gsub( "한국예탁결제원\\)에","한국예탁결제원", cjjk) 

cjjk3 <- gsub("기관\\(한국","기관", cjjk3) 

cjjk3 <- gsub("채","", cjjk3) 

cjjk3 <- gsub("두","", cjjk3) 

cjjk3 <- gsub("한","", cjjk3)

cjjk3 <- gsub("소","", cjjk3) 

head(cjjk3, 30)







# 실습 4



# c2에 저장된 명사 중 두 글자 이상이 되는 것만 필터링

cjjk33 <- Filter(function(x) {nchar(x) >=2}, cjjk3)

head(cjjk33,30)



# c3를 table 함수를 이용해 단어별 빈도수가 나오게 만들고, wordcnt에 저장

wordcntjjk <- table(cjjk33)

# 내림차순으로 정렬해서 어떤 단어가 많이 나왔는지 확인

sort(wordcntjjk, decreasing = TRUE)





# 팔레트 지정

library(RColorBrewer)

Set2 <- brewer.pal(8, "Set2")



#(카) 여백 지정

library(wordcloud)

par(mar=c(0,0,0,0))

#워드클라우드가 잘 보이도록 여백 조정





# 워드클라우드로 표현

wordcloud(names(wordcntjjk), freq=wordcntjjk, scale=c(3, 0.3), rot.per=0.25,
          
          min.freq=1, random.order=F, random.color=T, colors=Set2)





#실습 6





# 4. 빈도수 높은 단어를 막대그래프로 작성하기



tempjjk <- sort(wordcntjjk, decreasing=T)[1:10] # 빈도수 높은 단어 10개 추출

tempjjk

par(mar=c(3,3,3,3)) #여백지정

pal2 <- brewer.pal(8, "Accent") #막대색 변경



barplot(tempjjk, # 막대그래프 작성
        
        names.arg = names(tempjjk), # 막대 이름을 단어로 표시
        
        col = pal2, # 막대의 색상 지정
        
        main ="빈도수 높은 단어", ylab = "단어 빈도수")

###################################

