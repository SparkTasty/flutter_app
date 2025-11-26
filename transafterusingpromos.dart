import 'package:flutter/material.dart';

class RideSelectionPage extends StatefulWidget {
  const RideSelectionPage({super.key});

  @override
  State<RideSelectionPage> createState() => _RideSelectionPageState();
}

class _RideSelectionPageState extends State<RideSelectionPage> {
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
    {
      "label": "GoMine Car Premium",
      "icon": Icons.directions_car_rounded,
      "desc": "4-5 mins • 4 passengers",
      "price": 16.00,
      "oldPrice": 20.00,
    },
    {
      "label": "GoMine Scooter",
      "icon": Icons.electric_scooter_rounded,
      "desc": "3-4 mins • 1 passenger",
      "price": 4.80,
      "oldPrice": 6.00,
    },
    {
      "label": "GoMine Scooter Comfort",
      "icon": Icons.two_wheeler_rounded,
      "desc": "4-5 mins • 1 passenger",
      "price": 6.40,
      "oldPrice": 8.00,
    },
    {
      "label": "GoMine Scooter Plus",
      "icon": Icons.two_wheeler,
      "desc": "3-5 mins • 1 passenger",
      "price": 8.00,
      "oldPrice": 10.00,
    },
    {
      "label": "GoMine Scooter Premium",
      "icon": Icons.moped,
      "desc": "3-5 mins • 1 passenger",
      "price": 10.00,
      "oldPrice": 12.50,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Map preview placeholder
            Container(
              height: 170,
              width: double.infinity,
              color: Colors.grey[200], // Replace with GoogleMap if available
              alignment: Alignment.center,
              child: Text("Map Preview", style: TextStyle(color: Colors.black38)),
            ),
            // Pickup/dropoff display
            Padding(
              padding: const EdgeInsets.only(left: 14, right: 14, top: 8, bottom: 4),
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
                    _destinationRow(Icons.place, mainGreen, "Bobst Library"),
                    SizedBox(height: 3),
                    _destinationRow(Icons.place, Colors.red, "Larchmont Hotel"),
                  ],
                ),
              ),
            ),
            // Ride options list
            Expanded(
              child: ListView.separated(
                itemCount: rideOptions.length,
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                separatorBuilder: (_, __) => SizedBox(height: 8),
                itemBuilder: (context, i) {
                  final opt = rideOptions[i];
                  final selected = i == selectedIndex;
                  return GestureDetector(
                    onTap: () => setState(() => selectedIndex = i),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: selected ? mainGreen : Colors.transparent,
                          width: selected ? 2 : 0,
                        ),
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                      child: Row(
                        children: [
                          Icon(opt["icon"], color: mainGreen, size: 46),
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
                                Text(opt["desc"], style: TextStyle(color: Colors.black54)),
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
                              SizedBox(height: 1),
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
                  );
                },
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
