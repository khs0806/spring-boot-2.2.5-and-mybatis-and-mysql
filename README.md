## 스프링 부트

####  MyBatis와 MySQL을 이용한 게시판 만들기

- STS 4.0 툴을 이용하여 스프링부트 2.0 프로젝트 생성
  -spring starter project 선택

- github 리포지터리 생성

- 프로젝트 폴더와 github 리포지터리 master 브랜치 연결

- .gitignore에 파일 추가
  -(.mvn/, mvnw, mvnw.cmd)

- 첫 커밋 하기전에 기본세팅부터 하기
  -의존성 추가
  -application.yml 세팅
  -log4jdbc.log4j2.properties, logback.xml 세팅
  (log4관련 세팅은 SQL을 깔끔하게 로그로 보여줄수있음)
  -DB 세팅
  -서버 작동하는지 확인
  -git commit -> git push
 - list.jsp 추가
 - ArticleService, ArticleServiceImp, ArticleDto 생성
 - 하드코딩으로 데이터 생성하여 리턴(중간확인용)
 - 컨트롤러가 받은 list 데이터를 jsp로 넘겨줌
 - 이제 Dao를 통해서 가져오도록 처리
 - 마이바티스 적용
 - add.jsp 추가
 - doAdd 기능 추가 
 - Cutil 도입(Bigint를 Long으로 바꾸기 용이)
 - 리스트 페이지에 총 게시물 개수 보여주기
  