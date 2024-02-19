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
- [x] home_screen 최초 앱 실행 시, null 발생하는 에러 해결하기 (긴급,중요) 
- [x] *** detail_screen 접근 시, null 에러 발생 (긴급,중요) - FutureBuilder 이하에서 snapshot.connectionState == ConnectionState.waiting 처리해야 하는데, ListView 내 itemBuilder 이하에서 처리해서 로딩 기능이 실행 되지 않았다 !
- [x] 블로그에는 print 담고, 깃허브에는 print 걷어내기
- [x] const 추가 - VSCode 저장 시, 자동 추가 기능 적용하고, 모든 파일 적용하기
- [x] Container 대신 SizedBox 적용하여 개선
- [x] 모델 내 annotation 설정, camelcase로 변수명 개선
- [x] 폰트 기능 추가 
- [x] VSCode 최대 라인 변경: 180
- [x] title이 thumb 영역 벗어나면 말줄임표 나타내기
- [x] detail_screen: 여러 디바이스에 적용하기 위한 MediaQuery 처리
- [x] popular movies 가로 크기 늘리기
- [x] 종류, title - 중복하는 style을 main에 작성하기
- [x] 시스템 바 위치까지 배경으로 지정하는 방법 - ListView 내 Stack 내 Positioned 지정해서 스크롤 되는 현상 - ListView 제거하여 스크롤 제거
- [ ] 세부 페이지 글자색 안 보인다 - 글자색 변경 기능 만들기 (우측 상단에 버튼 만들고 글자색 검정/흰색/빨강 변경 기능 만들기)
- [ ] Buy ticket 버튼 크기 조정
- [ ] 별점 사이즈 줄이기
- [ ] page 이동 시, Hero 위젯 사용하기
