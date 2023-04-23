# 그래프 기본 틀 생성하기

str(airquality)

ggplot(airquality, aes(x = Day, y = Temp))





# 산점도 그리기

ggplot(airquality, aes(x = Day, y = Temp)) +  geom_point()





# 산점도 점 크기와 색상 변경하기

ggplot(airquality, aes(x = Day, y = Temp)) +
  
  geom_point(size = 3, color = "red")



# 선 그래프 그리기

ggplot(airquality, aes(x = Day, y = Temp)) +
  
  geom_line()





# 막대 그래프 그리기

ggplot(mtcars, aes(x = cyl)) +     
  
  geom_bar(width = 0.5)      #막대그래프 추가(바의 넓이는 0.5)





# 5,7의 값은 없으므로 제외하고 막대그래프를 그림(factor이용)

ggplot(mtcars, aes(x = factor(cyl) )) + 
  
  geom_bar(width = 0.5)





# 누적 막대 그래프 그리기

ggplot(mtcars, aes(x = factor(cyl))) +
  
  geom_bar(aes(fill = factor(gear))) # fill 그래프 위에다 붙임 





# 선버스트 차트 그리기

ggplot(mtcars, aes(x = factor(cyl))) +
  
  geom_bar(aes(fill = factor(gear))) +
  
  coord_polar()





# 도넛 모양의 선버스트 차트 그리기

ggplot(mtcars, aes(x = factor(cyl))) +
  
  geom_bar(aes(fill = factor(gear))) +
  
  coord_polar(theta = "y")





# 상자 그림 그리기

ggplot(airquality, aes(x = Day, y = Temp, group = Day)) +
  
  geom_boxplot()





# 히스토그램 그리기

ggplot(airquality, aes(Temp)) +
  
  geom_histogram()



# 구간을 직접 지정하고 싶다면    

#binwidth 옵션을 사용하여 코드를 변경





ggplot(airquality, aes(Temp)) +
  
  geom_histogram(binwidth = 5 ) # 히스토그램의 막대크기가 5로 변경됨





# 선 그래프와 산점도 함께 그리기

ggplot(airquality, aes(x = Day, y = Temp)) +
  
  geom_line() +
  
  geom_point()





# 선 그래프 컬러와 산점도 점 크기 변경하기

ggplot(airquality, aes(x = Day, y = Temp)) +
  
  geom_line(color = "red") +
  
  geom_point(size = 3)





# II. 그래프에 객체추가하기

str(economics)



# 그래프에 사선 그리기

ggplot(economics, aes(x = date, y = psavert)) +
  
  geom_line() +
  
  geom_abline(intercept = 12.18671, slope = -0.0005444)





# 그래프에 평행선 그리기

ggplot(economics, aes(x = date, y = psavert)) +
  
  geom_line() +
  
  geom_hline(yintercept = mean(economics$psavert))



# 그래프에 텍스트 입력하기

ggplot(airquality, aes(x = Day, y = Temp)) +
  
  geom_point() +
  
  geom_text(aes(label = Temp, vjust = 0, hjust = 0))





# 그래프에 사각형 그리기

ggplot(mtcars, aes(x = wt, y = mpg)) +
  
  geom_point() +
  
  annotate("rect", xmin = 3, xmax = 4, ymin = 12,
           
           ymax = 21, alpha = 0.1, fill = "skyblue")





# 그래프에 화살표 그리기

ggplot(mtcars, aes(x = wt, y = mpg)) +
  
  geom_point() +
  
  annotate("rect", xmin = 3, xmax = 4, ymin = 12,
           
           ymax = 21, alpha = 0.5, fill = "skyblue") +
  
  annotate("segment", x = 2.5, xend = 3.7, y = 10,
           
           yend = 17, color = "red", arrow = arrow())



#x = 2.5             #x축 시작

#xend = 3.7        #x축 끝

#y = 10              #y축 시작

#yend = 17         #y축 끝





# 그래프에 화살표 그리기 + 텍스트 삽입

ggplot(mtcars, aes(x = wt, y = mpg)) +
  
  geom_point() +
  
  annotate("rect", xmin = 3, xmax = 4, ymin = 12,
           
           ymax = 21, alpha = 0.5, fill = "skyblue") +
  
  annotate("segment", x = 2.5, xend = 3.7, y = 10,
           
           yend = 17, color = "red", arrow = arrow()) +
  
  annotate("text", x = 2.5, y = 10, label = "point")





# 그래프와 축 제목 추가하기

ggplot(mtcars, aes(x = gear)) + geom_bar() +
  
  labs(x = "기어수", y = "자동차수",
       
       title = "변속기 기어별 자동차수")



# 그래프와 축 제목 추가하기

ggplot(mtcars, aes(x = gear)) + geom_bar() +
  
  labs(x = "기어수", y = "자동차수",
       
       title = "변속기 기어별 자동차수")+ theme_gray( ) 





# 그래프와 축 제목 추가하기

ggplot(mtcars, aes(x = gear)) + geom_bar() +
  
  labs(x = "기어수", y = "자동차수",
       
       title = "변속기 기어별 자동차수") + theme_light()









# III. 다양한 시각화 기법





data(GNI2014) # 데이터 불러오기

head(GNI2014) # 데이터 내용보기

treemap(GNI2014,
        
        index=c("continent","iso3"), # 계층구조 설정(대륙-국가)
        
        vSize="population", # 타일의 크기
        
        title="세계인구") # 트리맵 제목 





library(treemap) # treemap 패키지 불러오기

st <- data.frame(state.x77) # 매트릭스를 데이터프레임으로 변환

st <- data.frame(st, stname=rownames(st)) # 주 이름 열 stname을 추가



head(st)

treemap(st,
        
        index=c("stname"), # 타일에 주 이름 표기
        
        vSize="Area", # 타일의 크기
        
        title="USA 주 면적" ) # 트리맵의 제목







st <- state.x77[1:15,c(1,3,5)]                #1~15행까지, 인구, 살인수, 문맹수만 추출

st1<-data.frame(st)                            #st를 프레임(s1)으로 변경

symbols(st1$Illiteracy, st1$Murder, # 원의 x-문맹, y-범죄, 동그라미크기(인구)로 원을 그림
        
        circles=st1$Population, # 원의 반지름의 열
        
        xlab="문맹률",
        
        ylab="범죄율",
        
        main="문맹과범죄")

text(st1$Illiteracy, st1$Murder, # 텍스트가 출력될 x좌표-문맹, y 좌표-살인
     
     rownames(st1),# 출력할 텍스트
     
     cex=0.6, # 폰트 크기
     
     col="brown") # 폰트 컬러






