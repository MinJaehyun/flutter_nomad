# popular_movies

## 앱 실행 시, 흐름도
1. main.dart => home_screen.dart => api_services.dart => model.dart
2. 임시 데이터 넣어서 기본 UI 구현
3. 위 흐름과 반대로 코드 작성하기


## 파일별 기능
1. model.dart
- UI에 나타낼 데이터를 model에 속성으로 담을 것이다.
- fromJson 통해 인스턴스 만드는 구조 설정하기

2. api_services.dart
- 서버 내 json data를 가져와, josnDecode 처리 및 model 내 fromJson 통해 인스턴스(객체)로 만들어 반환할 것이다.

3. home_screen.dart
- Future.Bulder 내 ListView.seperator 내 UI 나타내기

4. main.dart
- home_screen.dart 호출하기

[//]: # ('https://movies-api.nomadcoders.workers.dev/popular')