import 'package:flutter/material.dart';

class TimeView extends StatelessWidget {
  final minute, second;
  const TimeView({super.key, this.minute, this.second});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Container(
                height: 4,
                width: 75,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              Container(
                height: 4,
                width: 80,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              Container(
                height: 120,
                width: 90,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Center(
                  child: Text(
                    minute >= 10 ? minute.toString() : '0${minute.toString()}',
                    style: TextStyle(fontSize: 45, color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
          Text(
            ':',
            style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 40),
          ),
          Column(
            children: [
              Container(
                height: 4,
                width: 75,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              Container(
                height: 4,
                width: 80,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              Container(
                height: 120,
                width: 90,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Center(
                  child: Text(
                    second >= 10 ? second.toString() : '0${second.toString()}',
                    style: TextStyle(fontSize: 45, color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
