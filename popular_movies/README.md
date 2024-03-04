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


## 문제점 및 해결 240304
1. 문제점: Image.network 호출하려면 인터넷 상에 이미지를 가져와야 하는데,
아래 주소 접근은 잘못 됐다. api 주소에 접근해서 사진을 가져오고 있다.
NetworkImage("https://movies-api.nomadcoders.workers.dev/popular/hu40Uxp9WtpL34jv3zyWLb5zEVY.jpg")
해결: api 주소의 이미지 파일명 가져오는게 아닌, api 위치에 이미지 파일명을 어딘가에 저장하고 파일로 가져와야 한다.
해결: aws-s3에 저장할 수도 있지만, 간편하게 https://imgur.com/ 에 저장하고 가져와 보자 (크기 조정: image.tmdb.org/t/p/w500/)
'https://image.tmdb.org/t/p/w500/${snapshot.data![0].posterPath}' 으로 가져올 것이다.
즉, https://image.tmdb.org/t/p/w500/hu40Uxp9WtpL34jv3zyWLb5zEVY.jpg 이다.

2. 상황: 높이 조정 관련해서 FutureBuilder 내 ListView 위,아래에 Expanded 사용했는지? higth 사용했는지?
원인: Expanded() 이하에 아직 Expanded() 처리하지 않은 Container 들이 존재하므로 RenderFlex children have non-zero flex but incoming height constraints are unbounded 발생한다
해결: todo: 일단 Sizeded() 박스로 height 설정하고, 나머지 Container 들을 작성한 뒤, 추후 Expanded로 교체한다

3. 문제점: FutureBuilder 내 ListView 위,아래에 어디에 snapshot.data로 로딩 호출한 지점 확인하기
해결: snapshot.data 아닌 snapshot.hasData로 유무 판별해야 한다.
