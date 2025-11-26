import 'package:flutter/material.dart';

class PaymentMethodPage extends StatefulWidget {
  const PaymentMethodPage({super.key});

  @override
  State<PaymentMethodPage> createState() => _PaymentMethodPageState();
}

class _PaymentMethodPageState extends State<PaymentMethodPage> {
  static const mainGreen = Color(0xFF00B345);
  int selectedIndex = 0; // Highlighted choice

  final List<Map<String, dynamic>> paymentOptions = [
    {
      "icon": Icons.account_balance_wallet,
      "label": "GoMine Wallet",
      "subtitle": "Available balance: \$2,069.50",
      "color": mainGreen,
    },
    {
      "icon": Icons.attach_money,
      "label": "Cash",
      "subtitle": "Pay drivers cash directly",
      "color": mainGreen,
    },
    {
      "icon": Icons.account_balance, // Substitute for PayPal
      "label": "PayPal",
      "subtitle": "andrew.ainsley@yourdomain.com",
      "color": Colors.blue,
    },
    {
      "icon": Icons.g_mobiledata,
      "label": "Google Pay",
      "subtitle": "andrew.ainsley@yourdomain.com",
      "color": Colors.red,
    },
    {
      "icon": Icons.apple,
      "label": "Apple Pay",
      "subtitle": "andrew.ainsley@yourdomain.com",
      "color": Colors.black,
    },
    {
      "icon": Icons.credit_card,
      "label": "Mastercard",
      "subtitle": ".... .... .... 4679",
      "color": Colors.black,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        title: Text(
          "Choose Payment Method",
          style: TextStyle(
              fontFamily: 'Jaro', fontWeight: FontWeight.bold, fontSize: 24),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add, color: Colors.black),
            onPressed: () {
              // Add payment method logic
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 24, horizontal: 20),
              itemCount: paymentOptions.length,
              itemBuilder: (context, index) {
                final opt = paymentOptions[index];
                final selected = index == selectedIndex;
                return Padding(
                  padding: EdgeInsets.only(bottom: 12),
                  child: GestureDetector(
                    onTap: () => setState(() => selectedIndex = index),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: selected ? mainGreen : Colors.transparent,
                          width: selected ? 2 : 0,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 14, horizontal: 18),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: opt["color"],
                            radius: 28,
                            child: Icon(opt["icon"], color: Colors.white, size: 36),
                          ),
                          SizedBox(width: 18),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  opt["label"],
                                  style: TextStyle(
                                    fontFamily: 'Jaro',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                if (opt["subtitle"] != null)
                                  Text(
                                    opt["subtitle"],
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black54,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          if (selected)
                            Icon(Icons.check, color: mainGreen, size: 28),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          // OK button bar
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 22, vertical: 8),
            child: SizedBox(
              width: double.infinity,
              height: 54,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: mainGreen,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                ),
                onPressed: () {
                  // Apply payment logic and close
                  Navigator.pop(context, paymentOptions[selectedIndex]["label"]);
                },
                child: Text(
                  "OK",
                  style: TextStyle(
                    fontFamily: "Jaro",
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 18),
        ],
      ),
    );
  }
}
