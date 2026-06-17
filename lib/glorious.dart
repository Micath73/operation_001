import 'package:flutter/material.dart';
// Note: We are keeping the model import because we will need it to rebuild our data structure later
import 'package:operation_001/prayer_model.dart';

class gloriousScreen extends StatefulWidget {
  const gloriousScreen({super.key});

  @override
  State<gloriousScreen> createState() => _gloriousScreenState();
}

class _gloriousScreenState extends State<gloriousScreen> {
  bool isAmharic = false;

  final int weeks = DateTime.now().weekday;
  final List<String> week = ['', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
  final List<String> weekend = ['', 'ሰኞ', 'ማክሰኞ', 'ረቡዕ', 'ሐሙስ', 'አርብ', 'ቅዳሜ', 'እሁድ'];

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
              isAmharic ? 'የክብር ምሥጢር' : 'The Glorious Mystery',
              key: ValueKey<bool>(isAmharic),
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
          // Background Image
          SizedBox.expand(
            child: Image.asset('assets/wmremove-transformed (9).jpeg', fit: BoxFit.cover),
          ),
          Container(color: Colors.black.withOpacity(0.4)),

          // Home UI
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(flex: 3),
                _buildAnimatedText(
                  isAmharic ? 'ዛሬ ${weekend[weeks]} ነው' : 'Today is ${week[weeks]}',
                  titleStyle.copyWith(fontSize: 24, fontWeight: FontWeight.w400),
                ),
                _buildAnimatedText(
                  isAmharic ? 'በክብር ምሥጢር\nእናሰላስል' : 'Let\'s Meditate Through The Glorious Mystery',
                  titleStyle,
                ),
                const Spacer(flex: 2),

                ElevatedButton(
                  onPressed: () {
                    // Logic removed - Ready for new learning-based implementation
                    print("Start Prayer Clicked!");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurpleAccent,
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 18),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    elevation: 8,
                  ),
                  child: Text(
                    isAmharic ? 'ጸሎቱን ጀምር' : 'START PRAYER',
                    style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 80),
              ],
            ),
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