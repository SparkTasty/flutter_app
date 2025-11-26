import 'package:flutter/material.dart';

class ActivityScheduledPage extends StatelessWidget {
  const ActivityScheduledPage({super.key});

  @override
  Widget build(BuildContext context) {
    const mainGreen = Color(0xFF00B345);

    final rides = [
      {
        'icon': Icons.directions_car_filled,
        'name': "Larchmont Hotel",
        'date': "Today, Dec 22, 2024 · 09:41 AM",
        'time': "16:00 PM",
        'dateShort': "Dec 23"
      },
      {
        'icon': Icons.electric_scooter_rounded,
        'name': "Strand Book Store",
        'date': "Dec 21, 2024 · 14:25 PM",
        'time': "10:30 AM",
        'dateShort': "Dec 24"
      },
      {
        'icon': Icons.directions_car_filled,
        'name': "Angelika Film Center &...",
        'date': "Dec 21, 2024 · 10:08 AM",
        'time': "19:00 PM",
        'dateShort': "Dec 24"
      },
      {
        'icon': Icons.electric_scooter_rounded,
        'name': "Beacon's Closet",
        'date': "Dec 20, 2024 · 08:46 AM",
        'time': "14:30 PM",
        'dateShort': "Dec 25"
      },
    ];

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
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.black,
                        side: BorderSide(color: Colors.black12, width: 1.5),
                        shape: StadiumBorder(),
                        padding: EdgeInsets.symmetric(vertical: 10),
                      ),
                      onPressed: () {},
                      child: Text("Ongoing", style: TextStyle(fontSize: 17)),
                    ),
                  ),
                  SizedBox(width: 8),
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
            SizedBox(height: 8),
            // Scheduled rides
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.only(left: 10, right: 10, top: 2),
                itemCount: rides.length,
                separatorBuilder: (_, __) => Divider(height: 1, color: Colors.black12),
                itemBuilder: (context, i) {
                  final ride = rides[i];
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundColor: mainGreen.withOpacity(0.10),
                          child: Icon(ride['icon'] as IconData, color: mainGreen),
                          radius: 28,
                        ),
                        SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                ride['name'].toString(),
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontFamily: 'Jaro',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                ride['date'].toString(),
                                style: TextStyle(color: Colors.black54, fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 6),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              ride['time']!.toString(),
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            SizedBox(height: 6),
                            Text(
                              ride['dateShort']!.toString(),
                              style: TextStyle(color: Colors.black54, fontSize: 15),
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
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
