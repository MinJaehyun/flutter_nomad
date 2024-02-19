import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webtoon/services/api_service.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DetailScreen extends StatefulWidget {
  // id, 이미지(todo: 불필요하면 추후 삭제하기), 제목, 별점 popularity?, 상영 시간 runtime,
  // note: 상위에서 받은 id 사용함
  late dynamic id;

  DetailScreen({super.key, required this.id});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<void> detailInfo;

  @override
  void initState() {
    super.initState();
    detailInfo = ApiService.getDetailInfo(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    // 화면 너비와 높이에 따라 자동으로 위치를 계산
    final double topPosition = screenSize.height;
    final double leftPosition = screenSize.width;

    return Scaffold(
      appBar: AppBar(title: const Text('Back to list')),
      body: FutureBuilder(
        future: detailInfo,
        builder: (context, AsyncSnapshot snapshot) {
          // note: FutureBuilder 이하에서 snapshot.connectionState == ConnectionState.waiting 처리해야 하는데, ListView 내 itemBuilder 이하에서 처리해서 로딩 기능이 실행 되지 않았다 !
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final snapshotData = snapshot.data!;
          final average = snapshotData.voteAverage / 2;
          late double showAverage = 0;

          // note:
          average >= 5
              ? showAverage = 5
              : average >= 4.5
                  ? showAverage = 4.5
                  : average >= 4
                      ? showAverage = 4
                      : average >= 3.5
                          ? showAverage = 3.5
                          : average >= 3
                              ? showAverage = 3
                              : average >= 2.5
                                  ? showAverage = 2.5
                                  : average >= 2
                                      ? showAverage = 2
                                      : average >= 1.5
                                          ? showAverage = 1.5
                                          : average >= 1
                                              ? showAverage = 1
                                              : average >= 0.5
                                                  ? showAverage = 0.5
                                                  : showAverage = 0;

          // note:
          var runTimeHour = 105 ~/ 60;
          var runTimeMin = 105 % 60;

          // note:
          String productionCompanies = '';
          for (var item in snapshotData.productionCompanies) {
            productionCompanies += '${item['name']}, \n';
          }

          return ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              // note: 배경이미지 전체 채우기 - 이미지 높이 설정 후, BoxFit.cover 설정
              return Stack(
                // final original_title, popularity, runtime, production_companies, overview;
                children: [
                  Image.network('https://image.tmdb.org/t/p/w500/${snapshotData!.posterPath}', fit: BoxFit.cover, height: 730),
                  Positioned(
                    top: topPosition * 0.2,
                    left: leftPosition * 0.05,
                    child: Text('${snapshotData.originalTitle}', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 35)),
                  ),
                  // note: rating 기능
                  Positioned(
                    top: topPosition * 0.27,
                    left: leftPosition * 0.03,
                    child: RatingBar.builder(
                      // print(snapshotData.vote_average.runtimeType); // double: 5.473
                      // note: 별점 10 만점 기준, (5,473 / 2)는 2이므로 별둘, (1: 별하나, 2:별둘, 3:별셋, 4:별넷 else: 별다섯)
                      initialRating: showAverage,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        debugPrint(rating as String?);
                      },
                    ),
                  ),
                  Positioned(
                    top: topPosition * 0.35,
                    left: leftPosition * 0.05,
                    child: Row(
                      children: [
                        Text(
                          '${runTimeHour}h ${runTimeMin}min',
                          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white.withOpacity(0.6), fontSize: 15),
                        ),
                        const SizedBox(width: 20),
                        Text(productionCompanies, style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 15), maxLines: 13),
                      ],
                    ),
                  ),
                  Positioned(
                    top: topPosition * 0.46,
                    left: leftPosition * 0.05,
                    child: const Text(
                      'Storyline',
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 30),
                    ),
                  ),
                  Positioned(
                    top: topPosition * 0.52,
                    left: leftPosition * 0.05,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Text('${snapshotData.overview}', style: const TextStyle(color: Colors.white, fontSize: 18)),
                    ),
                  ),
                  Positioned(
                    bottom: topPosition * 0.05,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 130),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.yellow,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          // error: 사이즈 조정 안되는 이유?
                          // maximumSize: const Size(100, 35),
                        ),
                        onPressed: () {
                          // todo: 추후, 클릭 시, inapp 결제하기
                        },
                        child: const Text(
                          'Buy ticket',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
