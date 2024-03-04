// note: 3개의 모델(popular movies, now in cinemas, coming soon)

// note: https://movies-api.nomadcoders.workers.dev/popular
class MoviesModel {
  final int id;
  final String posterPath;

  // note: 외부 데이터 필요 시, 사용하기 위한 처리
  MoviesModel(this.id, this.posterPath);

  MoviesModel.fromJson(Map<String, dynamic> parsingJson)
      : id = parsingJson['id'],
        posterPath = parsingJson['poster_path'];
}

// note: now in cinemas: https://movies-api.nomadcoders.workers.dev/now-playing
class PlayingMovies {
  final int id;
  final String posterPath, title;

  PlayingMovies(this.id, this.posterPath, this.title);

  PlayingMovies.fromJson(Map<String, dynamic> parsingData)
      : id = parsingData['id'],
        posterPath = parsingData['poster_path'],
        title = parsingData['title'];
}

// note: coming soon: https://movies-api.nomadcoders.workers.dev/coming-soon
class ComingSoonMovies {
  final int id;
  final String posterPath, title;

  ComingSoonMovies(this.id, this.posterPath, this.title);

  ComingSoonMovies.fromJson(Map<String, dynamic> parsingData)
      : id = parsingData['id'],
        posterPath = parsingData['poster_path'],
        title = parsingData['title'];
}

/* 참고: https://docs.flutter.dev/data-and-backend/serialization/json
User(this.name, this.email);

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String,
        email = json['email'] as String;

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
      };
* */

