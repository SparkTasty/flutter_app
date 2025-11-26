import 'package:flutter/material.dart';

class OptionsFeesPage extends StatefulWidget {
  const OptionsFeesPage({super.key});

  @override
  State<OptionsFeesPage> createState() => _OptionsFeesPageState();
}

class _OptionsFeesPageState extends State<OptionsFeesPage> {
  static const Color mainGreen = Color(0xFF00B345); // added explicit type
  int seaters = 4; // Default/initial

  // Demo vehicle options
  final List<Map<String, dynamic>> vehicleOptions = [
    {
      "type": "GoMine Car",
      "img": Icons.directions_car_filled,
      "fee": "\$12.50",
      "desc": "3-5 mins • 4 passengers"
    },
    {
      "type": "GoMine Car XL",
      "img": Icons.taxi_alert,
      "fee": "\$15.00",
      "desc": "4-6 mins • 6 passengers"
    },
    {
      "type": "GoMine Car Plus",
      "img": Icons.local_taxi, // replaced invalid/unsupported icon
      "fee": "\$16.00",
      "desc": "4-5 mins • 4 passengers"
    },
  ];

  int selectedVehicle = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Map placeholder (if needed)
            Expanded(
              flex: 3,
              child: Container(
                width: double.infinity,
                color: Colors.grey.shade300,
                child: Center(
                  child: Text("Map Here", style: TextStyle(color: Colors.black38)),
                ),
              ),
            ),
            // Vehicle options and rest of page
            Expanded(
              flex: 4,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 18),
                    // Number of seaters row
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Number of seaters",
                            style: TextStyle(
                              fontFamily: 'Jaro',
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.remove_circle_outline, color: mainGreen),
                                onPressed: seaters > 1
                                    ? () => setState(() => seaters--)
                                    : null,
                              ),
                              Container(
                                width: 34,
                                alignment: Alignment.center,
                                child: Text(
                                  "$seaters",
                                  style: TextStyle(
                                    fontFamily: 'Jaro',
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.add_circle_outline, color: mainGreen),
                                onPressed: seaters < 6
                                    ? () => setState(() => seaters++)
                                    : null,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    // Vehicle options
                    ...List.generate(vehicleOptions.length, (i) {
                      final opt = vehicleOptions[i];
                      final selected = i == selectedVehicle;
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                        child: GestureDetector(
                          onTap: () => setState(() => selectedVehicle = i),
                          child: Container(
                            decoration: BoxDecoration(
                              color: selected ? mainGreen.withOpacity(.08) : Colors.white,
                              border: Border.all(
                                  color: selected ? mainGreen : Colors.grey.shade300,
                                  width: selected ? 2 : 1),
                              borderRadius: BorderRadius.circular(14),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 18),
                            child: Row(
                              children: [
                                Icon(opt["img"], color: mainGreen, size: 36),
                                SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        opt["type"],
                                        style: TextStyle(
                                          fontFamily: "Jaro",
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17,
                                        ),
                                      ),
                                      Text(
                                        opt["desc"],
                                        style: TextStyle(color: Colors.black54),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  opt["fee"],
                                  style: TextStyle(
                                    fontFamily: 'Jaro',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                    // Payment/Promos section
                    SizedBox(height: 14),
                    ListTile(
                      title: Text(
                        "Payment",
                        style: TextStyle(fontFamily: 'Jaro', fontWeight: FontWeight.bold),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("GoMine Wallet", style: TextStyle(fontFamily: 'Jaro')),
                          Icon(Icons.chevron_right, color: Colors.black45),
                        ],
                      ),
                      onTap: () {},
                    ),
                    Divider(),
                    ListTile(
                      title: Text(
                        "Promos / Vouchers",
                        style: TextStyle(fontFamily: 'Jaro', fontWeight: FontWeight.bold),
                      ),
                      trailing: Icon(Icons.chevron_right, color: Colors.black45),
                      onTap: () {},
                    ),
                    Divider(),
                    SizedBox(height: 12),
                    // Book button bar
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
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
                                  // Book logic here
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
                      ),
                    ),
                    SizedBox(height: 30),
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
