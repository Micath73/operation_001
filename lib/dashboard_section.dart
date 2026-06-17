import 'package:flutter/material.dart';

class DashboardSection extends StatefulWidget {
  const DashboardSection({super.key});

  @override
  State<DashboardSection> createState() => _DashboardSectionState();
}

class _DashboardSectionState extends State<DashboardSection> {


  String selectedDay = 'Mon';
  List<String> days = ['Mon', 'Tue', 'Wed', 'Thur', 'Fri', 'Sat', 'Sun'];

  Widget _buildDailyButton(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () => print(label),
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
                    style: TextStyle(fontWeight: FontWeight.bold),
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
                _buildDailyButton("Read today's Gospel"),
                _buildDailyButton("Pray today's Angelus"),
                if (selectedDay != 'Sun')
                  _buildDailyButton("Pray today's Rosary"),
                if (selectedDay == 'Fri')
                  _buildDailyButton("Special Friday Divine Mercy"),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
