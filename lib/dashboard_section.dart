import 'package:flutter/material.dart';
import 'package:operation_001/Divine_Mercy_Chaplet.dart';
import 'package:operation_001/angelusScreen.dart';
import 'package:operation_001/chapelScreen.dart';
import 'package:operation_001/joyful.dart';
import 'package:operation_001/glorious.dart';
import 'package:operation_001/luminous.dart';
import 'package:operation_001/sorrowful.dart';
class DashboardSection extends StatefulWidget {
  const DashboardSection({super.key});

  @override
  State<DashboardSection> createState() => _DashboardSectionState();
}

class _DashboardSectionState extends State<DashboardSection> {
  String selectedDay = 'Mon';
  final List<String> days = ['Mon', 'Tue', 'Wed', 'Thur', 'Fri', 'Sat', 'Sun'];

  @override
  void initState() {
    super.initState();
    // Automatically select current day of the week on load
    int todayWeekday = DateTime.now().weekday; // 1 = Mon, 7 = Sun
    List<String> dayMap = ['Mon', 'Tue', 'Wed', 'Thur', 'Fri', 'Sat', 'Sun'];
    selectedDay = dayMap[todayWeekday - 1];
  }

  // Returns the correct Rosary screen widget based on selected day or today's weekday
  Widget _getRosaryScreenForDay(String day) {
    switch (day) {
      case 'Mon':
      case 'Sat':
        return const joyfulScreen();
      case 'Tue':
      case 'Fri':
        return const sorrowfulScreen();
      case 'Wed':
      case 'Sun':
        return const gloriousScreen();
      case 'Thur':
        return const luminousScreen();
      default:
        return const joyfulScreen();
    }
  }

  // Refactored helper button accepting custom onPressed callback
  Widget _buildDailyButton(String label, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: onPressed,
          child: Text(label),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 16),
          child: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white70,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'Daily Progress Dashboard',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                const SizedBox(height: 20),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: days.map((day) {
                      bool isSelected = selectedDay == day;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedDay = day;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: isSelected ? Colors.deepPurple : Colors.grey[300],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            day,
                            style: TextStyle(
                              color: isSelected ? Colors.white : Colors.black,
                              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 25),
                Text(
                  "Selected: $selectedDay",
                  style: const TextStyle(
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),
                _buildDailyButton("Read today's Gospel", () {
                  // TODO: Connect Gospel screen here when ready
                  print("Reading Gospel for $selectedDay");
                }),
                _buildDailyButton("Pray today's Angelus", () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const angelus()),
                  );
                }),
                _buildDailyButton("Pray today's Rosary", () {
                  Widget rosaryTarget = _getRosaryScreenForDay(selectedDay);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => rosaryTarget),
                  );
                }),
                if (selectedDay == 'Fri')
                  _buildDailyButton("Special Friday Divine Mercy", () {
                    // TODO: Connect Divine Mercy screen
                    print("Navigating to Divine Mercy");
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>chaplet()));
                  }),
              ],
            ),
          ),
        ),
      ],
    );
  }
}