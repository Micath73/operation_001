import 'package:operation_001/prayer_model.dart';

class PrayerData {
  /// Static helper to map prayer titles to their specific artwork background assets
  static String getImagePath(String title) {
    switch (title.trim().toLowerCase()) {
      case 'act of contrition':
      case 'የንስሐ ጸሎት':
        return 'assets/img_2.png';
      case 'the morning offering':
      case 'የጠዋት መስዋዕት':
        return 'assets/sunrise.jpeg';
      case 'prayer of st. francis':
      case 'prayer to st. francis of assisi':
      case 'የቅዱስ ፍራንቸስኮስ ጸሎት':
        return 'assets/francis.jpg';
      case 'the guardian angel prayer':
      case 'ጸሎት ወደ ቅዱስ ጠባቂ መልአክ':
        return 'assets/guardian.jpg';
      case 'prayer for the hour of mercy':
      case 'hour of mercy':
      case 'the hour of mercy':
      case 'የምሕረት ሰዓት ጸሎት':
        return 'assets/img_5.png';
      case 'prayer to st. michael the archangel':
      case 'ወደ ቅዱስ ሚካኤል ሊቀ መላእክት ጸሎት':
        return 'assets/img_13.png';
      case 'rosary':
      case 'የመቁጠሪያ ጸሎት':
        return 'assets/img_6.png';
      case 'anima christi':
      case 'አኒማ ክርስቲ (የቅዱስ ቁርባን ጸሎት)':
        return 'assets/anima christi vip.jpg';
      case 'litany of the holy name of jesus':
      case 'የቅዱስ ኢየሱስ ስም ሊጣንያ':
        return 'assets/img_16.png';
      case 'come, holy spirit':
      case 'ና መንፈስ ቅዱስ ፈጣሪ ሆይ':
        return 'assets/img_17.png';
      case 'prayer to the holy trinity':
      case 'ጸሎት ወደ ቅድስት ሥላሴ':
      case 'prayer for the holy father':
      case 'ለርዕሠ ሊቃነ ጳጳሳት ጸሎት':
        return 'assets/father.jpg';
      case 'prayer to st. joseph':
      case 'prayer to saint joseph':
      case 'ጸሎት ወደ ቅዱስ ዮሴፍ':
      case 'prayer for families':
      case 'ለቤተሰብ ጸሎት':
        return 'assets/img_12.png';
      case 'traditional evening prayer':
      case 'የማታ ፀሎት (ልዩ)':
        return 'assets/img_10.png';
      case 'st. patrick\'s breastplate':
      case 'የቅዱስ ፓትሪክ ጥበቃ':
        return 'assets/saint patrick.jpg';
      case 'visit we beseech thee':
      case 'የቤት ጥበቃ ጸሎት':
      case 'psalm 51 (miserere)':
      case 'መዝሙር 51 (ምስረሬ)':
        return 'assets/img_2.png';
      case 'basic prayers (sign of the cross, our father, hail mary, glory be)':
      case 'የዕለት ተዕለት መሠረታዊ ጸሎቶች':
      case 'apostles\' creed':
      case 'የሐዋርያት የእምነት መግለጫ':
      case 'grace before & after meals':
      case 'ከምግብ በፊትና በኋላ የሚደረግ ጸሎት':
      case 'acts of faith, hope & charity':
      case 'የእምነት፡ የተስፋና የፍቅር ሥራ ጸሎቶች':
      case 'short aspirations':
      case 'አጫጭር የልብ ምኞቶች':
      case 'prayer before work':
      case 'ሥራ ከመጀመር በፊት የሚደረግ ጸሎት':
      case 'short night prayer or evening examen':
      case 'የማታ አጭር ጸሎት':
      case 'act of spiritual communion':
      case 'የመንፈሳዊ ህብረት ሥራ ጸሎት':
      case 'o sacrament most holy':
      case 'ኦ እጅግ ቅዱስ ቁርባን':
      case 'regina caeli':
      case 'ንግስተ ሰማይ ደስ ይበልሽ':
      case 'sub tuum praesidium':
      case 'ከሰላማዊ ጥበቃህ ሥር':
      case 'eternal rest (prayer for the dead)':
      case 'ለነፍሳት ዕረፍት የሚደረግ ጸሎት':
      case 'prayer of abandonment':
      case 'የእጅ መስጠት ጸሎት':
      default:
        return 'assets/sunrise.jpeg';
    }
  }
  /// Returns the true master title for a prayer card in English or Amharic
  static String getMainTitle(String key, String langCode) {
    final normalized = key.trim().toLowerCase();
    final isAmharic = langCode == 'am';

    if (normalized.contains('basic prayers')) {
      return isAmharic ? 'መሠረታዊ ጸሎቶች' : 'Basic Prayers';
    } else if (normalized.contains('grace before')) {
      return isAmharic ? 'ከምግብ በፊትና በኋላ የሚደረግ ጸሎት' : 'Grace Before & After Meals';
    } else if (normalized.contains('acts of faith')) {
      return isAmharic ? 'የእምነት፡ የተስፋና የፍቅር ጸሎቶች' : 'Acts of Faith, Hope & Charity';
    } else if (normalized.contains('short aspirations')) {
      return isAmharic ? 'አጫጭር የልብ ምኞቶች' : 'Short Aspirations';
    } else if (normalized.contains('rosary')) {
      return isAmharic ? 'የመቁጠሪያ ጸሎት' : 'The Holy Rosary';
    }

    // Fallback: If it's a single prayer, grab the title from the first step
    final steps = getPrayer(key);
    if (steps.isNotEmpty) {
      return steps.first.getTitle(langCode);
    }
    return key;
  }

  static final Map<String, List<PrayerStep>> masterPrayerDB = {
    // -------------------------------------------------------------------------
    // 1. BASIC PRAYERS (Partitioned)
    // -------------------------------------------------------------------------
    'Basic Prayers (Sign of the Cross, Our Father, Hail Mary, Glory Be)': [
      PrayerStep(
        sectionHeader: 'SIGN OF THE CROSS',
        sectionHeaderAm: 'የመስቀል ምልክት',
        titleEn: 'Sign of the Cross',
        titleAm: 'መሰረታዊ ጸሎቶች',
        contentEn: 'In the name of the Father, and of the Son, and of the Holy Spirit. Amen.',
        contentAm: 'በስም ፡ አብ ፡ ወወልድ ፡ ወመንፈሰ ፡ ቅዱስ ፡ አሐዱ ፡ አምላክ ፡ አሜን',
        imagePath: 'assets/sunrise.jpeg',
      ),
      PrayerStep(
        sectionHeader: 'OUR FATHER',
        sectionHeaderAm: 'አባታችን ሆይ',
        titleEn: 'The Lord\'s Prayer',
        titleAm: 'አባታችን ሆይ',
        contentEn: 'Our Father, who art in heaven, hallowed be thy name; thy kingdom come, thy will be done on earth as it is in heaven. Give us this day our daily bread, and forgive us our trespasses, as we forgive those who trespass against us; and lead us not into temptation, but deliver us from evil. Amen.',
        contentAm: 'በሰማይ የምትኖር አባታችን ሆይ፣ ስምህ ይመስገን፣ መንግሥትህ ይምጣ፤ ፈቃድህ በሰማይ እንደሆነ እንዲሁም በምድር ይሁን፡፡ የዕለት እንጀራችንን ዛሬ ስጠን፤ እኛ የበደሉንን ይቅር እንደምንል በደላችንን ይቅር በልልን፤ ከክፉ ሁሉ ሰውርን እንጂ ወደ ፈተና አታግባን፡፡ መንግስት ኃይልና ክብር ለዘለዓለም ያንተ ነውና፡፡ አሜን፡፡',
        imagePath: 'assets/sunrise.jpeg',
      ),
      PrayerStep(
        sectionHeader: 'HAIL MARY',
        sectionHeaderAm: 'ጸጋን የሞላሽ ማርያም ሆይ',
        titleEn: 'Hail Mary',
        titleAm: 'ጸጋን የሞላሽ ማርያም ሆይ',
        contentEn: 'Hail Mary, full of grace, the Lord is with thee. Blessed art thou among women, and blessed is the fruit of thy womb, Jesus. Holy Mary, Mother of God, pray for us sinners, now and at the hour of our death. Amen.',
        contentAm: 'ጸጋ የመላሽ ማርይም ሆይ ሰላም ላንቺ ይሁን፣ እግዚአብሔር ካንቺ ጋር ነው፣ ከሴቶች ሁሉ የተባረክሽ ነሽ፣ የሆድሽም ፍሬ ኢየሱስ የተባረከ ነው፡፡ ቅድስት ማርያም የአምላክ እናት ለኛ ለኃጢአተኞች አሁንም በሞታችንም ጊዜ ለምኝልን፡፡',
        imagePath: 'assets/sunrise.jpeg',
      ),
      PrayerStep(
        sectionHeader: 'GLORY BE',
        sectionHeaderAm: 'ስብሐት ለአብ',
        titleEn: 'Glory Be',
        titleAm: 'ስብሐት ለአብ',
        contentEn: 'Glory be to the Father, and to the Son, and to the Holy Spirit. As it was in the beginning, is now, and ever shall be, world without end. Amen.',
        contentAm: 'ለአብ፣ ለወልድና ለመንፈስ ቅዱስ ምስጋና ይሁን አሁንም ዘወትርም ለዘለዓለምም አሜን፡፡',
        imagePath: 'assets/sunrise.jpeg',
      ),
    ],


    // -------------------------------------------------------------------------
    // 2. APOSTLES' CREED
    // -------------------------------------------------------------------------
    'Apostles\' Creed': [
      PrayerStep(
        sectionHeader: 'PROFESSION OF FAITH',
        sectionHeaderAm: 'የእምነት መግለጫ',
        titleEn: 'Apostles\' Creed',
        titleAm: 'የሐዋርያት እምነት መግለጫ',
        contentEn: 'I believe in God, the Father almighty, Creator of heaven and earth, and in Jesus Christ, his only Son, our Lord, who was conceived by the Holy Spirit, born of the Virgin Mary, suffered under Pontius Pilate, was crucified, died and was buried; he descended into hell; on the third day he rose again from the dead; he ascended into heaven, and is seated at the right hand of God the Father almighty; from there he will come to judge the living and the dead.\n\nI believe in the Holy Spirit, the holy catholic Church, the communion of saints, the forgiveness of sins, the resurrection of the body, and life everlasting. Amen.',
        contentAm: 'ሁሉን በሚችል ሰማይንና ምድርን በፈጠረ በእግዚአግሔር አብ አምናለሁ፡፡ የአብ አንድ ልጅ በሆነው በጌታችን ኢየሱስ ክርስቶስ አምናለሁ፡፡ እሱ በመንፈስ ቅዱስ ተጸነሰ፣ ከድንግል ማርያም ተወለደ፣ በጴንጤናዊው ጲላጦስ ዘመን ተሰቃየ፣ ተሰቀለ፣ ሞተ፣ ተቀበረ፣ ወደ ሲኦል ወረደ፣ በሶስተኛው ቀን ከሙታን ተለይቶ ተነሣ፣ ወደ ሰማይ ወጣ፣ ሁሉን በሚችል በእግዚአብሔር አብ ቀኝ ተቀመጠ፣ ያሉትንና የሞቱትን ሊፈርድ ዳግመኛ ይመጣል፣ በመንፈስ ቅዱስም አምናለሁ፣ የሁሉም በሆነችው በቅድስት ቤተክርስቲያን በቅዱሳንም አንድነት አምናለሁ፣ በኃጢአት ስርየት፣ በሙታን ትንሣኤ፣ በዘላለም ሕይወት አምናለሁ፡፡ አሜን፡፡',
        imagePath: 'assets/ethiopian_manuscript.jpeg',
      ),
    ],

// -------------------------------------------------------------------------
// 3. GRACE BEFORE & AFTER MEALS (Partitioned)
// -------------------------------------------------------------------------
    'Grace Before & After Meals': [
      PrayerStep(
        sectionHeader: 'GRACE BEFORE MEALS',
        sectionHeaderAm: 'ከምግብ በፊት የሚደረግ ጸሎት',
        titleEn: 'Grace Before Meals',
        titleAm: 'ከምግብ በፊት ና በኋላ የሚደረግ ጸሎት ',
        contentEn: 'Bless us, O Lord, and these Thy gifts, which we are about to receive from Thy bounty, through Christ our Lord. Amen.',
        contentAm: 'ጌታ ሆይ እኛን ልጆችህን ባርክ፤ ይህንንም የቀረበልን ምግብ ከእኛ ጭምር ባርክ፤ ለተራቡትም ምግብ ስጣቸው፡፡ አሜን፡፡',
        imagePath: 'assets/ethiopian_blessing.jpeg',
      ),
      PrayerStep(
        sectionHeader: 'GRACE AFTER MEALS',
        sectionHeaderAm: 'ምግብ ከበሉ በኋላ',
        titleEn: 'Grace After Meals',
        titleAm: 'ምግብ ከበሉ በኋላ',
        contentEn: 'We give Thee thanks, Almighty God, for all Thy benefits, who livest and reignest world without end. Amen. May the souls of the faithful departed, through the mercy of God, rest in peace. Amen.',
        contentAm: 'ጌታ ሆይ ስላደረግልህን መልካም ነገር ሁሉ እናመሰግንሃለን፡፡ ነፍሳችንን በሠላም ጠብቃት፣ ልባችን ለዘላለም እንዲያመሰግንህ አድርግ፡፡ አሜን፡፡',
        imagePath: 'assets/ethiopian_blessing.jpeg',
      ),
    ],

// -------------------------------------------------------------------------
// 4. ACTS OF FAITH, HOPE & CHARITY (Partitioned)
// -------------------------------------------------------------------------
    'Acts of Faith, Hope & Charity': [
      PrayerStep(
        sectionHeader: 'ACT OF FAITH',
        sectionHeaderAm: 'የእምነት፡ የተስፋና የፍቅር ጸሎቶች',
        titleEn: 'Act of Faith',
        titleAm: 'የእምነት ሥራ',
        contentEn: 'O my God, I firmly believe that You are one God in three divine Persons, Father, Son, and Holy Spirit. I believe that Your divine Son became man and died for our sins, and that He will come to judge the living and the dead. I believe these and all the truths which the holy Catholic Church teaches, because You have revealed them, Who can neither deceive nor be deceived. Amen.',
        contentAm: 'አምላኬ ሆይ አንተ የገለጥኸውን ቅድስት ቤተክርስቲያን የምታምነውንና የምታስተምረውን ሁሉ አምናለሁ፡፡',
        imagePath: 'assets/ethiopian_icon_faith.jpeg',
      ),
      PrayerStep(
        sectionHeader: 'ACT OF FAITH - OPTION 2',
        sectionHeaderAm: 'የእምነት ሥራ 2',
        titleEn: 'Act of Faith - Option 2',
        titleAm: 'የእምነት ሥራ 2',
        contentEn: 'O Lord my God, I firmly believe in Your triune Godhead: Father, Son, and Holy Spirit. I believe that Your divine Son became man, died for our sins, rose from the dead, and will return to judge the living and the dead. I believe this and all that the Catholic Church teaches, for You have revealed it, Who can neither deceive nor be deceived by mankind. Amen.',
        contentAm: 'ጌታ አምላኬ ሆይ፣ የአንተ ሦስት አምላክነት ስሞች በአብ፣ በወልድና በመንፈስ ቅዱስ አጠንክሬ አምናለሁ፡፡ የአንተ የእግዚአብሔር ልጅ ሰው ሆኖ ለኃጢአታችን ሞቶ ከሞት እንደተነሳ እንዲሁም ተመልሶ ያሉትንና የሞቱትን ሊፈርድ ይመጣል፡፡ ይህንንና ካቶሊክ ቤተክርስቲያን የሚታስተምረውን ሁሉ አምናለሁ፡፡ ለምን ቢባል አንተ የሰው ልጆችን ማታለል የማትችልና በእነርሱ የማትታለል መሆኑን ግልጽ አድርገሃል፡፡',
        imagePath: 'assets/ethiopian_icon_faith.jpeg',
      ),
      PrayerStep(
        sectionHeader: 'ACT OF HOPE',
        sectionHeaderAm: 'የተስፋ ሥራ',
        titleEn: 'Act of Hope',
        titleAm: 'የተስፋ ሥራ',
        contentEn: 'O my God, relying on Your infinite goodness and promises, I hope to obtain pardon of my sins, the help of Your grace, and life everlasting, through the merits of Jesus Christ, my Lord and Redeemer. Amen.',
        contentAm: 'አምላኬ ሆይ ተስፋ የሰጠኸው ቃልህ እውነተኛ ነውና ስለ ኢየሱስ ክርስቶስ ትሩፋት የዘላለም ሕይወት እንደምትሰጠኝና ወደዚያውም ለመድረስ ጸጋህን እንደምታድለኝ ተሰፋ አደርጋለሁ፡፡',
        imagePath: 'assets/ethiopian_icon_faith.jpeg',
      ),
      PrayerStep(
        sectionHeader: 'ACT OF HOPE - OPTION 2',
        sectionHeaderAm: 'የተስፋ ሥራ 2',
        titleEn: 'Act of Hope - Option 2',
        titleAm: 'የተስፋ ሥራ 2',
        contentEn: 'O my God, I rely upon Your infinite mercy and Your holy promises, hoping to obtain the forgiveness of my sins. Through the merits of the good works found in my Lord and Savior Jesus Christ, I place my hope in Your grace and in life everlasting. Amen.',
        contentAm: 'አምላኬ ሆይ በማይወሰን ርኀራኄህና ቃል በመግባትህ እመካለሁ፤ የኃጢአቶቼንም ይቅርታ እንዳማገኝ ተስፋ አደርጋለሁ፡፡ በጌታዬና በመድኃኔቴ በኢየሱስ ክርስቶስ በኩል በሚገኘው በመልካም ሥራዎች በኩል፣ ከአንተ በሚገኘው ጸጋና በዘላለም ሕይወት ተስፋ አደረጋሃለሁ፡፡',
        imagePath: 'assets/ethiopian_icon_faith.jpeg',
      ),
      PrayerStep(
        sectionHeader: 'ACT OF CHARITY',
        sectionHeaderAm: 'የፍቅር ሥራ',
        titleEn: 'Act of Charity',
        titleAm: 'የፍቅር ሥራ',
        contentEn: 'O my God, I love You above all things, with my whole heart and soul, because You are all-good and worthy of all love. Loving You, I also love my neighbor as myself for the love of You. Amen.',
        contentAm: 'አምላኬ ሆይ አለመጠን ደግ፣ አለመጠንም ተወዳጅ ነህና እወድሃለሁ፣ ስላንተ ፍቅር ሰውንም ሁሉ እወዳለሁ፡፡',
        imagePath: 'assets/ethiopian_icon_faith.jpeg',
      ),
      PrayerStep(
        sectionHeader: 'ACT OF CHARITY - OPTION 2',
        sectionHeaderAm: 'የበጎ አድራጎት ሥራ',
        titleEn: 'Act of Charity - Option 2',
        titleAm: 'የበጎ አድራጎት ሥራ',
        contentEn: 'O my God, I love You with my whole heart and soul above all things, for You are the fountain of all love and all goodness. For the love of You, I love my neighbors as myself. I forgive all who have offended me, and I ask pardon of those whom I have offended. Lord Jesus, grant me the grace of love that I may love You more and more. Amen.',
        contentAm: 'አምላኬ ሆይ ከልቤ እና ነፍሴ ከሁሉ ነገሮች አብልጨ አንተን እወዳለሁ፤ ምክንያቱም አንተ የፍቅር ሁሉ ምንጭ እና የሁሉ መልካም ነህ፡፡ ስለአንተ ፍቅር ባለንጀሮቼን እንደራሴ አድርጌ እወዳቸዋለሁ፡፡ የበደሉኝን ሁሉ ይቅር እላቸዋለሁ፤ የበደልኳቸውንም ይቅርታ እጠይቃቸዋለሁ፡፡ ጌታ ኢየሱስ ሆይ አንተን የበለጠ እንዳፈቅር ፍቅር ስጠኝ፡፡',
        imagePath: 'assets/ethiopian_icon_faith.jpeg',
      ),
    ],


    // -------------------------------------------------------------------------
    // 5. SHORT ASPIRATIONS
    // -------------------------------------------------------------------------
    'Short Aspirations': [
      PrayerStep(
        sectionHeader: 'EJACULATIONS & SHORT PRAYERS',
        sectionHeaderAm: 'አጫጭር የልብ ምኞቶች',
        titleEn: 'Short Aspirations',
        titleAm: 'አጫጭር የልብ ምኞቶች',
        contentEn: 'Lord, have mercy upon me.\nJesus, meek and humble of heart, make my heart like unto Thine.\nSacred Heart of Jesus, I place all my trust in Thee.\nSweet Heart of Mary, be my salvation.\nMy Lord and my God!',
        contentAm: 'ጌታ ሆይ፣ ማረኝ።\nልብህ የዋህና ትሑት የሆነው ኢየሱስ ሆይ፣ ልቤን እንደ ልብህ አድርገው።\nየኢየሱስ ቅዱስ ልብ ሆይ፣ ሙሉ ተስፋዬን በአንተ ላይ አደርጋለሁ።\nየማርያም ጣፋጭ ልብ ሆይ፣ መዳኛኝ ሁኚ።\nጌታዬና አምላኬ ሆይ!',
        imagePath: 'assets/ethiopian_illumination.jpeg',
      ),
    ],

    // -------------------------------------------------------------------------
    // 6. COME, HOLY SPIRIT
    // -------------------------------------------------------------------------
    'Come, Holy Spirit': [
      PrayerStep(
        sectionHeader: 'VERSES 1 - 2',
        sectionHeaderAm: 'አንቀፅ 1 - 2',
        titleEn: 'Come, Holy Spirit',
        titleAm: 'ና መንፈስ ቅዱስ ፈጣሪ ሆይ',
        contentEn:
        'Come, Holy Ghost, Creator blest,\nVouchsafe within our souls to rest;\nCome with Thy grace and heavenly aid,\nTo fill the hearts which Thou hast made.\n\nTo Thee, the Comforter, we cry,\nTo Thee, the Gift of God most High,\nThe Fount of life, the Fire of love,\nThe soul\'s Anointing from above.',
        contentAm:
        'ና መንፈስ ቅዱስ፣ የተባረክህ ፈጣሪ ሆይ፣\nበነፍሳችንም ውስጥ መኖሪያህን አድርግ፤\nበጸጋህና በሰማያዊ ረድኤትህ ና፣\nአንተ የፈጠርካቸውን ልቦች ሙላ።\n\nአጽናኝ ወደ ሆንኸው ወደ አንተ እንጮኻለን፣\nከሰማይ የወረድክ የልዑል እግዚአብሔር ስጦታ ሆይ፤\nየሕይወት ምንጭ እና የፍቅር እሳት ሆይ\nከእግዚአብሔር የመጣህ የነፍስ ቅባት አንተ ነህ።',
        imagePath: 'assets/img_17.png',
      ),
      PrayerStep(
        sectionHeader: 'VERSES 3 - 4',
        sectionHeaderAm: 'አንቀፅ 3 - 4',
        titleEn: 'Come, Holy Spirit',
        titleAm: 'ና መንፈስ ቅዱስ ፈጣሪ ሆይ',
        contentEn:
        'The sevenfold gifts of grace are Thine,\nO Finger of the Hand Divine;\nTrue Promise of the Father Thou,\nWho dost the tongue with speech endow.\n\nThy light to every sense impart,\nAnd pour Thy love in every heart;\nThyself in our infirmity\nThe never-failing strength supply.',
        contentAm:
        'ሰባቱ የጸጋ ስጦታዎች የአንተ ናቸው፣\nየመለኮታዊው እጅ ጣት ሆይ፤\nአንተ የአብ ተስፋ ነህ፣\nአንደበትን በኃይል የምታናግር።\n\nስሜታችንን በብርሃንህ አብራው፣\nበልባችን ፍቅር ሞልቶ እንዲፈስ አድርገው፤\nበጽኑ ትዕግስትህ እና የጸጋ ስጦታህ\nድክመታችንን በኃይልህ አበርታው።',
        imagePath: 'assets/img_17.png',
      ),
    ],

    // -------------------------------------------------------------------------
    // 7. THE MORNING OFFERING
    // -------------------------------------------------------------------------
      'The Morning Offering': [
        PrayerStep(
          sectionHeader: 'MORNING OFFERING - OPTION 1',
          sectionHeaderAm: 'የጠዋት ጸሎት 1',
          titleEn: 'Morning Prayer - Option 1',
          titleAm: 'የጠዋት ጸሎት',
          contentEn: 'Sign of the Cross...\nIn the name of the Father, and of the Son, and of the Holy Spirit, one God. Amen.\n\n(My God, I adore You):\nMy God, I adore You and I love You with my whole heart. I thank You for having created me, for making me a Christian, and for having preserved me during this night (this day). I offer You all my actions of this day; grant that they all may be according to Your holy will and for Your greater glory. I pray that You keep me from sin and deliver me from all evil this day (this night). Our Father...',
          contentAm: 'የመስቀል ምልክት...\nበሰመ አብ፣ በወልድና በመንፈስ ቅዱስ አንድ አምላክ፡፡ አሜን፡፡\n\n(አምላኬ ሆይ እሰግድልሃለሁ):-\nአምላኬ ሆይ እሰግድልሃለሁ፤ በልቤ በፍጹም እወድሃለሁ፣ ስለ ፈጠርኸኝና ክርሲቲያን ስላደረግኸኝ፣ በዚህች ሌሊት(በዚች ቀን) ስለጠበቅኸኝ አመሰግንሃለሁ፡፡ ሥራዬን ሁሉ ላንተ አቀርባለሁ፤ በዚህች ቀን(በዚህች ሌሊት) ከኃጢአት እንድትጠብቀኝ ከክፉ ነገርም ሁሉ እንድታድነኝ እለምንሃለሁ፡፡\n\nአባታችን ሆይ …',
          imagePath: 'assets/sunrise.jpeg',
        ),
        PrayerStep(
          sectionHeader: 'MORNING OFFERING - OPTION 2',
          sectionHeaderAm: 'የጠዋት መስዋዕት 2',
          titleEn: 'The Morning Offering - Option 2',
          titleAm: 'የጠዋት መስዋዕት',
          contentEn: 'O Jesus, through the Immaculate Heart of Mary, I offer You my prayers, works, joys and sufferings of this day for all the intentions of Your Sacred Heart, in union with the Holy Sacrifice of the Mass throughout the world, in reparation for my sins, for the intentions of all my relatives and friends, and in particular for the intentions of the Holy Father. Amen.',
          contentAm: 'እግዚአብሔር፣ የኢየሱስ ልብ፣ ያለ አዳም ኃጢአት የተጸነስች እንዲሁም የቤተክርስቲያን እናት በሆነችዉ በማርያም በኩል፣ በቅዱስ ቁርባን መስዋዕት በኩል፣ ልመናዎቼን ሥራዎቼን ተስፋዎቼንና የዛሬ ቀን መከራዎቼን ለወንዶችና ለሴቶች፣ ለሰው ልጆች ሁሉ ደህንነትና ለኃጢአቶች ካሣ እንዲሆን አቀርባለሁ።',
          imagePath: 'assets/sunrise.jpeg',
        ),
      ],

    // -------------------------------------------------------------------------
    // 8. PRAYER BEFORE WORK
    // -------------------------------------------------------------------------
    'Prayer Before Work': [
      PrayerStep(
        sectionHeader: 'DEDICATION OF LABOR',
        sectionHeaderAm: 'ሥራን ለአምላክ መስጠት',
        titleEn: 'Prayer Before Work',
        titleAm: 'ሥራ ከመጀመር በፊት የሚደረግ ጸሎት',
        contentEn: 'Lord Jesus, I offer You all my actions of this day. Direct my thoughts, sanctify my labor, and help me to perform all my duties with love and diligence, so that whatever I do may be pleasing in Your sight and bring glory to Your holy name. Amen.',
        contentAm: 'አምላካችን ሆይ ይህ ሥራችንን በመሉ በአንተ ጀምረን ባንተ ወደ ፍጻሜ እንድናደርስ አንተን እለምንሃለሁ፡፡ ጸሎታችንም ሆነ ሥራችን ሁሉ ባንተ ተጀምሮ ባንተ እንዲያልቅ አድርግልን፡፡ ባንድ ልጅህ በጌታችን ኢየሱስ ክርስቶስ ስም እንለምንሃለን፡፡ አሜን፡፡',
        imagePath: 'assets/ethiopian_work.jpeg',
      ),
    ],

    // -------------------------------------------------------------------------
    // 9. THE BENEDICTUS
    // -------------------------------------------------------------------------
    'The Benedictus': [
      PrayerStep(
        sectionHeader: 'CANTICLE OF ZECHARIAH',
        sectionHeaderAm: 'የዘካርያስ ምስጋና',
        titleEn: 'The Benedictus',
        titleAm: 'የዘካርያስ ምስጋና (ቤኔዲክቱስ)',
        contentEn:
        'Blessed be the Lord God of Israel; for he hath visited and redeemed his people,\n'
            'And hath raised up an horn of salvation for us in the house of his servant David;\n'
            'As he spake by the mouth of his holy prophets, which have been since the world began:\n'
            'That we should be saved from our enemies, and from the hand of all that hate us;\n'
            'To perform the mercy promised to our fathers, and to remember his holy covenant;\n'
            'The oath which he sware to our father Abraham,\n'
            'That he would grant unto us, that we being delivered out of the hand of our enemies\n'
            'Might serve him without fear,\n'
            'In holiness and righteousness before him, all the days of our life.\n\n'
            'And thou, child, shalt be called the prophet of the Highest:\n'
            'For thou shalt go before the face of the Lord to prepare his ways;\n'
            'To give knowledge of salvation unto his people by the remission of their sins,\n'
            'Through the tender mercy of our God;\n'
            'Whereby the dayspring from on high hath visited us,\n'
            'To give light to them that sit in darkness and in the shadow of death,\n'
            'To guide our feet into the way of peace.',
        contentAm:
        'የእስራኤል ጌታ አምላክ ይባረክ፥ ጐብኝቶ ለሕዝቡ ቤዛ አድርጎአልና፤\n'
            'ከጥንት ጀምሮ በነበሩት በቅዱሳን ነቢያት አፍ እንደ ተናገረ፥\n'
            'በብላቴናው በዳዊት ቤት የመዳን ቀንድን አስነስቶልናል፤\n'
            'ማዳኑም ከወደረኞቻችንና ከሚጠሉን ሁሉ እጅ ነው፤\n'
            'እንደዚህ ለአባቶቻችን ምሕረት አደረገ፤\n'
            'ለአባታችን ለአብርሃምም የማለውን መሐላውን ቅዱሱን ኪዳን አሰበ፤\n'
            'በእርሱም ከጠላቶቻችን እጅ ድነን\n'
            'በዘመናችን ሁሉ ያለ ፍርሃት\n'
            'በቅድስናና በጽድቅ በፊቱ እንድናገለግለው ሰጠን።\n\n'
            'ደግሞም አንተ ሕፃን ሆይ፥ የልዑል ነቢይ ትባላለህ፥\n'
            'መንገዱን ልትጠርግ በጌታ ፊት ትሄዳለህና፤\n'
            'እንደዚህም የኃጢአታቸው ስርየት የሆነውን የመዳን እውቀት ለሕዝቡ ትሰጣለህ፤\n'
            'ይህም ከላይ የመጣ ብርሃን በጐበኘበት\n'
            'በአምላካችን ምሕረትና ርኅራኄ ምክንያት ነው፤\n'
            'ብርሃኑም በጨለማና በሞት ጥላ ተቀምጠው ላሉት ያበራል፤\n'
            'እግሮቻችንንም በሰላም መንገድ ያቀናል።',
        imagePath: 'assets/sunrise.jpeg',
      ),
    ],


    // -------------------------------------------------------------------------
    // 10. TRADITIONAL EVENING PRAYER
    // -------------------------------------------------------------------------
    'Traditional Evening Prayer': [
      PrayerStep(
        sectionHeader: 'EVENING PRAYER - OPTION 1',
        sectionHeaderAm: 'የማታ ጸሎት 1',
        titleEn: 'Evening Prayer - Option 1',
        titleAm: 'የማታ ጸሎት',
        contentEn: 'Sign of the Cross...\nIn the name of the Father, and of the Son, and of the Holy Spirit, one God. Amen.\n\n(My God, I adore You):\nMy God, I adore You and I love You with my whole heart. I thank You for having created me, for making me a Christian, and for having preserved me during this day (this night). I offer You all my actions of this day; grant that they all may be according to Your holy will and for Your greater glory. I pray that You keep me from sin and deliver me from all evil this night (this day). Our Father...',
        contentAm: 'የመስቀል ምልክት...\nበሰመ አብ፣ በወልድና በመንፈስ ቅዱስ አንድ አምላክ፡፡ አሜን፡፡\n\n(አምላኬ ሆይ እሰግድልሃለሁ):-\nአምላኬ ሆይ እሰግድልሃለሁ፤ በልቤ በፍጹም እወድሃለሁ፣ ስለ ፈጠርኸኝና ክርሲቲያን ስላደረግኸኝ፣ በዚህች ሌሊት(በዚች ቀን) ስለጠበቅኸኝ አመሰግንሃለሁ፡፡ ሥራዬን ሁሉ ላንተ አቀርባለሁ፤ በዚህች ቀን(በዚህች ሌሊት) ከኃጢአት እንድትጠብቀኝ ከክፉ ነገርም ሁሉ እንድታድነኝ እለምንሃለሁ፡፡\n\nአባታችን ሆይ …',
        imagePath: 'assets/img_10.png',
      ),
      PrayerStep(
        sectionHeader: 'EVENING THANKSGIVING - OPTION 2',
        sectionHeaderAm: 'የማታ ጸሎት 2',
        titleEn: 'Traditional Evening Prayer - Option 2',
        titleAm: 'የማታ ፀሎት (ልዩ)',
        contentEn: 'O my God, at the end of this day I thank Thee most heartily for all the graces I have received from Thee. I am sorry for all my sins, and I beg Thy pardon for them. Look down upon me with Thy mercy, and protect me through this night. May Thy holy angels watch over me, and may the Blessed Virgin Mary, Saint Joseph, and my patron saints pray for me. Deliver me from all evil, and grant me a peaceful rest. Amen.',
        contentAm: 'አምላኬ ሆይ፡- እኔ ሁል ጊዜ ከአንተ ለተቀበልኳቸው ጥቅሞች ሁሉ፤ ከሁሉ በላይ ለዚሁ ቀን አንተን አመሰግናለሁ፡፡ እኔ የሠራኋቸውን ኃጢአቶቼን እንድገናዘብ ብርሃን ስጠኝ በእነርሱም ከእውነት ለመጸጸት ጸጋህን ስጠኝ። አምላኬ ሆይ፣ በምህረትህ ተመልከተኝ፣ በዚህችም境 ሌሊት ጠብቀኝ። አሜን።',
        imagePath: 'assets/img_10.png',
      ),
    ],


    // -------------------------------------------------------------------------
    // 11. VISIT WE BESEECH THEE
    // -------------------------------------------------------------------------
    'Visit We Beseech Thee': [
      PrayerStep(
        sectionHeader: 'BLESSING OF THE FAMILY AND THE HOUSE',
        sectionHeaderAm: 'ጸሎት ስለ ቤተሰብ ቡራኬ',
        titleEn: 'Prayer for the Household',
        titleAm: 'ስለ ቤተሰብ ና ስለ ቤት ቡራኬ',
        contentEn: 'Hear us, Lord, holy Father, almighty and eternal God, and vouchsafe to send Your holy angel from heaven, to guard, cherish, protect, visit and defend all those who dwell in this house. Through Christ our Lord. Amen.',
        contentAm: 'ሁሉን የምትችል ዘለዓለማዊ አምላክ ቅዱስ አባት ጌታችን ሆይ ጸሎታችንን ስማ እዚህ ቤት የሚገኙትን ሰዎች እንዲጠብቅ እንዲያበረታ እንዲደግፍ እንዲጎበኝ እንዲከላከልላቸው ከሰማይ መልአክህን ላክላቸው።',
        imagePath: 'assets/img_2.png',
      ),
      PrayerStep(
        sectionHeader: 'PROTECTION OF THE HOME',
        sectionHeaderAm: 'ጸሎት ስለ ቤት ቡራኬ',
        titleEn: 'Visit, We Beseech Thee',
        titleAm: 'የቤት ጥበቃ ጸሎት',
        contentEn: 'Visit, we beseech thee, O Lord, this dwelling, and drive far from it all the snares of the enemy; let thy holy angels dwell herein to preserve us in peace; and let thy blessing be always upon us. Through Christ our Lord. Amen.',
        contentAm: 'አምላክ ሆይ ይህን ቤት እንድትጐበኝ የጠላትንም ወጥመድ ሁሉ ወዲያ እንድታርቅ እንለምንሃለን በሰላም እንዲጠብቁን ቅዱሳን መላእክትህ ይኑሩበት ቡራኬህም ሁል ጊዜ ከኛ ጋር ይሁን እያልን በጌታችን በኢየሱስ ክርስቶስ ስም እንለምንሃለን አሜን።',
        imagePath: 'assets/img_2.png',
      ),
    ],


    // -------------------------------------------------------------------------
    // 12. SHORT NIGHT PRAYER OR EVENING EXAMEN
    // -------------------------------------------------------------------------
    'Short Night Prayer or Evening Examen': [
      PrayerStep(
        sectionHeader: 'EXAMEN OF CONSCIENCE',
        sectionHeaderAm: 'የሕሊና ምርመራ እና የምታ ጸሎት',
        titleEn: 'Short Night Prayer',
        titleAm: 'የማታ አጭር ጸሎት',
        contentEn: 'Into Your hands, Lord, I commend my spirit. Forgive me my failings today, protect me through the quiet hours of the night, and grant me peaceful rest in Your sacred embrace. Amen.',
        contentAm: 'ጌታ ሆይ፣ ነፍሴን በእጆችህ አደራ እሰጣለሁ። የዛሬውን ኃጢአቴን ይቅር በል፣ በዚህች ሌሊትም ጠብቀኝ፣ በቅዱስ እቅፍህም ሰላማዊ ዕረፍትን ስጠኝ። አሜን።',
        imagePath: 'assets/ethiopian_night.jpeg',
      ),
    ],

    // -------------------------------------------------------------------------
    // 13. TE DEUM
    // -------------------------------------------------------------------------
    'Te Deum': [
      PrayerStep(
        sectionHeader: 'READING FOCUS',
        sectionHeaderAm: 'የንባብ ትኩረት',
        titleEn: 'Te Deum',
        titleAm: 'Te Deum (ምስጋና ለሥላሴ)',
        contentEn:
        'We praise Thee, O God; we acknowledge Thee to be the Lord.\n'
            'All the earth doth worship Thee, the Father everlasting.\n'
            'To Thee all Angels cry aloud, the Heavens and all the Powers therein.\n'
            'To Thee Cherubim and Seraphim continually do cry:\n'
            'Holy, Holy, Holy, Lord God of Sabaoth;\n'
            'Heaven and earth are full of the Majesty of Thy glory.\n'
            'The glorious company of the Apostles praise Thee.\n'
            'The goodly fellowship of the Prophets praise Thee.\n'
            'The noble army of Martyrs praise Thee.\n'
            'The holy Church throughout all the world doth acknowledge Thee;\n'
            'The Father of an infinite Majesty;\n'
            'Thine honorable, true, and only Son;\n'
            'Also the Holy Ghost, the Comforter.\n'
            'Thou art the King of Glory, O Christ.\n'
            'Thou art the everlasting Son of the Father.\n'
            'When Thou tookest upon Thee to deliver man, Thou didst not abhor the Virgin\'s womb.\n'
            'When Thou hadst overcome the sharpness of death, Thou didst open the Kingdom of Heaven to all believers.\n'
            'Thou sittest at the right hand of God, in the glory of the Father.\n'
            'We believe that Thou shalt come to be our Judge.\n'
            'We therefore pray Thee, help Thy servants, whom Thou hast redeemed with Thy precious blood.\n'
            'Make them to be numbered with Thy Saints in glory everlasting.\n'
            'O Lord, save Thy people, and bless Thine heritage.\n'
            'Govern them, and lift them up forever.\n'
            'Day by day we magnify Thee;\n'
            'And we worship Thy Name, ever world without end.\n'
            'Vouchsafe, O Lord, to keep us this day without sin.\n'
            'O Lord, have mercy upon us, have mercy upon us.\n'
            'O Lord, let Thy mercy lighten upon us, as our trust is in Thee.\n'
            'O Lord, in Thee have I trusted; let me never be confounded.\n'
            'Amen.',
        contentAm:
        'አምላክ ሆይ፥ እናመሰግንሃለን፤ ጌታ እንደሆንህም እንመሰክራለን።\n'
            'ዘላለማዊ አባት ሆይ፥ ምድር ሁሉ ትሰግድልሃለች።\n'
            'መላእክት ሁሉ፥ ሰማያትም በውስጣቸው ያሉ ኃይላትም ሁሉ በታላቅ ድምፅ ወደ አንተ ይጮኻሉ።\n'
            'ኪሩቤልና ሱራፌል ሳያቋርጡ ወደ አንተ ይጮኻሉ፦\n'
            'ቅዱስ፥ ቅዱስ፥ ቅዱስ፥ የሠራዊት ጌታ እግዚአብሔር፤\n'
            'ሰማይና ምድር በክብርህ ግርማ ተሞልተዋል።\n'
            'የሐዋርያት የከበረ ማኅበር ያመሰግንሃል።\n'
            'የነቢያት መልካም ኅብረት ያመሰግንሃል።\n'
            'የሰማዕታት የተከበረ ሠራዊት ያመሰግንሃል።\n'
            'በዓለም ሁሉ ያለች ቅድስት ቤተ ክርስቲያን አንተን ትመሰክራለች፤\n'
            'ወሰን የሌለው ግርማ ባለቤት የሆነውን አብን፤\n'
            'የተከበረውን፥ እውነተኛውንና አንድያውን ልጅህን፤\n'
            'እንዲሁም አጽናኙን መንፈስ ቅዱስን።\n'
            'ክርስቶስ ሆይ፥ አንተ የክብር ንጉሥ ነህ።\n'
            'አንተ የአብ ዘላለማዊ ልጅ ነህ።\n'
            'ሰውን ለማዳን ሰውነትን በተቀበልህ ጊዜ፥ የድንግልን ማኅፀን አልተጸየፍህም።\n'
            'የሞትን መውጊያ ድል ካደረግህ በኋላ፥ መንግሥተ ሰማያትን ለምእመናን ሁሉ ከፈትህ።\n'
            'በእግዚአብሔር ቀኝ በአብ ክብር ተቀምጠሃል።\n'
            'ፈራጃችን ሆነህ እንደምትመጣ እናምናለን።\n'
            'ስለዚህ እንለምንሃለን፤ በክቡር ደምህ የዋጀሃቸውን አገልጋዮችህን እርዳቸው።\n'
            'በዘላለማዊ ክብር ከቅዱሳንህ ጋር እንዲቆጠሩ አድርጋቸው።\n'
            'ጌታ ሆይ፥ ሕዝብህን አድን፤ ርስትህንም ባርክ።\n'
            'ምራቸው፤ ለዘላለምም ከፍ ከፍ አድርጋቸው።\n'
            'በየቀኑ እናከብርሃለን፤\n'
            'ለስምህም ከዘላለም እስከ ዘላለም እንሰግዳለን።\n'
            'ጌታ ሆይ፥ ይህችን ቀን ከሃጥያት እንድትጠብቀን እንለምንሃለን\n'
            'ጌታ ሆይ፥ ማረን፤ ማረን።\n'
            'ጌታ ሆይ፥ በአንተ እንደምንታመን ምሕረትህ በላያችን ይውረድ።\n'
            'ጌታ ሆይ፥ በአንተ ታምኛለሁ፤ ለዘላለም አልፈር።\n'
            'አሜን።',
        imagePath: 'assets/sunrise.jpeg',
      ),
    ],

    // -------------------------------------------------------------------------
    // 14. PRAYER TO ST. MICHAEL THE ARCHANGEL
    // -------------------------------------------------------------------------
    'Prayer to St. Michael the Archangel': [
      PrayerStep(
        sectionHeader: 'PROTECTION IN BATTLE',
        sectionHeaderAm: 'የመንፈሳዊ ውጊያ ጥበቃ',
        titleEn: 'Prayer to St. Michael the Archangel',
        titleAm: 'ወደ ቅዱስ ሚካኤል ሊቀ መላእክት ጸሎት',
        contentEn:
        'Saint Michael the Archangel, defend us in battle. Be our protection against the wickedness and snares of the devil. May God rebuke him, we humbly pray; and do thou, O Prince of the heavenly host, by the power of God, cast into hell Satan and all the evil spirits, who prowl about the world seeking the ruin of souls. Amen.',
        contentAm:
        'እጅግ የተከበርክ ቅዱስ ሚካኤል ሆይ፣ ለምንልን፣ የሰማይ ሰራዊት ሁሉ አለቃ፣ የሰይጣን አሸናፊ፣ የቤተክርስቲያን ጠባቂና ባልደረባ፣ የቤተሰብ ረዳትየሆንክ ቅዱስ ሚካኤል ሆይ፣ ከሚታዩትና ከማይታዩት የነፍስ ጠላቶችና፣ ከርኩሳን መናፍስት ጠብቀን። አሜን።',
        imagePath: 'assets/img_13.png',
      ),
    ],

    // -------------------------------------------------------------------------
    // 15. THE GUARDIAN ANGEL PRAYER
    // -------------------------------------------------------------------------
    'The Guardian Angel Prayer': [
      PrayerStep(
        sectionHeader: 'PROTECTION',
        sectionHeaderAm: 'ጥበቃ',
        titleEn: 'The Guardian Angel Prayer',
        titleAm: 'ጸሎት ወደ ቅዱስ ጠባቂ መልአክ',
        contentEn:
        'Angel of God, my guardian dear, To whom God\'s love commits me here, Ever this day, be at my side, To light, to guard, to rule, and guide. Amen.',
        contentAm:
        'ጠባቂዬ የሆንህ የእግዚአብሔር መልአክ ሆይ፣ አንተ እንድትጠብቀኝ በአምላክ ቸርነት ላንተ ተሰጥቼአለሁና አዕምሮዬን አብራልኝ፣ ጠብቀኝ፣ ምራኝ፣ እርዳኝ። አሜን።',
        imagePath: 'assets/guardian.jpg',
      ),
    ],

    // -------------------------------------------------------------------------
    // 16. LITANY OF THE HOLY NAME OF JESUS
    // -------------------------------------------------------------------------
    // -------------------------------------------------------------------------
// LITANY OF THE HOLY NAME OF JESUS
// -------------------------------------------------------------------------
    'Litany of the Holy Name of Jesus': [
      PrayerStep(
        sectionHeader: 'OPENING INVOCATIONS',
        sectionHeaderAm: 'የመግቢያ ምልጃ',
        titleEn: 'Litany of the Holy Name of Jesus',
        titleAm: 'የቅዱስ ኢየሱስ ስም ሊጣንያ',
        contentEn:
        'Lord, have mercy on us.\n'
            'Christ, have mercy on us.\n'
            'Lord, have mercy on us.\n'
            'Jesus, hear us.\n'
            'Jesus, graciously hear us.\n\n'
            'God, the Father of Heaven, have mercy on us.\n'
            'God the Son, Redeemer of the world, have mercy on us.\n'
            'God, the Holy Spirit, have mercy on us.\n'
            'Holy Trinity, one God, have mercy on us.\n\n'
            'Jesus, Son of the living God, have mercy on us.\n'
            'Jesus, Splendor of the Father, have mercy on us.\n'
            'Jesus, Brightness of eternal Light, have mercy on us.\n'
            'Jesus, King of Glory, have mercy on us.\n'
            'Jesus, Sun of Justice, have mercy on us.\n'
            'Jesus, Son of the Virgin Mary, have mercy on us.\n'
            'Jesus, most admirable, have mercy on us.\n'
            'Jesus, the mighty God, have mercy on us.\n'
            'Jesus, Father of the world to come, have mercy on us.\n'
            'Jesus, Angel of great counsel, have mercy on us.\n'
            'Jesus, most powerful, have mercy on us.\n'
            'Jesus, most patient, have mercy on us.\n'
            'Jesus, most obedient, have mercy on us.\n'
            'Jesus, meek and humble of heart, have mercy on us.\n'
            'Jesus, lover of chastity, have mercy on us.\n'
            'Jesus, our Lover, have mercy on us.\n'
            'Jesus, God of Peace, have mercy on us.\n'
            'Jesus, Author of Life, have mercy on us.\n'
            'Jesus, Model of Virtues, have mercy on us.\n'
            'Jesus, zealous for souls, have mercy on us.\n'
            'Jesus, our God, have mercy on us.\n'
            'Jesus, our Refuge, have mercy on us.\n'
            'Jesus, Father of the Poor, have mercy on us.\n'
            'Jesus, Treasure of the Faithful, have mercy on us.\n'
            'Jesus, Good Shepherd, have mercy on us.\n'
            'Jesus, True Light, have mercy on us.\n'
            'Jesus, eternal Wisdom, have mercy on us.\n'
            'Jesus, infinite Goodness, have mercy on us.\n'
            'Jesus, our Way and our Life, have mercy on us.\n'
            'Jesus, joy of the Angels, have mercy on us.\n'
            'Jesus, King of the Patriarchs, have mercy on us.\n'
            'Jesus, Master of the Apostles, have mercy on us.\n'
            'Jesus, Teacher of the Evangelists, have mercy on us.\n'
            'Jesus, Strength of Martyrs, have mercy on us.\n'
            'Jesus, Light of Confessors, have mercy on us.\n'
            'Jesus, Purity of Virgins, have mercy on us.\n'
            'Jesus, Crown of all Saints, have mercy on us.\n\n'
            'Be merciful, spare us, O Jesus.\n'
            'Be merciful, graciously hear us, O Jesus.\n\n'
            'From all evil, deliver us, O Jesus.\n'
            'From all sin, deliver us, O Jesus.\n'
            'From Your wrath, deliver us, O Jesus.\n'
            'From the snares of the devil, deliver us, O Jesus.\n'
            'From the spirit of impurity, deliver us, O Jesus.\n'
            'From everlasting death, deliver us, O Jesus.\n'
            'From neglect of Your inspirations, deliver us, O Jesus.\n\n'
            'Through the mystery of Your holy Incarnation, deliver us, O Jesus.\n'
            'Through Your Nativity, deliver us, O Jesus.\n'
            'Through Your Infancy, deliver us, O Jesus.\n'
            'Through Your most divine Life, deliver us, O Jesus.\n'
            'Through Your labors, deliver us, O Jesus.\n'
            'Through Your Agony and Passion, deliver us, O Jesus.\n'
            'Through Your Cross and dereliction, deliver us, O Jesus.\n'
            'Through Your sufferings, deliver us, O Jesus.\n'
            'Through Your Death and Burial, deliver us, O Jesus.\n'
            'Through Your Resurrection, deliver us, O Jesus.\n'
            'Through Your Ascension, deliver us, O Jesus.\n'
            'Through Your institution of the Most Holy Eucharist, deliver us, O Jesus.\n'
            'Through Your joys, deliver us, O Jesus.\n'
            'Through Your glory, deliver us, O Jesus.\n\n'
            'Lamb of God, who takes away the sins of the world, spare us, O Jesus.\n'
            'Lamb of God, who takes away the sins of the world, graciously hear us, O Jesus.\n'
            'Lamb of God, who takes away the sins of the world, have mercy on us, O Jesus.\n'
            'Jesus, hear us.\n'
            'Jesus, graciously hear us.\n\n'
            'Let us pray.\n'
            'O Lord Jesus Christ, You have said, “Ask and you shall receive; seek, and you shall find; knock, and it shall be opened unto you.” Mercifully attend to our supplications, and grant us the grace of Your divine charity, that we may always love You with our whole heart, with all our words and deeds, and may never cease praising You.\n'
            'Make us, O Lord, to have a lasting reverence and love for Your Holy Name, for You never fail to govern those whom You firmly establish in Your love.\n'
            'You who live and reign forever and ever.\n'
            'Amen.',
        contentAm:
        'ጌታ ሆይ • ማረን\n'
            'ክርስቶስ ሆይ • ማረን\n'
            'ጌታ ሆይ • ማረን\n'
            'ኢየሱስ ሆይ • ስማን\n'
            'ኢየሱስ ሆይ • አድምጠን\n\n'
            'የሰማይ አባት አምላክ ሆይ • ማረን\n'
            'የዓለም መድኃኒው የአምላክ ወንድ ሆይ • ማረን\n'
            'መንፈስ ቅዱስ አምላክ ሆይ • ማረን\n'
            'ቅዱስ ሥላሴ አንድ አምላክ ሆይ • ማረን\n\n'
            'ኢየሱስ፥ የሕያው አምላክ ወንድ ሆይ • ማረን\n'
            'ኢየሱስ፥ የአብ ብርሃን ሆይ • ማረን\n'
            'ኢየሱስ፥ የዘለለቀ ብርሃን ብርሃን ሆይ • ማረን\n'
            'ኢየሱስ፥ የክብር ንጉሥ ሆይ • ማረን\n'
            'ኢየሱስ፥ የጽድቅ ፀሐይ ሆይ • ማረን\n'
            'ኢየሱስ፥ የድንግል ማርያም ወንድ ሆይ • ማረን\n'
            'ኢየሱስ፥ በጣም የሚደነቅ ሆይ • ማረን\n'
            'ኢየሱስ፥ ገዳይ አምላክ ሆይ • ማረን\n'
            'ኢየሱስ፥ የመጪው ዓለም አባት ሆይ • ማረን\n'
            'ኢየሱስ፥ የታላቅ ምክር መልአክ ሆይ • ማረን\n'
            'ኢየሱስ፥ በጣም ገዳይ ሆይ • ማረን\n'
            'ኢየሱስ፥ በጣም ታጋሽ ሆይ • ማረን\n'
            'ኢየሱስ፥ በጣም ታዘዥ ሆይ • ማረን\n'
            'ኢየሱስ፥ ሩኅ ሩቅና ትሑት ልብ ያለው ሆይ • ማረን\n'
            'ኢየሱስ፥ የንጹህነት ፍቃሪ ሆይ • ማረን\n'
            'ኢየሱስ፥ የእኛ ፍቃሪ ሆይ • ማረን\n'
            'ኢየሱስ፥ የሰላም አምላክ ሆይ • ማረን\n'
            'ኢየሱስ፥ የሕይወት መስጋት ሆይ • ማረን\n'
            'ኢየሱስ፥ የሥነ-ምግባር ምሳሌ ሆይ • ማረን\n'
            'ኢየሱስ፥ ለነፍሶች ታጋሽ ሆይ • ማረን\n'
            'ኢየሱስ፥ አምላካችን ሆይ • ማረን\n'
            'ኢየሱስ፥ መሸሸጊያችን ሆይ • ማረን\n'
            'ኢየሱስ፥ የድሆች አባት ሆይ • ማረን\n'
            'ኢየሱስ፥ የእምነተኞች ውድ ገበያ ሆይ • ማረን\n'
            'ኢየሱስ፥ መልካም እረኛ ሆይ • ማረን\n'
            'ኢየሱስ፥ እውነተኛ ብርሃን ሆይ • ማረን\n'
            'ኢየሱስ፥ ዘለለቀ ጥበብ ሆይ • ማረን\n'
            'ኢየሱስ፥ ያልተወሰነ መልካምነት ሆይ • ማረን\n'
            'ኢየሱስ፥ መንገዳችንና ሕይወታችን ሆይ • ማረን\n'
            'ኢየሱስ፥ የመልአካት ደስታ ሆይ • ማረን\n'
            'ኢየሱስ፥ የአባቶች ንጉሥ ሆይ • ማረን\n'
            'ኢየሱስ፥ የሐዋርያት መምህር ሆይ • ማረን\n'
            'ኢየሱስ፥ የወንጌል ጸሐፊዎች አስተማሪ ሆይ • ማረን\n'
            'ኢየሱስ፥ የተሰቃዮች ኃይል ሆይ • ማረን\n'
            'ኢየሱስ፥ የእምነተኞች ብርሃን ሆይ • ማረን\n'
            'ኢየሱስ፥ የድንግሎች ንጽህና ሆይ • ማረን\n'
            'ኢየሱስ፥ የቅዱሳን ሁሉ ሴራቅ ሆይ • ማረን\n\n'
            'ኢየሱስ ሆይ • ማርነን፥ አባርነን\n'
            'ኢየሱስ ሆይ • ማርነን፥ አድምጠን\n\n'
            'ከክፉ ሁሉ • አድነን ኢየሱስ ሆይ\n'
            'ከኃጢአት ሁሉ • አድነን ኢየሱስ ሆይ\n'
            'ከቍጣህ • አድነን ኢየሱስ ሆይ\n'
            'ከዲያብሎስ ውርጃ • አድነን ኢየሱስ ሆይ\n'
            'ከዝኙነኛ መንፈስ • አድነን ኢየሱስ ሆይ\n'
            'ከዘለለቀ ሞት • አድነን ኢየሱስ ሆይ\n'
            'ከተነሣሃብን መልአክት ማጣት • አድነን ኢየሱስ ሆይ\n\n'
            'በቅዱስ ሥጋ ወነፍስ የተገለጥህ በሚስጥር • አድነን ኢየሱስ ሆይ\n'
            'በወለድህ • አድነን ኢየሱስ ሆይ\n'
            'በሕፃንነትህ • አድነን ኢየሱስ ሆይ\n'
            'በበለጸገ መልካም ሕይወትህ • አድነን ኢየሱስ ሆይ\n'
            'በሥራህ • አድነን ኢየሱስ ሆይ\n'
            'በመከራህና በስቅለትህ • አድነን ኢየሱስ ሆይ\n'
            'በመስቀልህና በተሃድሶህ • አድነን ኢየሱስ ሆይ\n'
            'በስቃይህ • አድነን ኢየሱስ ሆይ\n'
            'በሞትህና በተቀባርህ • አድነን ኢየሱስ ሆይ\n'
            'በኵርናትህ • አድነን ኢየሱስ ሆይ\n'
            'በወጣህ ጊዜ • አድነን ኢየሱስ ሆይ\n'
            'በቅዱስ ቅዱስ ቅዱስ የእግዚአብሔር ሥጋ ወነፍስ ማስተዋወቅህ • አድነን ኢየሱስ ሆይ\n'
            'በደስታህ • አድነን ኢየሱስ ሆይ\n'
            'በክብርህ • አድነን ኢየሱስ ሆይ\n\n'
            'የዓለም ኃጢአት የሚያስወግድ የእግዚእ ጠንቋይ ሆይ • ኢየሱስ ሆይ፥ አባርነን\n'
            'የዓለም ኃጢአት የሚያስወግድ የእግዚእ ጠንቋይ ሆይ • ኢየሱስ ሆይ፥ አድምጠን\n'
            'የዓለም ኃጢአት የሚያስወግድ የእግዚእ ጠንቋይ ሆይ • ኢየሱስ ሆይ፥ ማረን\n'
            'ኢየሱስ ሆይ • ስማን\n'
            'ኢየሱስ ሆይ • አድምጠን\n\n'
            'እንጸልይ።\n'
            'ጌታችን ኢየሱስ ክርስቶስ ሆይ፥ “ጠይቁ ትቀበሉ፥ ፍለጉ ታገኙ፥ ቅረቡ ይከፈትላችኋል” ብለሃል። ልመናችንን በምሕረት ተቀበል፥ የመልካምነትህን ጸጋ ስጠን፤ በልባችን ሁሉ፥ በቃላቻችንና በሥራቻችን ሁሉ ሁልጊዜ እንድንወድህ፥ ማመስገንም እንዳንቋርጥ።\n'
            'ጌታ ሆይ፥ ለቅዱስ ስምህ ዘለለቀ ፍርሃትና ፍቅር ስጠን፤ በፍቅርህ የጠነከሩትን ሁልጊዜ አታሳልፋቸውምና።\n'
            'ዘለለቀ ሕያው የሆንህና የምትነግሥ አንተ ነህ።\n'
            'አሜን።',
        imagePath: 'assets/img_16.png',
      ),
    ],

// -------------------------------------------------------------------------
// ST. PATRICK'S BREASTPLATE
// -------------------------------------------------------------------------
    'St. Patrick\'s Breastplate': [
      PrayerStep(
        sectionHeader: 'SHIELD INVOCATION',
        sectionHeaderAm: 'የጥበቃ ጸሎት',
        titleEn: 'St. Patrick\'s Breastplate',
        titleAm: 'የቅዱስ ፓትሪክ ጥበቃ',
        contentEn:
        'I bind unto myself today\n'
            'The power of God to hold and lead me,\n'
            'The eye of God to watch over me,\n'
            'The wisdom of God to teach me,\n'
            'The ear of God to hear me,\n'
            'The word of God to speak for me,\n'
            'The hand of God to guide me,\n'
            'The way of God to lie before me,\n'
            'The shield of God to shelter me,\n'
            'The host of God to secure me,\n'
            'Against the snares of demons,\n'
            'Against the seductions of vices,\n'
            'Against the lusts of nature,\n'
            'Against everyone who meditates injury to me,\n'
            'Whether far or near,\n'
            'Whether few or many.\n\n'
            'Christ be with me,\n'
            'Christ within me,\n'
            'Christ behind me,\n'
            'Christ before me,\n'
            'Christ beside me,\n'
            'Christ to win me,\n'
            'Christ to comfort and restore me,\n'
            'Christ beneath me,\n'
            'Christ above me,\n'
            'Christ in quiet,\n'
            'Christ in danger,\n'
            'Christ in the hearts of all who love me,\n'
            'Christ in the mouth of friend and stranger.\n\n'
            'I bind unto myself today\n'
            'The strong name of the Trinity,\n'
            'By invocation of the same,\n'
            'The Three in One, and One in Three,\n'
            'Of whom all nature has creation,\n'
            'Eternal Father, Spirit, Word:\n'
            'Praise to the Lord of my salvation;\n'
            'Salvation is of Christ the Lord.\n'
            'Amen.',
        contentAm:
        'ዛሬ ለራሴ እገያለሁ\n'
            'እንድታይዝኝና እንድታስተምረኝ የአምላክን ኃይል፤\n'
            'እንድታሳምረኝ የአምላክን ዓይን፤\n'
            'እንድታስተምረኝ የአምላክን ጥበብ፤\n'
            'እንድታዳምጠኝ የአምላክን ጆሮ፤\n'
            'እንድትናገርልኝ የአምላክን ቃል፤\n'
            'እንድታስተምረኝ የአምላክን እጅ፤\n'
            'እንድታስቀምጥልኝ የአምላክን መንገድ፤\n'
            'እንድታሸጠኝ የአምላክን ጋሻ፤\n'
            'እንድታጠብኝ የአምላክን ሠራዊት፤\n'
            'ከዲያብሎሳት ውርጃ፤\n'
            'ከክፉ ምኞቶች ማታለል፤\n'
            'ከተፈጥሮ ዝኙነኛ ምኞት፤\n'
            'ርቀትም ቅርብም ሆነ ብዙም ሆነ ጥቂትም፥\n'
            'ልከፍተኝ የሚፈልግ ሰው ሁሉ እንድታድነኝ።\n\n'
            'ክርስቶስ ከእኔ ጋር፣\n'
            'ክርስቶስ በእኔ ውስጥ፣\n'
            'ክርስቶስ ከኋላዬ፣\n'
            'ክርስቶስ ከፊቴ፣\n'
            'ክርስቶስ አጠገቤ፣\n'
            'ክርስቶስ ለማሸነፌ፣\n'
            'ክርስቶስ ለማረኬና ለማበረታታቴ፣\n'
            'ክርስቶስ ከእኔ በታች፣\n'
            'ክርስቶስ ከእኔ በላይ፣\n'
            'ክርስቶስ በረሃብታ፣\n'
            'ክርስቶስ በመከራ፣\n'
            'ክርስቶስ በሚወዱኝ ሁሉ ልብ ውስጥ፣\n'
            'ክርስቶስ በጓደኛም ሆነ በእንግዳ አፍ ውስጥ።\n\n'
            'ዛሬ ለራሴ እገያለሁ\n'
            'የሥላሴን ጠንካራ ስም፤\n'
            'በስሙ ጥሪ፤\n'
            'ሦስት በአንድ፥ አንድ በሦስት፤\n'
            'ሁሉንም ፍጥረት የፈጠረው፤\n'
            'ዘለለቀ አብ፥ መንፈስ፥ ቃል፤\n'
            'ለመዳኔ ጌታ ምስጋና ይገባል፤\n'
            'ድኅነት የጌታው ከክርስቶስ ነው።\n'
            'አሜን።',
        imagePath: 'assets/saint patrick.jpg',
      ),
    ],

    // -------------------------------------------------------------------------
    // 18. ACT OF CONTRITION
    // -------------------------------------------------------------------------
    'Act of Contrition': [
      PrayerStep(
        sectionHeader: 'REPENTANCE',
        sectionHeaderAm: 'የንስሐ ጸሎት',
        titleEn: 'Act of Contrition',
        titleAm: 'የንስሐ ጸሎት',
        contentEn: 'O my God, I am heartily sorry for having offended You, and I detest all my sins because of Your just punishments, but most of all because they offend You, my God, who are all good and deserving of all my love. I firmly resolve, with the help of Your grace, to sin no more and to avoid the near occasions of sin. Amen.',
        contentAm: 'አምላኬ ሆይ ፍጹም ተወዳጅ ነህ፣ ኃጢአትን የምትጠላ ነህ፤ በኃጢአቴ ስለበደልኩህ እጅግ አዝናለሁ፤ ማረኝ! ዳግመኛ ወደ ኃጢአት አልመለስም፤ በጸጋህ ከኃጢአት ምክንያት ሁሉ እርቃለሁ። አሜን።',
        imagePath: 'assets/img_2.png',
      ),
    ],

    // -------------------------------------------------------------------------
    // 19. PRAYER FOR THE HOUR OF MERCY
    // -------------------------------------------------------------------------
    // -------------------------------------------------------------------------
// 19. PRAYER FOR THE FORGIVENESS OF SINS
// -------------------------------------------------------------------------
    'Prayer for the Hour of Mercy': [
      PrayerStep(
        sectionHeader: 'THE HOUR OF MERCY',
        sectionHeaderAm: 'የምሕረት ሰዓት',
        titleEn: 'Prayer for the Hour of Mercy',
        titleAm: 'የምሕረት ሰዓት ጸሎት',
        contentEn:
        'At three in the afternoon,\n'
            'the hour Christ died on the Cross,\n'
            'pause wherever you are, even for a moment.\n'
            'Remember His Passion and ask for His mercy,\n'
            'especially for sinners.',
        contentAm:
        'ከቀኑ በዘጠኝ ሰዓት፣\n'
            'ክርስቶስ በመስቀል ላይ በሞተበት ሰዓት፣\n'
            'ባሉበት ለአፍታም ቢሆን ቆም ይበሉ።\n'
            'ሕማሙን ያስቡ፤ ምሕረቱንም ይለምኑ፤\n'
            'በተለይም ለኃጢአተኞች።',
        imagePath: 'assets/img_5.png',
      ),
      PrayerStep(
        sectionHeader: 'THE PRAYER',
        sectionHeaderAm: 'ጸሎቱ',
        titleEn: 'Prayer for the Hour of Mercy',
        titleAm: 'የምሕረት ሰዓት ጸሎት',
        contentEn:
        'You expired, Jesus,\n'
            'but the source of life gushed forth for souls,\n'
            'and the ocean of mercy opened up for the whole world.\n\n'
            'O Fount of Life,\n'
            'unfathomable Divine Mercy,\n'
            'envelop the whole world\n'
            'and empty Yourself out upon us.',
        contentAm:
        'ኢየሱስ ሆይ፣ ሞትህ፤\n'
            'ነገር ግን የሕይወት ምንጭ ለነፍሳት ፈለቀ፤\n'
            'የምሕረትም ውቅያኖስ ለዓለም ሁሉ ተከፈተ።\n\n'
            'የሕይወት ምንጭ ሆይ፣\n'
            'የማይመረመር መለኮታዊ ምሕረት ሆይ፣\n'
            'ዓለምን ሁሉ ሸፍን፤\n'
            'ራስህንም በእኛ ላይ አፍስስ።',
        imagePath: 'assets/img_5.png',
      ),
      PrayerStep(
        sectionHeader: 'AN ACT OF TRUST',
        sectionHeaderAm: 'የመታመን ጸሎት',
        titleEn: 'Prayer for the Hour of Mercy',
        titleAm: 'የምሕረት ሰዓት ጸሎት',
        contentEn:
        'O Blood and Water,\n'
            'which gushed forth from the Heart of Jesus\n'
            'as a fount of mercy for us,\n'
            'I trust in You!\n\n'
            'Jesus, I trust in You.\n'
            'Amen.',
        contentAm:
        'ከኢየሱስ ልብ ለእኛ እንደ ምሕረት ምንጭ የፈለቁ\n'
            'ደምና ውሃ ሆይ፣\n'
            'በአንተ ታምኛለሁ!\n\n'
            'ኢየሱስ ሆይ፣ በአንተ ታምኛለሁ።\n'
            'አሜን።',
        imagePath: 'assets/img_5.png',
      ),
    ],

    // -------------------------------------------------------------------------
    // 20. PSALM 51 (MISERERE)
    // -------------------------------------------------------------------------
    'Psalm 51 (Miserere)': [
      PrayerStep(
        sectionHeader: 'PSALM 51',
        sectionHeaderAm: 'መዝሙር 51',
        titleEn: 'Psalm 51 (Miserere)',
        titleAm: 'መዝሙር 51 (የዳዊት ጸሎት)',
        contentEn:
        'Have mercy upon me, O God, according to thy lovingkindness:\n'
            'according unto the multitude of thy tender mercies blot out my transgressions.\n\n'
            'Wash me throughly from mine iniquity,\n'
            'and cleanse me from my sin.\n\n'
            'For I acknowledge my transgressions:\n'
            'and my sin is ever before me.\n\n'
            'Against thee, thee only, have I sinned,\n'
            'and done this evil in thy sight:\n'
            'that thou mightest be justified when thou speakest,\n'
            'and be clear when thou judgest.\n\n'
            'Behold, I was shapen in iniquity;\n'
            'and in sin did my mother conceive me.\n\n'
            'Behold, thou desirest truth in the inward parts:\n'
            'and in the hidden part thou shalt make me to know wisdom.\n\n'
            'Purge me with hyssop, and I shall be clean:\n'
            'wash me, and I shall be whiter than snow.\n\n'
            'Make me to hear joy and gladness;\n'
            'that the bones which thou hast broken may rejoice.\n\n'
            'Hide thy face from my sins,\n'
            'and blot out all mine iniquities.\n\n'
            'Create in me a clean heart, O God;\n'
            'and renew a right spirit within me.\n\n'
            'Cast me not away from thy presence;\n'
            'and take not thy holy spirit from me.\n\n'
            'Restore unto me the joy of thy salvation;\n'
            'and uphold me with thy free spirit.\n\n'
            'Then will I teach transgressors thy ways;\n'
            'and sinners shall be converted unto thee.\n\n'
            'Deliver me from bloodguiltiness, O God,\n'
            'thou God of my salvation:\n'
            'and my tongue shall sing aloud of thy righteousness.\n\n'
            'O Lord, open thou my lips;\n'
            'and my mouth shall shew forth thy praise.\n\n'
            'For thou desirest not sacrifice; else would I give it:\n'
            'thou delightest not in burnt offering.\n\n'
            'The sacrifices of God are a broken spirit:\n'
            'a broken and a contrite heart, O God, thou wilt not despise.',
        contentAm:
        'እግዚአብሔር ሆይ፤ እንደ ቸርነትህ መጠን፣ ምሕረት አድርግልኝ፤\n'
            'እንደ ርኅራኄህም ብዛት፣ መተላለፌን ደምስስ።\n'
            'በደሌን ፈጽሞ እጠብልኝ፤ ከኀጢአቴም አንጻኝ።\n\n'
            'እኔ መተላለፌን አውቃለሁና፤ ኀጢአቴም ዘወትር በፊቴ ነው።\n'
            'በውሳኔህ ትክክል፣ በምትሰጠው ፍርድም ንጹሕ ትሆን ዘንድ፣\n'
            'አንተን፣ በእርግጥ አንተን ብቻ በደልሁ፤ በፊትህም ክፉ ነገር አደረግሁ።\n\n'
            'ስወለድ ጀምሮ በደለኛ፣ ገና እናቴም ስትፀንሰኝ ኀጢአተኛ ነኝ።\n'
            'እነሆ፤ እውነትን ከሰው ልብ ትሻለህ፤\n'
            'ስለዚህ ጥልቅ ጥበብን በውስጤ አስተምረኝ።\n\n'
            'በሂሶጵ እርጨኝ፤ እኔም እነጻለሁ፤ እጠበኝ፤ ከበረዶም ይልቅ ነጭ እሆናለሁ።\n'
            'ሐሤትንና ደስታን አሰማኝ፤ ያደቀቅሃቸው ዐጥንቶቼም ደስ ይበላቸው።\n\n'
            'ፊትህን ከኀጢአቴ መልስ፤ በደሌንም ሁሉ ደምስስልኝ።\n'
            'አምላኬ ሆይ፤ ንጹሕ ልብ ፍጠርልኝ፤ ቀና የሆነውንም መንፈስ በውስጤ አድስ።\n'
            'ከፊትህ አትጣለኝ፤ ቅዱስ መንፈስህንም ከእኔ ላይ አትውሰድ።\n\n'
            'የማዳንህን ደስታ መልስልኝ፤ በእሽታ መንፈስም ደግፈህ ያዘኝ።\n'
            'እኔም ለሕግ ተላላፊዎች መንገድህን አስተምራለሁ፤ ኀጢአተኞችም ወደ አንተ ይመለሳሉ።\n\n'
            'የድነቴ አምላክ እግዚአብሔር ሆይ፤ ደም ከማፍሰስ አድነኝ፤\n'
            'አንደበቴም ስለ ጽድቅህ በእልልታ ይዘምራል።\n'
            'ጌታ ሆይ ከንፈሮቼን ክፈት፤ አፌም ምስጋናህን ያውጃል።\n\n'
            'መሥዋዕትን ብትወድ ኖሮ ባቀረብሁልህ ነበር፤ የሚቃጠል መሥዋዕትም ደስ አያሰኝህም።\n'
            'እግዚአብሔር የሚቀበለው መሥዋዕት የተሰበረ መንፈስ ነው፤\n'
            'እግዚአብሔር ሆይ፤ አንተ የተሰበረውንና የተዋረደውን ልብ አትንቅም።',
        imagePath: 'assets/img_2.png',
      ),
    ],

    // -------------------------------------------------------------------------
    // 21. ANIMA CHRISTI
    // -------------------------------------------------------------------------
    // -------------------------------------------------------------------------
// ANIMA CHRISTI
// -------------------------------------------------------------------------
    'Anima Christi': [
      PrayerStep(
        sectionHeader: 'PRAYER AFTER HOLY COMMUNION',
        sectionHeaderAm: 'ጸሎት ከቁርባን በኋላ',
        titleEn: 'Anima Christi',
        titleAm: 'አኒማ ክርስቲ (የቅዱስ ቁርባን ጸሎት)',
        contentEn:
        'My Lord, You have given Your whole self to me,\n'
            'and I also give my whole self to You.\n'
            'I offer You my heart and my soul.\n'
            'I give You my whole life.\n'
            'I desire to be Yours forever.\n\n'
            'My Lord, grant me all the graces that are beneficial for my soul.\n'
            'Help my relatives, my loved ones, and those who are kind to me.\n'
            'Deliver also the souls in purgatory from their suffering.\n\n'
            'Soul of Christ, sanctify me.\n'
            'Body of Christ, save me.\n'
            'Blood of Christ, inebriate me.\n'
            'Water from the side of Christ, wash me.\n'
            'Passion of Christ, strengthen me.\n'
            'O good Jesus, hear me.\n'
            'Within Your wounds hide me.\n'
            'Do not allow me to be separated from You.\n'
            'From the evil enemy, defend me.\n'
            'In the hour of my death, call me.\n'
            'And bid me come to You,\n'
            'that with Your saints I may praise You forever and ever.\n'
            'Amen.',
        contentAm:
        'ጌታዬ ሆይ፥ ሁለንተናህን ለኔ ሰጥተሃልና፥\n'
            'እኔም ሁለንተናየን ላንተ እሰጥሃለሁ።\n'
            'ልቤን ነፍሴን አቀርብልሃለሁ።\n'
            'ሕይወቴን በሙሉ ላንተ እሰጥሃለሁ።\n'
            'ለዘላለም ያንተ መሆን እፈልጋለሁ።\n\n'
            'ጌታዬ ሆይ፥ ለነፍሴ ጠቃሚዎች የሆኑትን ጸጋዎች ሁሉ ስጠኝ።\n'
            'ዘመዶቼን፥ ወዳጆቼን፥ መልካም አድራጊዎቼን እርዳቸው።\n'
            'የንስሐ ቦታ ነፍሶችንም ከጭንቅ አውጣቸው።\n\n'
            'የክርስቶስ ነፍስ ሆይ፥ ቀድሰኝ።\n'
            'የክርስቶስ ሥጋ ሆይ፥ አድነኝ።\n'
            'የክርስቶስ ደም ሆይ፥ እጠበኝ።\n'
            'የክርስቶስ ሕማም ሆይ፥ አበርታኝ።\n'
            'ደጉ ኢየሱስ ሆይ፥ ስማኝ።\n'
            'በቁስሎችህ ሰውረኝ።\n'
            'ከክፉ ጠላት አድነኝ።\n'
            'ካንተ እንዳልለይ አድርገኝ።\n'
            'በሞት ጊዜ ወዳንተ ጥራኝ።\n'
            'ለዘለዓለም ከቅዱሳን ጋር እንዳመሰግንህ ወዳንተ እመጣ ዘንድ ፍቀድልኝ።\n'
            'አሜን።',
        imagePath: 'assets/anima christi vip.jpg',
      ),
    ],


    'Prayer Before Holy Communion': [
      PrayerStep(
        sectionHeader: 'BEFORE HOLY COMMUNION',
        sectionHeaderAm: 'ከቅዱስ ቁርባን በፊት',
        titleEn: 'Prayer Before Holy Communion',
        titleAm: 'ጸሎት በቅዱስ ቁርባን ፊት',
        contentEn:
        'Our Lord Jesus Christ, for the love of mankind, through the symbol of Your kindness and love, the Holy Communion, You wait day and night for those who visit You; You call them and receive them.\n\n'
            'On this tabernacle throne, in the Holy Communion, we believe that You are truly present.\n'
            'We worship You.\n'
            'For all the good things You have done for us, we thank You.\n'
            'We thank You especially because You gave Yourself to us in the Holy Communion.\n'
            'We also thank You because You gave us Your Holy Mother Mary to be our protector.\n\n'
            'By thanking Your Sacred Heart,\n'
            'by offering You the kiss of love in place of the betrayal You endured,\n'
            'and by giving You the honor You deserve in place of the humiliation You received in the Holy Communion, we worship You.\n\n'
            'Our Jesus, we love You in our hearts.\n'
            'We are sorry for having offended Your boundless kindness so many times.\n'
            'In the time to come, we firmly resolve not to offend You again.\n'
            'Even now, our poverty is known; we offer our whole being to You.\n'
            'Let our will, our love, and all our desires be Yours.\n'
            'From this day forward, do with us, and with all that is ours, as You please.\n\n'
            'We ask only one thing of You:\n'
            'make Your love never depart from us,\n'
            'make our final end beautiful,\n'
            'and enable us always to fulfill Your will.\n\n'
            'Helper of souls in purgatory, help those entrusted to Your care.\n'
            'Help especially those who once honored You in the Holy Communion\n'
            'and loved Your Holy Mother Mary.\n'
            'Look upon all sinners with eyes of mercy.\n\n'
            'Our most beloved Savior, Jesus Christ, we unite all our thoughts with the thoughts of Your beloved Sacred Heart and offer them to Your eternal Father.\n'
            'We ask this in Your name, that He may accept them for love of You.\n\n'
            'Jesus our God, who are present in the Holy Communion, the mystery of love, we worship You.\n'
            'May this most holy divine mystery be praised forever.',
        contentAm:
        'ጌታችን ኢየሱስ ክርስቶስ ሆይ፥ ስለ ሰዎች ፍቅር ብለህ፥ የደግነትህና የፍቅርህ ምልክት በሆነው በምሥጢረ ቁርባን፥ ሌት ተቀን ተገኝተህ የሚጎበኙህን ትጠባበቃለህ፥ ትጠራለህ፥ ትቀበላለህም።\n\n'
            'በዚህ በመንበረ ታቦት ላይ፥ በምሥጢረ ቁርባን፥ በእውነት እንዳለህ እናምናለን።\n'
            'እንሰግድልሃለን።\n'
            'ስላደረግህልን መልካም ነገር ሁሉ እናመሰግንሃለን።\n'
            'ይልቁንም በቁርባን ራስህን ስለሰጠኸን እናመሰግንሃለን።\n'
            'ቅድስት እናትህን ማርያምን ጠበቃ እንድትሆነን ስለሰጠኸንም እናመሰግንሃለን።\n\n'
            'ቅዱስ ልብህን በማመስገን፥\n'
            'በምትበደለው በደል ፈንታ ካሣ በማቅረብ፥\n'
            'በቅዱስ ቁርባን በሚያዋርዱህ ውርደት ፈንታ የተገባ ክብር በመስጠት እንሰግድልሃለን።\n\n'
            'የኛ ኢየሱስ ሆይ፥ በልባችን እንወድሃለን።\n'
            'ወሰን የሌለውን ደግነትህን ብዙ ጊዜ በመበደላችን እንፀፀታለን።\n'
            'በመጪው ጊዜ ዳግመኛ አንበድልህም ብለን ቁርጥ ፈቃድ እናደርጋለን።\n'
            'አሁንም ቢሆን ምስኪንነታችን የታወቀ ነው፤ ሁለንተናችንን ላንተ እናቀርባለን።\n'
            'ፈቃዳችን፥ ፍቅራችን፥ ምኞታችን፥ ያለንም ሁሉ ያንተ ይሁን።\n'
            'ከዛሬ ጀምሮ እኛንም ሆነ ያለንን ሁሉ እንደፈለግህ አድርግ።\n\n'
            'አንድ ነገር ብቻ እንለምንሃለን፥\n'
            'ፍቅርህ እንዳይለየን፥ የመጨረሻው ፍጻሜያችን እንዲያምርልን፥\n'
            'ሁልጊዜ ፈቃድህን ፈጻሚ ሆነን እንድንገኝ አድርገን።\n\n'
            'የንስሐ ቦታ ነፍሶችን አደራህ ሆይ፥ እርዳቸው።\n'
            'ይልቁንም አንተን በምሥጢረ ቁርባን ያከብሩ የነበሩትን፥\n'
            'ቅድስት ማርያምን የሚወዱ የነበሩትን እርዳቸው።\n'
            'እንዲሁም ኃጢአተኞችን ሁሉ በምሕረት ዓይን ተመልከታቸው።\n\n'
            'እጅግ የተወደድህ መድኃኒታችን ኢየሱስ ክርስቶስ ሆይ፥ ከተወዳጁ ቅዱስ ልብህ አሳቦች ጋር የኛንም አሳቦች ሁሉ አጋጥመን ለዘላለማዊ አባትህ እናቀርባለን።\n'
            'ስላንተ ፍቅር ሲል እንዲቀበለን ባንተ ስም እንለምነዋለን።\n\n'
            'የፍቅር ምስጢር በሆነው በቅዱስ ቁርባን የምትገኝ ኢየሱስ አምላካችን ሆይ፥ እንሰግድልሃለን።\n'
            'ይህ እጅግ የተቀደሰ አምላካዊ ምስጢር ሁልጊዜ የተመሰገነ ይሁን።',
        imagePath: 'assets/Holy Mass.jpg',
      ),
    ],

// -------------------------------------------------------------------------
// 23. BLESSING OF THE HOLY COMMUNION (ST. THOMAS)
// -------------------------------------------------------------------------
    'Blessing of the Holy Communion (St. Thomas)': [
      PrayerStep(
        sectionHeader: 'EUCHARISTIC BLESSING',
        sectionHeaderAm: 'የቅዱስ ቁርባን ቡራኬ',
        titleEn: 'Blessing of the Holy Communion (St. Thomas)',
        titleAm: 'የቅዱስ ቁርባን ቡራኬ (የቅዱስ ቶማስ)',
        contentEn:
        'Before this exceedingly exalted mystery, let us humble ourselves and worship.\n'
            'Let the old order give way to the new.\n'
            'Let faith supply what the senses cannot grasp.\n'
            'To the Father and to the Son be praise, joy, honor, power, and thanksgiving.\n'
            'To the Spirit proceeding from both be equal praise.\n'
            'Amen.\n\n'
            'He gave them bread from heaven,\n'
            'containing all sweetness.\n\n'
            'Let us pray.\n\n'
            'O God, who in this wondrous mystery have left us a memorial of Your Passion, grant us, we pray, so to venerate the sacred mysteries of Your Body and Blood that we may always experience within ourselves the fruit of Your redemption.\n'
            'You who live and reign forever and ever.\n'
            'Amen.\n\n'
            'Thanksgiving after the Blessing.\n\n'
            'Blessed be God.\n'
            'Blessed be His Holy Name.\n'
            'Blessed be Jesus Christ, true God and true Man.\n'
            'Blessed be the Name of Jesus.\n'
            'Blessed be His Most Sacred Heart.\n'
            'Blessed be Jesus in the Most Holy Sacrament of the Altar.\n'
            'Blessed be Jesus in His Precious Blood.\n'
            'Blessed be the Holy Spirit, the Paraclete.\n'
            'Blessed be the great Mother of God, Mary most holy.\n'
            'Blessed be her holy and immaculate Conception.\n'
            'Blessed be her glorious Assumption.\n'
            'Blessed be the name of Mary, Virgin and Mother.\n'
            'Blessed be Saint Joseph, her most chaste spouse.\n'
            'Blessed be God in His angels and in His saints.\n'
            'Amen.',
        contentAm:
        'እንግድህ እጅግ ከፍ ላለው ምሥጢር ራሳችንን ዝቅ በማድረግ እንሰግድለት።\n'
            'አሮጌ ሥርዓቶች ለአዲሱ ሥርዓት ቦታ ይልቀቁ።\n'
            'ሕዋሳት በሚያጎድሉት ሃይማኖት ትሙላ።\n'
            'ለአብና ለወልድ ምስጋናና ደስታ፥ ሕይወትና ክብር፥ ኃይልና ውዳሴ ይሁን።\n'
            'ከሁለቱም ለሚሰርፀው መንፈስ ቅዱስ እንዲሁ ትክክል ምስጋና ይሁን።\n'
            'አሜን።\n\n'
            'ከሰማይ የወረደ ኅብስት ሰጣቸው፥\n'
            'ጣዕም ሁሉ ያለበትን።\n\n'
            'እንጸልይ።\n\n'
            'በዚህ አስደናቂ በሆነው ምሥጢር የሕማማትህን መታሰቢያ የተዉልን አምላክ ሆይ፥ የማዳንህ ፍሬ ሁልጊዜ በውስጣችን ይሰማን ዘንድ፥ አንተ ለዘላለም የምትኖር እና የምትነግስ ለሥጋህና ለደምህ ቅዱስ ምስጢር እንድንሰግድ አድርገን።\n'
            'አሜን።\n\n'
            'ከቡራኬ በኋላ ምስጋና።\n\n'
            'እግዚአብሔር የተመሰገነ ይሁን።\n'
            'ቅዱስ ስሙ የተመሰገነ ይሁን።\n'
            'ፍጹም አምላክ ፍጹም ሰው ኢየሱስ ክርስቶስ የተመሰገነ ይሁን።\n'
            'የኢየሱስ ስም የተመሰገነ ይሁን።\n'
            'እጅግ ቅዱስ ልቡ የተመሰገነ ይሁን።\n'
            'በቅዱስ ቁርባን የሚገኝ ኢየሱስ የተመሰገነ ይሁን።\n'
            'ኢየሱስ በክቡር ደሙ የተመሰገነ ይሁን።\n'
            'መንፈስ ቅዱስ ጰራቅሊጦስ የተመሰገነ ይሁን።\n'
            'የአምላክ እናት ቅድስት ማርያም የተመሰገነች ትሁን።\n'
            'እድፍ በሌለበት በቅድስት ፅንሰታዋ የተመሰገነች ትሁን።\n'
            'ድንግል ማርያም በቅድስት ፍልሰታዋ የተመሰገነች ትሁን።\n'
            'ድንግልም እናትም የሆነች የማርያም ስም የተመሰገነ ይሁን።\n'
            'እጅግ ንጹሕ እጮኛዋ ቅዱስ ዮሴፍ የተመሰገነ ይሁን።\n'
            'እግዚአብሔር በመላእክቱና በጻድቃኑ ዘንድ የተመሰገነ ይሁን።\n'
            'አሜን።',
        imagePath: 'assets/Holy Mass.jpg',
      ),
    ],

// -------------------------------------------------------------------------
// 24. PRAYER AFTER RECEIVING HOLY COMMUNION
// -------------------------------------------------------------------------
    'Prayer After Receiving Holy Communion': [
      PrayerStep(
        sectionHeader: 'AFTER HOLY COMMUNION',
        sectionHeaderAm: 'ከቅዱስ ቁርባን በኋላ',
        titleEn: 'Prayer After Receiving Holy Communion',
        titleAm: 'ከቁርባን በኋላ የሚደገም ጸሎት',
        contentEn:
        'Jesus, receive my smallest offering.\n'
            'You have given Your whole self to me,\n'
            'and I also offer my whole self to You.\n\n'
            'Cleanse me and make me pure.\n'
            'I offer You my heart and my soul.\n'
            'I give You my whole life.\n'
            'Take me to Yourself at the end of my life and at my death.\n'
            'I desire to be Yours forever.\n'
            'Amen.\n\n'
            'O most kind and humble Jesus, behold, I kneel before You.\n'
            'O merciful Jesus, as the prophet David foretold, You counted my hands and my feet; You counted all my bones.\n'
            'As I behold this word with great love and contrition, and as I meditate on it in my mind, I earnestly ask You to imprint upon my heart faith, hope, and love, true contrition for my sins, and a very firm resolve to avoid them.\n'
            'I beg this of You, and I promise it to You.\n'
            'Amen.',
        contentAm:
        'ኢየሱስ ሆይ፥ የእኔን ትንሿን መስዋእቴን ተቀበል፤\n'
            'ሁለንትናህን ለኔ ሰጥተሃልና፥\n'
            'እኔም ሁለንተናዬን ላንተ እስጣለሁ።\n\n'
            'ንጹሕ አድርገህ አንጻኝ።\n'
            'ልቤን፥ ነፍሴን ላንተ አቀርብልሃለሁ።\n'
            'ሕይወቴን በሙሉ ላንተ እሰጣለሁ።\n'
            'በኑሮዬና በሞቴ መጨረሻ እኔን ላንተ ውሰድ።\n'
            'ለዘላለሙ ያንተ መሆን እፈልጋለሁ።\n'
            'አሜን።\n\n'
            'እጅግ ደግና የዋህ ኢየሱስ ሆይ፥ እነሆ እኔ በፊትህ ተንበርክኬአለሁ።\n'
            'ቸሩ ኢየሱስ ሆይ፥ ነብዩ ዳዊት አስቀድሞ ባንተ አፍ፥\n'
            'እጆቼንና እግሮቼን ቸነከሩ፥ አጥንቶቼንም ሁሉ ቆጠሩ ብሎ የተናገረውን ቃል በታላቅ ፍቅርና ጸጸት ስመለከት በሕሊናዬም ሳስብ ሳለሁ፥\n'
            'የሃይማኖት፥ የተስፋ የፍቅር ስሜትና የኃጢአቶቼም እውነተኛ ንስሐ፥ ከኃጢአቶቼም የምርቅበት እጅግ ጠንካራ ፈቃድ በልቤ ውስጥ እንዲታተም ታደርግልኝ ዘንድ በልቤ በጣም አጥብቄ እለምንሃለሁ።\n'
            'እማልድህማለሁ።\n'
            'አሜን።',
        imagePath: 'assets/Holy Mass.jpg',
      ),
    ],

    // -------------------------------------------------------------------------
    // 24. ROSARY (Partitioned)
    // -------------------------------------------------------------------------
    'Rosary': [
      PrayerStep(
        sectionHeader: 'THE HOLY ROSARY',
        sectionHeaderAm: 'የመቁጠሪያ ጸሎት አጀማመር',
        titleEn: 'Rosary Introduction',
        titleAm: 'የመቁጠሪያ ጸሎት',
        contentEn: 'In the name of the Father, and of the Son, and of the Holy Spirit. Amen.\n\n(Apostles\' Creed, Our Father, Three Hail Marys, Glory Be)',
        contentAm: 'በስብሐተ አብ፣ በወልድ፣ በመንፈስ ቅዱስ በአንድ አምላክ ስም አሜን።\n\n(የሐዋርያት እምነት፣ አባታችን ሆይ፣ ሦስት ጸጋን የሞላብሽ፣ ስብሐት ለአብ)',
        imagePath: 'assets/img_6.png',
      ),
    ],

    // -------------------------------------------------------------------------
// 25. THE MAGNIFICAT
// -------------------------------------------------------------------------
    'The Magnificat': [
      PrayerStep(
        sectionHeader: 'CANTICLE OF MARY',
        sectionHeaderAm: 'የእመቤታችን ማርያም ምስጋና',
        titleEn: 'The Magnificat',
        titleAm: 'የእመቤታችን ማርያም ምስጋና (ማግኒፊካት)',
        contentEn:
        'My soul doth magnify the Lord,\n'
            'And my spirit hath rejoiced in God my Saviour.\n'
            'For he hath regarded the low estate of his handmaiden:\n'
            'For, behold, from henceforth all generations shall call me blessed.\n'
            'For he that is mighty hath done to me great things;\n'
            'And holy is his name.\n'
            'And his mercy is on them that fear him\n'
            'From generation to generation.\n'
            'He hath shewed strength with his arm;\n'
            'He hath scattered the proud in the imagination of their hearts.\n'
            'He hath put down the mighty from their seats,\n'
            'And exalted them of low degree.\n'
            'He hath filled the hungry with good things;\n'
            'And the rich he hath sent empty away.\n'
            'He hath holpen his servant Israel,\n'
            'In remembrance of his mercy;\n'
            'As he spake to our fathers,\n'
            'To Abraham, and to his seed for ever.',
        contentAm:
        'ነፍሴ ጌታን ታከብረዋለች፥\n'
            'መንፈሴም በአምላኬ በመድኃኒቴ ሐሴት ታደርጋለች፤\n'
            'የባሪያይቱን ውርደት ተመልክቶአልና።\n'
            'እነሆም፥ ከዛሬ ጀምሮ ትውልድ ሁሉ ብፅዕት ይሉኛል፤\n'
            'ብርቱ የሆነ እርሱ በእኔ ታላቅ ሥራ አድርጎአልና፤\n'
            'ስሙም ቅዱስ ነው።\n'
            'ምሕረቱም ለሚፈሩት ከትውልድ እስከ ትውልድ ይኖራል።\n'
            'በክንዱ ኃይል አሳየ፤\n'
            'ትዕቢተኞችን በልባቸው ምኞት በታበጠ።\n'
            'ገዢዎችን ከዙፋናቸው አወረደ፤\n'
            'ዝቅተኞችንም አስነሳ።\n'
            'ከበደ የሆኑትን በመልካም ነገር አሟላ፤\n'
            'ባለ ጠገ቞ችንም ባዶ ልኮአቸው።\n'
            'እስራኤልን ባሪያውን ረዳ፥\n'
            'ምሕረቱን አስቦ፤\n'
            'እንደ ተናገረውም ለአባቶቻችን፥\n'
            'ለአብርሃምና ለዘርዋ ለዘላለም።',
        imagePath: 'assets/img_8.png',
      ),
    ],

// -------------------------------------------------------------------------
// 26. THE MEMORARE
// -------------------------------------------------------------------------
    'The Memorare': [
      PrayerStep(
        sectionHeader: 'MARIAN INTERCESSION',
        sectionHeaderAm: 'የማርያም አማላጅነት',
        titleEn: 'The Memorare',
        titleAm: 'እጅግ ርህርት የሆንሽ ድንግል ማርያም ሆይ',
        contentEn:
        'Remember, O most gracious Virgin Mary,\n'
            'that never was it known\n'
            'that anyone who fled to your protection,\n'
            'implored your help, or sought your intercession\n'
            'was left unaided.\n\n'
            'Inspired by this confidence, I fly unto you,\n'
            'O Virgin of virgins, my Mother.\n'
            'To you I come; before you I stand, sinful and sorrowful.\n'
            'O Mother of the Word Incarnate, despise not my petitions,\n'
            'but in your mercy hear and answer me.\n'
            'Amen.',
        contentAm:
        'ባንቺ ጥበቃ ከተማፀኑ፥ እርዳታሽን ከለመኑ፥ አማለጅነትሽን ከፈለጉ ሰዎች\n'
            'አንድስ እንኳን የተኮነነ እንዳልተሰማ አስቢ።\n'
            'የድንግሎች ድንግል የሆንሽ እናቴ ሆይ፤\n'
            'እኔም በዚህ እምነት ተጽናንቼ ወደ አንቺ እሮጣለሁ።\n'
            'በኀጢአቴም እየተጨነቅሁ በፊትሽ ቆሚያለሁ።\n'
            'የቃለ እግዚአብሔር እናት ሆይ፥ ራርተሽ ቃሌን ስሚ፤\n'
            'አድምጪ እንጂ ችላ አትበይ።\n'
            'አሜን።',
        imagePath: 'assets/img_11.png',
      ),
    ],

// -------------------------------------------------------------------------
// 27. HAIL HOLY QUEEN
// -------------------------------------------------------------------------
    'Hail Holy Queen': [
      PrayerStep(
        sectionHeader: 'SALVE REGINA',
        sectionHeaderAm: 'የምህረት እናት ንግስት ሆይ',
        titleEn: 'Hail Holy Queen',
        titleAm: 'የምህረት እናት ንግስት ሆይ',
        contentEn:
        'Hail, Holy Queen, Mother of Mercy,\n'
            'our life, our sweetness, and our hope.\n'
            'To you do we cry, poor banished children of Eve.\n'
            'To you do we send up our sighs,\n'
            'mourning and weeping in this valley of tears.\n\n'
            'Turn then, most gracious Advocate, your eyes of mercy toward us.\n'
            'And after this our exile,\n'
            'show unto us the blessed fruit of your womb, Jesus.\n'
            'O clement, O loving, O sweet Virgin Mary.\n'
            'Amen.',
        contentAm:
        'ሰላም ላንቺ ይሁን ሕይወታችን፥ ደስታችን፥ ተስፋችን ሆይ፥ ሰላም ላንቺ ይሁን።\n'
            'እኛ የሔዋን ልጆች ስደተኞች ጩኸታችንን ወዳንቺ እናቀርባለን።\n'
            'በዚህ በለቅሶ ቆላ እተጨነቅንና እያለቀሰን ወደንቺ እንማጠናለን።\n\n'
            'እንግዲህ እባክሽ የኛ ጠበቃ ሆይ፥ በምህረት ዓይኖችሽ ወደ እኛ ተመልከቺ።\n'
            'ደጊቱ፥ ቸሪቱ፥ መሐሪቱ ድንግል ማርያም ሆይ፥\n'
            'የተባረከውን የሆድሽን ፍሬ ኢየሱስን ከዚህ ከስደት በኋላ ለኛ እባክሽ አሳይን።\n'
            'አሜን።',
        imagePath: 'assets/img_18.png',
      ),
    ],

// -------------------------------------------------------------------------
// 28. REGINA CAELI
// -------------------------------------------------------------------------
    'Regina Caeli': [
      PrayerStep(
        sectionHeader: 'QUEEN OF HEAVEN',
        sectionHeaderAm: 'ንግስተ ሰማይ ደስ ይበልሽ',
        titleEn: 'Regina Caeli',
        titleAm: 'ንግስተ ሰማይ ደስ ይበልሽ',
        contentEn:
        'Queen of Heaven, rejoice, alleluia.\n'
            'For He whom you did merit to bear, alleluia,\n'
            'has risen, as He said, alleluia.\n'
            'Pray for us to God, alleluia.',
        contentAm:
        'ንግስተ ሰማይ ሆይ፥ ደስ ይበልሽ፥ አልሉያ፤\n'
            'የሸከምሽው አምላክ እንደ ተናገረው ተነሥቷልና፥ አልሉያ፤\n'
            'ወደ እግዚአብሔር ለምኝልን፥ አልሉያ።',
        imagePath: 'assets/Mary.jpg',
      ),
    ],

// -------------------------------------------------------------------------
// 29. SUB TUUM PRAESIDIUM
// -------------------------------------------------------------------------
    'Sub Tuum Praesidium': [
      PrayerStep(
        sectionHeader: 'UNDER THY PROTECTION',
        sectionHeaderAm: 'በክንፎችሽ ጥላ ሰውሪን',
        titleEn: 'Sub Tuum Praesidium',
        titleAm: 'በክንፎችሽ ጥላ ሰውሪን',
        contentEn:
        'We fly to your protection, O Holy Mother of God.\n'
            'Despise not our petitions in our necessities,\n'
            'but deliver us always from all dangers,\n'
            'O glorious and blessed Virgin Mary.\n'
            'Amen.',
        contentAm:
        'ቅድስት የአምላክ እናት ሆይ፥ ጸሎታችንን አትናቂ፤\n'
            'በተቸገርን ጊዜ ከክፉ ሁሉ ሰውሪን።\n'
            'የተባረክሽ እና የተከበርሽ ድንግል ማርያም ሆይ፥ አሜን።',
        imagePath: 'assets/Mary.jpg',
      ),
    ],

// -------------------------------------------------------------------------
// 30. PRAYER OF PURITY
// -------------------------------------------------------------------------
    'Prayer of Purity': [
      PrayerStep(
        sectionHeader: 'PRAYER OF PURITY',
        sectionHeaderAm: 'የንጽህና ፀሎት',
        titleEn: 'Prayer of Purity',
        titleAm: 'የንጽህና ፀሎት',
        contentEn:
        'Holy Virgin Mary, pray for me\n'
            'that today I may not think any evil thing about Your Son.\n'
            'Guard my heart, and obtain for me the grace of purity.\n\n'
            'Hail Mary, full of grace, the Lord is with thee.\n'
            'Blessed art thou among women, and blessed is the fruit of thy womb, Jesus.\n'
            'Holy Mary, Mother of God, pray for us sinners,\n'
            'now and at the hour of our death. Amen.\n\n'
            'Holy Virgin Mary, pray for me\n'
            'that today I may not speak any evil thing about Your Son.\n'
            'Guard my mouth, and obtain for me the grace of purity.\n\n'
            'Hail Mary, full of grace, the Lord is with thee.\n'
            'Blessed art thou among women, and blessed is the fruit of thy womb, Jesus.\n'
            'Holy Mary, Mother of God, pray for us sinners,\n'
            'now and at the hour of our death. Amen.\n\n'
            'Holy Virgin Mary, pray for me\n'
            'that today I may not do any evil thing against Your Son.\n'
            'Obtain for me the strength and love of Christ.\n\n'
            'Hail Mary, full of grace, the Lord is with thee.\n'
            'Blessed art thou among women, and blessed is the fruit of thy womb, Jesus.\n'
            'Holy Mary, Mother of God, pray for us sinners,\n'
            'now and at the hour of our death. Amen.',
        contentAm:
        'ቅድስት ድንግል ማርያም ሆይ፥ ስለ ልጅሽ ዛሬ እኔ ክፉ ነገር እንዳላስብ\n'
            'ልቤን እንድጠብቅ ፀጋን ለምኝልኝ።\n\n'
            'ፀጋ የመላሽ ማርያም ሆይ…\n\n'
            'ቅድስት ድንግል ማርያም ሆይ፥ ስለ ልጅሽ ዛሬ ክፉ ነገር እንዳልናገር\n'
            'አፌን እንድጠብቅ ፀጋን ለምኝልኝ።\n\n'
            'ፀጋ የመላሽ ማርያም ሆይ…\n\n'
            'ቅድስት ድንግል ማርያም ሆይ፥ ስለ ልጅሽ ዛሬ ክፉ ነገር እንዳልሠራ\n'
            'ከክርስቶስ ኃይልና ፍቅርን ለኔ ለምኝልኝ።\n\n'
            'ፀጋ የመላሽ ማርያም ሆይ…',
        imagePath: 'assets/img_11.png',
      ),
    ],

// -------------------------------------------------------------------------
// 31. LITANY OF OUR LADY
// -------------------------------------------------------------------------
    'Litany of Our Lady': [
      PrayerStep(
        sectionHeader: 'LITANY OF OUR LADY',
        sectionHeaderAm: 'የእመቤታችን ሊጣንያ',
        titleEn: 'Litany of Our Lady',
        titleAm: 'የእመቤታችን ሊጣንያ',
        contentEn:
        'Lord, have mercy on us.\n'
            'Christ, have mercy on us.\n'
            'Lord, have mercy on us.\n'
            'Christ, hear us.\n'
            'Christ, graciously hear us.\n\n'
            'God, the Father of Heaven, have mercy on us.\n'
            'God the Son, Redeemer of the world, have mercy on us.\n'
            'God, the Holy Spirit, have mercy on us.\n'
            'Holy Trinity, one God, have mercy on us.\n\n'
            'Holy Mary, pray for us.\n'
            'Holy Mother of God, pray for us.\n'
            'Holy Virgin of virgins, pray for us.\n'
            'Mother of Christ, pray for us.\n'
            'Mother of divine grace, pray for us.\n'
            'Mother most pure, pray for us.\n'
            'Mother most chaste, pray for us.\n'
            'Mother inviolate, pray for us.\n'
            'Mother undefiled, pray for us.\n'
            'Mother most amiable, pray for us.\n'
            'Mother most admirable, pray for us.\n'
            'Mother of good counsel, pray for us.\n'
            'Mother of our Creator, pray for us.\n'
            'Mother of our Savior, pray for us.\n'
            'Virgin most prudent, pray for us.\n'
            'Virgin most venerable, pray for us.\n'
            'Virgin most renowned, pray for us.\n'
            'Virgin most powerful, pray for us.\n'
            'Virgin most merciful, pray for us.\n'
            'Virgin most faithful, pray for us.\n'
            'Mirror of justice, pray for us.\n'
            'Seat of wisdom, pray for us.\n'
            'Cause of our joy, pray for us.\n'
            'Spiritual vessel, pray for us.\n'
            'Vessel of honor, pray for us.\n'
            'Singular vessel of devotion, pray for us.\n'
            'Mystical rose, pray for us.\n'
            'Tower of David, pray for us.\n'
            'Tower of ivory, pray for us.\n'
            'House of gold, pray for us.\n'
            'Ark of the covenant, pray for us.\n'
            'Gate of heaven, pray for us.\n'
            'Morning star, pray for us.\n'
            'Health of the sick, pray for us.\n'
            'Refuge of sinners, pray for us.\n'
            'Comforter of the afflicted, pray for us.\n'
            'Help of Christians, pray for us.\n'
            'Queen of angels, pray for us.\n'
            'Queen of patriarchs, pray for us.\n'
            'Queen of prophets, pray for us.\n'
            'Queen of apostles, pray for us.\n'
            'Queen of martyrs, pray for us.\n'
            'Queen of confessors, pray for us.\n'
            'Queen of virgins, pray for us.\n'
            'Queen of all saints, pray for us.\n'
            'Queen conceived without original sin, pray for us.\n'
            'Queen assumed into heaven, pray for us.\n'
            'Queen of the most holy Rosary, pray for us.\n'
            'Queen of peace, pray for us.\n\n'
            'Lamb of God, who takes away the sins of the world, spare us, O Lord.\n'
            'Lamb of God, who takes away the sins of the world, graciously hear us, O Lord.\n'
            'Lamb of God, who takes away the sins of the world, have mercy on us.\n\n'
            'Pray for us, O Holy Mother of God,\n'
            'that we may be made worthy of the promises of Christ.\n\n'
            'Let us pray.\n'
            'Almighty and everlasting God, who by the cooperation of the Holy Spirit prepared the body and soul of the glorious Virgin Mary to become a worthy dwelling for Your Son, grant that we who rejoice in her commemoration may, by her loving intercession, be delivered from present evils and from everlasting death.\n'
            'Through the same Christ our Lord.\n'
            'Amen.',
        contentAm:
        'ጌታ ሆይ - ማረን\n'
            'ክርስቶስ ሆይ - ማረን\n'
            'ጌታ ሆይ - ማረን\n'
            'ክርስቶስ ሆይ - ስማን\n'
            'ክርስቶስ ሆይ - አድምጠን\n\n'
            'ሰማያዊ አብ አምላክ ሆይ - ማረን\n'
            'መድኃኔዓለም ወልድ አምላክ ሆይ - ማረን\n'
            'መንፈስ ቅዱስ አምላክ ሆይ - ማረን\n'
            'ቅድስት ሥላሴ አንድ አምላክ ሆይ - ማረን\n\n'
            'ቅድስት ማርያም ሆይ - ለምኝልን\n'
            'ቅድስት የአምላክ እናት ሆይ - ለምኝልን\n'
            'ቅድስት የድንግሎች ድንግል ሆይ - ለምኝልን\n'
            'የክርስቶስ እናት ሆይ - ለምኝልን\n'
            'የአምላካዊ ጸጋ እናት ሆይ - ለምኝልን\n'
            'እጅግ የጠራሽ እናት ሆይ - ለምኝልን\n'
            'እጅግ ንጽሕት እናት ሆይ - ለምኝልን\n'
            'የምተወደጂ እናት ሆይ - ለምኝልን\n'
            'የምትደነቂ እናት ሆይ - ለምኝልን\n'
            'የመልካም ምክር እናት ሆይ - ለምኝልን\n'
            'የፈጣሪ እናት ሆይ - ለምኝልን\n'
            'የመድኃኔዓለም እናት ሆይ - ለምኝልን\n'
            'እጅግ ጥበበኛ ድንግል ሆይ - ለምኝልን\n'
            'ክብር የሚገባሽ ድንግል ሆይ - ለምኝልን\n'
            'ምስጋና የሚገባሽ ድንግል ሆይ - ለምኝልን\n'
            'የምትራሪ ድንግል ሆይ - ለምኝልን\n'
            'የጽድቅ መስተዋት ሆይ - ለምኝልን\n'
            'የጥበብ ወንበር ሆይ - ለምኝልን\n'
            'የደስታችን ምክንያት ሆይ - ለምኝልን\n'
            'ምስጢራዊት ጽጌረዳ ሆይ - ለምኝልን\n'
            'የኪዳን ታቦት ሆይ - ለምኝልን\n'
            'የሰማይ ደጃፍ ሆይ - ለምኝልን\n'
            'አጥቢያ ኮከብ ሆይ - ለምኝልን\n'
            'የበሽተኞች ፈውስ ሆይ - ለምኝልን\n'
            'የዳዊት ግንብ ሆይ - ለምኝልን\n'
            'የዝሆን ጥርስ ግንብ ሆይ - ለምኝልን\n'
            'የወርቅ ቤት ሆይ - ለምኝልን\n'
            'የኃጢአተኞች መማጠኛ ሆይ - ለምኝልን\n'
            'የሐዘንተኞች አፅናኝ ሆይ - ለምኝልን\n'
            'የክርስቲያኞች ረዳት ሆይ - ለምኝልን\n'
            'የመላእክት ንግሥት ሆይ - ለምኝልን\n'
            'የአባቶች ንግሥት ሆይ - ለምኝልን\n'
            'የነቢያት ንግሥት ሆይ - ለምኝልን\n'
            'የሐዋርያት ንግሥት ሆይ - ለምኝልን\n'
            'የሰማእታት ንግሥት ሆይ - ለምኝልን\n'
            'የጻድቃን ንግሥት ሆይ - ለምኝልን\n'
            'የድንግሎች ንግሥት ሆይ - ለምኝልን\n'
            'የምዕመናን ንግሥት ሆይ - ለምኝልን\n'
            'የቅዱሳን ሁሉ ንግሥት ሆይ - ለምኝልን\n'
            'ያለአዳም ኃጢአት የተጸነሽ ንግሥት ሆይ - ለምኝልን\n'
            'ወደ ሰማይ የወጣሽ ንግሥት ሆይ - ለምኝልን\n'
            'የሰላም ንግሥት ሆይ - ለምኝልን\n\n'
            'የዓለምን ኃጢአት የምታጠፋ የእግዚአብሔር በግ ሆይ - ራራልን\n'
            'የዓለምን ኃጢአት የምታጠፋ የእግዚአብሔር በግ ሆይ - አድምጠን\n'
            'የዓለምን ኃጢአት የምታጠፋ የእግዚአብሔር በግ ሆይ - ማረን\n\n'
            'ቅድስት የአምላክ እናት ሆይ - ለምኝልን፥\n'
            'ክርስቶስ ለሰጠን ተስፋ የተገባን እንድንሆን።\n\n'
            'እንጸልይ።\n'
            'እግዚአብሔር አምላክ ሆይ፥ ለነፍሳችንና ለሥጋችን በሚሆን ጤና ዘወትር ደስ እንዲለን፥\n'
            'በተመሰገነችው ዘወትር ድንግል በሆነችው በእመቤታችን ማርያም በከበረው አማላጅነቷ፥\n'
            'ከዚህ ዓለም ሀዘን እንድንድንና የዘለዓለምን ደስታ እንድናገኝ ለኛ ለአገልጋዮችህ አድርግልን ብለን በጌታችን ኢየሱስ ክርስቶስ ስም እንለምናሃለን።\n'
            'አሜን።',
        imagePath: 'assets/img.png',
      ),
    ],

    // -------------------------------------------------------------------------
// 30. PRAYER TO ST. JOSEPH
// -------------------------------------------------------------------------
    'Prayer to St. Joseph': [
      PrayerStep(
        sectionHeader: 'PETITION TO ST. JOSEPH',
        sectionHeaderAm: 'ጸሎት ወደ ቅዱስ ዮሴፍ',
        titleEn: 'Prayer to St. Joseph',
        titleAm: 'ጸሎት ወደ ቅዱስ ዮሴፍ',
        contentEn:
        'To you, O blessed Joseph, do we come in our afflictions,\n'
            'and having implored the help of your most holy Spouse,\n'
            'we confidently invoke your patronage also.\n\n'
            'Through that charity which bound you to the Immaculate Virgin Mother of God,\n'
            'and through the paternal love with which you embraced the Child Jesus,\n'
            'we humbly beg you graciously to regard the inheritance\n'
            'which Jesus Christ has purchased by His Blood,\n'
            'and with your power and strength to aid us in our necessities.\n\n'
            'O most watchful Guardian of the Holy Family,\n'
            'defend the chosen children of Jesus Christ.\n'
            'O most loving Father, ward off from us every contagion of error and corrupting influence.\n'
            'O our most mighty Protector, be kind to us,\n'
            'and from heaven assist us in our struggle with the power of darkness.\n\n'
            'As once you rescued the Child Jesus from deadly peril,\n'
            'so now protect God’s Holy Church\n'
            'from the snares of the enemy and from all adversity.\n'
            'Shield each one of us by your constant protection,\n'
            'so that, supported by your example and your help,\n'
            'we may be able to live piously, to die holy,\n'
            'and to obtain eternal happiness in heaven.\n'
            'Amen.\n\n'
            'Pray for us, O most watchful Guardian of the Holy Family,\n'
            'O chaste guardian of the Virgin Mary, and foster father of Jesus Christ.',
        contentAm:
        'ቅዱስ ዮሴፍ ሆይ፥ በጭንቃችን ጊዜ ወዳንተ እንማጠናለን።\n'
            'የቅድስት እጮኛህንና ያንተንም እርዳታ እንለምናለን።\n'
            'ከንጽሕት ድንግል የአምላክ እናት ጋር አንተን ባጋጠመና ሕፃኑን ኢየሱስን በወደድህበት በአባትነት ፍቅር፥\n'
            'ኢየሱስ ክርስቶስ በደሙ የገዛትን ርስት፥\n'
            'እባክህ በመልካም ዓይን ተመልከታት፤\n'
            'በችግራችንም ጊዜ ኃይልህና እርዳታህ አይለየን።\n\n'
            'የቅድስት ቤተ ሰብ ትጉ ጠባቂ ሆይ፥ የተመረጡትን የኢየሱስ ክርስቶስን ትውልድ ጠብቃት።\n'
            'እጅግ ተወዳጅ አባት ሆይ፥ ዓለምን የሚያሠቃይ የስሕተትና የመጥፎ አመል በሽታን ከኛ ወዲያ አስወግድልን።\n'
            'ብርቱ ጠባቂያችን ሆይ፥ ከሰይጣን ጋር በምናደርገው ውጊያ በሰማይ ሆነህ ራርተህ እርዳን።\n\n'
            'ቀድሞ የሕፃኑን የኢየሱስን ሕይወት ከሄሮድስ እጅ ከሞት አደጋ እንደ አዳንህ፥\n'
            'እንዲሁም አሁን የአምላክን ቅድስት ቤተ ክርስቲያን ከጠላት ውርጃና ከክፉ ነገር ሁሉ ሠውራት።\n\n'
            'እኛም አብነትህን ተከትለን እርዳታህንም ተመርኩዘን፥\n'
            'በቅድስና መኖር፥ በመንፈሳዊነት መሞትና በሰማይም የዘለዓለምን ደስታ መውረስ እንድንችል፥\n'
            'የዘወትር ጥበቃህ አይለየን።\n'
            'አሜን።\n\n'
            'የጌታችን የኢየሱስ ክርስቶስ ትጉ አሳዳጊና የእመቤታችን የድንግል ማርያም ንጹሕ ጠባቂ ቅዱስ ዮሴፍ ሆይ፥ ለምንልን።',
        imagePath: 'assets/img_12.png',
      ),
    ],

// -------------------------------------------------------------------------
// 31. THE LITANY OF SAINTS
// -------------------------------------------------------------------------
    'The Litany of Saints': [
      PrayerStep(
        sectionHeader: 'OPENING INVOCATION',
        sectionHeaderAm: 'የመግቢያ ምልጃ',
        titleEn: 'The Litany of Saints',
        titleAm: 'የቅዱሳን ሊጣንያ',
        contentEn:
        'Lord, have mercy on us.\n'
            'Christ, have mercy on us.\n'
            'Lord, have mercy on us.\n'
            'Christ, hear us.\n'
            'Christ, graciously hear us.\n\n'
            'God, the Father of Heaven, have mercy on us.\n'
            'God the Son, Redeemer of the world, have mercy on us.\n'
            'God, the Holy Spirit, have mercy on us.\n'
            'Holy Trinity, one God, have mercy on us.\n\n'
            'Holy Mary, pray for us.\n'
            'Holy Mother of God, pray for us.\n'
            'Holy Virgin of virgins, pray for us.\n'
            'Saint Michael, pray for us.\n'
            'Saint Gabriel, pray for us.\n'
            'Saint Raphael, pray for us.\n'
            'All holy Angels and Archangels, pray for us.\n'
            'All holy orders of blessed Spirits, pray for us.\n'
            'Saint John the Baptist, pray for us.\n'
            'Saint Joseph, pray for us.\n'
            'Saints Peter and Paul, pray for us.\n'
            'Saint Andrew, pray for us.\n'
            'Saints James and John, pray for us.\n'
            'Saint Thomas, pray for us.\n'
            'Saint James, pray for us.\n'
            'Saint Philip, pray for us.\n'
            'Saint Bartholomew, pray for us.\n'
            'Saints Simon and Jude, pray for us.\n'
            'Saint Matthew, pray for us.\n'
            'Saint Matthias, pray for us.\n'
            'Saint Barnabas, pray for us.\n'
            'Saint Luke, pray for us.\n'
            'Saint Mark, pray for us.\n'
            'All holy Apostles and Evangelists, pray for us.\n'
            'All holy Disciples of the Lord, pray for us.\n'
            'All holy Innocents, pray for us.\n'
            'Saint Stephen, pray for us.\n'
            'Saint Lawrence, pray for us.\n'
            'Saints Chrysanthus and Daria, pray for us.\n'
            'Saints John and Paul, pray for us.\n'
            'Saints Cosmas and Damian, pray for us.\n'
            'Saints Gervase and Protase, pray for us.\n'
            'All holy Martyrs, pray for us.\n'
            'Saint Sylvester, pray for us.\n'
            'Saint Gregory, pray for us.\n'
            'Saint Ambrose, pray for us.\n'
            'Saint Augustine, pray for us.\n'
            'Saint Jerome, pray for us.\n'
            'Saint Martin, pray for us.\n'
            'Saint Nicholas, pray for us.\n'
            'All holy Bishops and Confessors, pray for us.\n'
            'All holy Priests and Levites, pray for us.\n'
            'All holy Monks and Hermits, pray for us.\n'
            'Saint Mary Magdalene, pray for us.\n'
            'Saint Agatha, pray for us.\n'
            'Saint Lucy, pray for us.\n'
            'Saint Agnes, pray for us.\n'
            'Saint Cecilia, pray for us.\n'
            'Saint Catherine, pray for us.\n'
            'Saint Anastasia, pray for us.\n'
            'All holy Virgins and Widows, pray for us.\n'
            'All holy Saints of God, pray for us.\n\n'
            'Be merciful, spare us, O Lord.\n'
            'Be merciful, graciously hear us, O Lord.\n\n'
            'From all evil, deliver us, O Lord.\n'
            'From every sin, deliver us, O Lord.\n'
            'From everlasting death, deliver us, O Lord.\n'
            'Through the mystery of Your holy Incarnation, deliver us, O Lord.\n'
            'Through Your coming, deliver us, O Lord.\n'
            'Through Your Birth, deliver us, O Lord.\n'
            'Through Your Baptism and holy Fasting, deliver us, O Lord.\n'
            'Through Your Cross and Passion, deliver us, O Lord.\n'
            'Through Your Death and Burial, deliver us, O Lord.\n'
            'Through Your holy Resurrection, deliver us, O Lord.\n'
            'Through Your admirable Ascension, deliver us, O Lord.\n'
            'Through the coming of the Holy Spirit, the Paraclete, deliver us, O Lord.\n'
            'In the day of Judgment, deliver us, O Lord.\n\n'
            'We sinners, we beg You to hear us.\n'
            'That You may spare us, we beg You to hear us.\n'
            'That You may pardon us, we beg You to hear us.\n'
            'That You may bring us to true penance, we beg You to hear us.\n'
            'That You may govern and preserve Your holy Church, we beg You to hear us.\n'
            'That You may preserve the Pope and all orders in the Church in holy religion, we beg You to hear us.\n'
            'That You may humble the enemies of Your holy Church, we beg You to hear us.\n'
            'That You may give peace and true concord to Christian kings and rulers, we beg You to hear us.\n'
            'That You may grant peace and unity to all Christian people, we beg You to hear us.\n'
            'That You may bring back to the unity of the Church all who have strayed from the truth, and lead all unbelievers to the light of the Gospel, we beg You to hear us.\n'
            'That You may confirm and preserve us in Your holy service, we beg You to hear us.\n'
            'That You may lift up our minds to heavenly desires, we beg You to hear us.\n'
            'That You may render everlasting blessings to all our benefactors, we beg You to hear us.\n'
            'That You may deliver our souls and the souls of our brethren, relatives, and benefactors from eternal damnation, we beg You to hear us.\n'
            'That You may give and preserve the fruits of the earth, we beg You to hear us.\n'
            'That You may grant eternal rest to all the faithful departed, we beg You to hear us.\n'
            'That You may graciously hear us, we sinners, we beg You to hear us.\n\n'
            'Son of God, we beg You to hear us.\n\n'
            'Lamb of God, who takes away the sins of the world, spare us, O Lord.\n'
            'Lamb of God, who takes away the sins of the world, graciously hear us, O Lord.\n'
            'Lamb of God, who takes away the sins of the world, have mercy on us.\n\n'
            'Christ, hear us.\n'
            'Christ, graciously hear us.\n\n'
            'Let us pray.\n'
            'Almighty and everlasting God, who have dominion over the living and the dead and are merciful to all whom You foresee will be Yours through faith and works of mercy, we humbly beseech You that all for whom we are mindful to pray, whether in this present world or in the world to come, may by the intercession of all Your Saints obtain the remission of all their sins.\n'
            'Through our Lord Jesus Christ, Your Son, who lives and reigns with You in the unity of the Holy Spirit, God, forever and ever.\n'
            'Amen.',
        contentAm:
        'ጌታ ሆይ - ማረን\n'
            'ክርስቶስ ሆይ - ማረን\n'
            'ጌታ ሆይ - ማረን\n'
            'ክርስቶስ ሆይ - ስማን\n'
            'ክርስቶስ ሆይ - አድምጠን\n\n'
            'ሰማያዊ አብ አምላክ ሆይ - ማረን\n'
            'መድኃኔዓለም ወልድ አምላክ ሆይ - ማረን\n'
            'መንፈስ ቅዱስ አምላክ ሆይ - ማረን\n'
            'ቅድስት ሥላሴ አንድ አምላክ ሆይ - ማረን\n\n'
            'ቅድስት ማርያም ሆይ - ለምኝልን\n'
            'ቅድስት የአምላክ እናት ሆይ - ለምኝልን\n'
            'ቅድስት የድንግሎች ድንግል ሆይ - ለምኝልን\n'
            'ቅዱስ ሚካኤል ሆይ - ለምኝልን\n'
            'ቅዱስ ገብርኤል ሆይ - ለምኝልን\n'
            'ቅዱስ ሩፋኤል ሆይ - ለምኝልን\n'
            'ቅዱሳን መላእክትና አርአያት ሁሉ ሆይ - ለምኝልን\n'
            'ቅዱስ ዮሐንስ መጥምቁ ሆይ - ለምኝልን\n'
            'ቅዱስ ዮሴፍ ሆይ - ለምኝልን\n'
            'ቅዱሳን ጴጥሮስና ጳውሎስ ሆይ - ለምኝልን\n'
            'ቅዱስ ንድርያስ ሆይ - ለምኝልን\n'
            'ቅዱሳን ያዕቆብና ዮሐንስ ሆይ - ለምኝልን\n'
            'ቅዱስ ቶማስ ሆይ - ለምኝልን\n'
            'ቅዱስ ያዕቆብ ሆይ - ለምኝልን\n'
            'ቅዱስ ፊሊጶስ ሆይ - ለምኝልን\n'
            'ቅዱስ በርተሎሜዎስ ሆይ - ለምኝልን\n'
            'ቅዱሳን ስምዖንና ይሁዳ ሆይ - ለምኝልን\n'
            'ቅዱስ ማቴዎስ ሆይ - ለምኝልን\n'
            'ቅዱስ ማትያስ ሆይ - ለምኝልን\n'
            'ቅዱስ በርናባስ ሆይ - ለምኝልን\n'
            'ቅዱስ ሉቃስ ሆይ - ለምኝልን\n'
            'ቅዱስ ማርቆስ ሆይ - ለምኝልን\n'
            'ቅዱሳን ሐዋርያትና ወንጌላውያን ሁሉ ሆይ - ለምኝልን\n'
            'ቅዱሳን ደቀ መዛሙርት ሁሉ ሆይ - ለምኝልን\n'
            'ቅዱስ እስጢፋኖስ ሆይ - ለምኝልን\n'
            'ቅዱስ ላውርያኖስ ሆይ - ለምኝልን\n'
            'ቅዱሳን ስሮንስያኖስና ዳርያ ሆይ - ለምኝልን\n'
            'ቅዱሳን ዮሐንስና ጳውሎስ ሆይ - ለምኝልን\n'
            'ቅዱሳን ቆስጠንጢኖስና ዳምያኖስ ሆይ - ለምኝልን\n'
            'ቅዱሳን ጌርቫስዮስና ፕሮታስዮስ ሆይ - ለምኝልን\n'
            'ቅዱሳን ሰማእታት ሁሉ ሆይ - ለምኝልን\n'
            'ቅዱስ ሲልቬስተር ሆይ - ለምኝልን\n'
            'ቅዱስ ግሪጎሪዎስ ሆይ - ለምኝልን\n'
            'ቅዱስ አምብሮስ ሆይ - ለምኝልን\n'
            'ቅዱስ አውጎስጢኖስ ሆይ - ለምኝልን\n'
            'ቅዱስ ኢያርቆስ ሆይ - ለምኝልን\n'
            'ቅዱስ ማርቲኖስ ሆይ - ለምኝልን\n'
            'ቅዱስ ኒቆላዎስ ሆይ - ለምኝልን\n'
            'ቅዱሳን ጳጳሳትና እምነተኞች ሁሉ ሆይ - ለምኝልን\n'
            'ቅዱሳን ካህናትና ሌዋውያን ሁሉ ሆይ - ለምኝልን\n'
            'ቅዱሳን መነኮሳትና መነዘሮች ሁሉ ሆይ - ለምኝልን\n'
            'ቅድስት ማርያም ማግዳሌና ሆይ - ለምኝልን\n'
            'ቅድስት አጋታ ሆይ - ለምኝልን\n'
            'ቅድስት ሉሲ ሆይ - ለምኝልን\n'
            'ቅድስት አግነስ ሆይ - ለምኝልን\n'
            'ቅድስት ሴሲሊያ ሆይ - ለምኝልን\n'
            'ቅድስት ካትሪና ሆይ - ለምኝልን\n'
            'ቅድስት አናስታሲያ ሆይ - ለምኝልን\n'
            'ቅዱሳን ድንግሎትና መርያሞች ሁሉ ሆይ - ለምኝልን\n'
            'ቅዱሳን የእግዚአብሔር ቅዱሳን ሁሉ ሆይ - ለምኝልን\n\n'
            'ጌታ ሆይ - ማርነን፥ አባርነን\n'
            'ጌታ ሆይ - ማርነን፥ አድምጠን\n\n'
            'ከክፉ ሁሉ - አድነን ጌታ ሆይ\n'
            'ከኃጢአት ሁሉ - አድነን ጌታ ሆይ\n'
            'ከዘለለቀ ሞት - አድነን ጌታ ሆይ\n'
            'በቅዱስ ሥጋ ወነፍስ የተገለጥህ በሚስጥር - አድነን ጌታ ሆይ\n'
            'በመጣህ ጊዜ - አድነን ጌታ ሆይ\n'
            'በወለድህ - አድነን ጌታ ሆይ\n'
            'በጥምቀትህና በቅዱስ ጾምህ - አድነን ጌታ ሆይ\n'
            'በመስቀልህና በስቅለትህ - አድነን ጌታ ሆይ\n'
            'በሞትህና በተቀባርህ - አድነን ጌታ ሆይ\n'
            'በቅዱስ ኵርናትህ - አድነን ጌታ ሆይ\n'
            'በአስደናቂ ወጣትህ - አድነን ጌታ ሆይ\n'
            'በመንፈስ ቅዱስ ጰራቅሊጦስ መምጣት - አድነን ጌታ ሆይ\n'
            'በፍርድ ቀን - አድነን ጌታ ሆይ\n\n'
            'እኛ ኃጢአተኞች - እንለምናለን፥ ስማን\n'
            'እንድታባርነን - እንለምናለን፥ ስማን\n'
            'እንድትርሰን - እንለምናለን፥ ስማን\n'
            'ወደ እውነተኛ ንስሐ እንድታመጣን - እንለምናለን፥ ስማን\n'
            'ቅዱስን ቤተ ክርስቲያንህ እንድታስተዳድርና እንድታጠብ - እንለምናለን፥ ስማን\n'
            'ርዕሠ ሊቃነ ጳጳሳቱንና ሁሉንም ደረጃዎች በቅዱስ ሃይማኖት እንድታጠብ - እንለምናለን፥ ስማን\n'
            'የቅዱስ ቤተ ክርስቲያንህን ጠላቶች እንድታዋርድ - እንለምናለን፥ ስማን\n'
            'ለክርስቲያኖች ነገሥናትና መሪዎች ሰላምና እውነተኛ ወጥነት እንድትሰጥ - እንለምናለን፥ ስማን\n'
            'ለክርስቲያኖች ሁሉ ሰላምና ወንድማማክነት እንድትሰጥ - እንለምናለን፥ ስማን\n'
            'ከእውነት የተሳሳቱትን ወደ ቤተ ክርስቲያን ወንድማማክነት እንድትመልስ፥ አማኞችንም ወደ ወንጌል ብርሃን እንድታመጣ - እንለምናለን፥ ስማን\n'
            'በቅዱስ አገልግሎትህ እንድናጠናከርና እንድንጠብ - እንለምናለን፥ ስማን\n'
            'አሳባችንን ወደ ሰማያዊ ምኞት እንድታስነሳ - እንለምናለን፥ ስማን\n'
            'ለሁሉም ጠቅሚ ሰጪዎቻችን ዘለለቀ በረከት እንድትሰጥ - እንለምናለን፥ ስማን\n'
            'ነፍሳችንንና የወንድማማቾቻችንን፥ የዘመዶቻችንን፥ የጠቅሚ ሰጪዎቻችንን ነፍሶች ከዘለለቀ ቅጣት እንድታድን - እንለምናለን፥ ስማን\n'
            'የምድርን ፍሬ እንድትሰጥና እንድታጠብ - እንለምናለን፥ ስማን\n'
            'ለሁሉም እምነተኞች ሙታን የዘለለቀ እረፍት እንድትስጥ - እንለምናለን፥ ስማን\n'
            'እኛን ኃጢአተኞች በምሕረት እንድታዳምጠን - እንለምናለን፥ ስማን\n\n'
            'የአምላክ ወንድ ሆይ - እንለምናለን፥ ስማን\n\n'
            'የዓለምን ኃጢአት የሚያስወግድ የእግዚእ ጠንቋይ ሆይ - ጌታ ሆይ፥ አባርነን\n'
            'የዓለምን ኃጢአት የሚያስወግድ የእግዚእ ጠንቋይ ሆይ - ጌታ ሆይ፥ አድምጠን\n'
            'የዓለምን ኃጢአት የሚያስወግድ የእግዚእ ጠንቋይ ሆይ - ማረን\n\n'
            'ክርስቶስ ሆይ - ስማን\n'
            'ክርስቶስ ሆይ - አድምጠን\n\n'
            'እንጸልይ።\n'
            'ሁሉን ሕያውና ሙት የሚያስተዳድር፥ በእምነትና በምሕረት ሥራ ለራሱ የሚሆኑትን ሁሉ የሚያርፋቸው ሁሉን ቻይ ዘለለቀ አምላክ ሆይ፥ ለምንላቸው ለሆኑ ሁሉ፥ በዚህ ዓለም ሆነ በመጪው ዓለም፥ በቅዱሳንህ አማላጅነት ከኃጢአታቸው ሁሉ ስርየት እንዲያገኙ በርሃለን።\n'
            'በጌታችን በኢየሱስ ክርስቶስ በወንድህ በአብ ጋር በመንፈስ ቅዱስ ወሐድነት ሕያው የሆንህና የምትነግሥ አንተ ነህ።\n'
            'አሜን።',
        imagePath: 'assets/img_15.png',
      ),
    ],

// -------------------------------------------------------------------------
// 32. PRAYER OF ST. FRANCIS
// -------------------------------------------------------------------------
    'Prayer of St. Francis': [
      PrayerStep(
        sectionHeader: 'PETITION FOR PEACE',
        sectionHeaderAm: 'የሰላም ልመና',
        titleEn: 'Prayer of St. Francis',
        titleAm: 'የቅዱስ ፍራንቸስኮስ ጸሎት',
        contentEn:
        'Lord, make me an instrument of Your peace.\n'
            'Where there is hatred, let me sow love;\n'
            'where there is injury, pardon;\n'
            'where there is discord, union;\n'
            'where there is doubt, faith;\n'
            'where there is despair, hope;\n'
            'where there is darkness, light;\n'
            'and where there is sadness, joy.\n\n'
            'O Divine Master, grant that I may not so much seek\n'
            'to be consoled as to console;\n'
            'to be understood as to understand;\n'
            'to be loved as to love;\n'
            'for it is in giving that we receive,\n'
            'it is in pardoning that we are pardoned,\n'
            'and it is in dying that we are born to eternal life.\n'
            'Amen.',
        contentAm:
        'ጌታ ሆይ የሰላም መሳሪያ እንድሆን አድርገኝ፤\n'
            'ጥል ባለበት ፍቅር፣\n'
            'በደል ባለበት ይቅርታ፣\n'
            'ክርክር ባለበት ስምምነት፣\n'
            'ጥርጣሬ ባለበት እምነት፣\n'
            'ስህተት ባለበት እውነት፣\n'
            'ተስፋ መቁረጥ ባለበት መጽናናት፣\n'
            'ሐዘን ባለበት ደስታ፣\n'
            'ጨለማ ባለበት ብርሃን እንዲገኝ አደርግ ዘንድ አብቃኝ።\n\n'
            'ጌታ ሆይ፥\n'
            'ከመጽናናት ማጽናናት፥\n'
            'ከመግባባት ማግባባት፥\n'
            'ከመወደድ መውደድ፥\n'
            'ከመቀበል መስጠት፥\n'
            'ይቅር ለመባል ይቅር ማለት፥\n'
            'የዘለዓለም ሕይወት ለማግኘት መሞት እንዳለብኝ ለማወቅ እርዳኝ።\n'
            'አሜን።',
        imagePath: 'assets/francis.jpg',
      ),
    ],

// -------------------------------------------------------------------------
// 33. PRAYER FOR THE HOLY FATHER
// -------------------------------------------------------------------------
    'Prayer for the Holy Father': [
      PrayerStep(
        sectionHeader: 'PRAYER FOR THE POPE',
        sectionHeaderAm: 'ለርዕሠ ሊቃነ ጳጳሳታችን ጸሎት',
        titleEn: 'Prayer for the Holy Father',
        titleAm: 'ለርዕሠ ሊቃነ ጳጳሳታችን ጸሎት',
        contentEn:
        'O God, Shepherd and Ruler of all the faithful,\n'
            'look favorably upon Your servant Leo,\n'
            'whom You have set at the head of Your Church as her shepherd.\n'
            'Grant, we pray, that by word and example\n'
            'he may be of service to those over whom he presides,\n'
            'so that, together with the flock entrusted to his care,\n'
            'he may come to everlasting life.\n'
            'Amen.',
        contentAm:
        'እግዚአብሔር ሆይ፥ የምእመናንህ ሁሉ እረኛና መሪ፥\n'
            'የቤተ ክርስቲያንህን እረኛ የሆነውን አገልጋይህን ሊዮን በምሕረት ተመልከት።\n'
            'በቃሉም ሆነ በተግባሩ ለሚመራቸው ሁሉ አገልግሎት\n'
            'እንዲያበረክት፥\n'
            'እሱም ከተሰጠው መንጠቅ ጋር\n'
            'ወደ ዘለለቀ ሕይወት እንዲደርስ አድርግልን።\n'
            'አሜን።',
        imagePath: 'assets/father.jpg',
      ),
    ],

// -------------------------------------------------------------------------
// 34. PRAYER TO THE HOLY FAMILY
// -------------------------------------------------------------------------
    'Prayer to the Holy Family': [
      PrayerStep(
        sectionHeader: 'CONSECRATION TO THE HOLY FAMILY',
        sectionHeaderAm: 'ወደ ቅድስት ቤተሰብ ጸሎት',
        titleEn: 'Prayer to the Holy Family',
        titleAm: 'ወደ ቅድስት ቤተሰብ ጸሎት',
        contentEn:
        'Jesus, Mary, and Joseph,\n'
            'I give You my heart, my soul, and my life.\n'
            'Jesus, Mary, and Joseph,\n'
            'help me in my final hour.\n'
            'Jesus, Mary, and Joseph,\n'
            'may I breathe forth my soul in peace with You.\n'
            'Amen.',
        contentAm:
        'ኢየሱስ፥ ማርያም፥ ዮሴፍ፥ ልቤን፥ ነፍሴን፥ ሕይወቴን እሰጣችኋለሁ።\n'
            'ኢየሱስ፥ ማርያም፥ ዮሴፍ፥ በሞት ጊዜ እርዱኝ።\n'
            'ኢየሱስ፥ ማርያም፥ ዮሴፍ፥ በእጃችሁ በሰላም ልሙት።\n'
            'አሜን።',
        imagePath: 'assets/holy family.jpg',
      ),
    ],

// -------------------------------------------------------------------------
// 35. ETERNAL REST (PRAYER FOR THE DEAD)
// -------------------------------------------------------------------------
    'Eternal Rest (Prayer for the Dead)': [
      PrayerStep(
        sectionHeader: 'PRAYER FOR THE DEPARTED',
        sectionHeaderAm: 'ለሙታን የሚደረግ ጸሎት',
        titleEn: 'Eternal Rest',
        titleAm: 'የዕረፍተ ነፍስ ጸሎት',
        contentEn:
        'Eternal rest grant unto them, O Lord,\n'
            'and let perpetual light shine upon them.\n'
            'May they rest in peace.\n'
            'Amen.',
        contentAm:
        'ጌታ ሆይ፥ ለሙታን የዘላለም ዕረፍት ስጣቸው፤\n'
            'የዘላለምን ብርሃን አብራላቸው፤\n'
            'በሰላም አሳርፋቸው።\n'
            'አሜን።',
        imagePath: 'assets/Holy Mass.jpg',
      ),
    ],

// -------------------------------------------------------------------------
// 36. PRAYER OF ABANDONMENT
// -------------------------------------------------------------------------
    'Prayer of Abandonment': [
      PrayerStep(
        sectionHeader: 'SURRENDER TO GOD',
        sectionHeaderAm: 'እጅ መስጠት እና መታመን',
        titleEn: 'Prayer of Abandonment',
        titleAm: 'የእጅ መስጠት ጸሎት',
        contentEn:
        'Father, I abandon myself into Your hands;\n'
            'do with me what You will.\n'
            'Whatever You may do, I thank You.\n'
            'I am ready for all; I accept all.\n'
            'Let only Your will be done in me,\n'
            'and in all Your creatures.\n'
            'Amen.',
        contentAm:
        'አባት ሆይ፥ ራሴን ሙሉ በሙሉ በእጆችህ አደራ እሰጣለሁ፤\n'
            'የፈቀድከውን አድርግብኝ።\n'
            'ስለምታደርገውም ሁሉ አመሰግናለሁ፤\n'
            'ለሁሉም ዝግጁ ነኝ።\n'
            'ፈቃድህ ብቻ በእኔ ላይ ይሁን።\n'
            'አሜን።',
        imagePath: 'assets/father.jpg',
      ),
    ],

// -------------------------------------------------------------------------
// 37. PRAYER OF ST. AUGUSTINE
// -------------------------------------------------------------------------
    'Prayer of St. Augustine': [
      PrayerStep(
        sectionHeader: 'DEVOTION',
        sectionHeaderAm: 'መነሳትና ፍቅር',
        titleEn: 'Prayer of St. Augustine',
        titleAm: 'የቅዱስ አውጎስጢኖስ ጸሎት',
        contentEn:
        'Lord Jesus, let me know myself and know You,\n'
            'and desire nothing save only You.\n'
            'Let me hate myself and love You.\n'
            'Let me do all things for the sake of You,\n'
            'and deny myself for the sake of You,\n'
            'because You, and not any other good, are my supreme good.\n'
            'Amen.',
        contentAm:
        'ጌታ ኢየሱስ ሆይ፥ ራሴን እንድያውቅና አንተን እንድያውቅ፥\n'
            'ከአንተ በቀር ምንም እንዳልመኝ አድርገኝ።\n'
            'ራሴን እንድጠላና አንተን እንድወድ አድርገኝ።\n'
            'ሁሉንም ሥራ ለአንተ ፈቃድ እንድደርግ፥\n'
            'ራሴንም ለአንተ ፈቃድ እንድካድ አድርገኝ፤\n'
            'ምክንያቱም አንተ ብቻ ከሁሉ የላቀ የእኔ መልካም ነህ።\n'
            'አሜን።',
        imagePath: 'assets/sunrise.jpeg',
      ),
    ],

    // -------------------------------------------------------------------------
    // 36. PRAYER OF ABANDONMENT
    // -------------------------------------------------------------------------
    'Prayer of Abandonment': [
      PrayerStep(
        sectionHeader: 'SURRENDER TO GOD',
        sectionHeaderAm: 'እጅ መስጠት እና መታመን',
        titleEn: 'Prayer of Abandonment',
        titleAm: 'የእጅ መስጠት ጸሎት',
        contentEn: 'Father, I abandon myself into your hands; do with me what you will. Whatever you may do, I thank you: I am ready for all, I accept all. Let only your will be done in me, and in all your creatures... Amen.',
        contentAm: 'አባት ሆይ፣ ራሴን ሙሉ በሙሉ በእጆችህ አደራ እሰጣለሁ፤ የፈቀድከውን አድርግብኝ። ስለምታደርገውም ሁሉ አመሰግናለሁ፤ ለሁሉም ዝግጁ ነኝ። ፈቃድህ ብቻ በእኔ ላይ ይሁን። አሜን።',
        imagePath: 'assets/father.jpg',
      ),
    ],

    // -------------------------------------------------------------------------
    // 37. PRAYER OF ST. AUGUSTINE
    // -------------------------------------------------------------------------
    'Prayer of St. Augustine': [
      PrayerStep(
        sectionHeader: 'DEVOTION',
        sectionHeaderAm: 'መነሳትና ፍቅር',
        titleEn: 'Prayer of St. Augustine',
        titleAm: 'የቅዱስ አውጎስጢኖስ ጸሎት',
        contentEn: 'Lord Jesus, let me know myself and know you and desire nothing save only you. Amen.',
        contentAm: 'ጌታ ኢየሱስ ሆይ፣ ራሴን እንድያውቅና አንተን እንድያውቅ፣ ከአንተ በቀር ምንም እንዳልመኝ አድርገኝ። አሜን።',
        imagePath: 'assets/sunrise.jpeg',
      ),
    ],
  };

  /// Retrieves steps for a given prayer key and enforces background image mapping
  static List<PrayerStep> getPrayer(String key) {
    final normalizedKey = key.trim().toLowerCase();
    final imageAsset = getImagePath(key);

    String searchKey = normalizedKey;
    if (searchKey == 'hour of mercy' ||
        searchKey == 'the hour of mercy' ||
        searchKey == 'የምሕረት ሰዓት ጸሎት') {
      searchKey = 'prayer for the hour of mercy';
    }

    final entry = masterPrayerDB.entries.firstWhere(
          (e) =>
      e.key.trim().toLowerCase() == searchKey ||
          e.value.any((step) =>
          step.titleEn.trim().toLowerCase() == searchKey ||
              step.titleAm.trim().toLowerCase() == searchKey),
      orElse: () => MapEntry(
        key,
        [
          PrayerStep(
            sectionHeader: 'PRAYER',
            sectionHeaderAm: 'ጸሎት',
            titleEn: key,
            titleAm: key,
            contentEn:
            'Opening prayer for $key...\n\nLord, hear our prayer. Amen.',
            contentAm: 'የቀን ጸሎት ለ $key...\n\nአምላክ ሆይ፣ ጸሎታችንን ስማ። አሜን።',
            imagePath: imageAsset,
          ),
        ],
      ),
    );

    return entry.value
        .map((step) => PrayerStep(
      sectionHeader: step.sectionHeader,
      sectionHeaderAm: step.sectionHeaderAm,
      titleEn: step.titleEn,
      titleAm: step.titleAm,
      contentEn: step.contentEn,
      contentAm: step.contentAm,
      imagePath: imageAsset,
    ))
        .toList();
  }
}