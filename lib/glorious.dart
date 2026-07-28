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

  // 1. Define your prayer sequence using your PrayerStep model
  final List<PrayerStep> prayerSequence = [
    PrayerStep(
      sectionHeader: 'Sign of the Cross',
      titleEn: 'Sign Of The Cross',
      titleAm: 'በስመ አብ ወወልድ ወመንፈስ ቅዱስ',
      contentEn: 'In The Name Of The Father,\nAnd Of The Son,\nAnd Of The Holy Spirit.\nAmen',
      contentAm: 'በስመ አብ ወወልድ ወመንፈስ ቅዱስ አሐዱ አምላክ አሜን።',
      imagePath: 'assets/wmremove-transformed (9).jpeg',
    ),
    PrayerStep(
      sectionHeader: 'Apostles\' Creed',
      titleEn: 'The Apostles\' Creed',
      titleAm: 'የሐዋርያት እምነት',
      contentEn: 'I believe in God, the Father almighty, Creator of heaven and earth, and in Jesus Christ, His only Son, our Lord, who was conceived by the Holy Spirit, born of the Virgin Mary, suffered under Pontius Pilate, was crucified, died and was buried; He descended into hell; on the third day He rose again from the dead; He ascended into heaven, and seated at the right hand of God, the Father almighty; from thence He shall come to judge, the living and the dead. I believe in the Holy Spirit, the holy Catholic Church, the communion of saints, the forgiveness of sins, the resurrection of the body and life everlasting.\nAmen!',
      contentAm: 'ሁሉን በሚችል ሰማይንና ምድርን በፈጠረ\nበእግዚአብሔር አብ አምናለሁ፡፡\nአንድ ልጁ በሆነዉ በጌታችን\nበኢየሱስ ክርስቶስ አምናለሁ፤\nእሱ በመንፋስ ቅዱስ ተጸንሶ\nከድንግል ማርያም ተወለደ፡፡\nበጴንጤናዊው ጲላጦስ ዘመን ተሰቃየ፣\nተሰቀለ፣ ሞተ፣ ተቀበረ፣\nወደ ሲኦል ወረደ፣\nበሶስተኛው ቀን ከሙታን ተለይቶ ተነሣ፣\nወደ ሰማይ ወጣ፣\nሁሉን በሚችል በእግዚአብሔር አብ ቀኝ ተቀመጠ፣\nያሉትንና የሞቱትን ሊፈርድ ዳግመኛ ይመጣል፣\n በመንፈስ ቅዱስም አምናለሁ፣\nየሁሉም በሆነችው በቅድስት ቤተክርስቲያን\nበቅዱሳንም አንድነት አምናለሁ፣\nበኃጢአት ስርየት፣\nበሙታን ትንሣኤ፣\nበዘላለም ሕይወት አምናለሁ፡፡\nአሜን!',
      imagePath: 'assets/wmremove-transformed (9).jpeg',
    ),
    PrayerStep(
      sectionHeader: 'Our Father',
      titleEn: 'Our Father',
      titleAm: 'አባታችን ሆይ',
      contentEn: 'Our Father, who art in heaven, hallowed be thy name; thy kingdom come; thy will be done on earth as it is in heaven. Give us this day our daily bread; and forgive us our trespasses as we forgive those who trespass against us; and lead us not into temptation, but deliver us from evil.\nAmen!',
      contentAm: 'በሰማይ የምትኖር አባታችን ሆይ፣ስምህ ይመስገን፣መንግሥትህ ትምጣ፡ፈቃድህ በሰማይ እንደሆነ:እንዲሁም በምድር ይሁን። የዕለት እንጀራችንን ዛሬ ስጠን፤እኛ የበደሉንን ይቅር እንደምንል:በደላችንን ይቅር በልልን፤ከክፉ ሁሉ ሰውርን እንጂ ወደ ፈተና አታግባን፡፡ መንግስት ኃይልና ክብር ለዘለዓለም ያንተ ነውና፡፡\nአሜን!',
      imagePath: 'assets/wmremove-transformed (9).jpeg',
    ),
    PrayerStep(
      sectionHeader: 'Hail Mary',
      titleEn: 'Hail Mary',
      titleAm: 'ጸጋ የመላሽ',
      contentEn: 'Hail Mary, full of grace, the Lord is with you; Blessed art thou among women, and blessed is the fruit of thy womb, Jesus. Holy Mary, Mother of God, pray for us sinners now and at the hour of our death.\nAmen!',
      contentAm: 'ጸጋ የመላሽ ማርይም ሆይ:ሰላም ላንቺ ይሁን፣እግዚአብሔር ካንቺ ጋር ነው፣ከሴቶች ሁሉ የተባረክሽ ነሽ፣የሆድሽም ፍሬ ኢየሱስ የተባረከ ነው፡፡ ቅድስት ማርያም የአምላክ እናት:ለኛ ለኃጢአተኞች:አሁንም በሞታችንም ጊዜ ለምኝልን፡፡\nአሜን።',
      imagePath: 'assets/wmremove-transformed (9).jpeg',
    ),
    PrayerStep(
      sectionHeader: 'Glory Be',
      titleEn: 'Glory Be',
      titleAm: 'ስብሐት ለአብ',
      contentEn: 'Glory be to the Father,\nand to the Son,\nand to the Holy Spirit;\nas it was in the beginning,\nis now, and ever shall be,\nworld without end.\nAmen!',
      contentAm: 'ለአብ:ለወልድና:ለመንፈስ ቅዱስ ምስጋና ይሁን\nአሁንም ዘወትርም ለዘለዓለምም::\n አሜን!"',
      imagePath: 'assets/wmremove-transformed (9).jpeg',
    ),
    PrayerStep(
      sectionHeader: 'Fatima Prayer',
      titleEn: 'Fatima Prayer',
      titleAm: 'የፋጢማ ጸሎት',
      contentEn:'O my Jesus,\nforgive us our sins,\nsave us from the fires of hell;\nlead all souls to Heaven,\nespecially those who have\nmost need of your mercy.\nAmen.',
      contentAm:'አቤቱ ጌታዬ ኢየሱስ ሆይ፡\nኃጢአታችንን ይቅር በለን፡\nከገሃነም እሳት አድነን፡\nነፍሳትን ሁሉ ወደ መንግሥተ ሰማያት አግባ። አሜን።',
      imagePath: 'assets/wmremove-transformed (9).jpeg',
    ),
    PrayerStep(
        titleEn: "First Glorious Mystery",
        titleAm: "አንደኛ የክብር ምስጢር",
        contentEn: "The Resurrection.\n\n"
            "\"But on the first day of the week, at early dawn,\n"
            "they went to the tomb, taking the spices which they had prepared.\n"
            "And they found the stone rolled away from the tomb,\n"
            "but when they went in they did not find the body.\n"
            "While they were perplexed about this,\n"
            "behold, two men stood by them in dazzling apparel;\n"
            "and as they were frightened and bowed their faces to the ground,\n\n"
            "the men said to them,\n"
            "'Why do you seek the living among the dead? He is not here, but has risen'\n"
            "(Lk 24:1-5)\n\n\n",

        contentAm: "ጌታችን ኢየሱስ ክርስቶስ፡\n"
            "ሞቶ ከተቀበረ በኋላ በሶስተኛው ቀን፡\n"
            " ስለእኛ ኃጢአት እያሰበ ደም መላቡን ማሰብ ነው፡፡\n"
            "ከሙታን መነሳቱን፡\n"
            "እንዲሁም ሁለተኛ የማይሞት መሆኑን ማሰብ ነው፡፡\n"
            "የምስጢሩ ፍሬ ሐሳብ፡\n"
            "ከኃጢአት ተነሥቶ እንደገና ወደ ኃጢአት አለመመለስ ነው፡፡\n\n\n"
            "አባታችን ሆይ...\n",

        imagePath: "assets/img_27.png"
    ),

    PrayerStep(
      titleEn: "Second Glorious Mystery",
      titleAm: "ሁለተኛ የክብር ምስጢር",
      contentEn: "The Ascension.\n\n"
          "\"So then the Lord Jesus,\n"
          "after he had spoken to them,\n"
          "was taken up into heaven,\n"
          " and sat down at the right hand of God.\n"
          "(Mk 16:19).\n\n\n",

      contentAm: "ጌታችን ኢየሱስ ክርስቶስ፡\n"
          "ከሙታን በተነሣ በአርባኛው ቀን፡\n"
          "በታላቅ ክብር ወደ ሰማይ መውጣቱን ማሰብ ነው፡፡\n"
          "የምስጢሩ ፍሬ ሐሳብ፡\n"
          "ሰማይን ዘወትር ማሰብና መመኘት ነው፡፡\n\n\n",

      imagePath: "assets/img_28.png",
    ),

    PrayerStep(
      titleEn: "Third Glorious Mystery",
      titleAm: "ሶስተኛ የክብር ምስጢር",
      contentEn: "The descent of the Holy Spirit.\n\n"
          "\"When the day of Pentecost had come,\n"
          "they were all together in one place.\n"
          "And suddenly a sound came from heaven,\n"
          "like the rush of a mighty wind,\n"
          "and it filled all the house where they were sitting.\n"
          "And there appeared to them\n tongues as of fire,\n"
          "distributed and resting on\n each one of them.\n\n"
          "And they were all filled\n with the Holy Spirit,\n"
          "and began to speak in other tongues,\n"
          "as the Spirit gave them utterance.\n"
          "(Acts 2:1-4).\n\n\n",

      contentAm: "ሐዋርያት ከእመቤታችን ጋር፡\n"
          "በኢየሩሳሌም ተሰብስበው ሲጸልዩ፡\n"
          "በሃምሳኛው ቀን መንፈስ ቅዱስ መውረዱን ማሰብ ነው፡፡\n"
          "የምስጢሩ ፍሬ ሐሳብ፡\n"
          "የእግዚሰብሔርን ፍቅር ለማግኘት፡\n"
          "መንፈስ ቅዱስን መለመን ነው፡፡\n\n\n",

      imagePath: "assets/img_29.png",
    ),

    PrayerStep(
      titleEn: "The Annunciation",
      titleAm: "አራተኛ የክብር ምስጢር",
      contentEn: "The descent of the Holy Spirit.\n\n"
          "\"Henceforth all generations will call me blessed;\n"
          "for he who is mighty has done great things for me.\n"
          "(Lk 1:48-49).\n\n\n",

      contentAm: "እመቤታችን ቅድስት ድንግል ማርያም፡\n"
          "በእግዚአብሔር ኃይል ወደ ሰማይ መውጣትዋን ማሰብ ነው፡፡\n"
          "የምስጢሩ ፍሬ ሐሳብ፡\n"
          "መልካም ሞት ለመሞት፡\n"
          "በየቀኑ ማርያምን መለመን ነው፡፡\n\n\n",

      imagePath: "assets/img_30.png",
    ),

    PrayerStep(
      titleEn: "Fifth Glorious Mystery",
      titleAm: "አምስተኛ የክብር ምስጢር",
      contentEn: "The crowning of Our Lady Queen of Heaven.\n\n"
          "\"And a great portent appeared in heaven,\n"
          "a woman clothed with the sun,\n"
          "with the moon under her feet,\n"
          "and on her head a crown of twelve stars.\n"
          "(Rev 12:1 ).\n\n\n",

      contentAm: "እመቤታችን ቅድስት ድንግል ማርያም፡\n"
          "ከእግዚአብሔር የክብር አክሊል ማግኘትዋንና፡\n"
          "የሰማይና የምድር ንግሥት መሆኑዋን ማሰብ ነው፡፡\n"
          "የምስጢሩ ፍሬ ሐሳብ፡\n"
          "እመቤታችን ማርያምን ዕለት ዕለት መቁጠሪያ እየደገምን ማክበር ነው፡፡\n\n\n",

      imagePath: "assets/img_31.png",
    )

  ];


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