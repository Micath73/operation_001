import 'package:flutter/material.dart';
import 'daily_reading_model.dart';
import 'readings_service.dart';

class DailyReadingsScreen extends StatefulWidget {
  const DailyReadingsScreen({super.key});

  @override
  State<DailyReadingsScreen> createState() => _DailyReadingsScreenState();
}

class _DailyReadingsScreenState extends State<DailyReadingsScreen> {
  final ReadingsService _readingsService = ReadingsService();
  DateTime _selectedDate = DateTime.now();
  late Future<DailyReading?> _readingFuture;

  @override
  void initState() {
    super.initState();
    _loadReading();
  }

  void _loadReading() {
    setState(() {
      _readingFuture = _readingsService.getReadingForDate(_selectedDate);
    });
  }

  // Maps liturgical color strings to Flutter Material Colors 🎨
  Color _getLiturgicalColor(String colorName) {
    switch (colorName.toLowerCase()) {
      case 'purple':
      case 'violet':
        return Colors.deepPurple;
      case 'red':
        return Colors.red.shade800;
      case 'white':
      case 'gold':
        return Colors.amber.shade700;
      case 'green':
      default:
        return const Color(0xFF1B5E20); // Catholic Liturgical Green
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Today's Mass Readings",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          // 1. Horizontal Date Picker Strip 📅
          _buildDatePickerStrip(),

          // 2. Main Content Area powered by FutureBuilder ⚡
          Expanded(
            child: FutureBuilder<DailyReading?>(
              future: _readingFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(color: Colors.amber),
                  );
                }

                if (snapshot.hasError || snapshot.data == null) {
                  return _buildOfflineErrorWidget();
                }

                final reading = snapshot.data!;
                final accentColor = _getLiturgicalColor(reading.liturgicalColor);

                return SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Liturgical Banner Header 🏷️
                      _buildLiturgicalHeader(reading, accentColor),
                      const SizedBox(height: 20),

                      // First Reading Card 📖
                      _buildReadingCard(
                        title: reading.firstReadingTitle,
                        text: reading.firstReadingText,
                        accentColor: accentColor,
                      ),

                      // Responsorial Psalm Card 🎵
                      _buildPsalmCard(reading, accentColor),

                      // Optional Second Reading Card 📖
                      if (reading.secondReadingTitle != null &&
                          reading.secondReadingText != null) ...[
                        _buildReadingCard(
                          title: reading.secondReadingTitle!,
                          text: reading.secondReadingText!,
                          accentColor: accentColor,
                        ),
                      ],

                      // Gospel Card ✝️
                      _buildReadingCard(
                        title: reading.gospelTitle,
                        text: reading.gospelText,
                        accentColor: accentColor,
                        isGospel: true,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // Widget for Date Selection Ribbon 🗓️
  Widget _buildDatePickerStrip() {
    return Container(
      height: 70,
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 14, // 7 days past, 7 days future
        itemBuilder: (context, index) {
          final date = DateTime.now().add(Duration(days: index - 7));
          final isSelected = date.day == _selectedDate.day &&
              date.month == _selectedDate.month &&
              date.year == _selectedDate.year;

          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedDate = date;
              });
              _loadReading();
            },
            child: Container(
              width: 55,
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              decoration: BoxDecoration(
                color: isSelected ? Colors.amber.shade700 : Colors.white.withOpacity(0.08),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: isSelected ? Colors.amber : Colors.white12,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _getDayAbbreviation(date.weekday),
                    style: TextStyle(
                      color: isSelected ? Colors.black : Colors.white70,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "${date.day}",
                    style: TextStyle(
                      color: isSelected ? Colors.black : Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // Header displaying the day's Liturgical Name and Season Color Accent 🏷️
  Widget _buildLiturgicalHeader(DailyReading reading, Color accentColor) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: accentColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: accentColor.withOpacity(0.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(backgroundColor: accentColor, radius: 6),
              const SizedBox(width: 8),
              Text(
                reading.liturgicalColor.toUpperCase(),
                style: TextStyle(
                  color: accentColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            reading.liturgicalTitle,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  // Generic Card Container for Scripture 📄
  Widget _buildReadingCard({
    required String title,
    required String text,
    required Color accentColor,
    bool isGospel = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isGospel ? Colors.amber.withOpacity(0.5) : Colors.white12,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: isGospel ? Colors.amber : accentColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(color: Colors.white24, height: 20),
          Text(
            text,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 15,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  // Special Card Container for Psalm Response 🎵
  Widget _buildPsalmCard(DailyReading reading, Color accentColor) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Responsorial Psalm",
            style: TextStyle(
              color: accentColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            reading.psalmResponse,
            style: TextStyle(
              color: Colors.amber.shade200,
              fontSize: 15,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Divider(color: Colors.white24, height: 20),
          Text(
            reading.psalmText,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 15,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  // Fallback Error Widget when no data is cached & offline 📴
  Widget _buildOfflineErrorWidget() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.wifi_off_rounded, size: 60, color: Colors.white38),
            const SizedBox(height: 16),
            const Text(
              "No Readings Available Offline",
              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "Please connect to the internet once to download and cache readings for this date.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white60, fontSize: 14),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _loadReading,
              icon: const Icon(Icons.refresh),
              label: const Text("Retry"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber.shade700,
                foregroundColor: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getDayAbbreviation(int weekday) {
    const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return days[weekday - 1];
  }
}