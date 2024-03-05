import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:popular_movies/models/movies_model.dart';

class ApiService {
  static Future<List<MoviesModel>> getPopularMovies() async {
    final Uri url = Uri.parse('https://movies-api.nomadcoders.workers.dev/popular');
    final http.Response response = await http.get(url);
    List<MoviesModel> popularMoviesList = [];

    if(response.statusCode == 200) {
      final parsingData = jsonDecode(response.body);
      parsingData['results'].forEach((item) {
        popularMoviesList.add(MoviesModel.fromJson(item));
      });

      return popularMoviesList;
    }

    throw Error();
  }

  static Future<List<PlayingMovies>> getNowPlayingMovies() async {
    final url = Uri.parse('https://movies-api.nomadcoders.workers.dev/now-playing');
    final response = await http.get(url);
    List<PlayingMovies> playingMoviesList = [];

    if(response.statusCode == 200) {
      final parsingData = jsonDecode(response.body);
      parsingData['results'].forEach((item) {
        playingMoviesList.add(PlayingMovies.fromJson(item));
      });

      return playingMoviesList;
    }

    throw Error();
  }

  static Future<List<ComingSoonMovies>> getComingSoonMovies() async {
    final url = Uri.parse('https://movies-api.nomadcoders.workers.dev/coming-soon');
    final response = await http.get(url);
    List<ComingSoonMovies> comingSoonMoviesList = [];

    if(response.statusCode == 200) {
      final parsingData = jsonDecode(response.body);
      parsingData['results'].forEach((item) {
        comingSoonMoviesList.add(ComingSoonMovies.fromJson(item));
      });

      return comingSoonMoviesList;
    }

    throw Error();
  }

  // note: get detail page api
  static Future<DetailMovie> getDetailMovie(int id) async {
    final url = Uri.parse('https://movies-api.nomadcoders.workers.dev/movie?id=$id');
    final response = await http.get(url);
    final DetailMovie detailInfo;

    if(response.statusCode == 200) {
      final Map<String, dynamic> parsingData = jsonDecode(response.body);
      detailInfo = DetailMovie.fromJson(parsingData);

      return detailInfo;
    }

    throw Error();
  }


}

/* 참고: https://docs.flutter.dev/cookbook/networking/fetch-data
Future<http.Response> fetchAlbum() {
  return http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
}
* */