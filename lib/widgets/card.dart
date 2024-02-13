import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String time;
  final Color color;
  final String text1;
  final String text2;
  final String teamName;

  const CardWidget({super.key, required this.time, required this.color, required this.text1, required this.text2, required this.teamName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      time,
                      style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w800),
                    ),
                    SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: text1,
                            style: TextStyle(color: Colors.black, fontSize: 46, fontWeight: FontWeight.w600),
                            children:  <TextSpan>[
                              TextSpan(text: '\n${text2}', style: TextStyle(color: Colors.black, fontSize: 46, fontWeight: FontWeight.w600)),
                            ],
                          ),
                        ),
                        SizedBox(height: 24),
                        if(teamName == 'ME     RICHARD     CIRY      +4')
                        RichText(
                          text: TextSpan(
                            text: '${teamName.substring(0, 2)}',
                            style: TextStyle(color: Colors.black),
                            children:  <TextSpan>[
                              TextSpan(text: '${teamName.substring(2)}', style: TextStyle(color: Colors.black.withOpacity(0.5))),
                            ],
                          ),
                        ),
                        if(teamName != 'ME     RICHARD     CIRY      +4')
                        Text(
                          teamName,
                          style: TextStyle(color: Colors.black.withOpacity(0.5)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
