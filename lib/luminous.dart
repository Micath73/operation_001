import 'package:flutter/material.dart';
import 'package:operation_001/prayer_model.dart';

class luminousScreen extends StatefulWidget {
  const luminousScreen({super.key});

  @override
  State<luminousScreen> createState() => _luminousScreenState();
}

class _luminousScreenState extends State<luminousScreen> {
  bool isAmharic = false;

  final List<String> weeks = ['', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
  final List<String> weekend = ['', 'ሰኞ', 'ማክሰኞ', 'ረቡዕ', 'ሐሙስ', 'አርብ', 'ቅዳሜ', 'እሁድ'];
  final int week = DateTime.now().weekday;

  @override
  Widget build(BuildContext context) {
    const titleStyle = TextStyle(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
      shadows: [
        Shadow(blurRadius: 12.0, color: Colors.black, offset: Offset(2, 2)),
      ],
    );
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: SizedBox(
          width: screenWidth * 0.6,
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: Text(
              isAmharic ? 'የብርሃን ምሥጢር' : 'The Luminous Mystery',
              key: ValueKey(isAmharic),
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          TextButton(
            onPressed: () => setState(() => isAmharic = !isAmharic),
            child: Text(
              isAmharic ? 'አማ' : 'EN',
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          // Background Layer
          SizedBox.expand(
            child: Image.asset('assets/wmremove-transformed (10).png', fit: BoxFit.cover),
          ),
          Container(color: Colors.black.withOpacity(0.4)),

          // Home UI Layer
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 4),
              _buildAnimatedText(
                isAmharic ? 'ዛሬ ${weekend[week]} ነው' : 'Today is ${weeks[week]}',
                titleStyle.copyWith(fontSize: 24, fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 10),
              _buildAnimatedText(
                isAmharic ? 'በብርሃን ምሥጢር\nእናሰላስል' : 'Let\'s Meditate Through The Luminous Mystery',
                titleStyle,
              ),
              const Spacer(flex: 2),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurpleAccent,
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 18),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  elevation: 8,
                ),
                onPressed: () {
                  // Navigation Logic Removed
                  print("Luminous Start Clicked!");
                },
                child: Text(
                  isAmharic ? 'ጸሎቱን ጀምር' : 'START PRAYER',
                  style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 80),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAnimatedText(String text, TextStyle style) {
    return SizedBox(
      width: double.infinity,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: Text(
          text,
          key: ValueKey<String>(text),
          textAlign: TextAlign.center,
          style: style,
        ),
      ),
    );
  }
}