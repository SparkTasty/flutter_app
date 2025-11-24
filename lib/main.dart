import 'package:flutter/material.dart';
import 'mainsplash.dart';
import 'secondsplash.dart';
import 'thirdsplash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Go Mine',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        // ...existing theme...
      ),
      home: const MainSplashScreen(),
      routes: {
        '/second': (context) => const SecondSplashScreen(),
        '/third': (context) => const ThirdSplashScreen(),
        '/onboarding': (context) => const OnboardingScreen(),
      },
    );
  }
}
