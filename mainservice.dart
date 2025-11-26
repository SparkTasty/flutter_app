import 'package:flutter/material.dart';

class MainServiceScreen extends StatefulWidget {
  const MainServiceScreen({super.key});

  @override
  State<MainServiceScreen> createState() => _MainServiceScreenState();
}

class _MainServiceScreenState extends State<MainServiceScreen> {
  final Color mainGreen = Color(0xFF00B345);
  final TextEditingController searchController = TextEditingController();
  String searchTerm = '';

  // List of categories and icon data
  final List<_ServiceCategory> categories = [
    _ServiceCategory('Transport', Icons.directions_car_outlined, '/maintransport'),
    _ServiceCategory('Logistics', Icons.local_shipping_outlined, '/logistics'),
    _ServiceCategory('Mart', Icons.storefront_outlined, '/mart'),
    _ServiceCategory('Food', Icons.fastfood_outlined, '/food'),
    _ServiceCategory('Shopping', Icons.shopping_bag_outlined, '/shopping'),
    _ServiceCategory('Attraction', Icons.camera_alt_outlined, '/attraction'),
    _ServiceCategory('Relax', Icons.spa_outlined, '/relax'),
    _ServiceCategory('More', Icons.more_horiz, '/more'),
  ];

  @override
  Widget build(BuildContext context) {
    // Filter categories by search term
    final filtered = categories
        .where((cat) => cat.label.toLowerCase().contains(searchTerm.toLowerCase()))
        .toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(96),
        child: Container(
          color: mainGreen,
          child: Padding(
            padding: EdgeInsets.only(top: 32, left: 12, right: 12, bottom: 12),
            child: Row(
              children: [
                Container(
                  width: 68,
                  height: 56,
                  color: Colors.blue,
                  child: Center(
                    child: Text(
                      "GO",
                      style: TextStyle(
                        fontFamily: 'Jaro',
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Container(
                    height: 44,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: searchController,
                      onChanged: (v) => setState(() => searchTerm = v),
                      decoration: InputDecoration(
                        hintText: 'Search',
                        hintStyle: TextStyle(fontFamily: 'Jaro', color: Colors.grey),
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.search_outlined, color: Colors.grey),
                        contentPadding: EdgeInsets.symmetric(vertical: 10),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.add, color: Colors.grey),
                          onPressed: () {
                            // You can add functionality here if needed
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 22,
                  child: Icon(Icons.person_outline, color: mainGreen, size: 28),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 24, horizontal: 8),
        child: GridView.count(
          crossAxisCount: 4,
          childAspectRatio: 1.2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 10,
          children: filtered.map((cat) {
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, cat.route);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      offset: Offset(2, 2),
                    )
                  ],
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        cat.icon,
                        size: 38,
                        color: Colors.black,
                      ),
                      SizedBox(height: 8),
                      Text(
                        cat.label,
                        style: TextStyle(
                          fontFamily: 'Jaro',
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class _ServiceCategory {
  final String label;
  final IconData icon;
  final String route;
  _ServiceCategory(this.label, this.icon, this.route);
}
