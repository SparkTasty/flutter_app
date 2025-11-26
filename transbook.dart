import 'package:flutter/material.dart';

class TransBookingPage extends StatefulWidget {
  const TransBookingPage({super.key});

  @override
  State<TransBookingPage> createState() => _TransBookingPageState();
}

class _TransBookingPageState extends State<TransBookingPage> {
  static const Color mainGreen = Color(0xFF00B345);

  int selectedIndex = 0;
  final List<Map<String, dynamic>> rideOptions = [
    {
      "label": "GoMine Car",
      "icon": Icons.directions_car_filled_rounded,
      "desc": "3-5 mins • 4 passengers",
      "price": 10.00,
      "oldPrice": 12.50,
    },
    {
      "label": "GoMine Car XL",
      "icon": Icons.airport_shuttle_rounded,
      "desc": "4-6 mins • 6 passengers",
      "price": 12.00,
      "oldPrice": 15.00,
    },
    {
      "label": "GoMine Car Plus",
      "icon": Icons.electric_car_rounded,
      "desc": "4-5 mins • 4 passengers",
      "price": 13.20,
      "oldPrice": 16.50,
    },
  ];
  String paymentMethod = "GoMine Wallet";
  String promoCode = "EOYP25";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Map preview placeholder
            Container(
              height: 180,
              width: double.infinity,
              color: Colors.grey[200], // Replace with GoogleMap if available
              alignment: Alignment.center,
              child: Text("Map Preview", style: TextStyle(color: Colors.black38)),
            ),
            // Pickup/dropoff card
            Padding(
              padding: const EdgeInsets.only(left: 14, right: 14, top: 8, bottom: 3),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
                ),
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _destinationRow(Icons.place, mainGreen, 'Bobst Library'),
                    SizedBox(height: 3),
                    _destinationRow(Icons.place, Colors.red, 'Larchmont Hotel'),
                  ],
                ),
              ),
            ),
            // Ride options list
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: Card(
                elevation: 0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                child: Column(
                  children: List.generate(rideOptions.length, (i) {
                    final opt = rideOptions[i];
                    final selected = i == selectedIndex;
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 6),
                      child: GestureDetector(
                        onTap: () => setState(() => selectedIndex = i),
                        child: Container(
                          decoration: BoxDecoration(
                            color: selected ? Colors.green.shade50 : Colors.white,
                            border: Border.all(
                              color: selected ? mainGreen : Colors.transparent,
                              width: selected ? 2 : 0,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 14, vertical: 15),
                          child: Row(
                            children: [
                              Icon(opt["icon"], color: mainGreen, size: 44),
                              SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      opt["label"],
                                      style: TextStyle(
                                        fontFamily: "Jaro",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    SizedBox(height: 3),
                                    Text(
                                      opt["desc"],
                                      style: TextStyle(color: Colors.black54),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.check_circle, color: mainGreen, size: 20),
                                      SizedBox(width: 3),
                                      Text(
                                        "\$${opt["price"].toStringAsFixed(2)}",
                                        style: TextStyle(
                                          fontFamily: "Jaro",
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 2),
                                  Text(
                                    '\$${opt["oldPrice"].toStringAsFixed(2)}',
                                    style: TextStyle(
                                      color: Colors.black54,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
            // Payment, Promos, Book button
            Padding(
              padding: EdgeInsets.only(top: 10, left: 10, right: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 7,
                        child: Text("Payment", style: TextStyle(fontFamily: 'Jaro', fontWeight: FontWeight.bold)),
                      ),
                      Expanded(
                        flex: 10,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(paymentMethod, style: TextStyle(fontFamily: 'Jaro')),
                              Icon(Icons.chevron_right, color: Colors.black54),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        flex: 7,
                        child: Text("Promos / Vouchers", style: TextStyle(fontFamily: 'Jaro', fontWeight: FontWeight.bold)),
                      ),
                      Expanded(
                        flex: 10,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: mainGreen, width: 1.5),
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.transparent,
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            child: Text(
                              promoCode,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Jaro',
                                color: mainGreen,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 3),
                      Icon(Icons.chevron_right, color: Colors.black54),
                    ],
                  ),
                  SizedBox(height: 18),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 26,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.calendar_month, color: mainGreen, size: 26),
                        foregroundColor: Colors.green.shade200,
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: SizedBox(
                          height: 54,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: mainGreen,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(28),
                              ),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, '/transnearby');
                              // Book car logic here
                            },
                            child: Text(
                              "Book GoMine Car",
                              style: TextStyle(
                                fontFamily: "Jaro",
                                fontWeight: FontWeight.bold,
                                fontSize: 19,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _destinationRow(IconData icon, Color c, String label) => Row(
        children: [
          Icon(icon, color: c, size: 26),
          SizedBox(width: 10),
          Text(label, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
        ],
      );
}
