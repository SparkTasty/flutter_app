import 'package:flutter/material.dart';

class RideDetailsScheduledPage extends StatelessWidget {
  const RideDetailsScheduledPage({super.key});

  @override
  Widget build(BuildContext context) {
    const mainGreen = Color(0xFF00B345);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black, size: 28),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Ride Details",
          style: TextStyle(
            fontFamily: 'Jaro',
            fontWeight: FontWeight.bold,
            fontSize: 28,
            color: Colors.black,
          ),
        ),
        actions: [
          Icon(Icons.more_vert, color: Colors.black),
          SizedBox(width: 12),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        child: Column(
          children: [
            // Scheduled ride card
            Padding(
              padding: EdgeInsets.fromLTRB(18, 12, 18, 2),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                elevation: 0,
                color: Color(0xFFF8F8F8),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
                  child: Column(
                    children: [
                      Text(
                        "Your Scheduled Ride",
                        style: TextStyle(
                          fontFamily: 'Jaro',
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Monday, Dec 23 - 16:00 PM",
                        style: TextStyle(fontSize: 19, color: Colors.black54),
                      ),
                      SizedBox(height: 18),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: mainGreen,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.info, color: Colors.white, size: 22),
                            SizedBox(width: 5),
                            Text(
                              "We'll notify you when a driver's found",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Ride info card
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 0),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                elevation: 0,
                color: Color(0xFFF8F8F8),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: mainGreen.withOpacity(0.09),
                        radius: 26,
                        child: Icon(Icons.directions_car_filled, color: mainGreen, size: 28),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "GoRide Car",
                                  style: TextStyle(
                                    fontFamily: 'Jaro',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                Spacer(),
                                Icon(Icons.check_circle, color: mainGreen, size: 20),
                                SizedBox(width: 4),
                                Text(
                                  "\$10.00",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                Icon(Icons.schedule, color: Colors.black45, size: 18),
                                SizedBox(width: 4),
                                Text("3-5 mins",
                                  style: TextStyle(color: Colors.black54),
                                ),
                                SizedBox(width: 16),
                                Icon(Icons.group_outlined, color: Colors.black45, size: 18),
                                SizedBox(width: 4),
                                Text("4 passengers", style: TextStyle(color: Colors.black54))
                              ],
                            ),
                            SizedBox(height: 3),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text("\$12.50",
                                  style: TextStyle(
                                    color: Colors.black45,
                                    fontSize: 17,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Pickup and Dropoff
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                elevation: 0,
                color: Color(0xFFF8F8F8),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 18),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.place, color: mainGreen, size: 24),
                          SizedBox(width: 8),
                          Text("Bobst Library",
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                        ],
                      ),
                      Divider(),
                      Row(
                        children: [
                          Icon(Icons.place, color: Colors.red, size: 24),
                          SizedBox(width: 8),
                          Text("Larchmont Hotel",
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Status and booking info
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 6),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                elevation: 0,
                color: Color(0xFFF8F8F8),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(child: Text("Status", style: TextStyle(fontWeight: FontWeight.bold))),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: mainGreen, width: 1.2),
                            ),
                            child: Text(
                              "Scheduled",
                              style: TextStyle(
                                color: mainGreen,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      _infoRow("Payment", "GoRide Wallet"),
                      _infoRow("Date", "Dec 22, 2024"),
                      _infoRow("Time", "09:41 AM"),
                      _infoRow("Transaction ID", "TRX1222240941", trailing: true),
                      _infoRow("Booking ID", "BKG720469", trailing: true),
                    ],
                  ),
                ),
              ),
            ),
            // Fare breakdown
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 6),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                elevation: 0,
                color: Color(0xFFF8F8F8),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                  child: Column(
                    children: [
                      _infoRow("Trip Fare", "\$12.50"),
                      _infoRow("Discounts (20%)", "- 2.50"),
                      Divider(),
                      _infoRow("Total Paid", "\$10.00", isBold: true),
                    ],
                  ),
                ),
              ),
            ),
            // Buttons
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: mainGreen,
                        side: BorderSide(color: mainGreen, width: 2),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32)),
                        padding: EdgeInsets.symmetric(vertical: 16),
                      ),
                      onPressed: () {
                        // Handle share receipt
                      },
                      child: Text(
                        "Share Receipt",
                        style: TextStyle(
                          color: mainGreen,
                          fontFamily: 'Jaro',
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 0),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.red,
                        side: BorderSide(color: Colors.red, width: 2),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32)),
                        padding: EdgeInsets.symmetric(vertical: 16),
                      ),
                      onPressed: () {
                        // Handle cancel ride
                      },
                      child: Text(
                        "Cancel Ride",
                        style: TextStyle(
                          color: Colors.red,
                          fontFamily: 'Jaro',
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 34),
          ],
        ),
      ),
    );
  }

  Widget _infoRow(String left, String right, {bool isBold = false, bool trailing = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7.0),
      child: Row(
        children: [
          Expanded(
            child: Text(left, style: TextStyle(fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
          ),
          if (trailing)
            Row(
              children: [
                Text(right, style: TextStyle(fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
                SizedBox(width: 6),
                Icon(Icons.copy_rounded, size: 18, color: Colors.black45),
              ],
            )
          else
            Text(
              right,
              style: TextStyle(fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
            ),
        ],
      ),
    );
  }
}
