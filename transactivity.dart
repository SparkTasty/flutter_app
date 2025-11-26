import 'package:flutter/material.dart';

class TransActivityPage extends StatelessWidget {
  const TransActivityPage({super.key});

  @override
  Widget build(BuildContext context) {
    const mainGreen = Color(0xFF00B345);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // App bar substitute
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.directions_run_rounded, color: mainGreen, size: 28),
                  SizedBox(width: 8),
                  Text(
                    "Activity",
                    style: TextStyle(
                      fontFamily: 'Jaro',
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                    ),
                  ),
                  Spacer(),
                  Icon(Icons.more_vert, color: Colors.black, size: 26),
                  SizedBox(width: 8),
                ],
              ),
            ),
            // Filter tabs
            Padding(
              padding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: mainGreen,
                        foregroundColor: Colors.white,
                        shape: StadiumBorder(),
                        elevation: 0,
                        padding: EdgeInsets.symmetric(vertical: 10),
                      ),
                      onPressed: () {},
                      child: Text("Ongoing", style: TextStyle(fontSize: 17)),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.black,
                        side: BorderSide(color: Colors.black12, width: 1.5),
                        shape: StadiumBorder(),
                        padding: EdgeInsets.symmetric(vertical: 10),
                      ),
                      onPressed: () {},
                      child: Text("Scheduled", style: TextStyle(fontSize: 17)),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.black,
                        side: BorderSide(color: Colors.black12, width: 1.5),
                        shape: StadiumBorder(),
                        padding: EdgeInsets.symmetric(vertical: 10),
                      ),
                      onPressed: () {},
                      child: Text("Completed", style: TextStyle(fontSize: 17)),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.black,
                        side: BorderSide(color: Colors.black12, width: 1.5),
                        shape: StadiumBorder(),
                        padding: EdgeInsets.symmetric(vertical: 10),
                      ),
                      onPressed: () {},
                      child: Text("Cancelled", style: TextStyle(fontSize: 17)),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12),
            // Activity card
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 3),
              child: Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 28,
                            backgroundColor: mainGreen.withOpacity(0.12),
                            child: Icon(Icons.directions_car_filled, color: mainGreen, size: 28),
                          ),
                          SizedBox(width: 18),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Larchmont Hotel",
                                  style: TextStyle(
                                    fontFamily: 'Jaro',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 21,
                                  ),
                                ),
                                SizedBox(height: 6),
                                Row(
                                  children: [
                                    Text(
                                      "Today, Dec 22, 2024 · 09:41 AM",
                                      style: TextStyle(color: Colors.black54, fontSize: 15),
                                    ),
                                    Spacer(),
                                    Text("\$10.00",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18)),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text('GoRide Wallet', style: TextStyle(color: Colors.black54, fontSize: 15)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 17),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade50,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 18),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.place, color: mainGreen, size: 22),
                                SizedBox(width: 8),
                                Text("Bobst Library", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                              ],
                            ),
                            Divider(),
                            Row(
                              children: [
                                Icon(Icons.place, color: Colors.red, size: 22),
                                SizedBox(width: 8),
                                Text("Larchmont Hotel", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 18),
                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            foregroundColor: mainGreen,
                            side: BorderSide(color: mainGreen, width: 1.7),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(28)),
                          ),
                          onPressed: () {
                            // Go to route tracking
                          },
                          child: Text(
                            "Track Route",
                            style: TextStyle(
                              fontFamily: 'Jaro',
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: mainGreen,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Spacer(),
            // Bottom Navigation
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
              child: Row(
                children: [
                  _navItem(Icons.home_outlined, "Home", false, mainGreen),
                  _navItem(Icons.percent, "Promos", false, mainGreen),
                  _navItem(Icons.receipt_long, "Activity", true, mainGreen),
                  _navItem(Icons.person_outline, "Account", false, mainGreen),
                ],
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _navItem(IconData icon, String label, bool selected, Color mainGreen) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: selected ? mainGreen : Colors.black26),
          SizedBox(height: 2),
          Text(
            label,
            style: TextStyle(
              color: selected ? mainGreen : Colors.black26,
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
