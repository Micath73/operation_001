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

  final int dayNumber = DateTime.now().weekday;
  final List<String> weekDay = ['', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
  final List<String> weekdays = ['', 'ሰኞ', 'ማክሰኞ', 'ረቡዕ', 'ሐሙስ', 'አርብ', 'ቅዳሜ', 'እሁድ'];

  // Define prayer sequence using PrayerStep model
  final List<PrayerStep> prayerSequence = [
    PrayerStep(
      sectionHeader: 'Sign of the Cross',
      titleEn: 'Sign Of The Cross',
      titleAm: 'በስመ አብ ወወልድ ወመንፈስ ቅዱስ',
      contentEn: 'In The Name Of The Father,\nAnd Of The Son,\nAnd Of The Holy Spirit.\nAmen',
      contentAm: 'በስመ አብ ወወልድ ወመንፈስ ቅዱስ አሐዱ አምላክ አሜን።',
      imagePath: 'assets/wmremove-transformed (6).jpeg',
    ),
    PrayerStep(
      sectionHeader: 'Apostles\' Creed',
      titleEn: 'The Apostles\' Creed',
      titleAm: 'የሐዋርያት እምነት',
      contentEn: 'I believe in God, the Father almighty, Creator of heaven and earth, and in Jesus Christ, His only Son, our Lord, who was conceived by the Holy Spirit, born of the Virgin Mary, suffered under Pontius Pilate, was crucified, died and was buried; He descended into hell; on the third day He rose again from the dead; He ascended into heaven, and seated at the right hand of God, the Father almighty; from thence He shall come to judge, the living and the dead. I believe in the Holy Spirit, the holy Catholic Church, the communion of saints, the forgiveness of sins, the resurrection of the body and life everlasting.\nAmen!',
      contentAm: 'ሁሉን በሚችል ሰማይንና ምድርን በፈጠረ\nበእግዚአብሔር አብ አምናለሁ፡፡\nአንድ ልጁ በሆነዉ በጌታችን\nበኢየሱስ ክርስቶስ አምናለሁ፤\nእሱ በመንፋስ ቅዱስ ተጸንሶ\nከድንግል ማርያም ተወለደ፡፡\nበጴንጤናዊው ጲላጦስ ዘመን ተሰቃየ፣\nተሰቀለ፣ ሞተ፣ ተቀበረ፣\nወደ ሲኦል ወረደ፣\nበሶስተኛው ቀን ከሙታን ተለይቶ ተነሣ፣\nወደ ሰማይ ወጣ፣\nሁሉን በሚችል በእግዚአብሔር አብ ቀኝ ተቀመጠ፣\nያሉትንና የሞቱትን ሊፈርድ ዳግመኛ ይመጣል፣\n በመንፈስ ቅዱስም አምናለሁ፣\nየሁሉም በሆነችው በቅድስት ቤተክርስቲያን\nበቅዱሳንም አንድነት አምናለሁ፣\nበኃጢአት ስርየት፣\nበሙታን ትንሣኤ፣\nበዘላለም ሕይወት አምናለሁ፡፡\nአሜን!',
      imagePath: 'assets/wmremove-transformed (6).jpeg',
    ),
    PrayerStep(
      sectionHeader: 'Our Father',
      titleEn: 'Our Father',
      titleAm: 'አባታችን ሆይ',
      contentEn: 'Our Father, who art in heaven, hallowed be thy name; thy kingdom come; thy will be done on earth as it is in heaven. Give us this day our daily bread; and forgive us our trespasses as we forgive those who trespass against us; and lead us not into temptation, but deliver us from evil.\nAmen!',
      contentAm: 'በሰማይ የምትኖር አባታችን ሆይ፣ስምህ ይመስገን፣መንግሥትህ ትምጣ፡ፈቃድህ በሰማይ እንደሆነ:እንዲሁም በምድር ይሁን። የዕለት እንጀራችንን ዛሬ ስጠን፤እኛ የበደሉንን ይቅር እንደምንል:በደላችንን ይቅር በልልን፤ከክፉ ሁሉ ሰውርን እንጂ ወደ ፈተና አታግባን፡፡ መንግስት ኃይልና ክብር ለዘለዓለም ያንተ ነውና፡፡\nአሜን!',
      imagePath: 'assets/wmremove-transformed (6).jpeg',
    ),
    PrayerStep(
      sectionHeader: 'Hail Mary',
      titleEn: 'Hail Mary',
      titleAm: 'ጸጋ የመላሽ',
      contentEn: 'Hail Mary, full of grace, the Lord is with you; Blessed art thou among women, and blessed is the fruit of thy womb, Jesus. Holy Mary, Mother of God, pray for us sinners now and at the hour of our death.\nAmen!',
      contentAm: 'ጸጋ የመላሽ ማርይም ሆይ:ሰላም ላንቺ ይሁን፣እግዚአብሔር ካንቺ ጋር ነው፣ከሴቶች ሁሉ የተባረክሽ ነሽ፣የሆድሽም ፍሬ ኢየሱስ የተባረከ ነው፡፡ ቅድስት ማርያም የአምላክ እናት:ለኛ ለኃጢአተኞች:አሁንም በሞታችንም ጊዜ ለምኝልን፡፡\nአሜን።',
      imagePath: 'assets/wmremove-transformed (6).jpeg',
    ),
    PrayerStep(
      sectionHeader: 'Glory Be',
      titleEn: 'Glory Be',
      titleAm: 'ስብሐት ለአብ',
      contentEn: 'Glory be to the Father,\nand to the Son,\nand to the Holy Spirit;\nas it was in the beginning,\nis now, and ever shall be,\nworld without end.\nAmen!',
      contentAm: 'ለአብ:ለወልድና:ለመንፈስ ቅዱስ ምስጋና ይሁን\nአሁንም ዘወትርም ለዘለዓለምም::\n አሜን!"',
      imagePath: 'assets/wmremove-transformed (6).jpeg',
    ),
    PrayerStep(
      sectionHeader: 'Fatima Prayer',
      titleEn: 'Fatima Prayer',
      titleAm: 'የፋጢማ ጸሎት',
      contentEn:'O my Jesus,\nforgive us our sins,\nsave us from the fires of hell;\nlead all souls to Heaven,\nespecially those who have\nmost need of your mercy.\nAmen.',
      contentAm:'አቤቱ ጌታዬ ኢየሱስ ሆይ፡\nኃጢአታችንን ይቅር በለን፡\nከገሃነም እሳት አድነን፡\nነፍሳትን ሁሉ ወደ መንግሥተ ሰማያት አግባ። አሜን።',
      imagePath: 'assets/wmremove-transformed (6).jpeg',
    ),
    PrayerStep(
      titleEn: "First Sorrowful Mystery",
      titleAm: "የመጀመሪያ የህመም ምሥጢር",
      contentEn: "The agony in the Garden.\n\n"
          "\"Then Jesus went with them\n"
          "to a place called Gethsemane,\n"
          "and he said to his disciples,\n"
          "'Sit here, while I go yonder and pray.'\n"
          "And taking with him Peter\n"
          "and the two sons of Zebedee,\n"
          "he began to be sorrowful and troubled.\n\n"
          "Then he said to them,\n"
          "'My soul is very sorrowful,\n"
          "even to death; remain here,\n"
          "and watch with me.'\n"
          "And going a little farther\n"
          "he fell on his face and prayed,\n"
          "'My Father, if it be possible,\n"
          "let this cup pass from me;\n"
          "nevertheless, not as I will,\n"
          "but as you will'\"\n"
          "(Mt 26:36-39).",
      contentAm: "ጌታችን ኢየሱስ ክርስቶስ፡\n"
          "በጌተሰማኒ አትክልት ውስጥ ጸሎት እያደረሰ፡\n"
          " ስለእኛ ኃጢአት እያሰበ ደም መላቡን ማሰብ ነው፡፡\n"
          "የምስጢሩ ፍሬ ሐሳብ፡\n"
          "በኃጢአታችን በሚገባ ማዘን ነው፡፡\n\n\n",
      imagePath: "assets/img_22.png",
    ),
    PrayerStep(
      titleEn: "Second Sorrowful Mystery",
      titleAm: "ሁለተኛዉ የህመም ምሥጢር",
      contentEn: "The Scourging at the Pillar.\n\n"
          "\"Pilate released Barabbas to them,\n"
          "but after he had Jesus scourged,\n"
          "he handed him over\n"
          "to be crucified\"\n"
          "(Mt 27:26).",
      contentAm: "ጌታችን ኢየሱስ ክርስቶስ፡\n"
          " በጵላጦስ ፊት ደም እስከሚጎርፍ ድረስ፡\n"
          " ስለኃጢአታችን አለ ልክ መገረፉን ማሰብ ነው፡፡\n"
          " የምስጢሩ ፍሬ ሐሳብ: ከኃጢአት መራቅ ነው፡፡\n\n\n",
      imagePath: "assets/img_23.png",
    ),
    PrayerStep(
      titleEn: "Third Sorrowful Mystery",
      titleAm: "ሦስተኛዉ የህመም ምሥጢር",
      contentEn: "The Crowning with Thorns.\n\n"
          "\"Then the soldiers of the governor\n"
          "took Jesus into the praetorium,\n"
          "and they gathered the whole\n"
          "battalion before him.\n"
          "And they stripped him and put\n"
          "a scarlet robe upon him,\n"
          "and plaiting a crown of thorns\n"
          "they put it on his head,\n"
          "and put a reed in his right hand.\n\n"
          "And kneeling before him\n"
          "they mocked him, saying,\n"
          "'Hail, King of the Jews!'\"\n"
          "(Mt 27:27-29).",
      contentAm: "በጌታችን ኢየሱስ ክርስቶስ፡\n"
          "ራስ ላይ የእሾኸ አክሊል መደፋቱን ማሰብ ነው፡፡\n"
          "ራስ ላይ የእሾኸ አክሊል መደፋቱን ማሰብ ነው፡፡\n"
          "የምስጢሩ ፍሬ ሐሳብ:ኢየሱስን እንደ ንጉሣችን ማክበር ነው፡፡\n\n\n",
      imagePath: "assets/img_24.png",
    ),
    PrayerStep(
      titleEn: "Fourth Sorrowful Mystery",
      titleAm: "አራተኛዉ የህመም ምሥጢር",
      contentEn: "The Carrying of the Cross.\n\n"
          "\"And they compelled a passer-by,\n"
          "Simon of Cyrene,\n"
          "who was coming in from the country,\n"
          "the father of Alexander and Rufus,\n"
          "to carry his cross.\n"
          "And they brought him to the place\n"
          "called Golgotha\n"
          "(which means the place of a skull)\"\n"
          "(Mk 15:21-22).",
      contentAm: "አይሁዳዊን በጌታችን ኢየሱስ ክርስቶስ ላይ፡\n"
          "የሞት ፍርድ እንደፈረዱና ስቃይን ለመጨመር፡\n"
          "ከባድ መስቀል ማሸከማቸውን ማሰብ ነው፡፡\n"
          " የምስጢሩ ፍሬ ሐሳብ\n"
          "ስቃያችንን ስለ እግዚአብሔር ብለን መታገስ ነው፡፡\n\n\n",
      imagePath: "assets/img_25.png",
    ),
    PrayerStep(
      titleEn: "Fifth Sorrowful Mystery",
      titleAm: "አምስተኛዉ የህመም ምሥጢር",
      contentEn: "The Crucifixion and Death.\n\n"
          "\"And when they came to the place\n"
          "which is called The Skull,\n"
          "there they crucified him,\n"
          "and the criminals,\n"
          "one on the right and one on the left.\n"
          "And Jesus said, 'Father, forgive them;\n"
          "for they know not what they do'...\n\n"
          "It was now about the sixth hour,\n"
          "and there was darkness over the\n"
          "whole land until the ninth hour,\n"
          "while the sun's light failed;\n"
          "and the curtain of the temple\n"
          "was torn in two.\n"
          "Then Jesus, crying with a loud voice,\n"
          "said, 'Father, into thy hands\n"
          "I commit my spirit!'\n"
          "And having said this\n"
          "he breathed his last\"\n"
          "(Lk 23:33-46).",
      contentAm: "ጌታችን ኢየሱስ ክርስቶስ፡\n"
          "ቀራንዮ በደረሰ ጊዜ ልብሱን ገፈውት እራቁቱ መሆኑን፡\n"
          "አለ ምሕረትም በመስቀል ላይ መቸንከሩን፡\n"
          "የመከራ ጎደኛው እናቱም ይህን ሁሉ መከራውን አይታ መጨነቅዋን ማሰብ ነው፡፡\n"
          "የምስጢሩ ፍሬ ሐሳብ፡\n"
          "የሱስንና ማርያምን ወደን ኃጢአትን ሁሉ መተው፡፡\n\n\n",
      imagePath: "assets/img_26.png",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // Tuesday = 2, Friday = 5
    bool isSorrowfulDay = (dayNumber == 2 || dayNumber == 5);

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
              isAmharic ? 'የሐዘን ምስጢር' : 'The Sorrowful Mystery',
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
          // Background Layer
          SizedBox.expand(
            child: Image.asset(
              'assets/wmremove-transformed (6).jpeg',
              fit: BoxFit.cover,
            ),
          ),
          Container(color: Colors.black.withOpacity(0.4)),

          // Home UI Layer
          SafeArea(
            child: Column(
              children: [
                const Spacer(flex: 4),
                _buildAnimatedText(
                  isSorrowfulDay
                      ? (isAmharic
                      ? 'ዛሬ ${weekdays[dayNumber]} ነው'
                      : 'Today is ${weekDay[dayNumber]}')
                      : (isAmharic
                      ? ''
                      : ''),
                  titleStyle.copyWith(fontSize: 20, fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 10),
                _buildAnimatedText(
                  isAmharic ? 'በሐዘን ምስጢር\nእናሰላስል' : 'Let\'s Meditate Through\nThe Sorrowful Mystery',
                  titleStyle,
                ),
                const Spacer(flex: 2),

                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => prayer_session(
                          prayerSteps: prayerSequence,
                          isAmharic: isAmharic,
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