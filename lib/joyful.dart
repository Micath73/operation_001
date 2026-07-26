import 'package:flutter/material.dart';
import 'package:operation_001/prayer_model.dart';
import 'package:operation_001/prayer_session_screen.dart';

class joyfulScreen extends StatefulWidget {
  const joyfulScreen({super.key});

  @override
  State<joyfulScreen> createState() => _joyfulScreenState();
}

class _joyfulScreenState extends State<joyfulScreen> {
  bool isAmharic = false;

  final int dayNumber = DateTime.now().weekday;
  final List<String> weekDay = ['', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
  final List<String> weekdays = ['', 'ሰኞ', 'ማክሰኞ', 'ረቡዕ', 'ሐሙስ', 'አርብ', 'ቅዳሜ', 'እሁድ'];

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
              isAmharic ? 'የደስታ ምሥጢር' : 'The Joyful Mystery',
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
          // Background Image
          SizedBox.expand(
            child: Image.asset(
              'assets/wmremove-transformed (3).jpeg',
              fit: BoxFit.cover,
            ),
          ),
          Container(color: Colors.black.withOpacity(0.4)),

          // Home UI
          Column(
            children: [
              const Spacer(flex: 4),
              _buildAnimatedText(
                isAmharic ? 'ዛሬ ${weekdays[dayNumber]} ነው' : 'Today is ${weekDay[dayNumber]}',
                titleStyle.copyWith(fontSize: 24, fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 10),
              _buildAnimatedText(
                isAmharic ? 'በደስታ ምስጢር\nእናሰላስል' : 'Let\'s Meditate Through The Joyful Mystery',
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
                  // 1. Define your prayer sequence using your PrayerStep model
                  final List<PrayerStep> prayerSequence = [
                    PrayerStep(
                      sectionHeader: 'Sign of the Cross',
                      titleEn: 'Sign Of The Cross',
                      titleAm: 'በስመ አብ ወወልድ ወመንፈስ ቅዱስ',
                      contentEn: 'In The Name Of The Father,\nAnd Of The Son,\nAnd Of The Holy Spirit.\nAmen',
                      contentAm: 'በስመ አብ ወወልድ ወመንፈስ ቅዱስ አሐዱ አምላክ አሜን።',
                      imagePath: 'assets/wmremove-transformed (3).jpeg',
                    ),
                    PrayerStep(
                      sectionHeader: 'Apostles\' Creed',
                      titleEn: 'The Apostles\' Creed',
                      titleAm: 'የሐዋርያት እምነት',
                      contentEn: 'I believe in God, the Father almighty, Creator of heaven and earth, and in Jesus Christ, His only Son, our Lord, who was conceived by the Holy Spirit, born of the Virgin Mary, suffered under Pontius Pilate, was crucified, died and was buried; He descended into hell; on the third day He rose again from the dead; He ascended into heaven, and seated at the right hand of God, the Father almighty; from thence He shall come to judge, the living and the dead. I believe in the Holy Spirit, the holy Catholic Church, the communion of saints, the forgiveness of sins, the resurrection of the body and life everlasting.\nAmen!',
                      contentAm: 'ሁሉን በሚችል ሰማይንና ምድርን በፈጠረ\nበእግዚአብሔር አብ አምናለሁ፡፡\nአንድ ልጁ በሆነዉ በጌታችን\nበኢየሱስ ክርስቶስ አምናለሁ፤\nእሱ በመንፋስ ቅዱስ ተጸንሶ\nከድንግል ማርያም ተወለደ፡፡\nበጴንጤናዊው ጲላጦስ ዘመን ተሰቃየ፣\nተሰቀለ፣ ሞተ፣ ተቀበረ፣\nወደ ሲኦል ወረደ፣\nበሶስተኛው ቀን ከሙታን ተለይቶ ተነሣ፣\nወደ ሰማይ ወጣ፣\nሁሉን በሚችል በእግዚአብሔር አብ ቀኝ ተቀመጠ፣\nያሉትንና የሞቱትን ሊፈርድ ዳግመኛ ይመጣል፣\n በመንፈስ ቅዱስም አምናለሁ፣\nየሁሉም በሆነችው በቅድስት ቤተክርስቲያን\nበቅዱሳንም አንድነት አምናለሁ፣\nበኃጢአት ስርየት፣\nበሙታን ትንሣኤ፣\nበዘላለም ሕይወት አምናለሁ፡፡\nአሜን!',
                      imagePath: 'assets/wmremove-transformed (3).jpeg',
                    ),
                    PrayerStep(
                      sectionHeader: 'Our Father',
                      titleEn: 'Our Father',
                      titleAm: 'አባታችን ሆይ',
                      contentEn: 'Our Father, who art in heaven, hallowed be thy name; thy kingdom come; thy will be done on earth as it is in heaven. Give us this day our daily bread; and forgive us our trespasses as we forgive those who trespass against us; and lead us not into temptation, but deliver us from evil.\nAmen!',
                      contentAm: 'በሰማይ የምትኖር አባታችን ሆይ፣ስምህ ይመስገን፣መንግሥትህ ትምጣ፡ፈቃድህ በሰማይ እንደሆነ:እንዲሁም በምድር ይሁን። የዕለት እንጀራችንን ዛሬ ስጠን፤እኛ የበደሉንን ይቅር እንደምንል:በደላችንን ይቅር በልልን፤ከክፉ ሁሉ ሰውርን እንጂ ወደ ፈተና አታግባን፡፡ መንግስት ኃይልና ክብር ለዘለዓለም ያንተ ነውና፡፡\nአሜን!',
                      imagePath: 'assets/wmremove-transformed (3).jpeg',
                    ),
                    PrayerStep(
                      sectionHeader: 'Hail Mary',
                      titleEn: 'Hail Mary',
                      titleAm: 'ጸጋ የመላሽ',
                      contentEn: 'Hail Mary, full of grace, the Lord is with you; Blessed art thou among women, and blessed is the fruit of thy womb, Jesus. Holy Mary, Mother of God, pray for us sinners now and at the hour of our death.\nAmen!',
                      contentAm: 'ጸጋ የመላሽ ማርይም ሆይ:ሰላም ላንቺ ይሁን፣እግዚአብሔር ካንቺ ጋር ነው፣ከሴቶች ሁሉ የተባረክሽ ነሽ፣የሆድሽም ፍሬ ኢየሱስ የተባረከ ነው፡፡ ቅድስት ማርያም የአምላክ እናት:ለኛ ለኃጢአተኞች:አሁንም በሞታችንም ጊዜ ለምኝልን፡፡\nአሜን።',
                      imagePath: 'assets/wmremove-transformed (3).jpeg',
                    ),
                    PrayerStep(
                      sectionHeader: 'Glory Be',
                      titleEn: 'Glory Be',
                      titleAm: 'ስብሐት ለአብ',
                      contentEn: 'Glory be to the Father,\nand to the Son,\nand to the Holy Spirit;\nas it was in the beginning,\nis now, and ever shall be,\nworld without end.\nAmen!',
                      contentAm: 'ለአብ:ለወልድና:ለመንፈስ ቅዱስ ምስጋና ይሁን\nአሁንም ዘወትርም ለዘለዓለምም::\n አሜን!"',
                      imagePath: 'assets/wmremove-transformed (3).jpeg',
                    ),
                    PrayerStep(
                      sectionHeader: 'Fatima Prayer',
                      titleEn: 'Fatima Prayer',
                      titleAm: 'የፋጢማ ጸሎት',
                      contentEn:'O my Jesus,\nforgive us our sins,\nsave us from the fires of hell;\nlead all souls to Heaven,\nespecially those who have\nmost need of your mercy.\nAmen.',
                      contentAm:'አቤቱ ጌታዬ ኢየሱስ ሆይ፡\nኃጢአታችንን ይቅር በለን፡\nከገሃነም እሳት አድነን፡\nነፍሳትን ሁሉ ወደ መንግሥተ ሰማያት አግባ። አሜን።',
                      imagePath: 'assets/wmremove-transformed (3).jpeg',
                    ),
                    PrayerStep(
                        titleEn: "First Joyful Mystery",
                        titleAm: "አንደኛ የደስታ ምስጢር",
                        contentEn: "The Annunciation.\n\n"
                            "\"In the sixth month\n"
                            "the angel Gabriel was sent from God\n"
                            "to a city of Galilee named Nazareth,\n"
                            "to a virgin betrothed to a man whose name was Joseph, of the house of David;\n"
                            "and the virgin's name was Mary\n"
                            "(Lk 1:26-27).\n\n\n"

                            "Our Father...\n"
                            "10 Hail Marys\n"
                            "Glory be to the Father...\n"
                            "Fatima Prayer...",
                        contentAm: "ቅዱስ ገብርኤል\n"
                            "ከሰማይ መጥቶ ለድንግል ማርያም እንዲህ አላት፡፡\n"
                            "ጸጋ የሞላሽ ሰላም ላንቺ!\n"
                            "ወንድ ልጅ ትወልጅያለሽ\n"
                            " ስሙንም ኢየሱስ ትይዋለሽ::\n"
                            "እመቤታችንም እንደ ቃልህ ይሁንልኝ አለች፡፡\n"
                            "በዚያ ጊዜ ኢየሱስ በመንፈስ ቅዱስ ኃይል መፀነሱንና\n"
                            "ለኛ ሰው መሆኑን ማሰብ ነው፡፡\n"
                            "የምስጢሩ ፍሬ ሐሳብ፡\n"
                            "ትዕብትን መናቅና ትህትናን መለመን፡፡\n\n\n"

                            "አባታችን ሆይ...\n"
                            "(10) ጸጋ የሞለሽ ማርያም ሆይ...\n"
                            "ለአብና ለወልድ ለመንፋስ ቅዱስ...\n"
                            "የፋጢማ ጸሎት...\n",
                        imagePath: "assets/img_32.png"
                    ),

                    PrayerStep(
                        titleEn: "Second Joyful Mystery",
                        titleAm: "ሁለተኛ የደስታ ምስጢር",
                        contentEn: "The Visitation.\n\n"
                            "\"In those days\n"
                            "Mary arose and went with haste into the hill country,\n"
                            "to a city of Judah,\n"
                            "and she entered the house of Zechariah and greeted Elizabeth.\n"
                            "And when Elizabeth heard the greeting of Mary,\n"
                            "the babe leaped in her womb;\n"
                            "and Elizabeth was filled with the Holy Spirit\n"
                            "and she exclaimed with a loud cry,\n"
                            "'Blessed are you among women, and blessed is the fruit of your womb!'\n"
                            "(Lk 1:39-42).\n\n\n"

                            "Our Father...\n"
                            "10 Hail Marys\n"
                            "Glory be to the Father...\n"
                            "Fatima Prayer...",
                        contentAm: "እመቤታችን ድንግል ማርያም\n"
                            " የቅድስት ኤልሳቤጥን መፅነስ በሰማች ጊዜ\n"
                            "ልትጎበኛት ወደ እሷ መሄድዋን:\n"
                            " በእርስዋም ዘንድ ሶስት ወር መቀመጧን ማሰብ ነው፡፡\n"
                            "የምስጢሩ ፍሬ ሐሳብ፡\n"
                            "የሰውን ፍቅር መለመንና ለማግኘት መትጋት ነው፡፡\n\n\n"

                            "አባታችን ሆይ...\n"
                            "(10) ጸጋ የሞለሽ ማርያም ሆይ...\n"
                            "ለአብና ለወልድ ለመንፋስ ቅዱስ...\n"
                            "የፋጢማ ጸሎት...\n",
                        imagePath: "assets/img_33.png"
                    ),

                    PrayerStep(
                        titleEn: "Third Joyful Mystery",
                        titleAm: "ሶስተኛ የደስታ ምስጢር",
                        contentEn: "The Birth of Our Lord.\n\n"
                            "\"In those days\n"
                            "a decree went out from Caesar Augustus\n"
                            "that all the world should be enrolled.\n"
                            "This was the first enrolment, when Quirinius was governor of Syria.\n"
                            "And all went to be enrolled, each to his own city.\n"
                            "And Joseph also went up from Galilee,\n"
                            "from the city of Nazareth, to Judea, to the city of David,\n"
                            "which is called Bethlehem,\n"
                            "because he was of the house and lineage of David,\n"
                            "to be enrolled with Mary, his betrothed, who was with child.\n"
                            "And while they were there,\n"
                            "the time came for her to be delivered.\n"
                            "And she gave birth to her first-born son\n"
                            "and wrapped him in swaddling cloths,\n"
                            "and laid him in a manger,\n"
                            "because there was no place for them in the inn.\n"
                            "(Lk 2:1-7).\n\n\n"

                            "Our Father...\n"
                            "10 Hail Marys\n"
                            "Glory be to the Father...\n"
                            "Fatima Prayer...",
                        contentAm: "እመቤታችን\n"
                            "ጌታችን ኢየሱስ ክርስቶስን የምትወልድበት ቀን በደረሰ ጊዜ\n"
                            "በቤተልሔም በከብቶች በረት መውለድዋን ማሰብ ነው::\n"
                            "የምስጢሩ ፍሬ ሐሳብ፡\n"
                            "የዚህ ዓለም ሀብት መናቅና ድህነትን መቻል ነው፡፡\n\n\n"

                            "አባታችን ሆይ...\n"
                            "(10) ጸጋ የሞለሽ ማርያም ሆይ...\n"
                            "ለአብና ለወልድ ለመንፋስ ቅዱስ...\n"
                            "የፋጢማ ጸሎት...\n",
                        imagePath: "assets/img_34.png"
                    ),

                    PrayerStep(
                        titleEn: "Fourth Joyful Mystery",
                        titleAm: "አራተኛ የደስታ ምስጢር",
                        contentEn: "The Presentation in the Temple.\n\n"
                            "\"And at the end of eight days,\n"
                            "when he was circumcised,\n"
                            "he was called Jesus,\n"
                            "the name given by the angel before he was conceived in the womb.\n"
                            "And when the time came for their purification\n"
                            "according to the law of Moses,\n"
                            "they brought him up to Jerusalem\n"
                            "to present him to the Lord (as it is written in the law of the Lord,\n"
                            "'Every male that opens the womb shall be called holy to the Lord')\n"
                            "and to offer a sacrifice according to what is said in the law of the Lord,\n"
                            "'a pair of turtledoves, or two young pigeons.'\n"
                            "(Lk 2:21-24).\n\n\n"

                            "Our Father...\n"
                            "10 Hail Marys\n"
                            "Glory be to the Father...\n"
                            "Fatima Prayer...",
                        contentAm: "እመቤታችን ማርያም\n"
                            "ጌታችን ከወለደች በኋላ ወደ ቤተመቅደስ ወስዳ\n"
                            "ቅዱስ ስምኦንም እርሱን በብዙ ደስታ መቀበሉን ማሰብ ነው::\n"
                            "የምስጢሩ ፍሬ ሐሳብ፡\n"
                            "የእግዚአብሔርንና የቤተክርቲያንን ደንብ መጠበቅ ነው፡፡\n\n\n"

                            "አባታችን ሆይ...\n"
                            "(10) ጸጋ የሞለሽ ማርያም ሆይ...\n"
                            "ለአብና ለወልድ ለመንፋስ ቅዱስ...\n"
                            "የፋጢማ ጸሎት...\n",
                        imagePath: "assets/img_35.png"
                    ),

                    PrayerStep(
                        titleEn: "Fifth Joyful Mystery",
                        titleAm: "አምስተኛ የደስታ ምስጢር",
                        contentEn: "The finding of Jesus in the temple.\n\n"
                            "\"Now his parents went to Jerusalem every year\n"
                            "at the feast of the Passover.\n"
                            "And when he was twelve years old,\n"
                            "they went up according to custom;\n"
                            "and when the feast was ended,\n"
                            "as they were returning,\n"
                            "the boy Jesus stayed behind in Jerusalem. His parents did not know it ...\n\n"
                            "After three days they found him in the temple,\n"
                            "sitting among the teachers,\n"
                            "listening to them and asking them questions;\n"
                            "and all who heard him were amazed at his understanding and his answers\n"
                            "(Lk 2:41-47).\n\n\n"

                            "Our Father...\n"
                            "10 Hail Marys\n"
                            "Glory be to the Father...\n"
                            "Fatima Prayer...",
                        contentAm: "ጌታችን ኢየሱስ\n"
                            "በተወለደ በአሥራ ሁለት ዓመቱ\n"
                            "እመቤታችን ማርያም ሳታውቅ በኢየሩሳሌም\n"
                            "የእግዚአብሔር ህግ በሚያስተምሩት መካከል መገኘቱን ማሰብ ነው::\n"
                            "የምስጢሩ ፍሬ ሐሳብ፡\n"
                            "የእግዚአብሔርን ሕግ መማር ነው፡፡\n\n\n"

                            "አባታችን ሆይ...\n"
                            "(10) ጸጋ የሞለሽ ማርያም ሆይ...\n"
                            "ለአብና ለወልድ ለመንፋስ ቅዱስ...\n"
                            "የፋጢማ ጸሎት...\n",
                        imagePath: "assets/img_36.png"
                    )

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