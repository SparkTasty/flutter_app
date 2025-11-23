import 'package:flutter/material.dart';

void main() {
  runApp(const GoMineApp());
}

class GoMineApp extends StatelessWidget {
  const GoMineApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF00B345), // green hex #00B345
      body: Center(
        child: Text(
          'Go Mine',
          style: TextStyle(
            fontFamily: 'Jaro', // add Jaro font in assets and pubspec.yaml
            fontSize: 64,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
