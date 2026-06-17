import 'package:flutter/material.dart';
import 'package:operation_001/prayer_model.dart';

class sorrowfulScreen extends StatefulWidget {
  const sorrowfulScreen({super.key});
  @override
  State<sorrowfulScreen> createState() => _sorrowfulScreenState();
}

class _sorrowfulScreenState extends State<sorrowfulScreen> {
  bool isAmharic = false;

  @override
  Widget build(BuildContext context) {
    final int weeks = DateTime.now().weekday;
    final List<String> weekday = ['', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
    final List<String> weekdays = ['', 'ሰኞ', 'ማክሰኞ', 'ረቡዕ', 'ሐሙስ', 'አርብ', 'ቅዳሜ', 'እሁድ'];

    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: SizedBox(
          width: screenWidth * 0.6,
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: Text(
              isAmharic ? 'የሐዘን ምስጢር' : 'The Sorrowful Mystery',
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
          SizedBox.expand(
            child: Image.asset(
                'assets/wmremove-transformed (6).jpeg',
                fit: BoxFit.cover
            ),
          ),
          Container(color: Colors.black.withOpacity(0.4)),
          SafeArea(
            child: Column(
              children: [
                const Spacer(flex: 4),
                _buildAnimatedText(
                    isAmharic ? 'ዛሬ ${weekdays[weeks]} ነው' : 'Today is ${weekday[weeks]}',
                    24,
                    FontWeight.w400
                ),
                const SizedBox(height: 10),
                _buildAnimatedText(
                    isAmharic ? 'በሐዘን ምስጢር እናሰላስል' : 'Let\'s Meditate Through\nThe Sorrowful Mystery',
                    32,
                    FontWeight.bold
                ),
                const Spacer(flex: 2),
                ElevatedButton(
                  onPressed: () {
                    // Logic reset - Ready to learn how to bridge to the next screen
                    print("Sorrowful Start Clicked!");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 18),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    elevation: 8,
                  ),
                  child: Text(
                    isAmharic ? "ጸሎቱን ጀምር" : "START PRAYER",
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

  Widget _buildAnimatedText(String text, double size, FontWeight weight) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Text(
          text,
          key: ValueKey<String>(text),
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: size,
            fontWeight: weight,
            shadows: const [
              Shadow(blurRadius: 12.0, color: Colors.black, offset: Offset(2, 2))
            ],
          ),
        ),
      ),
    );
  }
}