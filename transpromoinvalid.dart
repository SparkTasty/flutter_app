import 'package:flutter/material.dart';

class TransPromoError extends StatelessWidget {
  const TransPromoError({super.key});

  @override
  Widget build(BuildContext context) {
    const mainGreen = Color(0xFF00B345);

    return Stack(
      children: [
        // Greyed out background overlay
        ModalBarrier(
          dismissible: false,
          color: Colors.black.withOpacity(0.45),
        ),
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
                // Big X in a red circular background
                Container(
                  height: 74,
                  width: 74,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.redAccent,
                  ),
                  child: Icon(Icons.close, color: Colors.white, size: 48),
                ),
                SizedBox(height: 16),
                Text(
                  "Whoops!",
                  style: TextStyle(
                    fontFamily: "Jaro",
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                SizedBox(height: 9),
                Text(
                  "It looks like the promo code you entered is invalid or expired.",
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.black54,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
