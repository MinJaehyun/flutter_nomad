import 'package:flutter/material.dart';

class PlayPause extends StatelessWidget {
  final isTimer;
  final void Function() onStartPressed;
  final void Function() onStopPressed;

  const PlayPause({super.key, this.isTimer, required this.onStartPressed, required this.onStopPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: IconButton(
        onPressed: !isTimer ? onStartPressed : onStopPressed,
        // 재생 누르면 일시정지 아이콘으로 변경하고, 일시정지 누르면 재생 아이콘으로 변경하기
        icon: !isTimer ? Icon(Icons.play_circle, size: 80) : Icon(Icons.pause_circle_outline_outlined, size: 80),
      ),
    );
  }
}
