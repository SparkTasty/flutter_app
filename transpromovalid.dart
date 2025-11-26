import 'package:flutter/material.dart';

class TransPromoValid extends StatelessWidget {
  const TransPromoValid({super.key});

  @override
  Widget build(BuildContext context) {
    const mainGreen = Color(0xFF00B345);

    return Stack(
      children: [
        // Dark overlay on background
        ModalBarrier(
          dismissible: false,
          color: Colors.black.withOpacity(0.45),
        ),
        // Bottom modal sheet
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 20)],
            ),
            padding: EdgeInsets.only(top: 38, left: 18, right: 18, bottom: 36),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Big green checkmark
                Container(
                  height: 74,
                  width: 74,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: mainGreen,
                  ),
                  child: Icon(Icons.check, color: Colors.white, size: 48),
                ),
                SizedBox(height: 16),
                Text(
                  "Promo Code Applied!",
                  style: TextStyle(
                    fontFamily: "Jaro",
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                SizedBox(height: 11),
                Text(
                  "Your promo code has been successfully redeemed. Enjoy your discounted ride!",
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.black54,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 32),
                Row(
                  children: [
                    // Use Later button (outline/secondary style)
                    Expanded(
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          foregroundColor: mainGreen,
                          backgroundColor: mainGreen.withOpacity(0.1),
                          side: BorderSide.none,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 18),
                        ),
                        onPressed: () {
                          // Handle Use Later
                          Navigator.pop(context, 'later');
                        },
                        child: Text(
                          "Use Later",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: mainGreen,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 14),
                    // Use Now button (solid)
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: mainGreen,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 18),
                        ),
                        onPressed: () {
                          // Handle Use Now
                          Navigator.pop(context, 'now');
                        },
                        child: Text(
                          "Use Now",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
