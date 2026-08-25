import 'package:flutter/material.dart';
import 'package:operation_001/prayer_model.dart';
import 'package:operation_001/prayer_session_screen.dart';

class luminousScreen extends StatefulWidget {
  const luminousScreen({super.key});

  @override
  State<luminousScreen> createState() => _luminousScreenState();
}

class _luminousScreenState extends State<luminousScreen> {
  bool isAmharic = false;

  final int dayNumber = DateTime.now().weekday;
  final List<String> weekDay = [
    '',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];
  final List<String> weekdays = [
    '',
    'ሰኞ',
    'ማክሰኞ',
    'ረቡዕ',
    'ሐሙስ',
    'አርብ',
    'ቅዳሜ',
    'እሁድ',
  ];

  // Define prayer sequence using PrayerStep model
  final List<PrayerStep> prayerSequence = [
    PrayerStep(
      sectionHeader: 'Sign of the Cross',
      titleEn: 'Sign Of The Cross',
      titleAm: 'በስመ አብ ወወልድ ወመንፈስ ቅዱስ',
      contentEn:
          'In The Name Of The Father,\nAnd Of The Son,\nAnd Of The Holy Spirit.\nAmen',
      contentAm: 'በስመ አብ ወወልድ ወመንፈስ ቅዱስ አሐዱ አምላክ አሜን።',
      imagePath: 'assets/wmremove-transformed (10).png',
    ),
    PrayerStep(
      sectionHeader: 'Apostles\' Creed',
      titleEn: 'The Apostles\' Creed',
      titleAm: 'የሐዋርያት እምነት',
      contentEn:
          'I believe in God, the Father almighty, Creator of heaven and earth, and in Jesus Christ, His only Son, our Lord, who was conceived by the Holy Spirit, born of the Virgin Mary, suffered under Pontius Pilate, was crucified, died and was buried; He descended into hell; on the third day He rose again from the dead; He ascended into heaven, and seated at the right hand of God, the Father almighty; from thence He shall come to judge, the living and the dead. I believe in the Holy Spirit, the holy Catholic Church, the communion of saints, the forgiveness of sins, the resurrection of the body and life everlasting.\nAmen!',
      contentAm:
          'ሁሉን በሚችል ሰማይንና ምድርን በፈጠረ\nበእግዚአብሔር አብ አምናለሁ፡፡\nአንድ ልጁ በሆነዉ በጌታችን\nበኢየሱስ ክርስቶስ አምናለሁ፤\nእሱ በመንፋስ ቅዱስ ተጸንሶ\nከድንግል ማርያም ተወለደ፡፡\nበጴንጤናዊው ጲላጦስ ዘመን ተሰቃየ፣\nተሰቀለ፣ ሞተ፣ ተቀበረ፣\nወደ ሲኦል ወረደ፣\nበሶስተኛው ቀን ከሙታን ተለይቶ ተነሣ፣\nወደ ሰማይ ወጣ፣\nሁሉን በሚችል በእግዚአብሔር አብ ቀኝ ተቀመጠ፣\nያሉትንና የሞቱትን ሊፈርድ ዳግመኛ ይመጣል፣\n በመንፈስ ቅዱስም አምናለሁ፣\nየሁሉም በሆነችው በቅድስት ቤተክርስቲያን\nበቅዱሳንም አንድነት አምናለሁ፣\nበኃጢአት ስርየት፣\nበሙታን ትንሣኤ፣\nበዘላለም ሕይወት አምናለሁ፡፡\nአሜን!',
      imagePath: 'assets/wmremove-transformed (10).png',
    ),
    PrayerStep(
      sectionHeader: 'Our Father',
      titleEn: 'Our Father',
      titleAm: 'አባታችን ሆይ',
      contentEn:
          'Our Father, who art in heaven, hallowed be thy name; thy kingdom come; thy will be done on earth as it is in heaven. Give us this day our daily bread; and forgive us our trespasses as we forgive those who trespass against us; and lead us not into temptation, but deliver us from evil.\nAmen!',
      contentAm:
          'በሰማይ የምትኖር አባታችን ሆይ፣ስምህ ይመስገን፣መንግሥትህ ትምጣ፡ፈቃድህ በሰማይ እንደሆነ:እንዲሁም በምድር ይሁን። የዕለት እንጀራችንን ዛሬ ስጠን፤እኛ የበደሉንን ይቅር እንደምንል:በደላችንን ይቅር በልልን፤ከክፉ ሁሉ ሰውርን እንጂ ወደ ፈተና አታግባን፡፡ መንግስት ኃይልና ክብር ለዘለዓለም ያንተ ነውና፡፡\nአሜን!',
      imagePath: 'assets/wmremove-transformed (10).png',
    ),
    PrayerStep(
      sectionHeader: 'Hail Mary',
      titleEn: 'Hail Mary',
      titleAm: 'ጸጋ የመላሽ',
      contentEn:
          'Hail Mary, full of grace, the Lord is with you; Blessed art thou among women, and blessed is the fruit of thy womb, Jesus. Holy Mary, Mother of God, pray for us sinners now and at the hour of our death.\nAmen!',
      contentAm:
          'ጸጋ የመላሽ ማርይም ሆይ:ሰላም ላንቺ ይሁን፣እግዚአብሔር ካንቺ ጋር ነው፣ከሴቶች ሁሉ የተባረክሽ ነሽ፣የሆድሽም ፍሬ ኢየሱስ የተባረከ ነው፡፡ ቅድስት ማርያም የአምላክ እናት:ለኛ ለኃጢአተኞች:አሁንም በሞታችንም ጊዜ ለምኝልን፡፡\nአሜን።',
      imagePath: 'assets/wmremove-transformed (10).png',
    ),
    PrayerStep(
      sectionHeader: 'Glory Be',
      titleEn: 'Glory Be',
      titleAm: 'ስብሐት ለአብ',
      contentEn:
          'Glory be to the Father,\nand to the Son,\nand to the Holy Spirit;\nas it was in the beginning,\nis now, and ever shall be,\nworld without end.\nAmen!',
      contentAm: 'ለአብ:ለወልድና:ለመንፈስ ቅዱስ ምስጋና ይሁን\nአሁንም ዘወትርም ለዘለዓለምም::\n አሜን!"',
      imagePath: 'assets/wmremove-transformed (10).png',
    ),
    PrayerStep(
      sectionHeader: 'Fatima Prayer',
      titleEn: 'Fatima Prayer',
      titleAm: 'የፋጢማ ጸሎት',
      contentEn:
          'O my Jesus,\nforgive us our sins,\nsave us from the fires of hell;\nlead all souls to Heaven,\nespecially those who have\nmost need of your mercy.\nAmen.',
      contentAm:
          'አቤቱ ጌታዬ ኢየሱስ ሆይ፡\nኃጢአታችንን ይቅር በለን፡\nከገሃነም እሳት አድነን፡\nነፍሳትን ሁሉ ወደ መንግሥተ ሰማያት አግባ። አሜን።',
      imagePath: 'assets/wmremove-transformed (10).png',
    ),
    PrayerStep(
      titleEn: "First Luminous Mystery",
      titleAm: "አንደኛ የብርሃን ምስጢር",
      contentEn:
          "Baptism of Jesus.\n\n"
          "\"And when Jesus was baptized,\n"
          "… the heavens were opened\n"
          "and He saw the Spirit of God descending like a dove,\n"
          "and alighting on Him, and lo, a voice from heaven, saying\n"
          "'this is My beloved Son,” with whom I am well pleased.'\n"
          "(Matthew 3:16-17).\n\n\n",
      contentAm:
          "ጌታችን ኢየሱስ ክርስቶስ\n"
          "በዮርዳኖስ ወንዝ በአጥማቂው\n"
          "ዮሐንስ እጅ እንደተጠመቀ ማሰብ ነው፡፡\n\n\n",
      imagePath: "assets/img_37.png",
    ),
    PrayerStep(
      titleEn: "Second Luminous Mystery",
      titleAm: "ሁለተኛ የብርሃን ምስጢር",
      contentEn:
          "Wedding at Cana.\n\n"
          "\"His mother said to the servants,\n"
          "'Do whatever He tells you.'\n"
          "… Jesus said to them,\n"
          "'Fill the jars with water.'\n"
          "And they filled them up to the brim.\n"
          "(John 2:5-7).\n\n\n",
      contentAm:
          "ጌታችን ኢየሱስ ክርስቶስ\n"
          " በቃና ዘገሊላ በመጀመሪያ ተአምር\n"
          "ውኃን ወደ ወይን ጠጅ መለወጡን ማሰብ ነው፡፡\n\n\n",
      imagePath: "assets/img_38.png",
    ),
    PrayerStep(
      titleEn: "Third Luminous Mystery",
      titleAm: "ሶስተኛ የብርሃን ምስጢር",
      contentEn:
          "Proclaiming the Kingdom.\n\n"
          "\"And preach as you go, saying,\n"
          "'The kingdom of heaven is at hand.'\n"
          "Heal the sick, raise the dead, cleanse lepers, cast out demons.\n"
          "You received without pay, give without pay.\n"
          "(Matthew 10:7-8).\n\n\n",
      contentAm:
          "ጌታችን ኢየሱስ ክርስቶስ\n"
          "ስለ እግዚአብሔር መንግስት\n"
          "አዋጅ እንዳደረገ ማሰብ ነው፡፡\n\n\n",
      imagePath: "assets/img_39.png",
    ),
    PrayerStep(
      titleEn: "Fourth Luminous Mystery",
      titleAm: "አራተኛ የብርሃን ምስጢር",
      contentEn:
          "Transfiguration.\n\n"
          "\"And as He was praying,\n"
          "the appearance of His countenance was altered\n"
          "and His raiment become dazzling white.\n"
          "And a voice came out of the cloud saying,\n"
          "'This is My Son, My chosen; listen to Him!'\n"
          "(Luke 9:29, 35).\n\n\n",
      contentAm:
          "ጌታችን ኢየሱስ ክርስቶስ\n"
          "በታቦር ተራራ ላይ በሐዋርያት ፊት\n"
          "መልኩ መለወጡን ማሰብ ነው፡፡\n\n\n",
      imagePath: "assets/img_40.png",
    ),
    PrayerStep(
      titleEn: "Fifth Luminous Mystery",
      titleAm: "አምስተኛ የብርሃን ምስጢር",
      contentEn:
          "Institution of the Eucharist.\n\n"
          "\"And He took bread,\n"
          "and when He had given thanks\n"
          "He broke it and gave it to them, saying,\n"
          "'This is My body which is given for you.'\n"
          "… And likewise the cup after supper, saying,\n"
          "'This cup which is poured out for you is\n"
          "the new covenant in My blood.'\n"
          "(Luke 22:19-20)\n\n\n",
      contentAm:
          "ጌታችን ኢየሱስ ክርስቶስ\n"
          "በጸሎት ሐሙስ ማታ ከሐዋርያት ጋር ሆነው\n"
          "ቅዱስ ቁርባንን መመሥረቱን ማሰብ ነው፡፡\n\n\n",
      imagePath: "assets/img_41.png",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Thursday = 4
    bool isLuminousDay = (dayNumber == 4);

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
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        title: SizedBox(
          width: screenWidth * 0.6,
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: Text(
              isAmharic ? 'የብርሃን ምሥጢር' : 'The Luminous Mystery',
              key: ValueKey<bool>(isAmharic),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
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
              style: TextStyle(
                color: theme.colorScheme.secondary,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          // Background Layer
          SizedBox.expand(
            child: Image.asset(
              'assets/wmremove-transformed (10).png',
              fit: BoxFit.cover,
            ),
          ),
          Container(color: Colors.black.withOpacity(0.4)),

          // Home UI Layer
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(flex: 4),
                _buildAnimatedText(
                  isLuminousDay
                      ? (isAmharic
                            ? 'ዛሬ ${weekdays[dayNumber]} ነው'
                            : 'Today is ${weekDay[dayNumber]}')
                      : '',
                  titleStyle.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 10),
                _buildAnimatedText(
                  isAmharic
                      ? 'በብርሃን ምሥጢር\nእናሰላስል'
                      : 'Let\'s Meditate Through The Luminous Mystery',
                  titleStyle,
                ),
                const Spacer(flex: 2),

                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PrayerSession(
                          prayerSteps: prayerSequence,
                          isAmharic: isAmharic,
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.colorScheme.primary,
                    foregroundColor: theme.colorScheme.onPrimary,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 50,
                      vertical: 18,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 8,
                  ),
                  child: Text(
                    isAmharic ? 'ጸሎቱን ጀምር' : 'START PRAYER',
                    style: TextStyle(
                      color: theme.colorScheme.onPrimary,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
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
