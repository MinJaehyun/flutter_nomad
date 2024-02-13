import 'package:flutter/material.dart';
import 'package:ui_challenge/widgets/card.dart';
import 'package:ui_challenge/widgets/today.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          // 상단 날짜 위젯
          Expanded(child: Today()),
          // 중단 카드 위젯
          CardWidget(time: '11\n30\n  |\n12\n20', color: Colors.yellowAccent.shade100, text1: 'DESIGN',text2: 'MEETING', teamName: 'ALEX      HELENA      NANA'),
          CardWidget(time: '12\n35\n  |\n14\n10', color: Colors.purple.shade200,text1: 'DAILY',text2: 'PROJECT', teamName: 'ME     RICHARD     CIRY      +4'),
          CardWidget(time: '15\n00\n  |\n16\n30', color: Colors.green.shade100,text1: 'WEEKLY',text2: 'PLANNING', teamName: 'DEN     NANA     MARK'),
        ],
      ),
    );
  }
}
