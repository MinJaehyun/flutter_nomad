import 'package:flutter/material.dart';

import 'package:webtoon/models/movies_model.dart';
import 'package:webtoon/screens/detail_screen.dart';
import 'package:webtoon/services/api_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  Future<List<PopularMovieModel>> popularMovies = ApiService.getPopularMovies();
  Future<List<NowPlayingModel>> nowPlayingMovies = ApiService.getNowPlaying();
  Future<List<ComingSoonModel>> comingSoon = ApiService.getComingSoon();

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 26,
      color: Colors.black.withOpacity(0.6),
    );

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: 850,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // note: Popular Movies
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Popular Movies', style: textStyle),
                        futurePopular(),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  // note: Now In Cinemas
                  Container(
                    height: 250,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Now In Cinemas', style: textStyle),
                        futureNowPlaying(),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  // note: Coming soon
                  Container(
                    height: 250,
                    // width: 111,
                    // decoration: BoxDecoration(color: Colors.grey),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Coming soon', style: textStyle),
                        Expanded(
                          child: futureComingSoon(),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  FutureBuilder<List<ComingSoonModel>> futureComingSoon() {
    return FutureBuilder(
      future: comingSoon,
      builder: (context, AsyncSnapshot snapshot) {
        return ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: snapshot.data!.length, // ['results']
          separatorBuilder: (context, index) {
            return SizedBox(width: 25);
          },
          itemBuilder: (context, index) {
            if (snapshot.hasData == null || snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            return Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => DetailScreen(id: '${snapshot.data![index].id}'))),
                      child: Image.network('https://image.tmdb.org/t/p/w500/${snapshot.data![index].poster_path}'),
                    ),
                  ),
                  Text('${snapshot.data![index].title}', style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black.withOpacity(0.6))),
                ],
              ),
            );
          },
        );
      },
    );
  }

  FutureBuilder<List<NowPlayingModel>> futureNowPlaying() {
    return FutureBuilder(
      future: nowPlayingMovies,
      builder: (context, AsyncSnapshot snapshot) {
        return Expanded(
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: snapshot.data!.length,
            separatorBuilder: (context, index) {
              return SizedBox(width: 20);
            },
            itemBuilder: (context, index) {
              if (snapshot.hasData == null) {
                return Center(child: CircularProgressIndicator());
              }
              return Column(
                children: [
                  Expanded(
                    child: Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: GestureDetector(
                        onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => DetailScreen(id: '${snapshot.data![index].id}'))),
                        child: Image.network('https://image.tmdb.org/t/p/w500/${snapshot.data![index].poster_path}'),
                      ),
                    ),
                  ),
                  Text(
                    '${snapshot.data![index].title}',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black.withOpacity(0.6),
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }

  FutureBuilder<List<PopularMovieModel>> futurePopular() {
    return FutureBuilder(
      future: popularMovies,
      builder: (context, AsyncSnapshot snapshot) {
        return Expanded(
          // note: ListView.builder 대신 separated 사용하여 기존 기능에 간격 추가할 수 있다
          child: ListView.separated(
            // note: 가로 정렬
            scrollDirection: Axis.horizontal,
            itemCount: snapshot.data!.length,
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(width: 20);
            },
            itemBuilder: (context, index) {
              // print(snapshot.data![index]);
              if (snapshot.hasData == null || snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasData) {
                return Container(
                  // height: 100,
                  width: 210,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.black.withOpacity(0.3),
                    // note: boxShadow: BoxShadow() // The argument type 'BoxShadow' can't be assigned to the parameter type 'List<BoxShadow>?'.
                    // note: offset: (1,1)          // The argument type '(int, int)' can't be assigned to the parameter type 'Offset'.
                    // boxShadow: [BoxShadow(blurRadius: 15, offset: Offset(10, 10))],
                  ),
                  // note: 이미지 꽉 채우기 - fit: BoxFit.fill
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => DetailScreen(id: '${snapshot.data![index].id}'))),
                    child: Image.network('https://image.tmdb.org/t/p/w500/${snapshot.data![index].poster_path}', fit: BoxFit.fill),
                  ),
                );
              }
              return Text('${snapshot.hasError}');
            },
          ),
        );
      },
    );
  }

}
