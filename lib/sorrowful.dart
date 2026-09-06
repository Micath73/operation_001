import 'package:flutter/material.dart';
import 'package:operation_001/prayer_model.dart';
import 'package:operation_001/prayer_session_screen.dart';

class SorrowfulScreen extends StatefulWidget {
  const SorrowfulScreen({super.key});

  @override
  State<SorrowfulScreen> createState() => _SorrowfulScreenState();
}

class _SorrowfulScreenState extends State<SorrowfulScreen> {
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

  final List<PrayerStep> prayerSequence = [
    PrayerStep(
      sectionHeader: 'Sign of the Cross',
      titleEn: 'Sign Of The Cross',
      titleAm: 'በስመ አብ ወወልድ ወመንፈስ ቅዱስ',
      contentEn:
      'In The Name Of The Father,\nAnd Of The Son,\nAnd Of The Holy Spirit.\nAmen',
      contentAm: 'በስመ አብ ወወልድ ወመንፈስ ቅዱስ አሐዱ አምላክ አሜን።',
      imagePath: 'assets/wmremove-transformed (6).jpeg',
    ),
    PrayerStep(
      sectionHeader: 'Apostles\' Creed',
      titleEn: 'The Apostles\' Creed',
      titleAm: 'የሐዋርያት እምነት',
      contentEn:
      'I believe in God, the Father almighty, Creator of heaven and earth, and in Jesus Christ, His only Son, our Lord, who was conceived by the Holy Spirit, born of the Virgin Mary, suffered under Pontius Pilate, was crucified, died and was buried; He descended into hell; on the third day He rose again from the dead; He ascended into heaven, and seated at the right hand of God, the Father almighty; from thence He shall come to judge, the living and the dead. I believe in the Holy Spirit, the holy Catholic Church, the communion of saints, the forgiveness of sins, the resurrection of the body and life everlasting.\nAmen!',
      contentAm:
      'ሁሉን በሚችል ሰማይንና ምድርን በፈጠረ\nበእግዚአብሔር አብ አምናለሁ፡፡\nአንድ ልጁ በሆነዉ በጌታችን\nበኢየሱስ ክርስቶስ አምናለሁ፤\nእሱ በመንፋስ ቅዱስ ተጸንሶ\nከድንግል ማርያም ተወለደ፡፡\nበጴንጤናዊው ጲላጦስ ዘመን ተሰቃየ፣\nተሰቀለ፣ ሞተ፣ ተቀበረ፣\nወደ ሲኦል ወረደ፣\nበሶስተኛው ቀን ከሙታን ተለይቶ ተነሣ፣\nወደ ሰማይ ወጣ፣\nሁሉን በሚችል በእግዚአብሔር አብ ቀኝ ተቀመጠ፣\nያሉትንና የሞቱትን ሊፈርድ ዳግመኛ ይመጣል፣\n በመንፈስ ቅዱስም አምናለሁ፣\nየሁሉም በሆነችው በቅድስት ቤተክርስቲያን\nበቅዱሳንም አንድነት አምናለሁ፣\nበኃጢአት ስርየት፣\nበሙታን ትንሣኤ፣\nበዘላለም ሕይወት አምናለሁ፡፡\nአሜን!',
      imagePath: 'assets/wmremove-transformed (6).jpeg',
    ),
    PrayerStep(
      sectionHeader: 'Our Father',
      titleEn: 'Our Father',
      titleAm: 'አባታችን ሆይ',
      contentEn:
      'Our Father, who art in heaven, hallowed be thy name; thy kingdom come; thy will be done on earth as it is in heaven. Give us this day our daily bread; and forgive us our trespasses as we forgive those who trespass against us; and lead us not into temptation, but deliver us from evil.\nAmen!',
      contentAm:
      'በሰማይ የምትኖር አባታችን ሆይ፣ስምህ ይመስገን፣መንግሥትህ ትምጣ፡ፈቃድህ በሰማይ እንደሆነ:እንዲሁም በምድር ይሁን። የዕለት እንጀራችንን ዛሬ ስጠን፤እኛ የበደሉንን ይቅር እንደምንል:በደላችንን ይቅር በልልን፤ከክፉ ሁሉ ሰውርን እንጂ ወደ ፈተና አታግባን፡፡ መንግስት ኃይልና ክብር ለዘለዓለም ያንተ ነውና፡፡\nአሜን!',
      imagePath: 'assets/wmremove-transformed (6).jpeg',
    ),
    PrayerStep(
      sectionHeader: 'Hail Mary',
      titleEn: 'Hail Mary',
      titleAm: 'ጸጋ የመላሽ',
      contentEn:
      'Hail Mary, full of grace, the Lord is with you; Blessed art thou among women, and blessed is the fruit of thy womb, Jesus. Holy Mary, Mother of God, pray for us sinners now and at the hour of our death.\nAmen!',
      contentAm:
      'ጸጋ የመላሽ ማርይም ሆይ:ሰላም ላንቺ ይሁን፣እግዚአብሔር ካንቺ ጋር ነው፣ከሴቶች ሁሉ የተባረክሽ ነሽ፣የሆድሽም ፍሬ ኢየሱስ የተባረከ ነው፡፡ ቅድስት ማርያም የአምላክ እናት:ለኛ ለኃጢአተኞች:አሁንም በሞታችንም ጊዜ ለምኝልን፡፡\nአሜን።',
      imagePath: 'assets/wmremove-transformed (6).jpeg',
    ),
    PrayerStep(
      sectionHeader: 'Glory Be',
      titleEn: 'Glory Be',
      titleAm: 'ስብሐት ለአብ',
      contentEn:
      'Glory be to the Father,\nand to the Son,\nand to the Holy Spirit;\nas it was in the beginning,\nis now, and ever shall be,\nworld without end.\nAmen!',
      contentAm:
      'ለአብ:ለወልድና:ለመንፈስ ቅዱስ ምስጋና ይሁን\nአሁንም ዘወትርም ለዘለዓለምም::\n አሜን!',
      imagePath: 'assets/wmremove-transformed (6).jpeg',
    ),
    PrayerStep(
      sectionHeader: 'Fatima Prayer',
      titleEn: 'Fatima Prayer',
      titleAm: 'የፋጢማ ጸሎት',
      contentEn:
      'O my Jesus,\nforgive us our sins,\nsave us from the fires of hell;\nlead all souls to Heaven,\nespecially those who have\nmost need of your mercy.\nAmen.',
      contentAm:
      'አቤቱ ጌታዬ ኢየሱስ ሆይ፡\nኃጢአታችንን ይቅር በለን፡\nከገሃነም እሳት አድነን፡\nነፍሳትን ሁሉ ወደ መንግሥተ ሰማያት አግባ። አሜን።',
      imagePath: 'assets/wmremove-transformed (6).jpeg',
    ),
    PrayerStep(
      titleEn: "First Sorrowful Mystery",
      titleAm: "አንደኛ የሕማማት ምስጢር",
      contentEn:
      "The Agony in the Garden.\n\n"
          "\"Then Jesus went with them to a place called Gethsemane,\n"
          "and he said to his disciples, 'Sit here, while I go yonder and pray.'\n"
          "And taking with him Peter and the two sons of Zebedee,\n"
          "he began to be sorrowful and troubled.\"\n"
          "(Mt 26:36-37)\n\n\n",
      contentAm:
      "ጌታችን ኢየሱስ ክርስቶስ፡\n"
          "በጌቴሴማኔ የአትክልት ቦታ፡\n"
          "ስለእኛ ኃጢአት እያሰበ ደም መላቡን ማሰብ ነው፡፡\n"
          "የምስጢሩ ፍሬ ሐሳብ፡\n"
          "የኃጢአታችንን ታላቅነት አውቀን መጸጸት ነው፡፡\n\n\n",
      imagePath: "assets/img_18.png",
    ),
    PrayerStep(
      titleEn: "Second Sorrowful Mystery",
      titleAm: "ሁለተኛ የሕማማት ምስጢር",
      contentEn:
      "The Scourging at the Pillar.\n\n"
          "\"Pilate released Barabbas to them;\n"
          "but after he had Jesus scourged,\n"
          "he handed him over to be crucified.\"\n"
          "(Mt 27:26)\n\n\n",
      contentAm:
      "ጌታችን ኢየሱስ ክርስቶስ፡\n"
          "በጲላጦስ ቤት በግፍ መንገላታቱንና፡\n"
          "በሰንሰለት ታስሮ መገረፉን ማሰብ ነው፡፡\n"
          "የምስጢሩ ፍሬ ሐሳብ፡\n"
          "የስጋችንን ፈቃድና ፍላጎት መግታት ነው፡፡\n\n\n",
      imagePath: "assets/img_19.png",
    ),
    PrayerStep(
      titleEn: "Third Sorrowful Mystery",
      titleAm: "ሶስተኛ የሕማማት ምስጢር",
      contentEn:
      "The Crowning with Thorns.\n\n"
          "\"Plaiting a crown of thorns they put it on his head,\n"
          "and put a reed in his right hand.\n"
          "And kneeling before him they mocked him, saying,\n"
          "'Hail, King of the Jews!'\"\n"
          "(Mt 27:29)\n\n\n",
      contentAm:
      "ጌታችን ኢየሱስ ክርስቶስ፡\n"
          "በጨካኞች ወታደሮች የሾህ አክሊል በመደፋቱ፡\n"
          "የደረሰበትን የራስ ምታትና ስቃይ ማሰብ ነው፡፡\n"
          "የምስጢሩ ፍሬ ሐሳብ፡\n"
          "የትዕቢትንና የክፉ አሳቦችን ፈተና ማሸነፍ ነው፡፡\n\n\n",
      imagePath: "assets/img_20.png",
    ),
    PrayerStep(
      titleEn: "Fourth Sorrowful Mystery",
      titleAm: "አራተኛ የሕማማት ምስጢር",
      contentEn:
      "The Carrying of the Cross.\n\n"
          "\"So they took Jesus, and he went out,\n"
          "bearing his own cross, to the place called the place of a skull,\n"
          "which is called in Hebrew Golgotha.\"\n"
          "(Jn 19:17)\n\n\n",
      contentAm:
      "ጌታችን ኢየሱስ ክርስቶስ፡\n"
          "ከባድ መስቀል ተሸክሞ፡\n"
          "ወደ ቀራንዮ ተራራ መጓዙን ማሰብ ነው፡፡\n"
          "የምስጢሩ ፍሬ ሐሳብ፡\n"
          "የሚደርስብንን ችግርና መከራ በትዕግሥት መቀበል ነው፡፡\n\n\n",
      imagePath: "assets/img_21.png",
    ),
    PrayerStep(
      titleEn: "Fifth Sorrowful Mystery",
      titleAm: "አምስተኛ የሕማማት ምስጢር",
      contentEn:
      "The Crucifixion and Death of Jesus.\n\n"
          "\"And when they came to the place which is called The Skull,\n"
          "there they crucified him...\n"
          "Jesus, crying with a loud voice, said,\n"
          "'Father, into thy hands I commit my spirit!'\n"
          "And having said this he breathed his last.\"\n"
          "(Lk 23:33, 46)\n\n\n",
      contentAm:
      "ጌታችን ኢየሱስ ክርስቶስ፡\n"
          "በቀራንዮ ተራራ በመስቀል ላይ ተቸንክሮ፡\n"
          "ስለእኛ መሞቱን ማሰብ ነው፡፡\n"
          "የምስጢሩ ፍሬ ሐሳብ፡\n"
          "እግዚአብሔርንና ሰዎችን በቅን ልብ መውደድ ነው፡፡\n\n\n",
      imagePath: "assets/img_22.png",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // Tuesday = 2, Friday = 5
    final bool isSorrowfulDay = (dayNumber == 2 || dayNumber == 5);
    final double screenWidth = MediaQuery.of(context).size.width;

    const titleStyle = TextStyle(
      fontSize: 30.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
      shadows: [
        Shadow(blurRadius: 12.0, color: Colors.black, offset: Offset(2, 2)),
      ],
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        title: SizedBox(
          width: screenWidth * 0.6,
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: Text(
              isAmharic ? 'የሕማማት ምሥጢር' : 'The Sorrowful Mystery',
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
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: TextButton(
              onPressed: () => setState(() => isAmharic = !isAmharic),
              style: TextButton.styleFrom(
                backgroundColor: Colors.white.withAlpha(30),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text(
                isAmharic ? 'EN' : 'አማ',
                style: TextStyle(
                  color: theme.colorScheme.secondary,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/wmremove-transformed (6).jpeg',
              fit: BoxFit.cover,
            ),
          ),

          // Standard Semi-Transparent Dark Overlay
          Positioned.fill(
            child: Container(color: Colors.black.withAlpha(125)),
          ),

          // Content Layer
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  const Spacer(flex: 3),
                  if (isSorrowfulDay)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withAlpha(30),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.white.withAlpha(50),
                        ),
                      ),
                      child: _buildAnimatedText(
                        isAmharic
                            ? 'ዛሬ ${weekdays[dayNumber]} ነው (የሕማማት ምሥጢር)'
                            : 'Today is ${weekDay[dayNumber]} (Sorrowful Mystery)',
                        const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  const SizedBox(height: 16),
                  _buildAnimatedText(
                    isAmharic
                        ? 'በሕማማት ምሥጢር\nእናሰላስል'
                        : 'Let\'s Meditate Through The Sorrowful Mystery',
                    titleStyle,
                  ),
                  const Spacer(flex: 3),
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
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
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28),
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
                  ),
                  const SizedBox(height: 48),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnimatedText(String text, TextStyle style) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: Text(
        text,
        key: ValueKey<String>(text),
        textAlign: TextAlign.center,
        style: style,
      ),
    );
  }
}