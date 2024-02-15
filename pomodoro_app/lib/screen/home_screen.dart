import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var counter = 3;

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('test', style: Theme.of(context).textTheme.displayLarge),
            ElevatedButton(onPressed: (){
              Timer.periodic(const Duration(seconds: 2), (timer) {
                print(timer.tick);
                counter--;
                if (counter == 0) {
                  print('Cancel timer');
                  timer.cancel();
                }
              });
            }, child: Text('test')),
          ],
        ),
      ),
    );
  }
}
