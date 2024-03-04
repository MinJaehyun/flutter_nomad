import 'package:flutter/material.dart';

import 'package:popular_movies/models/movies_model.dart';
import 'package:popular_movies/services/api_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final popularMovies = ApiService.getPopularMovies();
  final nowPlayingMovies = ApiService.getNowPlayingMovies();
  final comingSoonMovies = ApiService.getComingSoonMovies();

  @override
  Widget build(BuildContext context) {
    TextStyle subjectText = TextStyle(fontWeight: FontWeight.bold, fontSize: 22);
    // print(popularMoviesData); // 'Future<List<MoviesModel>>

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // note: popular movies
                renderPopularMovies(subjectText),
                SizedBox(height: 15),
                // note: now in cinemas
                renderNowInCinemas(subjectText),
                SizedBox(height: 15),
                // note: coming soon
                renderComingSoon(subjectText),
              ],
            ),
          ),
        ),
      ),
    );
  }

  FutureBuilder<List<ComingSoonMovies>> renderComingSoon(TextStyle subjectText) {
    return FutureBuilder(
      future: comingSoonMovies,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        return Column(
          children: [
            Text('Coming soon', style: subjectText),
            Container(
              height: 150,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data!.length,
                separatorBuilder: (context, index) {
                  return SizedBox(width: 15);
                },
                itemBuilder: (context, index) {
                  return Image.network('https://image.tmdb.org/t/p/w500${snapshot.data![index].posterPath}');
                },
              ),
            ),
          ],
        );
      },
    );
  }

  FutureBuilder<List<PlayingMovies>> renderNowInCinemas(TextStyle subjectText) {
    return FutureBuilder(
      future: nowPlayingMovies,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        return Column(
          children: [
            Text('Now in Cinemas', style: subjectText),
            Container(
              height: 150,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data!.length,
                separatorBuilder: (context, index) {
                  return SizedBox(width: 15);
                },
                itemBuilder: (context, index) {
                  return Image.network('https://image.tmdb.org/t/p/w500/${snapshot.data![index].posterPath}');
                },
              ),
            ),
          ],
        );
      },
    );
  }

  FutureBuilder<List<MoviesModel>> renderPopularMovies(TextStyle subjectText) {
    return FutureBuilder(
      future: popularMovies,
      builder: (context, AsyncSnapshot snapshot) {
        // print(snapshot.data![0].posterPath); // /hu40Uxp9WtpL34jv3zyWLb5zEVY.jpg
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return Column(
          children: [
            SizedBox(child: Text('Popular Movies', style: subjectText)),
            Container(
              height: 350,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data!.length,
                separatorBuilder: (context, index) {
                  return SizedBox(width: 15);
                },
                itemBuilder: (context, index) {
                  return Container(
                    width: 200,
                    // 참고: child: Image.network('https://movies-api.nomadcoders.workers.dev/popular${snapshot.data![0].posterPath}'),
                    child: Image.network('https://image.tmdb.org/t/p/w500/${snapshot.data![index].posterPath}'),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
