import 'package:flutter/material.dart';

class CancelSuccessPage extends StatelessWidget {
  const CancelSuccessPage({super.key});

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
          icon: Icon(Icons.close, color: Colors.black, size: 32),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(flex: 6),
          // Checkmark
          Icon(Icons.check_circle, color: mainGreen, size: 92),
          SizedBox(height: 34),
          // Main message
          Text(
            "Ride has been canceled!",
            style: TextStyle(
              fontFamily: 'Jaro',
              fontWeight: FontWeight.bold,
              fontSize: 27,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 18),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              "Funds have been returned to your account. You can see the cancellation history in the activity menu.",
              style: TextStyle(fontSize: 18, color: Colors.black54),
              textAlign: TextAlign.center,
            ),
          ),
          Spacer(flex: 10),
          Padding(
            padding: EdgeInsets.fromLTRB(24, 12, 24, 32),
            child: SizedBox(
              width: double.infinity,
              height: 58,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: mainGreen,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32)),
                  elevation: 0,
                ),
                onPressed: () {
                  Navigator.pop(context); // Navigate as needed
                },
                child: Text(
                  "OK",
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
