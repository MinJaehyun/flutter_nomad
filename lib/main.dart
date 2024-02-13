import 'package:flutter/material.dart';
import 'package:ui_challenge/screen/home_screen.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Color greyBlack = Color(0xFF202020);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFF202020),
        appBar: AppBar(
          backgroundColor: greyBlack,
          title: ClipOval(
            child: SizedBox.fromSize(
              size: Size.fromRadius(26), // Image radius
              child: Image.asset('assets/image/face.png', fit: BoxFit.cover),
            ),
          ),
          actions: [
            IconButton(onPressed: (){}, icon: Icon(Icons.add, color: Colors.white)),
          ],
        ),
        body: HomeScreen(),
      ),
    );
  }
}
