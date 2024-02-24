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
      // print(parsingData['results']);

      parsingData['results'].forEach((item) {
        popularMoviesList.add(MoviesModel.fromJson(item));
      });

      print(popularMoviesList);
      return popularMoviesList;
    }

    throw Error();
  }
}

/* 참고: https://docs.flutter.dev/cookbook/networking/fetch-data
Future<http.Response> fetchAlbum() {
  return http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
}
* */