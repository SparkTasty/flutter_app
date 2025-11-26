import 'package:flutter/material.dart';

class SetPickupPage extends StatelessWidget {
  const SetPickupPage({super.key});

  @override
  Widget build(BuildContext context) {
    const mainGreen = Color(0xFF00B345);
    final addressName = "Bobst Library";
    final addressDetail = "70 Washington Square S, New York, NY 10012";

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            // Map placeholder (replace with GoogleMap widget for real maps)
            Positioned.fill(
              child: Column(
                children: [
                  Expanded(
                    flex: 7,
                    child: Container(
                      width: double.infinity,
                      color: Colors.grey.shade300,
                      child: Center(
                        child: Text(
                          "Map Placeholder",
                          style: TextStyle(
                            fontFamily: 'Jaro',
                            fontSize: 24,
                            color: Colors.black38,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: SizedBox(),
                  ),
                ],
              ),
            ),
            // Bottom Sheet for Pickup Details
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(24)),
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 32)],
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Sheet drag bar
                      Center(
                        child: Container(
                          width: 40,
                          height: 4,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      SizedBox(height: 18),
                      Text(
                        'Set pickup location',
                        style: TextStyle(
                          fontFamily: 'Jaro',
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                      SizedBox(height: 18),
                      Row(
                        children: [
                          Icon(Icons.location_on, color: mainGreen, size: 36),
                          SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  addressName,
                                  style: TextStyle(
                                    fontFamily: 'Jaro',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  addressDetail,
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 10),
                          IconButton(
                            icon: Icon(Icons.edit, color: Colors.grey.shade700),
                            onPressed: () {
                              // Add pickup edit logic (or show address autocomplete)
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 28),
                      SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: mainGreen,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(28),
                            ),
                          ),
                          onPressed: () {
                            // Confirm and proceed to next step
                          },
                          child: Text(
                            "Next",
                            style: TextStyle(
                              fontFamily: "Jaro",
                              fontWeight: FontWeight.bold,
                              fontSize: 19,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Navigation Back Button
            Positioned(
              left: 18,
              top: 18,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(color: Colors.black12, blurRadius: 8)
                  ],
                ),
                child: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.black, size: 28),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ),
            // Center dot for current pickup marker (optional)
          ],
        ),
      ),
    );
  }
}
