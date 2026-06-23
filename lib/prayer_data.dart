import 'package:flutter/material.dart';
import 'package:operation_001/prayer_model.dart';

class prayer_data{

  static Map<String,List<PrayerStep>> masterPrayerDB= {
    'The Morning Offering':[
          PrayerStep(
              titleEn: 'In The Name Of The Father\n And Of The Son\n And Of The Holy Spirit\n Amen!',
              titleAm: 'የጠዋት መስዋዕት',
              contentEn: 'O Jesus,\n'
                  'through the Immaculate Heart of Mary,\n'
                  'I offer You my prayers, works,\n'
                  'joys and sufferings\n'
                  'of this day for all the intentions\n'
                  'of Your Sacred Heart,\n'
                  'in union with the Holy Sacrifice of the Mass\n'
                  'throughout the world,\n'
                  'in reparation for my sins,\n'
                  'for the intentions of all my relatives and friends,\n'
                  'and in particular\n'
                  'for the intentions of the Holy Father.\n'
                  'Amen',
              contentAm: 'እግዚአብሔር፣የኢየሱስ ልብ፣\n'
                  'ያለ አዳም ኃጢአት የተጸነስች\n'
                  'እንዲሁም የቤተክርስቲያን እናት በሆነችዉ\n'
                  ' በማርያም በኩል፣\n'
                  'በቅዱስ ቁርባን መስዋዕት በኩል፣\n'
                  'ልመናዎቼን ሥራዎቼን ተስፋዎቼንና\n'
                  'የዛሬ ቀን መከራዎቼን ለወንዶችና ለሴቶች፣\n'
                  'ለሰው ልጆች ሁሉ ደህንነትና ለኃጢአቶች ካሣ እንዲሆን አቀርባለሁ፡፡',
              imagePath: 'assets/sunrise.jpeg')
],
    'Prayer of St. Francis':[
      PrayerStep(
          titleEn: 'Prayer Of St. Francis',
          titleAm: 'የቅዱስ ፍራንቸስኮስ ጸሎት',
          contentEn: 'Lord, make me an instrument of your peace:\n'
              'where there is hatred, let me sow love;\n'
          'where there is injury, pardon;\n'
          'where there is doubt, faith;\n'
          'where there is despair, hope;\n'
          'where there is darkness, light;\n'
          'where there is sadness, joy.\n'
              'O divine Master, grant that I may not so much seek\n'
              'to be consoled as to console,\n'
              'to be understood as to understand,\n'
              'to be loved as to love.\n'
              'For it is in giving that we receive,\n'
              'it is in pardoning that we are pardoned,\n'
              'and it is in dying that we are born to eternal life.\n'
              'Amen',
          contentAm: 'ጌታ ሆይ የሰላም መሳሪያ እንድሆን አድርገኝ፤\n'
              'ጥል ባለበት ፍቅር፣\n'
          'በደል ባለበት ይቅርታ፣\n'
          'ክርክር ባለበት ስምምነት፣\n'
          'ጥርጣሬ ባለበት እምነት፣\n'
          'ስህተት ባለበት እዉነት፣\n'
          'ተስፋ መቁረጥ ባለበት መጽናናት፣\n'
          'ሓዘን ባለበት ደስታ፣\n'
          'ጨለማ ባለበት ብርሃን እንዲገኝ አደርግ ዘንድ አብቃኝ፡፡\n'
              'ጌታ ሆይ\n'
          'ከመጽናናት ማጽናናት፣\n'
          'ከመግባባት ማግባባት፣\n'
          'ከመወደድ መዉደድ፣\n'
          'ከመቀበል መስጠት፣\n'
          'ይቅር ለመባል ይቅር ማለት፣\n'
          'የዘለዓለም ሕይወት ለማግኘት መሞት እንዳለብኝ ለማወቅ እርዳኝ፡፡\n'
          'አሜን፡፡',
          imagePath: 'assets/St. Francis.jpg')
    ],

    'The Guardian Angel Prayer':[
      PrayerStep(
          titleEn: 'The Guardian Angel Prayer',
          titleAm: 'ፀሎት ወደ ቅዱስ ጠባቂ መልአክ',
          contentEn: 'Angel of God,\n'
              'my guardian dear,\n'
              'To whom God\'s love\n'
              'commits me here,\n'
              'Ever this day,\n'
              'be at my side,\n'
              'To light and guard,\n'
              'Rule and guide.',
          contentAm: 'ጠባቂዬ የሆንህ\n'
              'የእግዚአብሔር መልአክ ሆይ፣\n'
              'አንተ እንድትጠብቀኝ\n'
              'በአምላክ ቸርነት ላንተ ተሰጥቼአለሁና፣\n'
              'አዕምሮዬን አብራልኝ፣\n'
              'ጠብቀኝ፣\n'
              'ምራኝ፣\n'
              'እርዳኝ፡፡',
          imagePath: 'assets/St. Francis.jpg')
    ],

    'The Benedictus':[
      PrayerStep(
          titleEn: 'The Benedictus (Song of Zechariah)',
          titleAm: 'የዘካርያስ ጸሎት (ቤኔዲክቱስ)',
          contentEn: """Blessed be the Lord, the God of Israel;
          he has come to his people and set them free.
          He has raised up for us a mighty savior,
          born of the house of his servant David.
          
      Through his holy prophets he promised of old
      that he would save us from our enemies,
          from the hands of all who hate us.
      He promised to show mercy to our fathers
      and to remember his holy covenant.
      This was the oath he swore to our father
      Abraham:
      
      to set us free from the hands of our enemies,
          free to worship him without fear,
          holy and righteous in his sight all the days of our life.
          You, my child, shall be called the prophet of the Most High;
      for you will go before the Lord to prepare his way,
          to give his people knowledge of salvation
      by the forgiveness of their sins.
      
      In the tender compassion of our God
      the dawn from on high shall break upon us,
          to shine on those who dwell in darkness and the shadow of death,
          and to guide our feet into the way of peace.
          
      Glory to the Father and to the Son and to the Holy Spirit,
          as it was in the beginning, is now, and will be forever. Amen.""",
          contentAm: """68 የእስራኤል ጌታ አምላክ ይባረክ፥ ጐብኝቶ ለሕዝቡ ቤዛ አድርጎአልና፤
          69 -
      70 ከጥንት ጀምሮ በነበሩት በቅዱሳን ነቢያት አፍ እንደ ተናገረ፥ በብላቴናው በዳዊት ቤት የመዳን ቀንድን አስነስቶልናል፤
      71 ማዳኑም ከወደረኞቻችንና ከሚጠሉን ሁሉ እጅ ነው፤
      72 -
      73 እንደዚህ ለአባቶቻችን ምሕረት አደረገ፤ ለአባታችን ለአብርሃምም የማለውን መሐላውን ቅዱሱን ኪዳን አሰበ፤
      74 -
      75 በእርሱም ከጠላቶቻችን እጅ ድነን በዘመናችን ሁሉ ያለ ፍርሃት በቅድስናና በጽድቅ በፊቱ እንድናገለግለው ሰጠን።
      76 ደግሞም አንተ ሕፃን ሆይ፥ የልዑል ነቢይ ትባላለህ፥ መንገዱን ልትጠርግ በጌታ ፊት ትሄዳለህና፤
      77 እንደዚህም የኃጢአታቸው ስርየት የሆነውን የመዳን እውቀት ለሕዝቡ ትሰጣለህ፤
      78 ይህም ከላይ የመጣ ብርሃን በጐበኘበት በአምላካችን ምሕረትና ርኅራኄ ምክንያት ነው፤
          79 ብርሃኑም በጨለማና በሞት ጥላ ተቀምጠው ላሉት ያበራል እግሮቻችንንም በሰላም መንገድ ያቀናል።\n
          ለአብ፣ ለወልድና ለመንፈስ ቅዱስ ምስጋና ይሁን\nአሁንም ዘወትርም ለዘለዓለምም አሜን፡፡""",
          imagePath: 'assets/My Daily Journal.jpg')
    ],

    'Act Of Contrition':[
      PrayerStep(
          titleEn: 'Act Of Contrition',
          titleAm: 'የቅዱስ ፍራንቸስኮስ ጸሎት',
          contentEn: """My God,
          I am sorry for my sins with all my heart.
          In choosing to do wrong and failing to do good,
          I have sinned against you whom I should love above all things.
           
          I firmly intend, with your help,
          to do penance,
          to sin no more,
          and to avoid whatever leads me to sin.
          
          Our Savior Jesus Christ suffered and died for us.
          In his name, my God, have mercy.""",
          contentAm: 'አምላኬ ሆይ ፍጹም ተወዳጅ ነህ፣ '
              'ኃጢአትን የምትጠላ ነህ፤ '
              'በኃጢአቴ ስለበደልኩህ እጅግ አዝናለሁ፤ '
              'ማረኝ! '
              'ዳግመኛ ወደ ኃጢአት አልመለስም፤ '
              'በጸጋህ ከኃጢአት ምክንያት ሁሉ እርቃለሁ፡፡ አሜን፡',
          imagePath: 'assets/St. Francis.jpg')
    ],

    'Prayer for the Hour of Mercy':[
      PrayerStep(
          titleEn: 'Prayer for the Hour of Mercy',
          titleAm: 'የቅዱስ ፍራንቸስኮስ ጸሎት',
          contentEn: """V: You expired Jesus, but the source of life gushed forth for souls, and the ocean
          of mercy opened up for the whole world.
      All: O Fountain of Life, unfathomable Divine Mercy, envelop the whole world
      and empty Yourself out upon us.
      V: O Blood and Water which gushed forth from the Heart of Jesus
      as a fount of Mercy for us,
          All: I trust in You.
          V: Mary, Mother of Mercy and our Mother,
          All: Pray for us.
      V: Saint Faustina and Saint John Paul II
      All: Pray for us""",
          contentAm: 'ጌታ ሆይ የሰላም መሳሪያ እንድሆን አድርገኝ፤\n'
              'ጥል ባለበት ፍቅር፣\n'
              'በደል ባለበት ይቅርታ፣\n'
              'ክርክር ባለበት ስምምነት፣\n'
              'ጥርጣሬ ባለበት እምነት፣\n'
              'ስህተት ባለበት እዉነት፣\n'
              'ተስፋ መቁረጥ ባለበት መጽናናት፣\n'
              'ሓዘን ባለበት ደስታ፣\n'
              'ጨለማ ባለበት ብርሃን እንዲገኝ አደርግ ዘንድ አብቃኝ፡፡\n'
              'ጌታ ሆይ\n'
              'ከመጽናናት ማጽናናት፣\n'
              'ከመግባባት ማግባባት፣\n'
              'ከመወደድ መዉደድ፣\n'
              'ከመቀበል መስጠት፣\n'
              'ይቅር ለመባል ይቅር ማለት፣\n'
              'የዘለዓለም ሕይወት ለማግኘት መሞት እንዳለብኝ ለማወቅ እርዳኝ፡፡\n'
              'አሜን፡፡',
          imagePath: 'assets/St. Francis.jpg')
    ],

    'Prayer to St. Michael the Archangel':[
      PrayerStep(
          titleEn: 'Prayer to St. Michael the Archangel',
          titleAm: 'ጸሎት ወደ ቅዱስ ሚካኤል',
          contentEn: """St. Michael the Archangel, 
          defend us in battle.
      Be our defense against the wickedness and snares of the Devil.
      May God rebuke him, we humbly pray,
          and do thou,
          O Prince of the heavenly hosts,
          by the power of God,
          thrust into hell Satan,
          and all the evil spirits,
          who prowl about the world
      seeking the ruin of souls. Amen.""",
          contentAm: 'ጌታ ሆይ የሰላም መሳሪያ እንድሆን አድርገኝ፤\n'
              'ጥል ባለበት ፍቅር፣\n'
              'በደል ባለበት ይቅርታ፣\n'
              'ክርክር ባለበት ስምምነት፣\n'
              'ጥርጣሬ ባለበት እምነት፣\n'
              'ስህተት ባለበት እዉነት፣\n'
              'ተስፋ መቁረጥ ባለበት መጽናናት፣\n'
              'ሓዘን ባለበት ደስታ፣\n'
              'ጨለማ ባለበት ብርሃን እንዲገኝ አደርግ ዘንድ አብቃኝ፡፡\n'
              'ጌታ ሆይ\n'
              'ከመጽናናት ማጽናናት፣\n'
              'ከመግባባት ማግባባት፣\n'
              'ከመወደድ መዉደድ፣\n'
              'ከመቀበል መስጠት፣\n'
              'ይቅር ለመባል ይቅር ማለት፣\n'
              'የዘለዓለም ሕይወት ለማግኘት መሞት እንዳለብኝ ለማወቅ እርዳኝ፡፡\n'
              'አሜን፡፡',
          imagePath: 'assets/St. Francis.jpg')
    ],

    'Rosary':[
      PrayerStep(
          titleEn: 'Rosary',
          titleAm: 'የቅዱስ ፍራንቸስኮስ ጸሎት',
          contentEn: 'Lord, make me an instrument of your peace:\n'
              'where there is hatred, let me sow love;\n'
              'where there is injury, pardon;\n'
              'where there is doubt, faith;\n'
              'where there is despair, hope;\n'
              'where there is darkness, light;\n'
              'where there is sadness, joy.\n'
              'O divine Master, grant that I may not so much seek\n'
              'to be consoled as to console,\n'
              'to be understood as to understand,\n'
              'to be loved as to love.\n'
              'For it is in giving that we receive,\n'
              'it is in pardoning that we are pardoned,\n'
              'and it is in dying that we are born to eternal life.\n'
              'Amen',
          contentAm: 'ጌታ ሆይ የሰላም መሳሪያ እንድሆን አድርገኝ፤\n'
              'ጥል ባለበት ፍቅር፣\n'
              'በደል ባለበት ይቅርታ፣\n'
              'ክርክር ባለበት ስምምነት፣\n'
              'ጥርጣሬ ባለበት እምነት፣\n'
              'ስህተት ባለበት እዉነት፣\n'
              'ተስፋ መቁረጥ ባለበት መጽናናት፣\n'
              'ሓዘን ባለበት ደስታ፣\n'
              'ጨለማ ባለበት ብርሃን እንዲገኝ አደርግ ዘንድ አብቃኝ፡፡\n'
              'ጌታ ሆይ\n'
              'ከመጽናናት ማጽናናት፣\n'
              'ከመግባባት ማግባባት፣\n'
              'ከመወደድ መዉደድ፣\n'
              'ከመቀበል መስጠት፣\n'
              'ይቅር ለመባል ይቅር ማለት፣\n'
              'የዘለዓለም ሕይወት ለማግኘት መሞት እንዳለብኝ ለማወቅ እርዳኝ፡፡\n'
              'አሜን፡፡',
          imagePath: 'assets/St. Francis.jpg')
    ],

    'Vespers (Evening Prayer)':[
      PrayerStep(
          titleEn: 'Vespers(Evening Prayer)',
          titleAm: 'የቅዱስ ፍራንቸስኮስ ጸሎት',
          contentEn: 'Lord, make me an instrument of your peace:\n'
              'where there is hatred, let me sow love;\n'
              'where there is injury, pardon;\n'
              'where there is doubt, faith;\n'
              'where there is despair, hope;\n'
              'where there is darkness, light;\n'
              'where there is sadness, joy.\n'
              'O divine Master, grant that I may not so much seek\n'
              'to be consoled as to console,\n'
              'to be understood as to understand,\n'
              'to be loved as to love.\n'
              'For it is in giving that we receive,\n'
              'it is in pardoning that we are pardoned,\n'
              'and it is in dying that we are born to eternal life.\n'
              'Amen',
          contentAm: 'ጌታ ሆይ የሰላም መሳሪያ እንድሆን አድርገኝ፤\n'
              'ጥል ባለበት ፍቅር፣\n'
              'በደል ባለበት ይቅርታ፣\n'
              'ክርክር ባለበት ስምምነት፣\n'
              'ጥርጣሬ ባለበት እምነት፣\n'
              'ስህተት ባለበት እዉነት፣\n'
              'ተስፋ መቁረጥ ባለበት መጽናናት፣\n'
              'ሓዘን ባለበት ደስታ፣\n'
              'ጨለማ ባለበት ብርሃን እንዲገኝ አደርግ ዘንድ አብቃኝ፡፡\n'
              'ጌታ ሆይ\n'
              'ከመጽናናት ማጽናናት፣\n'
              'ከመግባባት ማግባባት፣\n'
              'ከመወደድ መዉደድ፣\n'
              'ከመቀበል መስጠት፣\n'
              'ይቅር ለመባል ይቅር ማለት፣\n'
              'የዘለዓለም ሕይወት ለማግኘት መሞት እንዳለብኝ ለማወቅ እርዳኝ፡፡\n'
              'አሜን፡፡',
          imagePath: 'assets/St. Francis.jpg')
    ],

    'The Magnificat':[
      PrayerStep(
          titleEn: 'The Magnificat',
          titleAm: 'የቅዱስ ፍራንቸስኮስ ጸሎት',
          contentEn: 'Lord, make me an instrument of your peace:\n'
              'where there is hatred, let me sow love;\n'
              'where there is injury, pardon;\n'
              'where there is doubt, faith;\n'
              'where there is despair, hope;\n'
              'where there is darkness, light;\n'
              'where there is sadness, joy.\n'
              'O divine Master, grant that I may not so much seek\n'
              'to be consoled as to console,\n'
              'to be understood as to understand,\n'
              'to be loved as to love.\n'
              'For it is in giving that we receive,\n'
              'it is in pardoning that we are pardoned,\n'
              'and it is in dying that we are born to eternal life.\n'
              'Amen',
          contentAm: 'ጌታ ሆይ የሰላም መሳሪያ እንድሆን አድርገኝ፤\n'
              'ጥል ባለበት ፍቅር፣\n'
              'በደል ባለበት ይቅርታ፣\n'
              'ክርክር ባለበት ስምምነት፣\n'
              'ጥርጣሬ ባለበት እምነት፣\n'
              'ስህተት ባለበት እዉነት፣\n'
              'ተስፋ መቁረጥ ባለበት መጽናናት፣\n'
              'ሓዘን ባለበት ደስታ፣\n'
              'ጨለማ ባለበት ብርሃን እንዲገኝ አደርግ ዘንድ አብቃኝ፡፡\n'
              'ጌታ ሆይ\n'
              'ከመጽናናት ማጽናናት፣\n'
              'ከመግባባት ማግባባት፣\n'
              'ከመወደድ መዉደድ፣\n'
              'ከመቀበል መስጠት፣\n'
              'ይቅር ለመባል ይቅር ማለት፣\n'
              'የዘለዓለም ሕይወት ለማግኘት መሞት እንዳለብኝ ለማወቅ እርዳኝ፡፡\n'
              'አሜን፡፡',
          imagePath: 'assets/St. Francis.jpg')
    ],

    'Prayer of St. Augustine':[
      PrayerStep(
          titleEn: 'Act Of Contrition',
          titleAm: 'የቅዱስ ፍራንቸስኮስ ጸሎት',
          contentEn: 'Lord, make me an instrument of your peace:\n'
              'where there is hatred, let me sow love;\n'
              'where there is injury, pardon;\n'
              'where there is doubt, faith;\n'
              'where there is despair, hope;\n'
              'where there is darkness, light;\n'
              'where there is sadness, joy.\n'
              'O divine Master, grant that I may not so much seek\n'
              'to be consoled as to console,\n'
              'to be understood as to understand,\n'
              'to be loved as to love.\n'
              'For it is in giving that we receive,\n'
              'it is in pardoning that we are pardoned,\n'
              'and it is in dying that we are born to eternal life.\n'
              'Amen',
          contentAm: 'ጌታ ሆይ የሰላም መሳሪያ እንድሆን አድርገኝ፤\n'
              'ጥል ባለበት ፍቅር፣\n'
              'በደል ባለበት ይቅርታ፣\n'
              'ክርክር ባለበት ስምምነት፣\n'
              'ጥርጣሬ ባለበት እምነት፣\n'
              'ስህተት ባለበት እዉነት፣\n'
              'ተስፋ መቁረጥ ባለበት መጽናናት፣\n'
              'ሓዘን ባለበት ደስታ፣\n'
              'ጨለማ ባለበት ብርሃን እንዲገኝ አደርግ ዘንድ አብቃኝ፡፡\n'
              'ጌታ ሆይ\n'
              'ከመጽናናት ማጽናናት፣\n'
              'ከመግባባት ማግባባት፣\n'
              'ከመወደድ መዉደድ፣\n'
              'ከመቀበል መስጠት፣\n'
              'ይቅር ለመባል ይቅር ማለት፣\n'
              'የዘለዓለም ሕይወት ለማግኘት መሞት እንዳለብኝ ለማወቅ እርዳኝ፡፡\n'
              'አሜን፡፡',
          imagePath: 'assets/St. Francis.jpg')
    ],

    'Compline (Night Prayer)':[
      PrayerStep(
          titleEn: 'Act Of Contrition',
          titleAm: 'የቅዱስ ፍራንቸስኮስ ጸሎት',
          contentEn: 'Lord, make me an instrument of your peace:\n'
              'where there is hatred, let me sow love;\n'
              'where there is injury, pardon;\n'
              'where there is doubt, faith;\n'
              'where there is despair, hope;\n'
              'where there is darkness, light;\n'
              'where there is sadness, joy.\n'
              'O divine Master, grant that I may not so much seek\n'
              'to be consoled as to console,\n'
              'to be understood as to understand,\n'
              'to be loved as to love.\n'
              'For it is in giving that we receive,\n'
              'it is in pardoning that we are pardoned,\n'
              'and it is in dying that we are born to eternal life.\n'
              'Amen',
          contentAm: 'ጌታ ሆይ የሰላም መሳሪያ እንድሆን አድርገኝ፤\n'
              'ጥል ባለበት ፍቅር፣\n'
              'በደል ባለበት ይቅርታ፣\n'
              'ክርክር ባለበት ስምምነት፣\n'
              'ጥርጣሬ ባለበት እምነት፣\n'
              'ስህተት ባለበት እዉነት፣\n'
              'ተስፋ መቁረጥ ባለበት መጽናናት፣\n'
              'ሓዘን ባለበት ደስታ፣\n'
              'ጨለማ ባለበት ብርሃን እንዲገኝ አደርግ ዘንድ አብቃኝ፡፡\n'
              'ጌታ ሆይ\n'
              'ከመጽናናት ማጽናናት፣\n'
              'ከመግባባት ማግባባት፣\n'
              'ከመወደድ መዉደድ፣\n'
              'ከመቀበል መስጠት፣\n'
              'ይቅር ለመባል ይቅር ማለት፣\n'
              'የዘለዓለም ሕይወት ለማግኘት መሞት እንዳለብኝ ለማወቅ እርዳኝ፡፡\n'
              'አሜን፡፡',
          imagePath: 'assets/St. Francis.jpg')
    ],

    'The Memorare':[
      PrayerStep(
          titleEn: 'The Memorare',
          titleAm: 'የቅዱስ ፍራንቸስኮስ ጸሎት',
          contentEn: 'Lord, make me an instrument of your peace:\n'
              'where there is hatred, let me sow love;\n'
              'where there is injury, pardon;\n'
              'where there is doubt, faith;\n'
              'where there is despair, hope;\n'
              'where there is darkness, light;\n'
              'where there is sadness, joy.\n'
              'O divine Master, grant that I may not so much seek\n'
              'to be consoled as to console,\n'
              'to be understood as to understand,\n'
              'to be loved as to love.\n'
              'For it is in giving that we receive,\n'
              'it is in pardoning that we are pardoned,\n'
              'and it is in dying that we are born to eternal life.\n'
              'Amen',
          contentAm: 'ጌታ ሆይ የሰላም መሳሪያ እንድሆን አድርገኝ፤\n'
              'ጥል ባለበት ፍቅር፣\n'
              'በደል ባለበት ይቅርታ፣\n'
              'ክርክር ባለበት ስምምነት፣\n'
              'ጥርጣሬ ባለበት እምነት፣\n'
              'ስህተት ባለበት እዉነት፣\n'
              'ተስፋ መቁረጥ ባለበት መጽናናት፣\n'
              'ሓዘን ባለበት ደስታ፣\n'
              'ጨለማ ባለበት ብርሃን እንዲገኝ አደርግ ዘንድ አብቃኝ፡፡\n'
              'ጌታ ሆይ\n'
              'ከመጽናናት ማጽናናት፣\n'
              'ከመግባባት ማግባባት፣\n'
              'ከመወደድ መዉደድ፣\n'
              'ከመቀበል መስጠት፣\n'
              'ይቅር ለመባል ይቅር ማለት፣\n'
              'የዘለዓለም ሕይወት ለማግኘት መሞት እንዳለብኝ ለማወቅ እርዳኝ፡፡\n'
              'አሜን፡፡',
          imagePath: 'assets/St. Francis.jpg')
    ],

    'Prayer to Saint Joseph':[
      PrayerStep(
          titleEn: 'Prayer to Saint Joseph',
          titleAm: 'የቅዱስ ፍራንቸስኮስ ጸሎት',
          contentEn: 'Lord, make me an instrument of your peace:\n'
              'where there is hatred, let me sow love;\n'
              'where there is injury, pardon;\n'
              'where there is doubt, faith;\n'
              'where there is despair, hope;\n'
              'where there is darkness, light;\n'
              'where there is sadness, joy.\n'
              'O divine Master, grant that I may not so much seek\n'
              'to be consoled as to console,\n'
              'to be understood as to understand,\n'
              'to be loved as to love.\n'
              'For it is in giving that we receive,\n'
              'it is in pardoning that we are pardoned,\n'
              'and it is in dying that we are born to eternal life.\n'
              'Amen',
          contentAm: 'ጌታ ሆይ የሰላም መሳሪያ እንድሆን አድርገኝ፤\n'
              'ጥል ባለበት ፍቅር፣\n'
              'በደል ባለበት ይቅርታ፣\n'
              'ክርክር ባለበት ስምምነት፣\n'
              'ጥርጣሬ ባለበት እምነት፣\n'
              'ስህተት ባለበት እዉነት፣\n'
              'ተስፋ መቁረጥ ባለበት መጽናናት፣\n'
              'ሓዘን ባለበት ደስታ፣\n'
              'ጨለማ ባለበት ብርሃን እንዲገኝ አደርግ ዘንድ አብቃኝ፡፡\n'
              'ጌታ ሆይ\n'
              'ከመጽናናት ማጽናናት፣\n'
              'ከመግባባት ማግባባት፣\n'
              'ከመወደድ መዉደድ፣\n'
              'ከመቀበል መስጠት፣\n'
              'ይቅር ለመባል ይቅር ማለት፣\n'
              'የዘለዓለም ሕይወት ለማግኘት መሞት እንዳለብኝ ለማወቅ እርዳኝ፡፡\n'
              'አሜን፡፡',
          imagePath: 'assets/St. Francis.jpg')
    ],

    'Prayer to St. Francis of Assisi':[
      PrayerStep(
          titleEn: 'Prayer to St. Francis of Assisi',
          titleAm: 'የቅዱስ ፍራንቸስኮስ ጸሎት',
          contentEn: 'Lord, make me an instrument of your peace:\n'
              'where there is hatred, let me sow love;\n'
              'where there is injury, pardon;\n'
              'where there is doubt, faith;\n'
              'where there is despair, hope;\n'
              'where there is darkness, light;\n'
              'where there is sadness, joy.\n'
              'O divine Master, grant that I may not so much seek\n'
              'to be consoled as to console,\n'
              'to be understood as to understand,\n'
              'to be loved as to love.\n'
              'For it is in giving that we receive,\n'
              'it is in pardoning that we are pardoned,\n'
              'and it is in dying that we are born to eternal life.\n'
              'Amen',
          contentAm: 'ጌታ ሆይ የሰላም መሳሪያ እንድሆን አድርገኝ፤\n'
              'ጥል ባለበት ፍቅር፣\n'
              'በደል ባለበት ይቅርታ፣\n'
              'ክርክር ባለበት ስምምነት፣\n'
              'ጥርጣሬ ባለበት እምነት፣\n'
              'ስህተት ባለበት እዉነት፣\n'
              'ተስፋ መቁረጥ ባለበት መጽናናት፣\n'
              'ሓዘን ባለበት ደስታ፣\n'
              'ጨለማ ባለበት ብርሃን እንዲገኝ አደርግ ዘንድ አብቃኝ፡፡\n'
              'ጌታ ሆይ\n'
              'ከመጽናናት ማጽናናት፣\n'
              'ከመግባባት ማግባባት፣\n'
              'ከመወደድ መዉደድ፣\n'
              'ከመቀበል መስጠት፣\n'
              'ይቅር ለመባል ይቅር ማለት፣\n'
              'የዘለዓለም ሕይወት ለማግኘት መሞት እንዳለብኝ ለማወቅ እርዳኝ፡፡\n'
              'አሜን፡፡',
          imagePath: 'assets/St. Francis.jpg')
    ],

    'The Litany of the Saints':[
      PrayerStep(
          titleEn: 'The Litany of the Saints',
          titleAm: 'የቅዱስ ፍራንቸስኮስ ጸሎት',
          contentEn: 'Lord, make me an instrument of your peace:\n'
              'where there is hatred, let me sow love;\n'
              'where there is injury, pardon;\n'
              'where there is doubt, faith;\n'
              'where there is despair, hope;\n'
              'where there is darkness, light;\n'
              'where there is sadness, joy.\n'
              'O divine Master, grant that I may not so much seek\n'
              'to be consoled as to console,\n'
              'to be understood as to understand,\n'
              'to be loved as to love.\n'
              'For it is in giving that we receive,\n'
              'it is in pardoning that we are pardoned,\n'
              'and it is in dying that we are born to eternal life.\n'
              'Amen',
          contentAm: 'ጌታ ሆይ የሰላም መሳሪያ እንድሆን አድርገኝ፤\n'
              'ጥል ባለበት ፍቅር፣\n'
              'በደል ባለበት ይቅርታ፣\n'
              'ክርክር ባለበት ስምምነት፣\n'
              'ጥርጣሬ ባለበት እምነት፣\n'
              'ስህተት ባለበት እዉነት፣\n'
              'ተስፋ መቁረጥ ባለበት መጽናናት፣\n'
              'ሓዘን ባለበት ደስታ፣\n'
              'ጨለማ ባለበት ብርሃን እንዲገኝ አደርግ ዘንድ አብቃኝ፡፡\n'
              'ጌታ ሆይ\n'
              'ከመጽናናት ማጽናናት፣\n'
              'ከመግባባት ማግባባት፣\n'
              'ከመወደድ መዉደድ፣\n'
              'ከመቀበል መስጠት፣\n'
              'ይቅር ለመባል ይቅር ማለት፣\n'
              'የዘለዓለም ሕይወት ለማግኘት መሞት እንዳለብኝ ለማወቅ እርዳኝ፡፡\n'
              'አሜን፡፡',
          imagePath: 'assets/St. Francis.jpg')
    ],

    'Prayer of Abandonment':[
      PrayerStep(
          titleEn: 'Prayer of Abandonment',
          titleAm: 'የቅዱስ ፍራንቸስኮስ ጸሎት',
          contentEn: 'Lord, make me an instrument of your peace:\n'
              'where there is hatred, let me sow love;\n'
              'where there is injury, pardon;\n'
              'where there is doubt, faith;\n'
              'where there is despair, hope;\n'
              'where there is darkness, light;\n'
              'where there is sadness, joy.\n'
              'O divine Master, grant that I may not so much seek\n'
              'to be consoled as to console,\n'
              'to be understood as to understand,\n'
              'to be loved as to love.\n'
              'For it is in giving that we receive,\n'
              'it is in pardoning that we are pardoned,\n'
              'and it is in dying that we are born to eternal life.\n'
              'Amen',
          contentAm: 'ጌታ ሆይ የሰላም መሳሪያ እንድሆን አድርገኝ፤\n'
              'ጥል ባለበት ፍቅር፣\n'
              'በደል ባለበት ይቅርታ፣\n'
              'ክርክር ባለበት ስምምነት፣\n'
              'ጥርጣሬ ባለበት እምነት፣\n'
              'ስህተት ባለበት እዉነት፣\n'
              'ተስፋ መቁረጥ ባለበት መጽናናት፣\n'
              'ሓዘን ባለበት ደስታ፣\n'
              'ጨለማ ባለበት ብርሃን እንዲገኝ አደርግ ዘንድ አብቃኝ፡፡\n'
              'ጌታ ሆይ\n'
              'ከመጽናናት ማጽናናት፣\n'
              'ከመግባባት ማግባባት፣\n'
              'ከመወደድ መዉደድ፣\n'
              'ከመቀበል መስጠት፣\n'
              'ይቅር ለመባል ይቅር ማለት፣\n'
              'የዘለዓለም ሕይወት ለማግኘት መሞት እንዳለብኝ ለማወቅ እርዳኝ፡፡\n'
              'አሜን፡፡',
          imagePath: 'assets/St. Francis.jpg')
    ],

    'Anima Christi':[
      PrayerStep(
          titleEn: 'Anima Christi',
          titleAm: 'የቅዱስ ፍራንቸስኮስ ጸሎት',
          contentEn: 'Lord, make me an instrument of your peace:\n'
              'where there is hatred, let me sow love;\n'
              'where there is injury, pardon;\n'
              'where there is doubt, faith;\n'
              'where there is despair, hope;\n'
              'where there is darkness, light;\n'
              'where there is sadness, joy.\n'
              'O divine Master, grant that I may not so much seek\n'
              'to be consoled as to console,\n'
              'to be understood as to understand,\n'
              'to be loved as to love.\n'
              'For it is in giving that we receive,\n'
              'it is in pardoning that we are pardoned,\n'
              'and it is in dying that we are born to eternal life.\n'
              'Amen',
          contentAm: 'ጌታ ሆይ የሰላም መሳሪያ እንድሆን አድርገኝ፤\n'
              'ጥል ባለበት ፍቅር፣\n'
              'በደል ባለበት ይቅርታ፣\n'
              'ክርክር ባለበት ስምምነት፣\n'
              'ጥርጣሬ ባለበት እምነት፣\n'
              'ስህተት ባለበት እዉነት፣\n'
              'ተስፋ መቁረጥ ባለበት መጽናናት፣\n'
              'ሓዘን ባለበት ደስታ፣\n'
              'ጨለማ ባለበት ብርሃን እንዲገኝ አደርግ ዘንድ አብቃኝ፡፡\n'
              'ጌታ ሆይ\n'
              'ከመጽናናት ማጽናናት፣\n'
              'ከመግባባት ማግባባት፣\n'
              'ከመወደድ መዉደድ፣\n'
              'ከመቀበል መስጠት፣\n'
              'ይቅር ለመባል ይቅር ማለት፣\n'
              'የዘለዓለም ሕይወት ለማግኘት መሞት እንዳለብኝ ለማወቅ እርዳኝ፡፡\n'
              'አሜን፡፡',
          imagePath: 'assets/St. Francis.jpg')
    ],

    'Litany of the Holy Name of Jesus':[
      PrayerStep(
          titleEn: 'Litany of the Holy Name of Jesus',
          titleAm: 'የቅዱስ ፍራንቸስኮስ ጸሎት',
          contentEn: 'Lord, make me an instrument of your peace:\n'
              'where there is hatred, let me sow love;\n'
              'where there is injury, pardon;\n'
              'where there is doubt, faith;\n'
              'where there is despair, hope;\n'
              'where there is darkness, light;\n'
              'where there is sadness, joy.\n'
              'O divine Master, grant that I may not so much seek\n'
              'to be consoled as to console,\n'
              'to be understood as to understand,\n'
              'to be loved as to love.\n'
              'For it is in giving that we receive,\n'
              'it is in pardoning that we are pardoned,\n'
              'and it is in dying that we are born to eternal life.\n'
              'Amen',
          contentAm: 'ጌታ ሆይ የሰላም መሳሪያ እንድሆን አድርገኝ፤\n'
              'ጥል ባለበት ፍቅር፣\n'
              'በደል ባለበት ይቅርታ፣\n'
              'ክርክር ባለበት ስምምነት፣\n'
              'ጥርጣሬ ባለበት እምነት፣\n'
              'ስህተት ባለበት እዉነት፣\n'
              'ተስፋ መቁረጥ ባለበት መጽናናት፣\n'
              'ሓዘን ባለበት ደስታ፣\n'
              'ጨለማ ባለበት ብርሃን እንዲገኝ አደርግ ዘንድ አብቃኝ፡፡\n'
              'ጌታ ሆይ\n'
              'ከመጽናናት ማጽናናት፣\n'
              'ከመግባባት ማግባባት፣\n'
              'ከመወደድ መዉደድ፣\n'
              'ከመቀበል መስጠት፣\n'
              'ይቅር ለመባል ይቅር ማለት፣\n'
              'የዘለዓለም ሕይወት ለማግኘት መሞት እንዳለብኝ ለማወቅ እርዳኝ፡፡\n'
              'አሜን፡፡',
          imagePath: 'assets/St. Francis.jpg')
    ],

    'Come, Holy Spirit':[
      PrayerStep(
          titleEn: 'Come, Holy Spirit',
          titleAm: 'የቅዱስ ፍራንቸስኮስ ጸሎት',
          contentEn: 'Lord, make me an instrument of your peace:\n'
              'where there is hatred, let me sow love;\n'
              'where there is injury, pardon;\n'
              'where there is doubt, faith;\n'
              'where there is despair, hope;\n'
              'where there is darkness, light;\n'
              'where there is sadness, joy.\n'
              'O divine Master, grant that I may not so much seek\n'
              'to be consoled as to console,\n'
              'to be understood as to understand,\n'
              'to be loved as to love.\n'
              'For it is in giving that we receive,\n'
              'it is in pardoning that we are pardoned,\n'
              'and it is in dying that we are born to eternal life.\n'
              'Amen',
          contentAm: 'ጌታ ሆይ የሰላም መሳሪያ እንድሆን አድርገኝ፤\n'
              'ጥል ባለበት ፍቅር፣\n'
              'በደል ባለበት ይቅርታ፣\n'
              'ክርክር ባለበት ስምምነት፣\n'
              'ጥርጣሬ ባለበት እምነት፣\n'
              'ስህተት ባለበት እዉነት፣\n'
              'ተስፋ መቁረጥ ባለበት መጽናናት፣\n'
              'ሓዘን ባለበት ደስታ፣\n'
              'ጨለማ ባለበት ብርሃን እንዲገኝ አደርግ ዘንድ አብቃኝ፡፡\n'
              'ጌታ ሆይ\n'
              'ከመጽናናት ማጽናናት፣\n'
              'ከመግባባት ማግባባት፣\n'
              'ከመወደድ መዉደድ፣\n'
              'ከመቀበል መስጠት፣\n'
              'ይቅር ለመባል ይቅር ማለት፣\n'
              'የዘለዓለም ሕይወት ለማግኘት መሞት እንዳለብኝ ለማወቅ እርዳኝ፡፡\n'
              'አሜን፡፡',
          imagePath: 'assets/St. Francis.jpg')
    ],

    'Hail Holy Queen':[
      PrayerStep(
          titleEn: 'Hail Holy Queen',
          titleAm: 'የቅዱስ ፍራንቸስኮስ ጸሎት',
          contentEn: 'Lord, make me an instrument of your peace:\n'
              'where there is hatred, let me sow love;\n'
              'where there is injury, pardon;\n'
              'where there is doubt, faith;\n'
              'where there is despair, hope;\n'
              'where there is darkness, light;\n'
              'where there is sadness, joy.\n'
              'O divine Master, grant that I may not so much seek\n'
              'to be consoled as to console,\n'
              'to be understood as to understand,\n'
              'to be loved as to love.\n'
              'For it is in giving that we receive,\n'
              'it is in pardoning that we are pardoned,\n'
              'and it is in dying that we are born to eternal life.\n'
              'Amen',
          contentAm: 'ጌታ ሆይ የሰላም መሳሪያ እንድሆን አድርገኝ፤\n'
              'ጥል ባለበት ፍቅር፣\n'
              'በደል ባለበት ይቅርታ፣\n'
              'ክርክር ባለበት ስምምነት፣\n'
              'ጥርጣሬ ባለበት እምነት፣\n'
              'ስህተት ባለበት እዉነት፣\n'
              'ተስፋ መቁረጥ ባለበት መጽናናት፣\n'
              'ሓዘን ባለበት ደስታ፣\n'
              'ጨለማ ባለበት ብርሃን እንዲገኝ አደርግ ዘንድ አብቃኝ፡፡\n'
              'ጌታ ሆይ\n'
              'ከመጽናናት ማጽናናት፣\n'
              'ከመግባባት ማግባባት፣\n'
              'ከመወደድ መዉደድ፣\n'
              'ከመቀበል መስጠት፣\n'
              'ይቅር ለመባል ይቅር ማለት፣\n'
              'የዘለዓለም ሕይወት ለማግኘት መሞት እንዳለብኝ ለማወቅ እርዳኝ፡፡\n'
              'አሜን፡፡',
          imagePath: 'assets/St. Francis.jpg')
    ],
  };
}
