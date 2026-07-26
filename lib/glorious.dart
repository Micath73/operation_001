import 'package:flutter/material.dart';
// Note: We are keeping the model import because we will need it to rebuild our data structure later
import 'package:operation_001/prayer_model.dart';
import 'package:operation_001/prayer_session_screen.dart';

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
                    // 1. Define your prayer sequence using your PrayerStep model
                    final List<PrayerStep> prayerSequence = [
                      PrayerStep(
                        sectionHeader: 'Sign of the Cross',
                        titleEn: 'Sign Of The Cross',
                        titleAm: 'በስመ አብ ወወልድ ወመንፈስ ቅዱስ',
                        contentEn: 'In The Name Of The Father,\nAnd Of The Son,\nAnd Of The Holy Spirit.\nAmen',
                        contentAm: 'በስመ አብ ወወልድ ወመንፈስ ቅዱስ አሐዱ አምላክ አሜን።',
                        imagePath: 'assets/wmremove-transformed (10).png',
                      ),
                      PrayerStep(
                        sectionHeader: 'Apostles\' Creed',
                        titleEn: 'The Apostles\' Creed',
                        titleAm: 'የሐዋርያት እምነት',
                        contentEn: 'I believe in God, the Father almighty, Creator of heaven and earth, and in Jesus Christ, His only Son, our Lord, who was conceived by the Holy Spirit, born of the Virgin Mary, suffered under Pontius Pilate, was crucified, died and was buried; He descended into hell; on the third day He rose again from the dead; He ascended into heaven, and seated at the right hand of God, the Father almighty; from thence He shall come to judge, the living and the dead. I believe in the Holy Spirit, the holy Catholic Church, the communion of saints, the forgiveness of sins, the resurrection of the body and life everlasting.\nAmen!',
                        contentAm: 'ሁሉን በሚችል በሰማይና በምድር ፈጣሪ በእግዚአብሔር አብ አመናለሁ...',
                        imagePath: 'assets/wmremove-transformed (10).png',
                      ),
                      PrayerStep(
                        sectionHeader: 'Our Father',
                        titleEn: 'Our Father',
                        titleAm: 'አባታችን ሆይ',
                        contentEn: 'Our Father, who art in heaven, hallowed be Thy name...',
                        contentAm: 'አባታችን ሆይ፤ በሰማያት የምትኖር፤ ስምህ ይቀደስ...',
                        imagePath: 'assets/wmremove-transformed (10).png',
                      ),
                    ];

                    // 2. Pass the list and current language setting into prayer_session
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => prayer_session(
                          prayerSteps: prayerSequence, // 👈 Fixes the constructor mismatch!
                          isAmharic: isAmharic,           // 👈 Passes language toggle state
                        ),
                      ),
                    );
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