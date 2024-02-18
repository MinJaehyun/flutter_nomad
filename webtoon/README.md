# movies

## 사전 준비 (설치 플러그인 및 패키지)
- flutter_rating_bar 4.0.1 - 별점 기능
- http: ^1.2.1 - server json data 요청

## 레이아웃 구상하기
- ### 엡은 2개 화면(Home, Detail)으로 이루어져 있다 
- ### Home 스크린 기능 
1. 가장 인기 있는 영화 목록이 표시 
2. 극장에 상영 중인 영화 목록이 표시
3. 곧 개봉할 영화 목록 표시


- ### movie 탭하면 세부 정보 화면 이동하기
- ### 세부 정보 화면에 표시될 내용
1. 영화의 포스터
2. 영화의 제목
3. 영화의 등급
4. 영화의 개요
5. 영화의 장르


## 흐름
- main => home_screen => api_services => movies_model
- api_services에서 movies_model 통해서 전체 데이터 중 필요한 데이터만 가져온다


## 개선할 점
- [x] 이미지 화면에 꽉 채우기
- [x] Stack 및 Positioned 위젯 사용하여 이미지 위에 글자 띄우기
- [ ] 최초 로딩 시, null 에러 발생 (긴급,중요)
- [ ] home_screen 최초 앱 실행 시, null 발생하는 에러 해결하기 (긴급,중요) 
- [ ] 블로그에는 print 담고, 깃허브에는 print 걷어내기
- [ ] 폰트 수정
- [ ] const 추가 - VSCode 자동 추가하기
- [ ] title이 thumb 영역 벗어나면 자동 줄바꿈하도록 개선하기
- [ ] 종류, title - 공통적으로 반복하는 style을 main에 작성하기
- [ ] page 이동 시, Hero 위젯 사용하기
- [ ] 시스템 바 위치까지 배경으로 지정하는 방법
- [ ] 별점 사이즈 줄이기
- [ ] Buy ticket 버튼 크기 조정
- [ ] storyline 내용 5줄이상이면 스크롤 넣기
