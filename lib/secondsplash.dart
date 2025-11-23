import 'package:flutter/material.dart';

class SecondSplashScreen extends StatelessWidget {
  const SecondSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF00B345), // hex green
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Container(
                height: 400, // adjust as needed
                width: MediaQuery.of(context).size.width * 0.92,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 36),
                      child: Column(
                        children: [
                          Text(
                            'Your City, Simplified.',
                            style: TextStyle(
                              fontFamily: 'Jaro',
                              fontSize: 24,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 8),
                          Text(
                            'All your needs, one seamless app.',
                            style: TextStyle(
                              fontFamily: 'Jaro',
                              fontSize: 18,
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 36,
              right: 24,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  shadowColor: Colors.transparent,
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  textStyle: TextStyle(
                    fontFamily: 'Jaro',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  // Navigate to third splash page
                  Navigator.pushNamed(context, '/thirdSplash');
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Get Started / Explore Services'),
                    SizedBox(width: 6),
                    Icon(Icons.chevron_right),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
