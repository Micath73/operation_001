import 'package:flutter/material.dart';
import 'package:operation_001/prayer_model.dart';
import 'package:operation_001/prayer_session_screen.dart';

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
                        contentAm: 'ሁሉን በሚችል ሰማይንና ምድርን በፈጠረ\nበእግዚአብሔር አብ አምናለሁ፡፡\nአንድ ልጁ በሆነዉ በጌታችን\nበኢየሱስ ክርስቶስ አምናለሁ፤\nእሱ በመንፋስ ቅዱስ ተጸንሶ\nከድንግል ማርያም ተወለደ፡፡\nበጴንጤናዊው ጲላጦስ ዘመን ተሰቃየ፣\nተሰቀለ፣ ሞተ፣ ተቀበረ፣\nወደ ሲኦል ወረደ፣\nበሶስተኛው ቀን ከሙታን ተለይቶ ተነሣ፣\nወደ ሰማይ ወጣ፣\nሁሉን በሚችል በእግዚአብሔር አብ ቀኝ ተቀመጠ፣\nያሉትንና የሞቱትን ሊፈርድ ዳግመኛ ይመጣል፣\n በመንፈስ ቅዱስም አምናለሁ፣\nየሁሉም በሆነችው በቅድስት ቤተክርስቲያን\nበቅዱሳንም አንድነት አምናለሁ፣\nበኃጢአት ስርየት፣\nበሙታን ትንሣኤ፣\nበዘላለም ሕይወት አምናለሁ፡፡\nአሜን!',
                        imagePath: 'assets/wmremove-transformed (10).png',
                      ),
                      PrayerStep(
                        sectionHeader: 'Our Father',
                        titleEn: 'Our Father',
                        titleAm: 'አባታችን ሆይ',
                        contentEn: 'Our Father, who art in heaven, hallowed be thy name; thy kingdom come; thy will be done on earth as it is in heaven. Give us this day our daily bread; and forgive us our trespasses as we forgive those who trespass against us; and lead us not into temptation, but deliver us from evil.\nAmen!',
                        contentAm: 'በሰማይ የምትኖር አባታችን ሆይ፣ስምህ ይመስገን፣መንግሥትህ ትምጣ፡ፈቃድህ በሰማይ እንደሆነ:እንዲሁም በምድር ይሁን። የዕለት እንጀራችንን ዛሬ ስጠን፤እኛ የበደሉንን ይቅር እንደምንል:በደላችንን ይቅር በልልን፤ከክፉ ሁሉ ሰውርን እንጂ ወደ ፈተና አታግባን፡፡ መንግስት ኃይልና ክብር ለዘለዓለም ያንተ ነውና፡፡\nአሜን!',
                        imagePath: 'assets/wmremove-transformed (10).png',
                      ),
                      PrayerStep(
                        sectionHeader: 'Hail Mary',
                        titleEn: 'Hail Mary',
                        titleAm: 'ጸጋ የመላሽ',
                        contentEn: 'Hail Mary, full of grace, the Lord is with you; Blessed art thou among women, and blessed is the fruit of thy womb, Jesus. Holy Mary, Mother of God, pray for us sinners now and at the hour of our death.\nAmen!',
                        contentAm: 'ጸጋ የመላሽ ማርይም ሆይ:ሰላም ላንቺ ይሁን፣እግዚአብሔር ካንቺ ጋር ነው፣ከሴቶች ሁሉ የተባረክሽ ነሽ፣የሆድሽም ፍሬ ኢየሱስ የተባረከ ነው፡፡ ቅድስት ማርያም የአምላክ እናት:ለኛ ለኃጢአተኞች:አሁንም በሞታችንም ጊዜ ለምኝልን፡፡\nአሜን።',
                        imagePath: 'assets/wmremove-transformed (10).png',
                      ),
                      PrayerStep(
                        sectionHeader: 'Glory Be',
                        titleEn: 'Glory Be',
                        titleAm: 'ስብሐት ለአብ',
                        contentEn: 'Glory be to the Father,\nand to the Son,\nand to the Holy Spirit;\nas it was in the beginning,\nis now, and ever shall be,\nworld without end.\nAmen!',
                        contentAm: 'ለአብ:ለወልድና:ለመንፈስ ቅዱስ ምስጋና ይሁን\nአሁንም ዘወትርም ለዘለዓለምም::\n አሜን!"',
                        imagePath: 'assets/wmremove-transformed (10).png',
                      ),
                      PrayerStep(
                        sectionHeader: 'Fatima Prayer',
                        titleEn: 'Fatima Prayer',
                        titleAm: 'የፋጢማ ጸሎት',
                        contentEn:'O my Jesus,\nforgive us our sins,\nsave us from the fires of hell;\nlead all souls to Heaven,\nespecially those who have\nmost need of your mercy.\nAmen.',
                        contentAm:'አቤቱ ጌታዬ ኢየሱስ ሆይ፡\nኃጢአታችንን ይቅር በለን፡\nከገሃነም እሳት አድነን፡\nነፍሳትን ሁሉ ወደ መንግሥተ ሰማያት አግባ። አሜን።',
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