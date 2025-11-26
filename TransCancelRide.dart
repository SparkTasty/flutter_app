import 'package:flutter/material.dart';

class TransCancelRide extends StatefulWidget {
  const TransCancelRide({super.key});

  @override
  State<TransCancelRide> createState() => _TransCancelRideState();
}

class _TransCancelRideState extends State<TransCancelRide> {
  static const mainGreen = Color(0xFF00B345);
  int selectedReason = 0;

  final reasons = [
    "Change in plans",
    "Waiting for long time",
    "Unable to contact driver",
    "Driver denied to go to destination",
    "Driver denied to come to pickup",
    "Wrong address shown",
    "The price is not reasonable",
    "Emergency situation",
    "Booking mistake",
    "Poor weather conditions",
    "Other",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.black, size: 32),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Cancel Ride',
          style: TextStyle(
            fontFamily: 'Jaro',
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 26,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(26, 4, 0, 18),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Why are you cancelling?",
                style: TextStyle(
                  fontFamily: 'Jaro',
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 8),
              itemCount: reasons.length,
              itemBuilder: (context, i) {
                return ListTile(
                  leading: Radio<int>(
                    value: i,
                    groupValue: selectedReason,
                    onChanged: (value) {
                      setState(() {
                        selectedReason = value!;
                      });
                    },
                    activeColor: mainGreen,
                  ),
                  title: Text(
                    reasons[i],
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontFamily: 'Jaro',
                    ),
                  ),
                  contentPadding: EdgeInsets.only(left: 6, right: 24),
                  minLeadingWidth: 0,
                  horizontalTitleGap: 0,
                  visualDensity: VisualDensity.compact,
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(24, 0, 24, 24),
            child: SizedBox(
              height: 58,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: mainGreen,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                  elevation: 0,
                ),
                onPressed: () {
                  // Handle confirm/cancel logic here
                },
                child: Text(
                  "Confirm",
                  style: TextStyle(
                    fontFamily: 'Jaro',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
