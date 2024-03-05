import 'package:flutter/material.dart';
import 'package:popular_movies/services/api_service.dart';

class DetailScreen extends StatefulWidget {
  final int id;

  const DetailScreen({super.key, required this.id});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<void> detailMovie;

  @override
  void initState() {
    super.initState();
    detailMovie = ApiService.getDetailMovie(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    // print(detailMovie); // Instance of 'Future<List<DetailMovie>>'

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text('Back'),
          ),
          body: FutureBuilder(
            future: detailMovie,
            builder: (context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              }
              // return Image.network('https://image.tmdb.org/t/p/w500/${snapshotData!.posterPath}');
              return Image.network('https://image.tmdb.org/t/p/w500/${snapshot.data!.posterPath}');
            },
          )),
    );
  }
}

// child: Image.network('https://image.tmdb.org/t/p/w500${}'),
