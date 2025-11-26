import 'package:flutter/material.dart';

class MainTransportPage extends StatefulWidget {
  const MainTransportPage({super.key});

  @override
  State<MainTransportPage> createState() => _MainTransportPageState();
}

class _MainTransportPageState extends State<MainTransportPage> {
  static const mainGreen = Color(0xFF00B345);

  // Location edit state
  bool editingLocation = false;
  TextEditingController locationController =
      TextEditingController(text: "Your current location");

  // Dynamic list of destination fields/controllers
  List<TextEditingController> destinationControllers = [
    TextEditingController(), // Where to?
  ];
  int maxDestinations = 5;

  // Tabs
  bool showRecent = true;

  // Dummy data for recent and suggested locations
  final List<Map<String, String>> recent = [
    {"name": "New York University", "desc": "NY 10012, United States"},
    {"name": "Comedy Cellar", "desc": "117 Macdougal St, NY"},
  ];
  final List<Map<String, String>> suggested = [
    {"name": "Central Park", "desc": "Central Park S, NY"},
    {"name": "Empire State", "desc": "20 W 34th St, NY"},
  ];

  void addDestinationField() {
    if (destinationControllers.length < maxDestinations) {
      setState(() {
        destinationControllers.add(TextEditingController());
      });
    }
  }

  void onLocationTap() {
    setState(() {
      editingLocation = true;
    });
  }

  void onLocationSubmitted(String value) {
    setState(() {
      editingLocation = false;
      locationController.text = value;
    });
  }

  Widget _buildTab(String label, bool selected, VoidCallback onTap) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: selected ? mainGreen : Colors.grey.shade200,
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.symmetric(vertical: 12),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                fontFamily: 'Jaro',
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: selected ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLocationRow() {
    return editingLocation
        ? TextField(
            controller: locationController,
            autofocus: true,
            decoration: InputDecoration(
              hintText: "Enter location",
              border: InputBorder.none,
            ),
            onSubmitted: onLocationSubmitted,
          )
        : GestureDetector(
            onTap: onLocationTap,
            child: Row(
              children: [
                Icon(Icons.location_on, color: mainGreen),
                SizedBox(width: 8),
                Text(
                  locationController.text,
                  style: TextStyle(
                    fontFamily: 'Jaro',
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 24),
            // Top Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  GestureDetector(
                    child: Icon(Icons.close, size: 32),
                    onTap: () => Navigator.pop(context),
                  ),
                  SizedBox(width: 12),
                  Text(
                    "Set your destination",
                    style: TextStyle(
                      fontFamily: 'Jaro',
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 18),
            // Location/destination panel
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(22),
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 12)],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 14),
                  child: Column(
                    children: [
                      // Location
                      _buildLocationRow(),
                      Divider(thickness: 1, height: 28),
                      // Destination fields
                      ...List.generate(
                        destinationControllers.length,
                        (i) => Row(
                          children: [
                            Icon(Icons.location_on, color: Colors.red),
                            SizedBox(width: 8),
                            Expanded(
                              child: TextField(
                                controller: destinationControllers[i],
                                decoration: InputDecoration(
                                  hintText: i == 0
                                      ? 'Destination 1'
                                      : 'Destination ${i + 1}',
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                    fontSize: 17,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                            // Only add + button for last field, and limit maxDestinations
                            if (i == destinationControllers.length - 1 &&
                                destinationControllers.length < maxDestinations)
                              GestureDetector(
                                onTap: addDestinationField,
                                child: Container(
                                  width: 38,
                                  height: 38,
                                  margin: EdgeInsets.only(left: 4),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: mainGreen, width: 2),
                                  ),
                                  child: Icon(Icons.add, color: mainGreen, size: 24),
                                ),
                              ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          OutlinedButton.icon(
                            icon: Icon(Icons.map_outlined, color: mainGreen),
                            label: Text(
                              "Select from map",
                              style: TextStyle(color: Colors.black),
                            ),
                            onPressed: () {},
                          ),
                          OutlinedButton(
                            child: Text("Home"),
                            onPressed: () {},
                          ),
                          OutlinedButton(
                            child: Text("Office"),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Tabs for Recent and Suggested
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
              child: Row(
                children: [
                  _buildTab("Recent", showRecent, () {
                    setState(() => showRecent = true);
                  }),
                  _buildTab("Suggested", !showRecent, () {
                    setState(() => showRecent = false);
                  }),
                ],
              ),
            ),
            // Tab content – recent or suggested as buttons
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 6),
                itemCount: showRecent ? recent.length : suggested.length,
                itemBuilder: (context, index) {
                  final place =
                      showRecent ? recent[index] : suggested[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 6),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        side: BorderSide(color: mainGreen, width: 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 18, horizontal: 10),
                        elevation: 0,
                      ),
                      onPressed: () {
                        // Set as destination, show details, etc.
                      },
                      child: Row(
                        children: [
                          Icon(Icons.location_on_outlined,
                              size: 32, color: mainGreen),
                          SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  place["name"] ?? "",
                                  style: TextStyle(
                                    fontFamily: 'Jaro',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                  ),
                                ),
                                Text(
                                  place["desc"] ?? "",
                                  style: TextStyle(fontSize: 15, color: Colors.black54),
                                ),
                              ],
                            ),
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
}
