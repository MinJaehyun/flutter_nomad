// 파일 내 3개 class
class PopularMovieModel {
  final id, poster_path;

  PopularMovieModel(this.id, this.poster_path);

  PopularMovieModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        poster_path = json['poster_path'];
}

class NowPlayingModel {
  final id, poster_path, title;

  NowPlayingModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        poster_path = json['poster_path'],
        title = json['title'];
}

class ComingSoonModel {
  final id, poster_path, title;

  ComingSoonModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        poster_path = json['poster_path'],
        title = json['title'];
}

class DetailInfoModel {
  // id, 이미지, 제목, 상영 시간 runtime,
  // | 제작사는 여러개 production_companies 내 [index] 내 [name] , 스토리라인 overview, vote_average: 별정
  final id, poster_path, original_title, runtime, production_companies, overview, vote_average;

  DetailInfoModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        poster_path = json['poster_path'],
        original_title = json['original_title'],
        runtime = json['runtime'],
        production_companies = json['production_companies'],
        overview = json['overview'],
        vote_average = json['vote_average'];
}
