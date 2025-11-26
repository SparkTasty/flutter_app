import 'package:flutter/material.dart';

class DriverEnRoutePage extends StatelessWidget {
  const DriverEnRoutePage({super.key});

  @override
  Widget build(BuildContext context) {
    const mainGreen = Color(0xFF00B345);

    // For example UI
    final driver = {
      "name": "Theo Holland",
      "rating": "4.8",
      "phone": "+1 (646) 555-5640",
      "image": "https://randomuser.me/api/portraits/men/32.jpg",
      "car": "Toyota Corolla, White · NYC-3560",
      "ride": "GoMine Car",
      "payment": "GoMine Wallet",
      "fare": 12.50,
      "discount": 2.50,
      "total": 10.00,
    };

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Map preview (replace with GoogleMap if needed)
          Positioned.fill(
            child: Column(
              children: [
                Container(
                  color: Colors.grey.shade200,
                  height: 200,
                  width: double.infinity,
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(top: 38.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      width: 360,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _destRow(mainGreen, "Bobst Library"),
                          SizedBox(height: 5),
                          _destRow(Colors.red, "Larchmont Hotel"),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 36),
                // Optionally, car icon and path over the map here
              ],
            ),
          ),
          // Draggable bottom sheet
          DraggableScrollableSheet(
            initialChildSize: 0.32,
            minChildSize: 0.22,
            maxChildSize: 0.85,
            builder: (context, scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 18)],
                ),
                child: SingleChildScrollView(
                  controller: scrollController,
                  padding: EdgeInsets.symmetric(horizontal: 18, vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          width: 40,
                          height: 6,
                          margin: EdgeInsets.only(bottom: 12),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      Text(
                        "Driver is heading to your location...",
                        style: TextStyle(
                          fontFamily: 'Jaro',
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Driver will arriving in 1 min...",
                        style: TextStyle(fontSize: 15, color: Colors.black54),
                      ),
                      Text(
                        driver["car"] as String,
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black87),
                      ),
                      SizedBox(height: 18),
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(driver["image"] as String),
                            radius: 28,
                          ),
                          SizedBox(width: 18),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  driver["name"] as String,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 19,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.star, color: Colors.amber, size: 18),
                                    SizedBox(width: 4),
                                    Text((driver["rating"] ?? '').toString(), style: TextStyle(fontWeight: FontWeight.bold)),
                                    SizedBox(width: 12),
                                    Icon(Icons.phone, color: Colors.black45, size: 16),
                                    SizedBox(width: 4),
                                    Text((driver["phone"] ?? '').toString(), style: TextStyle(color: Colors.black54)),
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(width: 6),
                          _actionIcon(mainGreen, Icons.message, () {
                            // Chat logic
                          }),
                          SizedBox(width: 10),
                          _actionIcon(mainGreen, Icons.phone, () {
                            // Call logic
                          }),
                        ],
                      ),
                      // Only show fare breakdown if expanded enough (or always if you prefer)
                      SizedBox(height: 18),
                      Card(
                        margin: EdgeInsets.all(0),
                        elevation: 0,
                        child: Column(
                          children: [
                            _detailRow("Ride", (driver["ride"] ?? '').toString()),
                            _detailRow("Payment", (driver["payment"] ?? '').toString()),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Card(
                        margin: EdgeInsets.all(0),
                        elevation: 0,
                        child: Column(
                          children: [
                            _detailRow("Trip Fare", "\$${(driver["fare"] as num).toStringAsFixed(2)}"),
                            _detailRow("Discounts (20%)", "- \$${(driver["discount"] as num).toStringAsFixed(2)}"),
                            Divider(),
                            _detailRow(
                              "Total Paid",
                              "\$${(driver["total"] as num).toStringAsFixed(2)}",
                              isBold: true,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 18),
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
                            // Cancel ride logic
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
                      SizedBox(height: 16),
                    ],
                  ),
                ),
              );
            },
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

  Widget _actionIcon(Color mainGreen, IconData icon, VoidCallback onTap) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: mainGreen, width: 2),
        ),
        child: Icon(icon, color: mainGreen, size: 24),
      ),
    );
  }

  Widget _detailRow(String left, String right, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(left, style: TextStyle(fontWeight: isBold ? FontWeight.bold : FontWeight.w500)),
          Text(right, style: TextStyle(fontWeight: isBold ? FontWeight.bold : FontWeight.w500)),
        ],
      ),
    );
  }
}
