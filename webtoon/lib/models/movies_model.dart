class PopularMovieModel {
  final dynamic id, posterPath;

  PopularMovieModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        posterPath = json['poster_path'];
}

class NowPlayingModel {
  final dynamic id, posterPath, title;

  NowPlayingModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        posterPath = json['poster_path'],
        title = json['title'];
}

class ComingSoonModel {
  final dynamic id, posterPath, title;

  ComingSoonModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        posterPath = json['poster_path'],
        title = json['title'];
}

class DetailInfoModel {
  // id, 이미지, 제목, 상영 시간 runtime, 제작사는 여러개 production_companies 내 [index] 내 [name] , 스토리라인 overview, vote_average: 별정
  final dynamic id, posterPath, originalTitle, runtime, productionCompanies, overview, voteAverage;

  DetailInfoModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        posterPath = json['poster_path'],
        originalTitle = json['original_title'],
        runtime = json['runtime'],
        productionCompanies = json['production_companies'],
        overview = json['overview'],
        voteAverage = json['vote_average'];
}
