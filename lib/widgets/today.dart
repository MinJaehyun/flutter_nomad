import 'package:flutter/material.dart';

class Today extends StatelessWidget {
  const Today({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('MONDAY 16', style: TextStyle(color: Color(0xFFFEFEFE))),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'TODAY',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 40),
                    ),
                    Icon(Icons.circle, color: Colors.red.withOpacity(0.5), size: 12),
                    Text(
                      '17 18 19 2',
                      style: TextStyle(color: Colors.white.withOpacity(0.5), fontWeight: FontWeight.w600, fontSize: 40),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
