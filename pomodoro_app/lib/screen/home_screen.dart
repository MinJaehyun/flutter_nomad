import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pomodoro_app/widgets/ResetTimer.dart';
import 'package:pomodoro_app/widgets/TimeView.dart';
import 'package:pomodoro_app/widgets/play_pause.dart';
import 'package:pomodoro_app/widgets/round_goal.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<int> resetValues = [1, 15, 20, 25, 30];
  int resetValue = 25;
  bool isTimer = false;

  int minute = 0;
  int second = 0;

  int totalCount = 1500;
  late Timer timer;

  // lib/widgets/round_goal.dart
  int round = 0;
  int goal = 0;

  @override
  Widget build(BuildContext context) {
    // note: 시스템 바 제거
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        backgroundColor: Colors.redAccent,
        appBar: renderAppBar(),
        body: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              // note: time
              Flexible(
                flex: 3,
                fit: FlexFit.tight,
                child: Container(
                  // note: 좌,우 12:17 박스 만들기
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 35),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // note: 12:57
                        TimeView(minute:minute, second:second),
                        SizedBox(height: 40),
                        // note: 리셋 기능
                        ResetTimer(resetValues:resetValues, resetValue:resetValue, selectedView:selectedView),
                        SizedBox(height: 60),
                        // note: 재생/일시정지 기능
                        PlayPause(isTimer: isTimer, onStartPressed: onStartPressed, onStopPressed: onStopPressed),
                      ],
                    ),
                  ),
                ),
              ),
              // note: RoundGoal
              Flexible(flex: 1, child: RoundGoal(round: round, goal: goal)),
            ],
          ),
        ),
      ),
    );
  }

  AppBar renderAppBar() {
    return AppBar(
      backgroundColor: Colors.redAccent,
      title: Text(
        'POMOTIMER',
        style: TextStyle(color: Colors.white.withOpacity(0.8), fontWeight: FontWeight.w600),
      ),
    );
  }

  // 재생 버튼
  void onStartPressed() {
    setState(() {
      isTimer = true;
    });
    // note: timer.cancel() 사용하려면 timer 변수 생성해야 한다.
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (totalCount == 0) {
          timer.cancel();
          round = round + 1;
          isTimer = false;
          // note: 59 종료 되는 부분 해결
          totalCount = resetValue * 60 + 1;
          if (round == 2) {
            goal = goal + 1;
            round = 0;
          }
        }
        totalCount = totalCount - 1;
        minute = totalCount ~/ 60;
        second = totalCount % 60;
      });
    });
  }

  // 일시 정지 버튼
  void onStopPressed() {
    timer.cancel();
    setState(() {
      isTimer = false;
    });
  }

  // note: 시간 클릭 시, 해당 시간으로 선택한 화면 나타냄
  void selectedView(index) {
    setState(() {
      resetValue = resetValues[index];
      minute = resetValue;
      second = 0;
      totalCount = resetValue * 60;
      round = 0;
      goal = 0;
    });
  }
}
