import 'package:flutter/material.dart';

import 'package:webtoon/models/movies_model.dart';
import 'package:webtoon/screens/detail_screen.dart';
import 'package:webtoon/services/api_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<PopularMovieModel>> popularMovies = ApiService.getPopularMovies();
  final Future<List<NowPlayingModel>> nowPlayingMovies = ApiService.getNowPlaying();
  final Future<List<ComingSoonModel>> comingSoon = ApiService.getComingSoon();

  TextStyle mainTitleStyle = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 26,
    color: Colors.black,
  );

  TextStyle movieTitleStyle = TextStyle(
    fontWeight: FontWeight.w600,
    color: Colors.black.withOpacity(0.6),
  );

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            height: screenSize.height * 1.15,
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
                        Text('Popular Movies', style: mainTitleStyle),
                        futurePopular(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  // note: Now In Cinemas
                  SizedBox(
                    height: 250,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Now In Cinemas', style: mainTitleStyle),
                        futureNowPlaying(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  // note: Coming soon
                  SizedBox(
                    height: 250,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Coming soon', style: mainTitleStyle),
                        Expanded(child: futureComingSoon()),
                      ],
                    ),
                  ),
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
      builder: (context, AsyncSnapshot<List<ComingSoonModel>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('에러 발생: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Text('데이터 없음');
        }
        return ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: snapshot.data!.length, // ['results']
          separatorBuilder: (context, index) {
            return const SizedBox(width: 25);
          },
          itemBuilder: (context, index) {
            if (snapshot.hasData) {
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
                        child: Image.network('https://image.tmdb.org/t/p/w500/${snapshot.data![index].posterPath}'),
                      ),
                    ),
                    Text('${snapshot.data![index].title}',),
                  ],
                ),
              );
            }
            return null;
          },
        );
      },
    );
  }

  FutureBuilder<List<NowPlayingModel>> futureNowPlaying() {
    return FutureBuilder(
      future: nowPlayingMovies,
      builder: (context, AsyncSnapshot<List<NowPlayingModel>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('에러 발생: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Text('데이터 없음');
        }
        return Expanded(
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: snapshot.data!.length,
            separatorBuilder: (context, index) {
              return const SizedBox(width: 20);
            },
            itemBuilder: (context, index) {
              if (snapshot.hasData) {
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
                          child: Image.network('https://image.tmdb.org/t/p/w500/${snapshot.data![index].posterPath}'),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 100,
                      child: Text(
                        overflow: TextOverflow.ellipsis,
                        '${snapshot.data![index].title}',
                        style: movieTitleStyle
                      ),
                    ),
                  ],
                );
              }
              return null;
            },
          ),
        );
      },
    );
  }

  FutureBuilder<List<PopularMovieModel>> futurePopular() {
    return FutureBuilder(
      future: popularMovies,
      builder: (context, AsyncSnapshot<List<PopularMovieModel>> snapshot) {
        // note: FutureBuilder 이하에서 snapshot.connectionState == ConnectionState.waiting 처리해야 하는데, ListView 내 itemBuilder 이하에서 처리해서 로딩 기능이 실행 되지 않았다 !
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('에러 발생: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Text('데이터 없음');
        }
        return Expanded(
          // note: ListView.builder 대신 separated 사용하여 기존 기능에 간격 추가할 수 있다
          child: ListView.separated(
            // note: 가로 정렬
            scrollDirection: Axis.horizontal,
            itemCount: snapshot.data!.length,
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(width: 20);
            },
            itemBuilder: (context, index) {
              if (snapshot.hasData) {
                return Container(
                  width: 290,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
                  // note: 이미지 꽉 채우기 - fit: BoxFit.fill
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => DetailScreen(id: '${snapshot.data![index].id}'))),
                    child: Image.network('https://image.tmdb.org/t/p/w500/${snapshot.data![index].posterPath}', fit: BoxFit.fill),
                  ),
                );
              }
              return null;
            },
          ),
        );
      },
    );
  }
}
