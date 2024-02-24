import 'package:flutter/material.dart';
import 'package:popular_movies/services/api_serviece.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final data = ApiService.getPopularMovies();

  @override
  Widget build(BuildContext context) {
    TextStyle subjectText = TextStyle(fontWeight: FontWeight.bold, fontSize: 22);

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // note: popular movies
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text('Popular Movies', style: subjectText),
                    ),
                    Container(
                      width: 200,
                      child: Image.asset('assets/images/images.jpeg'),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                // note: now in cinemas
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text('Now in Cinemas', style: subjectText),
                    ),
                    Container(
                      width: 160,
                      child: Image.asset('assets/images/images.jpeg'),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                // note: coming soon
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text('Coming soon', style: subjectText),
                    ),
                    Container(
                      width: 160,
                      child: Image.asset('assets/images/images.jpeg'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
