import 'package:flutter/material.dart';

class RoundGoal extends StatelessWidget {
  final int round;
  final int goal;

  const RoundGoal({
    super.key, required this.round, required this.goal,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('$round/2', style: TextStyle(color: Colors.white.withOpacity(0.5), fontWeight: FontWeight.w600, fontSize: 25)),
              Text('ROUND', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600))
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('$goal/3', style: TextStyle(color: Colors.white.withOpacity(0.5), fontWeight: FontWeight.w600, fontSize: 25)),
              Text('GOAL', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),),
            ],
          ),
        ],
      ),
    );
  }
}