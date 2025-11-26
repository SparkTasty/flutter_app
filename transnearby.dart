import 'package:flutter/material.dart';

class TransNearbyPage extends StatelessWidget {
  const TransNearbyPage({super.key});

  @override
  Widget build(BuildContext context) {
    const mainGreen = Color(0xFF00B345);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Map placeholder
          Positioned.fill(
            child: Container(
              color: Colors.grey.shade200,
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  SizedBox(height: 36),
                  // Origin & destination card
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 12)],
                      ),
                      padding: EdgeInsets.symmetric(vertical: 18, horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _destRow(mainGreen, "Bobst Library"),
                          SizedBox(height: 6),
                          _destRow(Colors.red, "Larchmont Hotel"),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      // Replace with animated/ripple effect as needed
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 230,
                            height: 230,
                            decoration: BoxDecoration(
                              color: mainGreen.withOpacity(0.13),
                              shape: BoxShape.circle,
                            ),
                          ),
                          Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                              color: mainGreen.withOpacity(0.18),
                              shape: BoxShape.circle,
                            ),
                          ),
                          Container(
                            width: 90,
                            height: 90,
                            decoration: BoxDecoration(
                              color: mainGreen.withOpacity(0.30),
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 7),
                              boxShadow: [
                                BoxShadow(
                                    color: mainGreen.withOpacity(0.22),
                                    blurRadius: 22),
                              ],
                            ),
                            child: ClipOval(
                              // Replace with user's profile image, if desired
                              child: Image.network(
                                'https://randomuser.me/api/portraits/men/65.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Bottom Sheet
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
                boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 16)],
              ),
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 18),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 40,
                    height: 6,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  SizedBox(height: 18),
                  Text(
                    "Finding you a nearby driver…",
                    style: TextStyle(
                      fontFamily: 'Jaro',
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  SizedBox(height: 14),
                  Text(
                    "The driver will pick you up as soon as possible after they confirm your order.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: mainGreen.withOpacity(0.08),
                      child: Icon(Icons.radar, color: mainGreen, size: 36),
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 54,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.red,
                        side: BorderSide(color: Colors.red, width: 2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 14),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/maintransport');
                        // Cancel logic here
                      },
                      child: Text(
                        "Cancel Ride",
                        style: TextStyle(
                          fontFamily: "Jaro",
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                ],
              ),
            ),
          ),
          // Back button
          Positioned(
            left: 12,
            top: 44,
            child: CircleAvatar(
              backgroundColor: Colors.white.withOpacity(0.9),
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _destRow(Color color, String label) => Row(
        children: [
          Icon(Icons.place, color: color, size: 22),
          SizedBox(width: 8),
          Text(label, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17)),
        ],
      );
}
