import 'package:operation_001/prayer_model.dart';

class PrayerData {
  /// Static helper to map prayer titles to their specific artwork background assets
  static String getImagePath(String title) {
    switch (title.trim().toLowerCase()) {
      case 'act of contrition':
        return 'assets/img_2.png';
      case 'the morning offering':
        return 'assets/sunrise.jpeg';
      case 'prayer of st. francis':
      case 'prayer to st. francis of assisi':
        return 'assets/francis.jpg';
      case 'the guardian angel prayer':
        return 'assets/guardian angel.jpg';
      case 'angelus':
        return 'assets/img_1.png';
      case 'prayer for the hour of mercy':
      case 'jesus, i trust in you':
        return 'assets/img_5.png';
      case 'prayer to st. michael the archangel':
        return 'assets/img_4.png';
      case 'divine mercy chaplet':
      case 'rosary':
        return 'assets/img_6.png';
      case 'anima christi':
        return 'assets/anima christi vip.jpg';
      case 'litany of the holy name of jesus':
        return 'assets/img_16.png';
      case 'come, holy spirit':
        return 'assets/img_17.png';
      case 'prayer of abandonment':
      case 'prayer for the holy father':
        return 'assets/father.jpg';
      case 'prayer to saint joseph':
      case 'prayer for families':
        return 'assets/img_12.png';
      case 'traditional evening prayer':
        return 'assets/img_10.png';
      case 'st. patrick\'s breastplate':
        return 'assets/francis.jpg';
      case 'visit we beseech thee':
      case 'psalm 51 (miserere)':
        return 'assets/img_2.png';
      case 'sub tuum praesidium':
        return 'assets/img_1.png';
      case 'te deum':
      case 'the benedictus':
      case 'the magnificat':
      case 'the memorare':
      case 'hail holy queen':
      case 'prayer of st. augustine':
      case 'glory be':
      default:
        return 'assets/sunrise.jpeg';
    }
  }

  static final Map<String, List<PrayerStep>> masterPrayerDB = {
    'The Morning Offering': [
      PrayerStep(
        sectionHeader: 'READING FOCUS',
        titleEn: 'The Morning Offering',
        titleAm: 'የጠዋት መስዋዕት',
        contentEn:
        'O Jesus, through the Immaculate Heart of Mary, I offer You my prayers, works, joys and sufferings of this day for all the intentions of Your Sacred Heart,',
        contentAm:
        'እግዚአብሔር፣ የኢየሱስ ልብ፣ ያለ አዳም ኃጢአት የተጸነስች እንዲሁም የቤተክርስቲያን እናት በሆነችዉ በማርያም በኩል፣',
        imagePath: 'assets/sunrise.jpeg',
      ),
      PrayerStep(
        sectionHeader: 'INVOCATION',
        titleEn: 'The Morning Offering',
        titleAm: 'የጠዋት መስዋዕት',
        contentEn:
        'in union with the Holy Sacrifice of the Mass throughout the world, in reparation for my sins, for the intentions of all my relatives and friends,',
        contentAm:
        'በቅዱስ ቁርባን መስዋዕት በኩል፣ ልመናዎቼን ሥራዎቼን ተስፋዎቼንና የዛሬ ቀን መከራዎቼን ለወንዶችና ለሴቶች፣',
        imagePath: 'assets/sunrise.jpeg',
      ),
      PrayerStep(
        sectionHeader: 'FINAL PETITION',
        titleEn: 'The Morning Offering',
        titleAm: 'የጠዋት መስዋዕት',
        contentEn:
        'and in particular for the intentions of the Holy Father. Amen.',
        contentAm: 'ለሰው ልጆች ሁሉ ደህንነትና ለኃጢአቶች ካሣ እንዲሆን አቀርባለሁ፡፡ አሜን፡፡',
        imagePath: 'assets/sunrise.jpeg',
      ),
    ],
    'Hail Holy Queen': [
      PrayerStep(
        sectionHeader: 'READING FOCUS',
        titleEn: 'Hail Holy Queen',
        titleAm: 'ሰላም ለኪ እመቤታችን',
        contentEn:
        'Hail, Holy Queen, Mother of Mercy, our life, our sweetness and our hope. To thee do we cry, poor banished children of Eve.',
        contentAm:
        'የምህረት እናት ንግስት ሆይ ሰላም ለአንቺ ይሁን፤ ህይወታችን፣ ጣፋጭነታችንና ተስፋችን ሆይ ሰላም ለአንቺ ይሁን። የተሰደድነው የሔዋን ልጆች ወደ አንቺ እንጮኻለን።',
        imagePath: 'assets/sunrise.jpeg',
      ),
      PrayerStep(
        sectionHeader: 'INVOCATION',
        titleEn: 'Hail Holy Queen',
        titleAm: 'ሰላም ለኪ እመቤታችን',
        contentEn:
        'To thee do we send up our sighs, mourning and weeping in this valley of tears.',
        contentAm:
        'በዚህ በሐዘንና በእንባ ሸለቆ ውስጥ እያለቀስንና እያዘንን ወደ አንቺ እንቃተታለን።',
        imagePath: 'assets/sunrise.jpeg',
      ),
      PrayerStep(
        sectionHeader: 'FINAL PETITION',
        titleEn: 'Hail Holy Queen',
        titleAm: 'ሰላም ለኪ እመቤታችን',
        contentEn:
        'Turn then, most gracious advocate, thine eyes of mercy toward us, and after this our exile, show unto us the blessed fruit of thy womb, Jesus. O clement, O loving, O sweet Virgin Mary. Amen.',
        contentAm:
        'እንግዲህ አማላጃችን ሆይ፤ እነዚያን የምህረት ዓይኖችሽን ወደ እኛ መልሺ፤ ከዚህ ስደት በኋላም የማህፀንሽን የተባረከ ፍሬ ኢየሱስን አሳዪን። አንቺ ርኅሩኅ፣ አንቺ አፍቃሪ፣ አንቺ ጣፋጭ ድንግል ማርያም ሆይ። አሜን።',
        imagePath: 'assets/sunrise.jpeg',
      ),
    ],
    'Prayer of St. Francis': [
      PrayerStep(
        sectionHeader: 'PETITION',
        titleEn: 'Prayer of St. Francis',
        titleAm: 'የቅዱስ ፍራንሲስ ጸሎት',
        contentEn:
        'Lord, make me an instrument of your peace:\nwhere there is hatred, let me sow love;\nwhere there is injury, pardon;\nwhere there is doubt, faith;\nwhere there is despair, hope;\nwhere there is darkness, light;\nwhere there is sadness, joy.',
        contentAm:
        'ጌታ ሆይ፣ የሰላምህ መሣሪያ አድርገኝ፡\nጥል ባለበት ቦታ፣ ፍቅርን እንድዘራ፤\nበደል ባለበት፣ ይቅርታን፤\nመጠራጠር ባለበት፣ እምነትን፤\nተስፋ መቁረጥ ባለበት፣ ተስፋን፤\nጨለማ ባለበት፣ ብርሃንን፤\nሐዘን ባለበት፣ ደስታን እንድዘራ እርዳኝ።',
        imagePath: 'assets/sunrise.jpeg',
      ),
      PrayerStep(
        sectionHeader: 'REFLECTION',
        titleEn: 'Prayer of St. Francis',
        titleAm: 'የቅዱስ ፍራንሲስ ጸሎት',
        contentEn:
        'O divine Master, grant that I may not so much seek\nto be consoled as to console,\nto be understood as to understand,\nto be loved as to love.',
        contentAm:
        'ኦ ጌታ ሆይ፣ ከመጽናናት ይልቅ እንድጽናና፣\nከመወደድ ይልቅ እንድወድ፣\nከመረዳት ይልቅ እንድረዳ አድርገኝ።',
        imagePath: 'assets/sunrise.jpeg',
      ),
      PrayerStep(
        sectionHeader: 'FINAL PRAYER',
        titleEn: 'Prayer of St. Francis',
        titleAm: 'የቅዱስ ፍራንሲስ ጸሎት',
        contentEn:
        'For it is in giving that we receive,\nit is in pardoning that we are pardoned,\nand it is in dying that we are born to eternal life. Amen.',
        contentAm:
        'በመስጠት ስለምንቀበል፣\nበይቅርታ ስለምንታረቅ፣\nበመሞትም ወደ ዘላለም ሕይወት ስለምንወለድ ነው። አሜን።',
        imagePath: 'assets/sunrise.jpeg',
      ),
    ],
    'The Guardian Angel Prayer': [
      PrayerStep(
        sectionHeader: 'PROTECTION',
        titleEn: 'The Guardian Angel Prayer',
        titleAm: 'የጠባቂ መልአክ ጸሎት',
        contentEn:
        'Angel of God, my guardian dear,\nTo whom God\'s love commits me here,\nEver this day, be at my side,\nTo light, to guard, to rule, and guide. Amen.',
        contentAm:
        'የእግዚአብሔር መልአክ፣ ውድ ጠባቂዬ፣\nየእግዚአብሔር ፍቅር ለእኔ የሰጠህ፣\nዛሬ ሁልጊዜ ከአጠገቤ ሁን፣\nእንድታበራልኝ፣ እንድትጠብቀኝ፣ እንድትመራኝም። አሜን።',
        imagePath: 'assets/sunrise.jpeg',
      ),
    ],
    'The Benedictus': [
      PrayerStep(
        sectionHeader: 'CANTICLE OF ZECHARIAH',
        titleEn: 'The Benedictus',
        titleAm: 'የዘካርያስ ምስጋና (ቤኔዲክቱስ)',
        contentEn:
        'Blessed be the Lord, the God of Israel;\nhe has come to his people and set them free.\nHe has raised up for us a mighty savior,\nborn of the house of his servant David.\nThrough his holy prophets he promised of old\nthat he would save us from our enemies,\nfrom the hands of all who hate us.',
        contentAm:
        'የእስራኤል አምላክ ጌታ ይባረክ፤\nወደ ሕዝቡ መጥቶ ነጻ አውጥቷቸዋልና።\nበአገልጋዩ በዳዊት ቤት\nኃያል መድኃኒት አቆመልን፤\nከጠላቶቻችንና ከሚጠሉን ሁሉ እጅ እንደሚያድነን\nከጥንት ጀምሮ በቅዱሳን ነቢያቱ አፍ ተናግሯልና።',
        imagePath: 'assets/sunrise.jpeg',
      ),
      PrayerStep(
        sectionHeader: 'COVENANT OF MERCY',
        titleEn: 'The Benedictus',
        titleAm: 'የዘካርያስ ምስጋና (ቤኔዲክቱስ)',
        contentEn:
        'He promised to show mercy to our fathers\nand to remember his holy covenant.\nThis was the oath he swore to our father Abraham:\nto set us free from the hands of our enemies,\nfree to worship him without fear,\nholy and righteous in his sight all the days of our life.',
        contentAm:
        'ለአባቶቻችን ምሕረትን ለማድረግ\nቅዱስ ኪዳኑንም ለማሰብ ቃል ገባ፤\nይህም ለአባታችን ለአብርሃም የገባሁለት መሐላ ነው፤\nከጠላቶቻችን እጅ ነጻ ወጥተን፣\nበዘመናችን ሁሉ ያለ ፍርሃት በፊቱ በቅድስናና በጽድቅ እንድናመልከው።',
        imagePath: 'assets/sunrise.jpeg',
      ),
      PrayerStep(
        sectionHeader: 'PROPHETIC PROPHECY',
        titleEn: 'The Benedictus',
        titleAm: 'የዘካርያስ ምስጋና (ቤኔዲክቱስ)',
        contentEn:
        'You, my child, shall be called the prophet of the Most High;\nfor you will go before the Lord to prepare his way,\nto give his people knowledge of salvation\nby the forgiveness of their sins.',
        contentAm:
        'አንተም ሕፃን ሆይ፣ የልዑል ነቢይ ትባላለህ፤\nመንገዱን ልትጠርግ በጌታ ፊት ትሄዳለህና፣\nበኃጢአታቸው ስረየት የደኅንነትን እውቀት ለሕዝቡ ልትሰጥ።',
        imagePath: 'assets/sunrise.jpeg',
      ),
      PrayerStep(
        sectionHeader: 'DAWN FROM ON HIGH',
        titleEn: 'The Benedictus',
        titleAm: 'የዘካርያስ ምስጋና (ቤኔዲክቱስ)',
        contentEn:
        'In the tender compassion of our God\nthe dawn from on high shall break upon us,\nto shine on those who dwell in darkness and the shadow of death,\nand to guide our feet into the way of peace.\nGlory to the Father and to the Son and to the Holy Spirit,\nas it was in the beginning, is now, and will be forever. Amen.',
        contentAm:
        'ከአምላካችን ከበዛው ርኅራኄ የተነሣ\nከላይ የመጣው ንጋት ይጎበኘናል፤\nበጨለማና በሞት ጥላ ውስጥ ለቀመጡት ሊያበራ፣\nእግሮቻችንንም ወደ ሰላም መንገድ ሊመራ።\nክብር ለአብ ለወልድ ለመንፈስ ቅዱስም ይሁን፣\nበመጀመሪያ እንደነበረ አሁንም ዘወትርም ለዘላለሙ። አሜን።',
        imagePath: 'assets/sunrise.jpeg',
      ),
    ],
    'Act of Contrition': [
      PrayerStep(
        sectionHeader: 'REPENTANCE',
        titleEn: 'Act of Contrition',
        titleAm: 'የንስሐ ጸሎት',
        contentEn:
        'My God, I am sorry for my sins with all my heart. In choosing to do wrong and failing to do good, I have sinned against you whom I should love above all things.\nI firmly intend, with your help, to do penance, to sin no more, and to avoid whatever leads me to sin.\nOur Savior Jesus Christ suffered and died for us. In his name, my God, have mercy. Amen.',
        contentAm:
        'አምላኬ ሆይ፣ በፈጸምኩት ኃጢአት ሁሉ በሙሉ ልቤ እጸጸታለሁ። ክፉ በማድረጌና ደግ ነገር ባለማድረጌ፣ ከሁሉ በላይ ልወድህ በሚገባኝ በአንተ ላይ በደልሁ።\nበአንተ እርዳታ ንስሐ ለመግባት፣ ከእንግዲህ ወደ ኃጢአት ላለመመለስና ወደ ኃጢአት የሚመሩኝን ነገሮች ሁሉ ለማስወገድ ቁርጥ ውሳኔ አደርጋለሁ።\nመድኃኒታችን ኢየሱስ ክርስቶስ ስለ እኛ መከራን ተቀብሎ ሞተ። በስሙ አምላኬ ሆይ ምህረት አድርግልኝ። አሜን።',
        imagePath: 'assets/img_2.png',
      ),
    ],
    'Prayer for the Hour of Mercy': [
      PrayerStep(
        sectionHeader: 'FOUNT OF MERCY',
        titleEn: 'Prayer for the Hour of Mercy',
        titleAm: 'የምህረት ሰዓት ጸሎት',
        contentEn:
        'O Blood and Water, which gushed forth from the Heart of Jesus as a fount of Mercy for us, I trust in You.\n\nYou Yourself, Jesus, surely out of love for us, underwent such a terrible Passion. Your Father\'s justice would have been propitiated with a single sigh from You, and all Your self abasement is solely the work of Your mercy and Your inconceivable love ... At the end of Your death on the Cross, You bestowed upon us eternal life; allowing Your most holy side to be opened, You opened an inexhaustible spring of mercy for us, giving us Your dearest possession, the Blood and Water from Your Heart. Such is the omnipotence of Your mercy. From it all grace flows to us.',
        contentAm:
        'ለእኛ የምህረት ምንጭ ሆነህ ከኢየሱስ ልብ የፈሰስክ ደምና ውኃ ሆይ፣ በአንተ እተማመናለሁ።\n\nኢየሱስ ሆይ፣ በእርግጥ ስለ እኛ ካለህ ፍቅር የተነሣ እንዲህ ዓይነቱን አስ መከራ ተቀበልክ። የአባትህ ፍትሕ በአንተ አንዲት እፎይታ እንኳን ትረካ ነበር፤ የእንዲህ ዓይነቱ ራስን ዝቅ ማድረግ ሙሉ በሙሉ የምህረትህና የማይመረመር ፍቅርህ ሥራ ነው። በ መስቀል ላይ በሞትህ ፍጻሜ የዘላለም ሕይወትን ሰጠኸን፤ ቅዱስ ጎንህ እንዲከፈት በማድረግ አታልቆ የምህረት ምንጭ ከፈትክልን፤ የልብህን ደምና ውኃ ሰጠኸን። የምህረትህ ኃያልነት እንዲህ ነው። ከእርሱ ጸጋ ሁሉ ይፈስስልናል።',
        imagePath: 'assets/img_5.png',
      ),
      PrayerStep(
        sectionHeader: 'PETITION FOR SINNERS',
        titleEn: 'Prayer for the Hour of Mercy',
        titleAm: 'የምህረት ሰዓት ጸሎት',
        contentEn:
        'O Jesus, eternal Truth, our Life, I call upon You and beg Your mercy for poor sinners. O sweetest Heart of my Lord, full of pity and unfathomable mercy, I plead with you for poor sinners. O Most Sacred Heart, Fount of Mercy from which gush forth rays of inconceivable graces upon the entire human race, I beg of You light for poor sinners. O Jesus, be mindful of Your own bitter Passion and do not permit the loss of souls redeemed at so dear a price of Your most precious Blood.\n\nO Jesus, when I consider the great price of Your Blood, I rejoice at its immensity, for one drop alone would have been enough for the salvation of all sinners. (...) Oh, what immense joy burns in my heart when I contemplate Your incomprehensible goodness, O Jesus! I desire to bring all sinners to Your feet that they may glorify Your mercy throughout endless ages.',
        contentAm:
        'ኦ ኢየሱስ፣ የዘላለም እውነት፣ ሕይወታችን፣ ስለ ምስኪን ኃጢአተኞች ምህረትህን እለምናለሁ። ኦ የጌታዬ እጅግ ጣፋጭ ልብ፣ በምህረት የተሞላኸው፣ ስለ ምስኪን ኃጢአተኞች እማልድሃለሁ። ኦ እጅግ ቅዱስ ልብ፣ በሰው ልጅ ሁሉ ላይ የማይመረመር ጸጋን የምታፈስስ የምህረት ምንጭ፣ ስለ ምስኪን ኃጢአተኞች ብርሃንን እለምንሃለሁ። ኢየሱስ ሆይ፣ መራራ መከራህን አስብ፣ በክቡር ደምህ በውድ ዋጋ የተዋጁትን ነፍሳት ጥፋት አትፍቀድ።',
        imagePath: 'assets/img_5.png',
      ),
      PrayerStep(
        sectionHeader: 'SURRENDER & EXPIRE',
        titleEn: 'Prayer for the Hour of Mercy',
        titleAm: 'የምህረት ሰዓት ጸሎት',
        contentEn:
        'O Jesus, stretched out upon the cross, I implore You, give me the grace of doing faithfully the most holy will of Your Father, in all things, always and everywhere. And when this will of God will seem to me very harsh and difficult to fulfill, it is then I beg You, Jesus, may power and strength flow upon me from your wounds, and may my lips keep repeating, "Your will be done, O Lord".\n\nO Savior of the world, Lover of man\'s salvation, who in such terrible torment and pain, forgot Yourself to think only of the salvation of souls, O most compassionate Jesus, grant in the grace to forget myself that I may live totally for souls, helping You in the work of salvation, according to the most holy will of Your Father.\n\nYou expired, Jesus, but the source of life gushed forth for souls and the ocean of mercy opened up for the whole world. O Fount of Life, unfathomable Divine Mercy, envelop the whole world and empty Yourself out upon us. Amen.',
        contentAm:
        'በመስቀል ላይ የተዘረጋኸው ኢየሱስ ሆይ፣ የአባትህን ቅዱስ ፈቃድ በነገር ሁሉ፣ ሁልጊዜና በቦታ ሁሉ ታማኝ ሆኜ እንድፈጽም ጸጋህን ስጠኝ።\n\nኢየሱስ ሆይ፣ ተሞትክ፣ ነገር ግን የሕይወት ምንጭ ለነፍሳት ፈሰሰ፤ የምህረት ውቅያኖስም ለመላው ዓለም ተከፈተ። ኦ የሕይወት ምንጭ፣ የማይመረመር አምላካዊ ምህረት፣ መላውን ዓለም ሸፍነህ በላያችን ላይ ራስህን አፍስስ። አሜን።',
        imagePath: 'assets/img_5.png',
      ),
    ],
    'Prayer to St. Michael the Archangel': [
      PrayerStep(
        sectionHeader: 'PROTECTION IN BATTLE',
        titleEn: 'Prayer to St. Michael the Archangel',
        titleAm: 'ወደ ቅዱስ ሚካኤል ሊቀ መላእክት ጸሎት',
        contentEn:
        'Saint Michael the Archangel, defend us in battle.\nBe our protection against the wickedness and snares of the devil.\nMay God rebuke him, we humbly pray; and do thou,\nO Prince of the heavenly host, by the power of God,\ncast into hell Satan and all the evil spirits,\nwho prowl about the world seeking the ruin of souls. Amen.',
        contentAm:
        'ቅዱስ ሚካኤል ሊቀ መላእክት ሆይ፣ በውጊያ ላይ ጠብቀን።\nከዲያብሎስ ክፋትና ወጥመድ መከታ ሁነን።\nእግዚአብሔር እንዲገሥጸው በትሕትና እንጸልያለን፤\nአንተም የሰማያዊ ሠራዊት አለቃ ሆይ፣ በእግዚአብሔር ኃይል፣\nየነፍሳትን ጥፋት በመፈለግ በዓለም ላይ የሚዞሩትን\nሰይጣንንና ክፉዎችን መናፍስት ሁሉ ወደ ሲኦል ጣላቸው። አሜን።',
        imagePath: 'assets/img_4.png',
      ),
    ],
    'The Magnificat': [
      PrayerStep(
        sectionHeader: 'CANTICLE OF MARY',
        titleEn: 'The Magnificat',
        titleAm: 'የእመቤታችን ማርያም ምስጋና (ማግኒፊካት)',
        contentEn:
        'My soul proclaims the greatness of the Lord,\nmy spirit rejoices in God my Savior,\nfor he has looked with favor on his lowly servant.\nFrom this day all generations will call me blessed:\nthe Almighty has done great things for me,\nand holy is his Name.',
        contentAm:
        'ነፍሴ ጌታን ታ ታበራዋለች፤\nመንፈሴም በአምላኬ በመድኃኒቴ ሐሴት ታደርጋለች፤\nየአገልጋዩን ትሕትና ተመልክቷልና።\nእነሆ ከዛሬ ጀምሮ ትውልድ ሁሉ ብፅዕት ይሉኛል፤\nብርቱ የሆነው እርሱ በእኔ ታላቅ ነገር አድርጓልና፤\nስሙም ቅዱስ ነው።',
        imagePath: 'assets/sunrise.jpeg',
      ),
      PrayerStep(
        sectionHeader: 'EXALTATION OF THE LOWLY',
        titleEn: 'The Magnificat',
        titleAm: 'የእመቤታችን ማርያም ምስጋና (ማግኒፊካት)',
        contentEn:
        'He has mercy on those who fear him in every generation.\nHe has shown the strength of his arm,\nhe has scattered the proud in their conceit.\nHe has cast down the mighty from their thrones,\nand has lifted up the lowly.\nHe has filled the hungry with good things,\nand the rich he has sent away empty.',
        contentAm:
        'ምህረቱም ለሚፈሩት እስከ ትውልድና ትውልድ ይኖራል።\nበክንዱ ኃይል አሳይቷል፤\nትዕቢተኞችን በልባቸው አሳብ በትኗቸዋል።\nኃያላንን ከዙፋናቸው አዋርዷቸዋል፤\nትሑታንንም ከፍ ከፍ አድርጓቸዋል።\nራብተኞችን በበጎ ነገር አጥግቧቸዋል፤\nባለጠጎችንም ባዶ እጃቸውን ሰዶአቸዋል።',
        imagePath: 'assets/sunrise.jpeg',
      ),
      PrayerStep(
        sectionHeader: 'GOD\'S FAITHFULNESS',
        titleEn: 'The Magnificat',
        titleAm: 'የእመቤታችን ማርያም ምስጋና (ማግኒፊካት)',
        contentEn:
        'He has come to the help of his servant Israel\nfor he has remembered his promise of mercy,\nthe promise he made to our fathers,\nto Abraham and his children forever.\nGlory to the Father and to the Son and to the Holy Spirit,\nas it was in the beginning, is now, and will be forever. Amen.',
        contentAm:
        'ለአባቶቻችን ለአብርሃምና ለዘሩ እስከ ዘላለም እንደተናገረው\nምህረቱን አስቦ አገልጋዩን እስራኤልን ረድቷል።\nክብር ለአብ ለወልድ ለመንፈስ ቅዱስም ይሁን፣\nበመጀመሪያ እንደነበረ አሁንም ዘወትርም ለዘላለሙ። አሜን።',
        imagePath: 'assets/sunrise.jpeg',
      ),
    ],
    'Prayer of St. Augustine': [
      PrayerStep(
        sectionHeader: 'DEVOTION',
        titleEn: 'Prayer of St. Augustine',
        titleAm: 'የቅዱስ ኦገስቲን ጸሎት',
        contentEn:
        'Lord Jesus, let me know myself and know you and desire nothing save only you. Let me hate myself and love you. Let me humble myself and exalt you. Let me think nothing except you. Let me die to myself and live in you. Let me accept whatever happens as from you. Let me banish myself and follow you, and ever desire to follow you. Let me fly from myself and take refuge in you, that I may deserve to be defended by you. Let me fear for myself, let me fear you, and let me be among those who are chosen by you. Let me be willing to obey for the sake of you. Let me cling to nothing save only to you, and let me be poor because of you. Look upon me, that I may love you. Call me that I may see you, and for ever enjoy you. Amen.',
        contentAm:
        'ጌታ ኢየሱስ ሆይ፣ ራሴን እንድያውቅና አንተን እንድያውቅ፣ ከአንተ በቀር ምንም እንዳልመኝ አድርገኝ። ራሴን እንድጠላ አንተን እንድወድ አድርገኝ። ራሴን እንድያንስ አንተን እንድከብር አድርገኝ። ከአንተ በቀር ምንም እንዳልያስብ አድርገኝ። ለራሴ ሞቼ በአንተ እንድኖር አድርገኝ። የሚሆነውን ሁሉ ከአንተ እንደሆነ አድርጌ እንድቀበል አድርገኝ። ራሴን ትቼ አንተን እንድከተል፣ ሁልጊዜም አንተን መከተል እንድመኝ አድርገኝ። ከራሴ ሽሼ በአንተ እንድጠለል አድርገኝ። ስሜን፣ አንተን እንድፈራ፣ በአንተ ከተመረጡት መካከል እንድሆን አድርገኝ። ስለ አንተ ብዬ ለመታዘዝ ፈቃደኛ እንድሆን አድርገኝ። ከአንተ በቀር በምንም እንዳልጣበቅ አድርገኝ። እንድወድህ ተመልከተኝ። እንድያይህና ለዘላለም በአንተ ደስ እንዲለኝ ጠራኝ። አሜን።',
        imagePath: 'assets/sunrise.jpeg',
      ),
    ],
    'The Memorare': [
      PrayerStep(
        sectionHeader: 'MARIAN INTERCESSION',
        titleEn: 'The Memorare',
        titleAm: 'ሜሞራሬ (አስቢ)',
        contentEn:
        'Remember, O most gracious Virgin Mary,\nthat never was it known that anyone who fled to thy protection,\nimplored thy help, or sought thy intercession, was left unaided.\nInspired by this confidence I fly unto thee, O Virgin of virgins, my Mother.\nTo thee do I come, before thee I stand, sinful and sorrowful.\nO Mother of the Word Incarnate, despise not my petitions,\nbut in thy mercy hear and answer me. Amen.',
        contentAm:
        'እጅግ ርኅሩኅ ድንግል ማርያም ሆይ፣\nወደ ጥበቃሽ የሸሸ፣ እርዳታሽን የጠየቀ ወይም አማላጅነትሽን የፈለገ\nማንም እንደተተወ ከቶ እንዳልተሰማ አስቢ።\nበዚህ እምነት ተነሣሥቼ፣ የድንግሎች ድንግል እናቴ ሆይ፣ ወደ አንቺ እመጣለሁ፤\nበፊትሽ እቆማለሁ፣ ኃጢአተኛና ሐዘነኛ ሆኜ።\nየሰው የሆነው ቃል እናት ሆይ፣ ልመናዬን አትናቂ፣\nበምህረትሽ ስሚኝና መልሽልኝ እንጂ። አሜን።',
        imagePath: 'assets/sunrise.jpeg',
      ),
    ],
    'Prayer to St. Joseph': [
      PrayerStep(
        sectionHeader: 'PETITION TO ST. JOSEPH',
        titleEn: 'Prayer to St. Joseph',
        titleAm: 'ወደ ቅዱስ ዮሴፍ ጸሎት',
        contentEn:
        'Oh, St. Joseph, whose protection is so great, so prompt, so strong,\nbefore the throne of God, I place in you all my interests and desires.\nOh, St. Joseph, do assist me by your powerful intercession,\nand obtain for me from your Divine Son\nall spiritual blessings, through Jesus Christ, our Lord.\nSo that, having engaged here below your heavenly power,\nI may offer my thanksgiving and homage to the most loving of fathers.\nOh, St. Joseph, I never weary contemplating you and Jesus asleep in your arms;\nI dare not approach while he reposes near your heart.\nPress him in my name and kiss his fine head for me and\nask him to return the kiss when I draw my dying breath.\nSt. Joseph, patron of departing souls - pray for me. Amen.',
        contentAm:
        'ኦ ቅዱስ ዮሴፍ፣ ጥበቃህ በእግዚአብሔር ዙፋን ፊት እጅግ ታላቅ፣ ፈጣንና ኃያል የሆነ፣\nፍላጎቶቼንና ምኞቶቼን ሁሉ በአንተ ላይ አኖራለሁ።\nኦ ቅዱስ ዮሴፍ፣ በኃያል አማላጅነትህ እርዳኝ፣\nበጌታችን በኢየሱስ ክርስቶስ በኩል ከአምላካዊ ልጅህ\nመንፈሳዊ በረከቶችን ሁሉ አላብሰኝ።\nኦ ቅዱስ ዮሴፍ፣ አንተና በጉያህ የተኛው ኢየሱስን ከማሰብ ከቶ አልታክትም፤\nበልብህ አቅራቢያ ሲያረፍ ልቀርበው አልደፍርም።\nበስሜ እቀፈው፣ ስለ እኔም ውብ ራሱን ሳመው፣\nየመጨረሻ እስፋፌን ስተፍ እሱም መልሶ እንዲስመኝ ጠይቅልኝ።\nቅዱስ ዮሴፍ የሟቾች ነፍሳት ጠባቂ - ስለ እኔ ጸልይ። አሜን።',
        imagePath: 'assets/sunrise.jpeg',
      ),
    ],
    'The Litany of Saints': [
      PrayerStep(
        sectionHeader: 'OPENING INVOCATION',
        titleEn: 'The Litany of Saints',
        titleAm: 'የቅዱሳን ሊታኒ (ሊታኒያ)',
        contentEn:
        'Lord, have mercy on us. — Lord, have mercy on us.\nChrist, have mercy on us. — Christ, have mercy on us.\nLord, have mercy on us. — Lord, have mercy on us.\nChrist, hear us. — Christ, graciously hear us.\n\nGod, the Father of Heaven, — have mercy on us.\nGod the Son, Redeemer of the world, — have mercy on us.\nGod the Holy Spirit, — have mercy on us.\nHoly Trinity, one God, — have mercy on us.',
        contentAm:
        'ጌታ ሆይ፣ ማረን። — ጌታ ሆይ፣ ማረን።\nክርስቶስ ሆይ፣ ማረን። — ክርስቶስ ሆይ፣ ማረን።\nጌታ ሆይ፣ ማረን። — ጌታ ሆይ፣ ማረን።\nክርስቶስ ሆይ፣ ስማን። — ክርስቶስ ሆይ፣ በደስታ ስማን።\n\nእግዚአብሔር የሰማይ አባት፣ — ማረን።\nእግዚአብሔር ወልድ የዓለም መድኃኒት፣ — ማረን።\nእግዚአብሔር መንፈስ ቅዱስ፣ — ማረን።\nቅድስት ሥላሴ አንድ አምላክ፣ — ማረን።',
        imagePath: 'assets/sunrise.jpeg',
      ),
      PrayerStep(
        sectionHeader: 'INVOCATION OF SAINTS',
        titleEn: 'The Litany of Saints',
        titleAm: 'የቅዱሳን ሊታኒ (ሊታኒያ)',
        contentEn:
        'Holy Mary, — pray for us.\nHoly Mother of God, — pray for us.\nHoly Virgin of Virgins, — pray for us.\nSt. Michael, — pray for us.\nSt. Gabriel, — pray for us.\nSt. Raphael, — pray for us.\nAll you Holy Angels and Archangels, — pray for us.\nSt. John the Baptist, — pray for us.\nSt. Joseph, — pray for us.\nAll you Holy Patriarchs and Prophets, — pray for us.\nSt. Peter, — pray for us.\nSt. Paul, — pray for us.\nSt. Andrew, — pray for us.\nSt. James, — pray for us.\nSt. John, — pray for us.\nSt. Thomas, — pray for us.\nSt. Philip, — pray for us.\nSt. Bartholomew, — pray for us.\nSt. Matthew, — pray for us.\nSt. Simon, — pray for us.\nSt. Jude, — pray for us.\nSt. Matthias, — pray for us.\nSt. Barnabas, — pray for us.\nSt. Luke, — pray for us.\nSt. Mark, — pray for us.\nAll you Holy Apostles and Evangelists, — pray for us.\nAll you Holy Disciples of the Lord, — pray for us.\nAll you Holy Innocents, — pray for us.',
        contentAm:
        'ቅድስት ማርያም፣ — ጸልዪልን።\nቅድስት የአምላክ እናት፣ — ጸልዪልን።\nቅድስት የድንግሎች ድንግል፣ — ጸልዪልን።\nቅዱስ ሚካኤል፣ — ጸልይልን።\nቅዱስ ገብርኤል፣ — ጸልይልን።\nቅዱስ ሩፋኤል፣ — ጸልይልን።\nቅዱሳን መላእክትና ሊቃነ መላእክት ሁሉ፣ — ጸልዩልን።\nቅዱስ ዮሐንስ መጥምቅ፣ — ጸልይልን።\nቅዱስ ዮሴፍ፣ — ጸልይልን።\nቅዱሳን አበውና ነቢያት ሁሉ፣ — ጸልዩልን።\nቅዱስ ጴጥሮስ፣ — ጸልይልን።\nቅዱስ ጳውሎስ፣ — ጸልይልን።\nቅዱሳን ሐዋርያትና ወንጌላውያን ሁሉ፣ — ጸልዩልን።',
        imagePath: 'assets/sunrise.jpeg',
      ),
      PrayerStep(
        sectionHeader: 'SUPPLICATIONS',
        titleEn: 'The Litany of Saints',
        titleAm: 'የቅዱሳን ሊታኒ (ሊታኒያ)',
        contentEn:
        'Lord, be merciful, — Lord, save your people.\nFrom all evil, — Lord, save your people.\nFrom all sin, — Lord, save your people.\nFrom your wrath, — Lord, save your people.\nFrom a sudden and unprovided death, — Lord, save your people.\nFrom the snares of the devil, — Lord, save your people.\nFrom anger, hatred and all ill-will, — Lord, save your people.\nFrom everlasting death, — Lord, save your people.\nBy the mystery of your Holy Incarnation, — Lord, save your people.\nBy Your Cross and Passion, — Lord, save your people.\nBy Your Holy Resurrection, — Lord, save your people.\nBy the coming of the Holy Spirit, — Lord, save your people.',
        contentAm:
        'ጌታ ሆይ፣ ምሑር ሁን፣ — ጌታ ሆይ፣ ሕዝብህን አድን።\nከክፉ ሁሉ፣ — ጌታ ሆይ፣ ሕዝብህን አድን።\nከኃጢአት ሁሉ፣ — ጌታ ሆይ፣ ሕዝብህን አድን።\nከቁጣህ፣ — ጌታ ሆይ፣ ሕዝብህን አድን።\nከዲያብሎስ ወጥመድ፣ — ጌታ ሆይ፣ ሕዝብህን አድን።\nከዘላለም ሞት፣ — ጌታ ሆይ፣ ሕዝብህን አድን።\nበቅዱስ ሰው የመሆንህ ምስጢር፣ — ጌታ ሆይ፣ ሕዝብህን አድን።\nበመስቀልህና በመከራህ፣ — ጌታ ሆይ፣ ሕዝብህን አድን።\nበቅዱስ ትንሣኤህ፣ — ጌታ ሆይ፣ ሕዝብህን አድን።',
        imagePath: 'assets/sunrise.jpeg',
      ),
      PrayerStep(
        sectionHeader: 'PETITIONS & CONCLUSION',
        titleEn: 'The Litany of Saints',
        titleAm: 'የቅዱሳን ሊታኒ (ሊታኒያ)',
        contentEn:
        'Be merciful to us sinners, — Lord, hear our prayer.\nThat you will spare us, — Lord, hear our prayer.\nGuide and protect your holy Church, — Lord, hear our prayer.\nPreserve in holy religion the Pope, and all in holy Orders, — Lord, hear our prayer.\nGive peace and unity to the whole Christian people, — Lord, hear our prayer.\n\nLamb of God, who takes away the sins of the world, — spare us, O Lord!\nLamb of God, who takes away the sins of the world, — graciously hear us, O Lord!\nLamb of God, who takes away the sins of the world, — have mercy on us.\n\nChrist, hear us. — Christ, graciously hear us.\nLord, have mercy on us. — Lord, have mercy on us.',
        contentAm:
        'እኛን ኃጢአተኞችን ማረን፣ — ጌታ ሆይ፣ ጸሎታችንን ስማ።\nቅድስት ቤተክርስቲያንን መራ፣ ጠብቃትም፣ — ጌታ ሆይ፣ ጸሎታችንን ስማ።\nለክርስቲያን ሕዝብ ሁሉ ሰላምና አንድነትን ስጥ፣ — ጌታ ሆይ፣ ጸሎታችንን ስማ።\n\nየዓለምን ኃጢአት የሚያስወግድ የእግዚአብሔር በግ፣ — ማረን ጌታ ሆይ!\nየዓለምን ኃጢአት የሚያስወግድ የእግዚአብሔር በግ፣ — በደስታ ስማን ጌታ ሆይ!\nየዓለምን ኃጢአት የሚያስወግድ የእግዚአብሔር በግ፣ — ምህረት አድርግልን።\n\nክርስቶስ ሆይ፣ ስማን። — ክርስቶስ ሆይ፣ በደስታ ስማን።\nጌታ ሆይ፣ ማረን። — ጌታ ሆይ፣ ማረን።',
        imagePath: 'assets/sunrise.jpeg',
      ),
      ],

      'Anima Christi': [
        PrayerStep(
          sectionHeader: 'SOUL OF CHRIST',
          titleEn: 'Anima Christi',
          titleAm: 'አኒማ ክርስቲ (የክርስቶስ ነፍስ)',
          contentEn:
          'Soul of Christ, sanctify me.\n'
              'Body of Christ, save me.\n'
              'Blood of Christ, inebriate me.\n'
              'Water from the side of Christ, wash me.\n'
              'Passion of Christ, strengthen me.\n'
              'O good Jesus, hear me.\n'
              'Within your wounds hide me.\n'
              'Suffer me not to be separated from you.\n'
              'From the malicious enemy defend me.\n'
              'In the hour of my death call me,\n'
              'and bid me come unto you,\n'
              'that with your saints I may praise you\n'
              'for ever and ever. Amen.',
          contentAm:
          'የክርስቶስ ነፍስ ሆይ፣ ቀድሰኝ።\n'
              'የክርስቶስ አካል ሆይ፣ አድነኝ።\n'
              'የክርስቶስ ደም ሆይ፣ አርካኝ።\n'
              'ከክርስቶስ ጎን የፈሰሰው ውኃ ሆይ፣ እጠበኝ።\n'
              'የክርስቶስ መከራ ሆይ፣ አበርታኝ።\n'
              'ኦ ቸሩ ኢየሱስ ሆይ፣ ስማኝ።\n'
              'በቁስሎችህ ውስጥ ደብቀኝ።\n'
              'ከአንተ እንዳልለይ አትፍቀድልኝ።\n'
              'ከተንኮለኛው ጠላት ጠብቀኝ።\n'
              'በሞቴ ሰዓት ጠራኝ፣\n'
              'ወደ አንተም እንድመጣ እዘዘኝ፣\n'
              'ከቅዱሳንህ ጋር አመሰግንህ ዘንድ\n'
              'ለዘላለሙ። አሜን።',
          imagePath: 'assets/anima christi vip.jpg',
        ),
      ],

      // -------------------------------------------------------------------------
      // 2. COME, HOLY SPIRIT
      // -------------------------------------------------------------------------
      'Come, Holy Spirit': [
        PrayerStep(
          sectionHeader: 'INVOCATION OF THE HOLY SPIRIT',
          titleEn: 'Come, Holy Spirit',
          titleAm: 'መንፈስ ቅዱስ ሆይ ና',
          contentEn:
          'Come, Holy Spirit, fill the hearts of your faithful\n'
              'and enkindle in them the fire of your love.\n\n'
              'V. Send forth your Spirit and they shall be created.\n'
              'R. And you shall renew the face of the earth.\n\n'
              'Let us pray.\n'
              'O God, who by the light of the Holy Spirit, did instruct the hearts of the faithful, '
              'grant that by the same Holy Spirit we may be truly wise and ever enjoy His consolations, '
              'through Christ Our Lord. Amen.',
          contentAm:
          'መንፈስ ቅዱስ ሆይ ና፣ የሙእመናንህን ልብ ሙላ፣\n'
              'የፍቅርህንም እሳት በውስጣቸው አክብድ።\n\n'
              'ሀ. መንፈስህን ልክ፣ እነርሱም ይፈጠራሉ።\n'
              'ለ. የምድርንም ፊት ታድሳለህ።\n\n'
              'እንጸልይ።\n'
              'አምላክ ሆይ፣ በመንፈስ ቅዱስ ብርሃን የሙእመናንን ልብ ያስተማርክ፣ '
              'በዚያው መንፈስ እውነተኛ ጥበበኞች እንድንሆንና ሁልጊዜ በመጽናናቱ ደስ እንዲለን አድርገን፣ '
              'በጌታችን በክርስቶስ በኩል. አሜን።',
          imagePath: 'assets/img_17.png',
        ),
      ],

      // -------------------------------------------------------------------------
      // 3. PRAYER OF ABANDONMENT (CHARLES DE FOUCAULD)
      // -------------------------------------------------------------------------
      'Prayer of Abandonment': [
        PrayerStep(
          sectionHeader: 'SURRENDER TO THE FATHER',
          titleEn: 'Prayer of Abandonment',
          titleAm: 'የራስን ለአባት አሳልፎ መስጠት ጸሎት',
          contentEn:
          'Father, I abandon myself into your hands; do with me what you will.\n'
              'Whatever you may do, I thank you: I am ready for all, I accept all.\n'
              'Let only your will be done in me, and in all your creatures;\n'
              'I wish nothing more than this, O Lord.\n\n'
              'Into your hands I commend my soul: I offer it to you with all the love of my heart,\n'
              'for I love you Lord, and so need to give myself, to surrender myself into your hands without reserve,\n'
              'and with boundless confidence, for you are my Father. Amen.',
          contentAm:
          'አባቴ ሆይ፣ ራሴን በእጆችህ ላይ እጥላለሁ፤ የፈለግከውን አድርግብኝ።\n'
              'ግን ለማንኛውም ነገር አመሰግንሃለሁ፤ ለሁሉም ዝግጁ ነኝ፣ ሁሉንም እቀበላለሁ።\n'
              'በእኔና በፍጥረቶችህ ሁሉ ላይ ፈቃድህ ብቻ ይፈጸም፤\n'
              'ጌታ ሆይ፣ ከዚህ ውጭ ምንም አልመኝም።\n\n'
              'ነፍሴን በእጆችህ አምናለሁ፤ በልቤ ፍቅር ሁሉ ለአንተ እሰጣታለሁ፣\n'
              'አንተን እወድሃለሁና፣ ስለዚህ ያለ ምንም ቅድመ ሁኔታና ያለ ወሰን እምነት ራሴን በእጆችህ ላይ አሳልፌ መስጠት አለብኝ፣\n'
              'አንተ አባቴ ነህና። አሜን።',
          imagePath: 'assets/father.jpg',
        ),
      ],

      // -------------------------------------------------------------------------
      // 4. LITANY OF THE HOLY NAME OF JESUS
      // -------------------------------------------------------------------------
      'Litany of the Holy Name of Jesus': [
        PrayerStep(
          sectionHeader: 'OPENING INVOCATIONS',
          titleEn: 'Litany of the Holy Name of Jesus',
          titleAm: 'የቅዱስ ኢየሱስ ስም ሊታኒ',
          contentEn:
          'Lord, have mercy. — Lord, have mercy.\n'
              'Christ, have mercy. — Christ, have mercy.\n'
              'Lord, have mercy. — Lord, have mercy.\n'
              'Jesus, hear us. — Jesus, graciously hear us.\n\n'
              'God, the Father of Heaven, — have mercy on us.\n'
              'God the Son, Redeemer of the world, — have mercy on us.\n'
              'God the Holy Spirit, — have mercy on us.\n'
              'Holy Trinity, one God, — have mercy on us.',
          contentAm:
          'ጌታ ሆይ፣ ማረን። — ጌታ ሆይ፣ ማረን።\n'
              'ክርስቶስ ሆይ፣ ማረን። — ክርስቶስ ሆይ፣ ማረን።\n'
              'ጌታ ሆይ፣ ማረን። — ጌታ ሆይ፣ ማረን።\n'
              'ኢየሱስ ሆይ፣ ስማን። — ኢየሱስ ሆይ፣ በደስታ ስማን።\n\n'
              'እግዚአብሔር የሰማይ አባት፣ — ማረን።\n'
              'እግዚአብሔር ወልድ የዓለም መድኃኒት፣ — ማረን።\n'
              'እግዚአብሔር መንፈስ ቅዱስ፣ — ማረን።\n'
              'ቅድስት ሥላሴ አንድ አምላክ፣ — ማረን።',
          imagePath: 'assets/img_16.png',
        ),
        PrayerStep(
          sectionHeader: 'INVOCATION OF HIS HOLY TITLES',
          titleEn: 'Litany of the Holy Name of Jesus',
          titleAm: 'የቅዱስ ኢየሱስ ስም ሊታኒ',
          contentEn:
          'Jesus, Son of the living God, — have mercy on us.\n'
              'Jesus, Splendor of the Father, — have mercy on us.\n'
              'Jesus, Brightness of eternal Light, — have mercy on us.\n'
              'Jesus, King of Glory, — have mercy on us.\n'
              'Jesus, Sun of Justice, — have mercy on us.\n'
              'Jesus, Son of the Virgin Mary, — have mercy on us.\n'
              'Jesus, most amiable, — have mercy on us.\n'
              'Jesus, most admirable, — have mercy on us.\n'
              'Jesus, the mighty God, — have mercy on us.\n'
              'Jesus, Father of the world to come, — have mercy on us.\n'
              'Jesus, Angel of great counsel, — have mercy on us.',
          contentAm:
          'ኢየሱስ፣ የሕያው እግዚአብሔር ልጅ፣ — ማረን።\n'
              'ኢየሱስ፣ የአባት ግርማ፣ — ማረን።\n'
              'ኢየሱስ፣ የዘላለም ብርሃን እብራቅ፣ — ማረን።\n'
              'ኢየሱስ፣ የክብር ንጉሥ፣ — ማረን።\n'
              'ኢየሱስ፣ የጽድቅ ፀሐይ፣ — ማረን።\n'
              'ኢየሱስ፣ የድንግል ማርያም ልጅ፣ — ማረን።\n'
              'ኢየሱስ፣ እጅግ ተወዳጅ፣ — ማረን።\n'
              'ኢየሱስ፣ እጅግ ድንቅ፣ — ማረን።\n'
              'ኢየሱስ፣ ኃያል አምላክ፣ — ማረን።\n'
              'ኢየሱስ፣ የሚመጣው ዓለም አባት፣ — ማረን።',
          imagePath: 'assets/img_16.png',
        ),
        PrayerStep(
          sectionHeader: 'SUPPLICATIONS & CONCLUDING COLLECT',
          titleEn: 'Litany of the Holy Name of Jesus',
          titleAm: 'የቅዱስ ኢየሱስ ስም ሊታኒ',
          contentEn:
          'Be merciful, — spare us, O Jesus.\n'
              'Be merciful, — graciously hear us, O Jesus.\n\n'
              'From all evil, — deliver us, O Jesus.\n'
              'From all sin, — deliver us, O Jesus.\n'
              'By your Incarnation, — deliver us, O Jesus.\n'
              'By your Nativity, — deliver us, O Jesus.\n'
              'By your Cross and Passion, — deliver us, O Jesus.\n\n'
              'Lamb of God, who takes away the sins of the world, — spare us, O Jesus.\n'
              'Lamb of God, who takes away the sins of the world, — graciously hear us, O Jesus.\n'
              'Lamb of God, who takes away the sins of the world, — have mercy on us, O Jesus.\n\n'
              'Let us pray:\n'
              'O Lord Jesus Christ, who has said: Ask and you shall receive; seek and you shall find; knock and it shall be opened unto you; '
              'grant, we beseech You, to us who ask, the gift of Your most divine love. Amen.',
          contentAm:
          'ምሑር ሁን፣ — ማረን ኢየሱስ።\n'
              'ምሑር ሁን፣ — በደስታ ስማን ኢየሱስ።\n\n'
              'ከክፉ ሁሉ፣ — አድነን ኢየሱስ።\n'
              'ከኃጢአት ሁሉ፣ — አድነን ኢየሱስ።\n'
              'ሰው በመሆንህ፣ — አድነን ኢየሱስ።\n'
              'በልደትህ፣ — አድነን ኢየሱስ።\n'
              'በመስቀልህና በመከራህ፣ — አድነን ኢየሱስ።\n\n'
              'የዓለምን ኃጢአት የሚያስወግድ የእግዚአብሔር በግ፣ — ማረን ኢየሱስ።\n'
              'የዓለምን ኃጢአት የሚያስወግድ የእግዚአብሔር በግ፣ — በደስታ ስማን ኢየሱስ።\n'
              'የዓለምን ኃጢአት የሚያስወግድ የእግዚአብሔር በግ፣ — ምህረት አድርግልን ኢየሱስ።\n\n'
              'እንጸልይ፡\n'
              'ጌታ ኢየሱስ ክርስቶስ ሆይ፣ ለምኑ ይሰጣችሁማል፤ ፈልጉ ታገኙማላችሁ፤ መዝጊያን አንኳኩ ይከፈትላችሁማል ያልከው፤ '
              'የምንለምን እኛን የእግዚአብሔርን ፍቅር ስጦታ እንድታበለጽግልን እንለምንሃለን። አሜን።',
          imagePath: 'assets/img_16.png',
        ),
      ],

      // Existing core prayers retained cleanly
      'The Morning Offering': [
        PrayerStep(
          sectionHeader: 'READING FOCUS',
          titleEn: 'The Morning Offering',
          titleAm: 'የጠዋት መስዋዕት',
          contentEn:
          'O Jesus, through the Immaculate Heart of Mary, I offer You my prayers, works, joys and sufferings of this day for all the intentions of Your Sacred Heart,',
          contentAm:
          'እግዚአብሔር፣ የኢየሱስ ልብ፣ ያለ አዳም ኃጢአት የተጸነስች እንዲሁም የቤተክርስቲያን እናት በሆነችዉ በማርያም በኩል፣',
          imagePath: 'assets/sunrise.jpeg',
        ),
        PrayerStep(
          sectionHeader: 'INVOCATION',
          titleEn: 'The Morning Offering',
          titleAm: 'የጠዋት መስዋዕት',
          contentEn:
          'in union with the Holy Sacrifice of the Mass throughout the world, in reparation for my sins, for the intentions of all my relatives and friends,',
          contentAm:
          'በቅዱስ ቁርባን መስዋዕት በኩል፣ ልመናዎቼን ሥራዎቼን ተስፋዎቼንና የዛሬ ቀን መከራዎቼን ለወንዶችና ለሴቶች፣',
          imagePath: 'assets/sunrise.jpeg',
        ),
        PrayerStep(
          sectionHeader: 'FINAL PETITION',
          titleEn: 'The Morning Offering',
          titleAm: 'የጠዋት መስዋዕት',
          contentEn:
          'and in particular for the intentions of the Holy Father. Amen.',
          contentAm: 'ለሰው ልጆች ሁሉ ደህንነትና ለኃጢአቶች ካሣ እንዲሆን አቀርባለሁ፡፡ አሜን፡፡',
          imagePath: 'assets/sunrise.jpeg',
        ),
      ],
      'Hail Holy Queen': [
        PrayerStep(
          sectionHeader: 'READING FOCUS',
          titleEn: 'Hail Holy Queen',
          titleAm: 'ሰላም ለኪ እመቤታችን',
          contentEn:
          'Hail, Holy Queen, Mother of Mercy, our life, our sweetness and our hope. To thee do we cry, poor banished children of Eve.',
          contentAm:
          'የምህረት እናት ንግስት ሆይ ሰላም ለአንቺ ይሁን፤ ህይወታችን፣ ጣፋጭነታችንና ተስፋችን ሆይ ሰላም ለአንቺ ይሁን። የተሰደድነው የሔዋን ልጆች ወደ አንቺ እንጮኻለን።',
          imagePath: 'assets/sunrise.jpeg',
        ),
        PrayerStep(
          sectionHeader: 'INVOCATION',
          titleEn: 'Hail Holy Queen',
          titleAm: 'ሰላም ለኪ እመቤታችን',
          contentEn:
          'To thee do we send up our sighs, mourning and weeping in this valley of tears.',
          contentAm:
          'በዚህ በሐዘንና በእንባ ሸለቆ ውስጥ እያለቀስንና እያዘንን ወደ አንቺ እንቃተታለን።',
          imagePath: 'assets/sunrise.jpeg',
        ),
        PrayerStep(
          sectionHeader: 'FINAL PETITION',
          titleEn: 'Hail Holy Queen',
          titleAm: 'ሰላም ለኪ እመቤታችን',
          contentEn:
          'Turn then, most gracious advocate, thine eyes of mercy toward us, and after this our exile, show unto us the blessed fruit of thy womb, Jesus. O clement, O loving, O sweet Virgin Mary. Amen.',
          contentAm:
          'እንግዲህ አማላጃችን ሆይ፤ እነዚያን የምህረት ዓይኖችሽን ወደ እኛ መልሺ፤ ከዚህ ስደት በኋላም የማህፀንሽን የተባረከ ፍሬ ኢየሱስን አሳዪን። አንቺ ርኅሩኅ፣ አንቺ አፍቃሪ፣ አንቺ ጣፋጭ ድንግል ማርያም ሆይ። አሜን።',
          imagePath: 'assets/sunrise.jpeg',
        ),
      ],
      'Prayer of St. Francis': [
        PrayerStep(
          sectionHeader: 'PETITION',
          titleEn: 'Prayer of St. Francis',
          titleAm: 'የቅዱስ ፍራንሲስ ጸሎት',
          contentEn:
          'Lord, make me an instrument of your peace:\nwhere there is hatred, let me sow love;\nwhere there is injury, pardon;\nwhere there is doubt, faith;\nwhere there is despair, hope;\nwhere there is darkness, light;\nwhere there is sadness, joy.',
          contentAm:
          'ጌታ ሆይ፣ የሰላምህ መሣሪያ አድርገኝ፡\nጥል ባለበት ቦታ፣ ፍቅርን እንድዘራ፤\nበደል ባለበት፣ ይቅርታን፤\nመጠራጠር ባለበት፣ እምነትን፤\nተስፋ መቁረጥ ባለበት፣ ተስፋን፤\nጨለማ ባለበት፣ ብርሃንን፤\nሐዘን ባለበት፣ ደስታን እንድዘራ እርዳኝ።',
          imagePath: 'assets/sunrise.jpeg',
        ),
        PrayerStep(
          sectionHeader: 'REFLECTION',
          titleEn: 'Prayer of St. Francis',
          titleAm: 'የቅዱስ ፍራንሲስ ጸሎት',
          contentEn:
          'O divine Master, grant that I may not so much seek\nto be consoled as to console,\nto be understood as to understand,\nto be loved as to love.',
          contentAm:
          'ኦ ጌታ ሆይ፣ ከመጽናናት ይልቅ እንድጽናና፣\nከመወደድ ይልቅ እንድወድ፣\nከመረዳት ይልቅ እንድረዳ አድርገኝ።',
          imagePath: 'assets/sunrise.jpeg',
        ),
        PrayerStep(
          sectionHeader: 'FINAL PRAYER',
          titleEn: 'Prayer of St. Francis',
          titleAm: 'የቅዱስ ፍራንሲስ ጸሎት',
          contentEn:
          'For it is in giving that we receive,\nit is in pardoning that we are pardoned,\nand it is in dying that we are born to eternal life. Amen.',
          contentAm:
          'በመስጠት ስለምንቀበል፣\nበይቅርታ ስለምንታረቅ፣\nበመሞትም ወደ ዘላለም ሕይወት ስለምንወለድ ነው። አሜን።',
          imagePath: 'assets/sunrise.jpeg',
        ),
      ],
      'The Guardian Angel Prayer': [
        PrayerStep(
          sectionHeader: 'PROTECTION',
          titleEn: 'The Guardian Angel Prayer',
          titleAm: 'የጠባቂ መልአክ ጸሎት',
          contentEn:
          'Angel of God, my guardian dear,\nTo whom God\'s love commits me here,\nEver this day, be at my side,\nTo light, to guard, to rule, and guide. Amen.',
          contentAm:
          'የእግዚአብሔር መልአክ፣ ውድ ጠባቂዬ፣\nየእግዚአብሔር ፍቅር ለእኔ የሰጠህ፣\nዛሬ ሁልጊዜ ከአጠገቤ ሁን፣\nእንድታበራልኝ፣ እንድትጠብቀኝ፣ እንድትመራኝም። አሜን።',
          imagePath: 'assets/sunrise.jpeg',
        ),
      ],
      'The Benedictus': [
        PrayerStep(
          sectionHeader: 'CANTICLE OF ZECHARIAH',
          titleEn: 'The Benedictus',
          titleAm: 'የዘካርያስ ምስጋና (ቤኔዲክቱስ)',
          contentEn:
          'Blessed be the Lord, the God of Israel;\nhe has come to his people and set them free.\nHe has raised up for us a mighty savior,\nborn of the house of his servant David.\nThrough his holy prophets he promised of old\nthat he would save us from our enemies,\nfrom the hands of all who hate us.',
          contentAm:
          'የእስራኤል አምላክ ጌታ ይባረክ፤\nወደ ሕዝቡ መጥቶ ነጻ አውጥቷቸዋልና።\nበአገልጋዩ በዳዊት ቤት\nኃያል መድኃኒት አቆመልን፤\nከጠላቶቻችንና ከሚጠሉን ሁሉ እጅ እንደሚያድነን\nከጥንት ጀምሮ በቅዱሳን ነቢያቱ አፍ ተናግሯልና።',
          imagePath: 'assets/sunrise.jpeg',
        ),
        PrayerStep(
          sectionHeader: 'COVENANT OF MERCY',
          titleEn: 'The Benedictus',
          titleAm: 'የዘካርያስ ምስጋና (ቤኔዲክቱስ)',
          contentEn:
          'He promised to show mercy to our fathers\nand to remember his holy covenant.\nThis was the oath he swore to our father Abraham:\nto set us free from the hands of our enemies,\nfree to worship him without fear,\nholy and righteous in his sight all the days of our life.',
          contentAm:
          'ለአባቶቻችን ምሕረትን ለማድረግ\nቅዱስ ኪዳኑንም ለማሰብ ቃል ገባ፤\nይህም ለአባታችን ለአብርሃም የገባሁለት መሐላ ነው፤\nከጠላቶቻችን እጅ ነጻ ወጥተን፣\nበዘመናችን ሁሉ ያለ ፍርሃት በፊቱ በቅድስናና በጽድቅ እንድናመልከው።',
          imagePath: 'assets/sunrise.jpeg',
        ),
        PrayerStep(
          sectionHeader: 'PROPHETIC PROPHECY',
          titleEn: 'The Benedictus',
          titleAm: 'የዘካርያስ ምስጋና (ቤኔዲክቱስ)',
          contentEn:
          'You, my child, shall be called the prophet of the Most High;\nfor you will go before the Lord to prepare his way,\nto give his people knowledge of salvation\nby the forgiveness of their sins.',
          contentAm:
          'አንተም ሕፃን ሆይ፣ የልዑል ነቢይ ትባላለህ፤\nመንገዱን ልትጠርግ በጌታ ፊት ትሄዳለህና፣\nበኃጢአታቸው ስረየት የደኅንነትን እውቀት ለሕዝቡ ልትሰጥ።',
          imagePath: 'assets/sunrise.jpeg',
        ),
        PrayerStep(
          sectionHeader: 'DAWN FROM ON HIGH',
          titleEn: 'The Benedictus',
          titleAm: 'የዘካርያስ ምስጋና (ቤኔዲክቱስ)',
          contentEn:
          'In the tender compassion of our God\nthe dawn from on high shall break upon us,\nto shine on those who dwell in darkness and the shadow of death,\nand to guide our feet into the way of peace.\nGlory to the Father and to the Son and to the Holy Spirit,\nas it was in the beginning, is now, and will be forever. Amen.',
          contentAm:
          'ከአምላካችን ከበዛው ርኅራኄ የተነሣ\nከላይ የመጣው ንጋት ይጎበኘናል፤\nበጨለማና በሞት ጥላ ውስጥ ለቀመጡት ሊያበራ፣\nእግሮቻችንንም ወደ ሰላም መንገድ ሊመራ።\nክብር ለአብ ለወልድ ለመንፈስ ቅዱስም ይሁን፣\nበመጀመሪያ እንደነበረ አሁንም ዘወትርም ለዘላለሙ። አሜን።',
          imagePath: 'assets/sunrise.jpeg',
        ),
      ],
      'Act of Contrition': [
        PrayerStep(
          sectionHeader: 'REPENTANCE',
          titleEn: 'Act of Contrition',
          titleAm: 'የንስሐ ጸሎት',
          contentEn:
          'My God, I am sorry for my sins with all my heart. In choosing to do wrong and failing to do good, I have sinned against you whom I should love above all things.\nI firmly intend, with your help, to do penance, to sin no more, and to avoid whatever leads me to sin.\nOur Savior Jesus Christ suffered and died for us. In his name, my God, have mercy. Amen.',
          contentAm:
          'አምላኬ ሆይ፣ በፈጸምኩት ኃጢአት ሁሉ በሙሉ ልቤ እጸጸታለሁ። ክፉ በማድረጌና ደግ ነገር ባለማድረጌ፣ ከሁሉ በላይ ልወድህ በሚገባኝ በአንተ ላይ በደልሁ።\nበአንተ እርዳታ ንስሐ ለመግባት፣ ከእንግዲህ ወደ ኃጢአት ላለመመለስና ወደ ኃጢአት የሚመሩኝን ነገሮች ሁሉ ለማስወገድ ቁርጥ ውሳኔ አደርጋለሁ።\nመድኃኒታችን ኢየሱስ ክርስቶስ ስለ እኛ መከራን ተቀብሎ ሞተ። በስሙ አምላኬ ሆይ ምህረት አድርግልኝ። አሜን።',
          imagePath: 'assets/img_2.png',
        ),
      ],
      'Prayer for the Hour of Mercy': [
        PrayerStep(
          sectionHeader: 'FOUNT OF MERCY',
          titleEn: 'Prayer for the Hour of Mercy',
          titleAm: 'የምህረት ሰዓት ጸሎት',
          contentEn:
          'O Blood and Water, which gushed forth from the Heart of Jesus as a fount of Mercy for us, I trust in You.\n\nYou Yourself, Jesus, surely out of love for us, underwent such a terrible Passion...',
          contentAm:
          'ለእኛ የምህረት ምንጭ ሆነህ ከኢየሱስ ልብ የፈሰስክ ደምና ውኃ ሆይ፣ በአንተ እተማመናለሁ...',
          imagePath: 'assets/img_5.png',
        ),
      ],
      'Prayer to St. Michael the Archangel': [
        PrayerStep(
          sectionHeader: 'PROTECTION IN BATTLE',
          titleEn: 'Prayer to St. Michael the Archangel',
          titleAm: 'ወደ ቅዱስ ሚካኤል ሊቀ መላእክት ጸሎት',
          contentEn:
          'Saint Michael the Archangel, defend us in battle.\nBe our protection against the wickedness and snares of the devil.\nMay God rebuke him, we humbly pray; and do thou,\nO Prince of the heavenly host, by the power of God,\ncast into hell Satan and all the evil spirits,\nwho prowl about the world seeking the ruin of souls. Amen.',
          contentAm:
          'ቅዱስ ሚካኤል ሊቀ መላእክት ሆይ፣ በውጊያ ላይ ጠብቀን።\nከዲያብሎስ ክፋትና ወጥመድ መከታ ሁነን።\nእግዚአብሔር እንዲገሥጸው በትሕትና እንጸልያለን፤\nአንተም የሰማያዊ ሠራዊት አለቃ ሆይ፣ በእግዚአብሔር ኃይል፣\nየነፍሳትን ጥፋት በመፈለግ በዓለም ላይ የሚዞሩትን\nሰይጣንንና ክፉዎችን መናፍስት ሁሉ ወደ ሲኦል ጣላቸው። አሜን።',
          imagePath: 'assets/img_4.png',
        ),
      ],
      'The Magnificat': [
        PrayerStep(
          sectionHeader: 'CANTICLE OF MARY',
          titleEn: 'The Magnificat',
          titleAm: 'የእመቤታችን ማርያም ምስጋና (ማግኒፊካት)',
          contentEn:
          'My soul proclaims the greatness of the Lord,\nmy spirit rejoices in God my Savior,\nfor he has looked with favor on his lowly servant.\nFrom this day all generations will call me blessed:\nthe Almighty has done great things for me,\nand holy is his Name.',
          contentAm:
          'ነፍሴ ጌታን ታበራዋለች፤\nመንፈሴም በአምላኬ በመድኃኒቴ ሐሴት ታደርጋለች፤\nየአገልጋዩን ትሕትና ተመልክቷልና።\nእነሆ ከዛሬ ጀምሮ ትውልድ ሁሉ ብፅዕት ይሉኛል፤\nብርቱ የሆነው እርሱ በእኔ ታላቅ ነገር አድርጓልና፤\nስሙም ቅዱስ ነው።',
          imagePath: 'assets/sunrise.jpeg',
        ),
      ],
      'Prayer to Saint Joseph': [
        PrayerStep(
          sectionHeader: 'PETITION TO ST. JOSEPH',
          titleEn: 'Prayer to St. Joseph',
          titleAm: 'ወደ ቅዱስ ዮሴፍ ጸሎት',
          contentEn:
          'Oh, St. Joseph, whose protection is so great, so prompt, so strong,\nbefore the throne of God, I place in you all my interests and desires...',
          contentAm:
          'ኦ ቅዱስ ዮሴፍ፣ ጥበቃህ በእግዚአብሔር ዙፋን ፊት እጅግ ታላቅ፣ ፈጣንና ኃያል የሆነ...',
          imagePath: 'assets/img_12.png',
        ),
      ],
    // -------------------------------------------------------------------------
    // NEW ADDITIONS FROM PERPLEXITY
    // -------------------------------------------------------------------------
    'Traditional Evening Prayer': [
      PrayerStep(
        sectionHeader: 'EVENING THANKSGIVING',
        titleEn: 'Traditional Evening Prayer',
        titleAm: 'የምሽት ጸሎት',
        contentEn:
        'O my God, at the end of this day I thank You for all the graces I have received from You.\n'
            'I am sorry for the sins I have committed this day. Forgive me, O Lord.\n'
            'Protect me this night, and may Your grace be with me always. Amen.',
        contentAm:
        'አምላኬ ሆይ፣ በዚህ ቀን መጨረሻ ከእኔ የተቀበልኳቸውን ጸጋዎች ሁሉ አመሰግንሃለሁ።\n'
            'ዛሬ ስለሠራኋቸው ኃጢአቶች እጸጸታለሁ። ጌታ ሆይ ይቅር በለኝ።\n'
            'በዚህ ሌሊት ጠብቀኝ፣ ጸጋህም ሁልጊዜ ከእኔ ጋር ይሁን። አሜን።',
        imagePath: 'assets/img_10.png',
      ),
    ],

    'Te Deum': [
      PrayerStep(
        sectionHeader: 'HYMN OF PRAISE',
        titleEn: 'Te Deum (Hymn of Thanksgiving)',
        titleAm: 'ተ ደኤም (የምስጋና መዝሙር)',
        contentEn:
        'We praise Thee, O God; we acknowledge Thee to be the Lord.\n'
            'All the earth doth worship Thee, the Father everlasting.\n'
            'To Thee all Angels cry aloud: the Heavens and all the Powers therein;\n'
            'To Thee Cherubim and Seraphim continually do cry:\n'
            'Holy, Holy, Holy, Lord God of Sabaoth;\n'
            'Heaven and earth are full of the majesty of Thy glory. Amen.',
        contentAm:
        'እግዚአብሔር ሆይ፣ እናመሰግንሃለን፤ ጌታ መሆንህን እንመሰክራለን።\n'
            'ምድር ሁሉ ለዘላለም አባት ለአንተ ትሰግዳለች።\n'
            'መላእክት ሁሉ፣ ሰማያትና በውስጣቸው ያሉ ኃይላት ሁሉ ወደ አንቺ ይጮሃሉ፤\n'
            'ኪሩቤልና ሱራፌል ሳያቋርጡ ይጮሃሉ፡\n'
            'ቅዱስ፣ ቅዱስ፣ ቅዱስ፣ የሠራዊት ጌታ እግዚአብሔር፤\n'
            'ሰማይና ምድር የክብርህ ታላቅነት የተሞሉ ናቸው። አሜን።',
        imagePath: 'assets/sunrise.jpeg',
      ),
    ],

    'St. Patrick\'s Breastplate': [
      PrayerStep(
        sectionHeader: 'LORICA OF PROTECTION',
        titleEn: 'St. Patrick\'s Breastplate',
        titleAm: 'የቅዱስ ፓትሪክ ጥበቃ',
        contentEn:
        'Christ with me, Christ before me, Christ behind me, Christ in me,\n'
            'Christ beneath me, Christ above me, Christ on my right, Christ on my left,\n'
            'Christ when I lie down, Christ when I sit, Christ when I arise,\n'
            'Christ in the heart of every man who thinks of me,\n'
            'Christ in the mouth of everyone who speaks of me,\n'
            'Christ in every eye that sees me, Christ in every ear that hears me. Amen.',
        contentAm:
        'ክርስቶስ ከእኔ ጋር፣ ክርስቶስ በፊቴ፣ ክርስቶስ ከበስተኋላዬ፣ ክርስቶስ በእኔ ውስጥ፣\n'
            'ክርስቶስ ከበታቼ፣ ክርስቶስ ከበላዬ፣ ክርስቶስ በቀኝ በኩል፣ ክርስቶስ በግራ በኩል፣\n'
            'ስተኛ ክርስቶስ፣ ስቀመጥ ክርስቶስ፣ ስነሳ ክርስቶስ፣\n'
            'ስለ እኔ በሚያስብ ሰው ሁሉ ልብ ውስጥ ክርስቶስ፣\n'
            'ስለ እኔ በሚናገር ሰው ሁሉ አፍ ውስጥ ክርስቶስ፣\n'
            'በሚያየኝ ዓይን ሁሉ ውስጥ ክርስቶስ፣ በሚሰማኝ ጆሮ ሁሉ ውስጥ ክርስቶስ። አሜን።',
        imagePath: 'assets/francis.jpg',
      ),
    ],

    'Visit We Beseech Thee': [
      PrayerStep(
        sectionHeader: 'PROTECTION OF THE HOME',
        titleEn: 'Visit, We Beseech Thee',
        titleAm: 'የቤት ጥበቃ ጸሎት',
        contentEn:
        'Visit, we beseech Thee, O Lord, this habitation, and drive far from it all snares of the enemy.\n'
            'Let Thy holy Angels dwell herein to preserve us in peace;\n'
            'and may Thy blessing be always upon us, through our Lord Jesus Christ. Amen.',
        contentAm:
        'ጌታ ሆይ፣ ይህንን መኖሪያ እንድትጎበኝ፣ የጠላትንም ወጥመድ ሁሉ ከእርሱ እንድታርቅ እንለምንሃለን።\n'
            'በሰላም እንድንኖር ቅዱሳን መላእክትህ በእርሱ ውስጥ ይደሩ፤\n'
            'በረከትህም በጌታችን በኢየሱስ ክርስቶስ በኩል ሁልጊዜ በእኛ ላይ ይሁን። አሜን።',
        imagePath: 'assets/img_2.png',
      ),
    ],

    'Psalm 51 (Miserere)': [
      PrayerStep(
        sectionHeader: 'ACT OF PENITENCE',
        titleEn: 'Psalm 51 (Miserere)',
        titleAm: 'መዝሙር 51 (ምህረት አድርግልኝ)',
        contentEn:
        'Have mercy on me, O God, according to Thy steadfast love;\n'
            'according to Thy abundant mercy blot out my transgressions.\n'
            'Wash me thoroughly from my iniquity, and cleanse me from my sin!\n'
            'Create in me a clean heart, O God, and put a new and right spirit within me. Amen.',
        contentAm:
        'አምላክ ሆይ፣ እንደ ቸርነትህ መጠን ምሕረት አድርግልኝ፤\n'
            'እንደ ምሕረትህም ብዛት መተላለፌን ደምስስ።\n'
            'ከበደሌ ፈጽመህ እጠበኝ፣ ከኃጢአቴም አ hisፅራኝ።\n'
            'አምላክ ሆይ፣ ንጹሕ ልብን ፍጠርልኝ፣ የቀናውንም መንፈስ በውስጤ አድስ። አሜን።',
        imagePath: 'assets/img_2.png',
      ),
    ],

    'Sub Tuum Praesidium': [
      PrayerStep(
        sectionHeader: 'ANCIENT MARIAN PRAYER',
        titleEn: 'Sub Tuum Praesidium',
        titleAm: 'ሱብ ቱም ፕሬሲዲየም (ወደ አንቺ እንጠጋለን)',
        contentEn:
        'We fly to thy patronage, O holy Mother of God;\n'
            'despise not our petitions in our necessities,\n'
            'but deliver us always from all dangers, O glorious and blessed Virgin. Amen.',
        contentAm:
        'ቅድስት የአምላክ እናት ሆይ፣ ወደ አንቺ ጥበቃ እንሸሻለን፤\n'
            'በችግራችን ጊዜ ልመናችንን አትናቂ፣\n'
            'የከበርሽና የተባረክሽ ድንግል ሆይ፣ ሁልጊዜ ከደጋፊዎች ሁሉ አድነን። አሜን።',
        imagePath: 'assets/img_1.png',
      ),
    ],

    'Prayer for the Holy Father': [
      PrayerStep(
        sectionHeader: 'INTERCESSION FOR THE POPE',
        titleEn: 'Prayer for the Holy Father',
        titleAm: 'ለርዕሰ ሊቃነ ጳጳሳት ጸሎት',
        contentEn:
        'O God, the Shepherd and Ruler of all the faithful, look mercifully upon Thy servant, the Pope, whom Thou hast appointed to preside over Thy Church.\n'
            'Grant, we beseech Thee, that by word and example he may edify those under his charge, so that, together with the flock entrusted to him, he may attain everlasting life. Through Christ our Lord. Amen.',
        contentAm:
        'የምእመናን ሁሉ እረኛና መሪ የሆንክ አምላክ ሆይ፣ በቤተክርስቲያንህ ላይ እንዲሾም በሾምከው አገልጋይህ ርዕሰ ሊቃነ ጳጳሳት ላይ በምህረት ተመልከት።\n'
            'በቃልና በምሳሌነት በሥሩ ያሉትን ያንጽ ዘንድ፣ ከተሰጠው መንጋ ጋር ወደ ዘላለም ሕይወት ይደርስ ዘንድ እንለምንሃለን። በጌታችን በክርስቶስ በኩል. አሜን።',
        imagePath: 'assets/father.jpg',
      ),
    ],

    'Prayer for Families': [
      PrayerStep(
        sectionHeader: 'BLESSING OF THE HOUSEHOLD',
        titleEn: 'Prayer for Families',
        titleAm: 'ለቤተሰብ ጸሎት',
        contentEn:
        'O God, from whom all fatherhood and motherhood proceed, grant to our families the grace to live in Thy love and peace.\n'
            'Protect us from all harm, and guide us in the way of salvation. Through Christ our Lord. Amen.',
        contentAm:
        'አባትነትና እናትነት ሁሉ ከእርሱ የሚወጣ አምላክ ሆይ፣ ለቤተሰቦቻችን በፍቅርህና በሰላምህ የመኖርን ጸጋ ስጣቸው።\n'
            'ከጉዳት ሁሉ ጠብቀን፣ በደኅንነትም መንገድ መራን። በጌታችን በክርስቶስ በኩል. አሜን።',
        imagePath: 'assets/img_12.png',
      ),
    ],

    'Glory Be': [
      PrayerStep(
        sectionHeader: 'DOXOLOGY',
        titleEn: 'Glory Be',
        titleAm: 'ስብሐት ለአብ (ስብሐት)',
        contentEn:
        'Glory be to the Father, and to the Son, and to the Holy Spirit.\n'
            'As it was in the beginning, is now, and ever shall be, world without end. Amen.',
        contentAm:
        'ክብር ለአብ ለወልድ ለመንፈስ ቅዱስም ይሁን።\n'
            'በመጀመሪያ እንደነበረ አሁንም ዘወትርም ለዘላለሙ። አሜን።',
        imagePath: 'assets/sunrise.jpeg',
      ),
    ],

    'Jesus, I Trust in You': [
      PrayerStep(
        sectionHeader: 'ACT OF TRUST',
        titleEn: 'Jesus, I Trust in You',
        titleAm: 'ኢየሱስ ሆይ፣ በአንተ እተማመናለሁ',
        contentEn:
        'O Jesus, Fount of Mercy and Love, when doubts arise and burdens weigh heavy, I rest my soul in Your Sacred Heart.\n\n'
            'Jesus, I trust in You!\n'
            'Jesus, I trust in You!\n'
            'Jesus, I trust in You! Amen.',
        contentAm:
        'ኦ ኢየሱስ፣ የምህረትና የፍቅር ምንጭ፣ መጠራጠር በሚነሳበትና ሸክም በሚከብድበት ጊዜ፣ ነፍሴን በቅዱስ ልብህ ውስጥ አሳርፋለሁ።\n\n'
            'ኢየሱስ ሆይ፣ በአንተ እተማመናለሁ!\n'
            'ኢየሱስ ሆይ፣ በአንተ እተማመናለሁ!\n'
            'ኢየሱስ ሆይ፣ በአንተ እተማመናለሁ! አሜን።',
        imagePath: 'assets/img_5.png',
      ),
    ],
  };

  static List<PrayerStep> getPrayer(String key) {
    final normalizedKey = key.trim().toLowerCase();

    final entry = masterPrayerDB.entries.firstWhere(
          (e) => e.key.trim().toLowerCase() == normalizedKey,
      orElse: () => MapEntry(
        key,
        [
          PrayerStep(
            sectionHeader: 'PRAYER',
            titleEn: key,
            titleAm: key,
            contentEn: 'Opening prayer for $key...\n\nLord, hear our prayer. Amen.',
            contentAm: 'የቀን ጸሎት ለ $key...\n\nአምላክ ሆይ፣ ጸሎታችንን ስማ። አሜን።',
            imagePath: getImagePath(key),
          ),
        ],
      ),
    );
    return entry.value;
  }
}