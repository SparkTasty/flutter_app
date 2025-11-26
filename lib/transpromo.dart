import 'package:flutter/material.dart';

class TransPromoPage extends StatefulWidget {
  const TransPromoPage({super.key});

  @override
  State<TransPromoPage> createState() => _TransPromoPageState();
}

class _TransPromoPageState extends State<TransPromoPage> {
  static const mainGreen = Color(0xFF00B345);

  TextEditingController promoController = TextEditingController();
  String appliedCode = "";

  final List<Map<String, String>> promoList = [
    {
      "title": "Best Deal: 20% OFF",
      "code": "EOYP25",
      "detail": "No min. spend · Valid till 12/31/2024"
    },
    {
      "title": "15% OFF: New User Promotion",
      "code": "NUP15K",
      "detail": "Min. spend \$8.00 · Valid till 12/28/2024"
    },
    {
      "title": "10% OFF & 10% Cashback",
      "code": "10OFFC",
      "detail": "Min. spend \$8.00 · Valid till 12/30/2024"
    },
    {
      "title": "8% OFF & 8% Cashback",
      "code": "8OFF8C",
      "detail": "Min. spend \$10.00 · Valid till 12/30/2024"
    },
    {
      "title": "12% Cashback",
      "code": "C12BACK",
      "detail": "Min. spend \$12.00 · Valid till 12/31/2024"
    },
  ];

  int selectedPromo = 0; // Index of selected promo

  void applyPromo() {
    setState(() {
      appliedCode = promoController.text.trim();
      // Optionally: Match input code with promoList to select corresponding promo
      for (int i = 0; i < promoList.length; i++) {
        if (promoList[i]["code"] == appliedCode) {
          selectedPromo = i;
          break;
        }
      }
    });
    // You can add more application logic as needed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Promos / Vouchers",
          style: TextStyle(fontFamily: 'Jaro', fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          // Promo code box
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 16)],
              ),
              child: Padding(
                padding: EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Have a Promo Code?",
                      style: TextStyle(
                        fontFamily: 'Jaro',
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Divider(height: 26),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: promoController,
                            decoration: InputDecoration(
                              hintText: "Enter code here",
                              border: InputBorder.none,
                              hintStyle: TextStyle(color: Colors.black26, fontSize: 18),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: mainGreen,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(26),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 22, vertical: 12),
                          ),
                          onPressed: applyPromo,
                          child: Text(
                            "Ok",
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              children: [
                ...List.generate(promoList.length, (i) {
                  final p = promoList[i];
                  final selected = i == selectedPromo;
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 6),
                    child: GestureDetector(
                      onTap: () => setState(() => selectedPromo = i),
                      child: Container(
                        decoration: BoxDecoration(
                          color: selected ? Colors.green.shade50 : Colors.white,
                          border: Border.all(
                            color: selected ? mainGreen : Colors.transparent,
                            width: selected ? 2 : 0,
                          ),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 14, horizontal: 12),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.orange.shade400,
                              radius: 26,
                              child: Icon(Icons.local_offer, color: Colors.white, size: 28),
                            ),
                            SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    p["title"] ?? "",
                                    style: TextStyle(
                                      fontFamily: "Jaro",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                    ),
                                  ),
                                  SizedBox(height: 2),
                                  Text(
                                    "${p["code"]} · ${p["detail"]}",
                                    style: TextStyle(fontSize: 15, color: Colors.black54),
                                  ),
                                ],
                              ),
                            ),
                            if (selected)
                              Padding(
                                padding: EdgeInsets.only(left: 10, top: 2),
                                child: Icon(Icons.check, color: mainGreen, size: 28),
                              ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
                SizedBox(height: 24),
                // OK button at the bottom
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: SizedBox(
                    width: double.infinity,
                    height: 54,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: mainGreen,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28),
                        ),
                      ),
                      onPressed: () {
                        // Apply selected promo and return
                        Navigator.pop(context, promoList[selectedPromo]["code"]);
                      },
                      child: Text(
                        "OK",
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
        ],
      ),
    );
  }
}
