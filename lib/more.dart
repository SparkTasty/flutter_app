import 'package:flutter/material.dart';

class MorePage extends StatefulWidget {
  const MorePage({super.key});

  @override
  State<MorePage> createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  final headings = [
    'Home Delivery',
    'Travel',
    'Relax',
    'Beauty & Sport',
    'Life'
  ];

  // Map heading name to GlobalKey (for scrolling)
  final Map<String, GlobalKey> sectionKeys = {
    'Home Delivery': GlobalKey(),
    'Travel': GlobalKey(),
    'Relax': GlobalKey(),
    'Beauty & Sport': GlobalKey(),
    'Life': GlobalKey(),
  };

  final ScrollController scrollController = ScrollController();

  // Example data for each section
  final Map<String, List<String>> sectionItems = {
    'Home Delivery': [
      'Romantic Rose', 'Super Mart', 'Department Store', 'Fruit', 'Alcohol', 'Food Delivery'
    ],
    'Travel': [
      'Homestay', 'Attraction', 'Travel Vacation', 'Air Ticket', 'Transport'
    ],
    'Relax': [
      'Delicious Food', 'Leisure & Fun'
    ],
    'Beauty & Sport': [
      'Hairdressing Beauty', 'Fitness Exercise'
    ],
    'Life': [
      'Lifestyle Services', 'Home Renovation', 'Training & Learning', 'Wedding and Maternity/Baby', 
      'Auto Care', 'Pets Care', 'Professional Photoshoot Makeup & Styling'
    ]
  };

  // Scroll to specific section when menu item is pressed
  void scrollToSection(String heading) {
    final keyContext = sectionKeys[heading]?.currentContext;
    if (keyContext != null) {
      Scrollable.ensureVisible(
        keyContext,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left: Logo + Menu
          Container(
            width: 160,
            child: Column(
              children: [
                const SizedBox(height: 12),
                // Back button at the top
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black, size: 32),
                    onPressed: () => Navigator.pop(context),
                    tooltip: 'Back',
                  ),
                ),
                const SizedBox(height: 24),
                // Logo
                Container(
                  width: 120,
                  height: 120,
                  color: Colors.blue,
                  child: const Center(
                    child: Text(
                      "GO",
                      style: TextStyle(
                        fontFamily: 'Jaro',
                        fontWeight: FontWeight.bold,
                        fontSize: 38,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                // Headings as buttons
                ...headings.map((hd) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 12),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.shade100,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      onPressed: () => scrollToSection(hd),
                      child: Text(
                        hd,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontFamily: 'Jaro',
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                )),
              ],
            ),
          ),
          // Right: Scrollable service sections
          Expanded(
            child: SingleChildScrollView(
              controller: scrollController,
              child: Padding(
                padding: const EdgeInsets.only(top: 12, left: 16, right: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: headings.map((hd) => Column(
                    key: sectionKeys[hd],
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 18),
                      Text(
                        hd,
                        style: const TextStyle(
                          fontFamily: 'Jaro',
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      ...sectionItems[hd]!.map((item) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFB3EBC2),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              elevation: 0,
                            ),
                            onPressed: () {
                              // Navigator.pushNamed(context, "/${item.toLowerCase().replaceAll(' ', '_')}");
                            },
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontFamily: 'Jaro',
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      )).toList(),
                    ],
                  )).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
