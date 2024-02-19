import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:webtoon/models/movies_model.dart';

class ApiService {
  // note: getPopularMovies
  static Future<List<PopularMovieModel>> getPopularMovies() async {
    List<PopularMovieModel> popularMovieInstances = [];
    final url = Uri.parse('https://movies-api.nomadcoders.workers.dev/popular');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> popularMovies = jsonDecode(response.body);
      for (var popularMovie in popularMovies['results']) {
        popularMovieInstances.add(PopularMovieModel.fromJson(popularMovie));
      }

      return popularMovieInstances;
    }

    throw Error();
  }

  // note: getNowPlaying
  static Future<List<NowPlayingModel>> getNowPlaying() async {
    List<NowPlayingModel> nowPlayingList = [];
    final url =
        Uri.parse('https://movies-api.nomadcoders.workers.dev/now-playing');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final nowPlaying = jsonDecode(response.body);
      for (var item in nowPlaying['results']) {
        nowPlayingList.add(NowPlayingModel.fromJson(item));
      }

      return nowPlayingList;
    }

    throw Error();
  }

  // note: getComingSoonModel
  static Future<List<ComingSoonModel>> getComingSoon() async {
    List<ComingSoonModel> comingMovieInstances = [];
    final url =
        Uri.parse('https://movies-api.nomadcoders.workers.dev/coming-soon');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> comingSoonMovie = jsonDecode(response.body);
      for (var item in comingSoonMovie['results']) {
        comingMovieInstances.add(ComingSoonModel.fromJson(item));
      }

      return comingMovieInstances;
    }

    throw Error();
  }

  // note: getDetailInfo(id)
  static Future<DetailInfoModel> getDetailInfo(id) async {
    late DetailInfoModel detailInfo;
    final url =
        Uri.parse('https://movies-api.nomadcoders.workers.dev/movie?id=$id');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = jsonDecode(response.body);
      detailInfo = DetailInfoModel.fromJson(jsonData);
    }

    // print(detailInfo.poster_path); // /A7EByudX0eOzlkQ2FIbogzyazm2.jpg
    return detailInfo;
  }
}
