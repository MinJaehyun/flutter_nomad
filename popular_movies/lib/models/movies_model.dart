// note: 3개의 모델(popular movies, now in cinemas, coming soon)
class MoviesModel {
  final int id;
  final String posterPath, title;

  MoviesModel(this.id, this.posterPath, this.title);

  MoviesModel.fromJson(Map<String, dynamic> parsingJson)
      : id = parsingJson['id'],
        posterPath = parsingJson['poster_path'],
        title = parsingJson['title'];
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
