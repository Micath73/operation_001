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
          contentEn: """My soul proclaims the greatness of the Lord,
          my spirit rejoices in God my Savior,
          for he has looked with favor on his lowly servant.
      From this day all generations will call me blessed:
      the Almighty has done great things for me,
      and holy is his Name.
      He has mercy on those who fear him
      in every generation.
      He has shown the strength of his arm,
      he has scattered the proud in their conceit.
      He has cast down the mighty from their thrones,
      and has lifted up the lowly.
      He has filled the hungry with good things,
      and the rich he has sent away empty.
          He has come to the help of his servant Israel
          for he has remembered his promise of mercy,
          the promise he made to our fathers,
          to Abraham and his children forever.
          Glory to the Father and to the Son and to the Holy Spirit,
          as it was in the beginning, is now, and will be forever. Amen.""",
          contentAm: """'46 ማርያምም እንዲህ አለች።
          47 ነፍሴ ጌታን ታከብረዋለች፥ መንፈሴም በአምላኬ በመድኃኒቴ ሐሴት ታደርጋለች፤
      48 የባሪያይቱን ውርደት ተመልክቶአልና። እነሆም፥ ከዛሬ ጀምሮ ትውልድ ሁሉ ብፅዕት ይሉኛል፤
      49 ብርቱ የሆነ እርሱ በእኔ ታላቅ ሥራ አድርጎአልና፤ ስሙም ቅዱስ ነው።
      50 ምሕረቱም ለሚፈሩት እስከ ትውልድና ትውልድ ይኖራል።
      51 በክንዱ ኃይል አድርጎአል፤ ትዕቢተኞችን በልባቸው አሳብ በትኖአል፤
      52 ገዥዎችን ከዙፋናቸው አዋርዶአል፤ ትሑታንንም ከፍ አድርጎአል፤
      53 የተራቡትን በበጎ ነገር አጥግቦአል፤ ባለ ጠጎችንም ባዶአቸውን ሰዶአቸዋል።
      54 -
      55 ለአባቶቻችን እንደ ተናገረ፥ ለአብርሃምና ለዘሩ ለዘላለም ምሕረቱ ትዝ እያለው እስራኤልን ብላቴናውን ረድቶአል።'""",
          imagePath: 'assets/St. Francis.jpg')
    ],

    'Prayer of St. Augustine':[
      PrayerStep(
          titleEn: 'Act Of Contrition',
          titleAm: 'የቅዱስ ፍራንቸስኮስ ጸሎት',
          contentEn: """Lord Jesus,
              let me know myself and know you
              and desire nothing save only you.
              Let me hate myself and love you.
              Let me humble myself and exalt you.
              Let me think nothing except you.
              Let me die to myself and live in you.
              Let me accept whatever happens as from you.
              Let me banish myself and follow you,
              and ever desire to follow you.
              Let me fly from myself and take refuge in you,
              that I may deserve to be defended by you.
              Let me fear for myself, let me fear you,
              and let me be among those who are chosen by you.
              Let me be willing to obey for the sake of you.
              Let me cling to nothing save only to you,
              and let me be poor because of you.
              Look upon me, that I may love you.
              Call me that I may see you, and for ever enjoy you. Amen.""",
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
          titleEn: 'Compline (Night Prayer)',
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
          titleAm: 'የምህረት እናት ንግስት ሆይ',
          contentEn: """Remember, O most gracious Virgin Mary,
          that never was it known
      that anyone who fled to thy protection,
          implored thy help,
          or sought thy intercession,
          was left unaided.
      Inspired by this confidence
      I fly unto thee,
          O Virgin of virgins, my Mother.
          To thee do I come,
          before thee I stand,
          sinful and sorrowful.
          O Mother of the Word Incarnate,
          despise not my petitions,
          but in thy mercy hear and answer me.
      Amen.""",
          contentAm: 'ሰላም ላንቺ ይሁን ሕይወታችን፣ '
              'ደስታችን፣ ተስፋችን ሆይ ሰላም ላንቺ ይሁን፡፡ '
              'እኛ የሔዋን ልጆች ስደተኞች ጩኼታችንን ወዳንቺ እናቀርባለን፡፡ '
              'በዚህ በለቅሶ ቆላ እተጨነቅንና እያለቀሰን ወደንቺ እንማጠናለን፡፡ '
              'እንግዲህ እባክሽ የኛ ጠበቃ ሆይ በምህረት ዓይኖችሽ ወደ እኛ ተመልከቺ! '
              'ደጊቱ፣ ቸሪቱ፣ መሐሪቱ ድንግል ማርያም ሆይ '
              'የተባረከውን የሆድሽን ፍሬ ኢየሱስን '
              'ከዚህ ከስደት በኋላ ለኛ እባክሽ አሳይን፡፡ አሜን፡፡',
          imagePath: 'assets/St. Francis.jpg')
    ],

    'Prayer to Saint Joseph':[
      PrayerStep(
          titleEn: 'Prayer to Saint Joseph',
          titleAm: 'የቅዱስ ፍራንቸስኮስ ጸሎት',
          contentEn: """Oh, St. Joseph, whose protection is so great, so prompt, so strong,
          before the throne of God, I place in you all my interests and desires.
          Oh, St. Joseph, do assist me by your powerful intercession,
      and obtain for me from your Divine Son
      all spiritual blessings, through Jesus Christ, our Lord.
      So that, having engaged here below your heavenly power,
      I may offer my thanksgiving and homage to the most loving of fathers.

      Oh, St. Joseph, I never weary contemplating you and Jesus asleep in your arms;
      I dare not approach while he reposes near your heart.
      Press him in my name and kiss his fine head for me and
      ask him to return the kiss when I draw my dying breath.

      St. Joseph, patron of departing souls - pray for me.
      Amen.""",
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
          contentEn: """Lord,    have mercy on us.	
          Lord,   have mercy on us.	                          
          Christ, have mercy on us.	
          Christ, have mercy on us.
          Lord, have mercy on us.	
          Lord, have mercy on us.
          Christ, hear us.	
          Christ, graciously hear us.

          God, the Father of Heaven,	have mercy on us.
          God the Son, Redeemer of the world,	have mercy on us.
          God the Holy Spirit,	have mercy on us.
          Holy Trinity, one God,	have mercy on us.

          Holy Mary,	pray for us.
          Holy Mother of God,	pray for us.
          Holy Virgin of Virgins,	pray for us.
          St. Michael,	pray for us.
          St. Gabriel,	pray for us.
          St. Raphael,	pray for us.
      All you Holy Angels and Archangels	pray for us.
          St. John the Baptist,	pray for us.
          St. Joseph,	pray for us.
          All you Holy Patriarchs and Prophets,	pray for us.

          St. Peter,	pray for us.
          St. Paul,	pray for us.
          St. Andrew,	pray for us.
          St. James,	pray for us.
          St. John,	pray for us.
          St. Thomas,	pray for us.
          St. James,	pray for us.
          St. Philip,	pray for us.
          St. Bartholomew,	pray for us.
          St. Matthew,	pray for us.
          St. Simon,	pray for us.
          St. Jude,	pray for us.
          St. Matthias,	pray for us.
          St. Barnabas,	pray for us.
          St. Luke,	pray for us.
          St. Mark,	pray for us.
          All you Holy Apostles and Evangelists,	pray for us.
          All you Holy Disciples of the Lord,	pray for us.
          All you Holy Innocents,	pray for us.

          St. Stephen,	pray for us.
          St. Lawrence,	pray for us.
          St. Vincent,	pray for us.
          St. Fabian and Sebastian,	pray for us.
          St. John and Paul,	pray for us.
          St. Cosmas and Damian,	pray for us.
          All you Holy Martyrs,	pray for us.

          St. Sylvester,	pray for us.
          St. Gregory,	pray for us.
          St. Ambrose,	pray for us.
          St. Augustine,	pray for us.
          St. Jerome,	pray for us.
          St. Martin,	pray for us.
          St. Nicholas,	pray for us.
          All you Holy Bishops and Confessors,	pray for us.
          All you Holy Doctors,	pray for us.

          St. Anthony,	pray for us.
          St. Benedict,	pray for us.
          St. Bernard,	pray for us.
          St. Dominic,	pray for us.
          St. Francis,	pray for us.
          All you Holy Priests and Levites,	pray for us.
          All you Holy Monks and Hermits,	pray for us.

          St. Mary Magdalene,	pray for us.
          St. Agatha,	pray for us.
          St. Lucy,	pray for us.
          St. Agnes,	pray for us.
          St. Cecilia,	pray for us.
          St. Anastasia,	pray for us.
          St. Catherine,	pray for us.
          St. Clare,	pray for us.
          All you Holy Virgins and Widows,	pray for us.
          All you Holy Saints of God,	pray for us.

          Lord, be merciful,	Lord, save your people.
          From all evil,	    Lord, save your people.
          From all sin,	      Lord, save your people.
          From your wrath,	  Lord, save your people.
          From a sudden and unprovided death,	  Lord, save your people.
          From the snares of the devil,	        Lord, save your people.
          From anger, hatred and all ill-will,	Lord, save your people.
          From the spirit of uncleanness,	      Lord, save your people.
          From lightning and tempest,	          Lord, save your people.
          From the scourge of earthquake,	      Lord, save your people.
          From plague, famine and war,	        Lord, save your people.
          From everlasting death,	              Lord, save your people.
          By the mystery of your Holy Incarnation,	Lord, save your people.
          By Your Coming,	   Lord, save your people.
          By Your Birth,	   Lord, save your people.
          By Your Baptism and Holy Fasting,	Lord, save your people.
          By Your Cross and Passion,	Lord, save your people.
          By Your Death and Burial,	Lord, save your people.
          By Your Holy Resurrection,	Lord, save your people.
          By Your wonderful Ascension,	Lord, save your people.
          By the coming of the Holy Spirit,	Lord, save your people.
          On the Day of Judgment,	Lord, save your people.

          Be merciful to us sinners,	Lord, hear our prayer.
          That you will spare us,	Lord, hear our prayer.
          That you will pardon us,	Lord, hear our prayer.
      That it may please you to bring us to true penance,	Lord, hear our prayer.
          Guide and protect your holy Church,	Lord, hear our prayer.
          Preserve in holy religion the Pope, and all those in holy Orders,	Lord, hear our prayer.
          Humble the enemies of holy Church,	Lord, hear our prayer.
      Give peace and unity to the whole Christian people,	Lord, hear our prayer.
      Bring back to the unity of the Church all those who are straying, and bring all unbelievers to the light of the Gospel,	Lord, hear our prayer.
      Strengthen and preserve us in your holy service,	Lord, hear our prayer.
      Raise our minds to desire the things of heaven,	Lord, hear our prayer.
          Reward all our benefactors with eternal blessings,	Lord, hear our prayer.
          Deliver our souls from eternal damnation, and the souls of our brethren, relatives, and benefactors,	Lord, hear our prayer.
      Give and preserve the fruits of the earth,	Lord, hear our prayer.
      Grant eternal rest to all the faithful departed,	Lord, hear our prayer.
      That it may please You to hear and heed us, Jesus, Son of the Living God,	Lord, hear our prayer.

          Lamb of God, who takes away the sins of the world,	spare us, O Lord!
          Lamb of God, who takes away the sins of the world,	graciously hear us, O Lord!
          Lamb of God, who takes away the sins of the world,	Have mercy on us.

          Christ, hear us,	Christ, graciously hear us
          Lord Jesus, hear our prayer	Lord Jesus, hear our prayer.
          Lord, have mercy on us	Lord, have mercy on us.
          Christ, have mercy on us             	Christ, have mercy on us.
          Lord, have mercy on us	Lord, have mercy on us""",
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
          contentEn: """Father, 
          I abandon myself into your hands;
      do with me what you will.
          Whatever you may do, I thank you:
          I am ready for all, I accept all.

      Let only your will be done in me,
          and in all your creatures -
          I wish no more than this, O Lord.

      Into your hands I commend my soul:
      I offer it to you with all the love of my heart,
          for I love you, Lord, and so need to give myself,
      to surrender myself into your hands without reserve,
      and with boundless confidence,
      for you are my Father.""",
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
          contentEn: """Soul of Christ, sanctify me.

          Body of Christ, save me.

          Blood of Christ, inebriate me.

          Water from the side of Christ, wash me.

          Passion of Christ, strengthen me.

          O good Jesus, hear me.

      Within Thy Wounds hide me.

      Suffer me not to be separated from Thee.

      From the malignant enemy, defend me.

          In the hour of my death, call me,

          And bid me to come to Thee.

      That with Thy saints, I may praise Thee.

      Forever and ever.

      Amen.""",
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
          contentEn: """'Lord, have mercy on us.
          R. Christ, have mercy on us.
          V. Lord, have mercy on us. Jesus, hear us.
          R. Jesus, graciously hear us.
      V. God the Father of Heaven
      R. Have mercy on us.
      V. God the Son, Redeemer of the world,
          R. Have mercy on us.
          V. God the Holy Spirit,
          R. Have mercy on us.
          V. Holy Trinity, one God,
          R. Have mercy on us.
          V. Jesus, Son of the living God, R. Have mercy on us.
          Jesus, splendor of the Father, [etc.]
      Jesus, brightness of eternal light.
      Jesus, King of glory.
      Jesus, sun of justice.
      Jesus, Son of the Virgin Mary.
      Jesus, most amiable.
      Jesus, most admirable.
      Jesus, the mighty God.
      Jesus, Father of the world to come.
      Jesus, angel of great counsel.
      Jesus, most powerful.
      Jesus, most patient.
      Jesus, most obedient.
      Jesus, meek and humble of heart.
      Jesus, lover of chastity.
      Jesus, lover of us.
      Jesus, God of peace.
      Jesus, author of life.
      Jesus, example of virtues.
      Jesus, zealous lover of souls.
      Jesus, our God.
      Jesus, our refuge.
      Jesus, father of the poor.
      Jesus, treasure of the faithful.
      Jesus, good Shepherd.
      Jesus, true light.
      Jesus, eternal wisdom.
      Jesus, infinite goodness.
      Jesus, our way and our life.
      Jesus, joy of Angels.
      Jesus, King of the Patriarchs.
      Jesus, Master of the Apostles.
      Jesus, teacher of the Evangelists.
      Jesus, strength of Martyrs.
      Jesus, light of Confessors.
      Jesus, purity of Virgins.
      Jesus, crown of Saints.

      V. Be merciful, R. spare us, O Jesus.
      V. Be merciful, R. graciously hear us, O Jesus.

      V. From all evil, R. deliver us, O Jesus.
      From all sin, deliver us, O Jesus.
      From Your wrath, [etc.]
      From the snares of the devil.
      From the spirit of fornication.
      From everlasting death.
      From the neglect of Your inspirations.
      By the mystery of Your holy Incarnation.
      By Your Nativity.
      By Your Infancy.
      By Your most divine Life.
      By Your labors.
      By Your agony and passion.
      By Your cross and dereliction.
      By Your sufferings.
      By Your death and burial.
      By Your Resurrection.
      By Your Ascension.
      By Your institution of the most Holy Eucharist.
      By Your joys.
      By Your glory.

      V. Lamb of God, who takest away the sins of the world,
      R. spare us, O Jesus.
      V. Lamb of God, who takest away the sins of the world,
      R. graciously hear us, O Jesus.
      V. Lamb of God, who takest away the sins of the world,
      R. have mercy on us, O Jesus.

      V. Jesus, hear us.
      R. Jesus, graciously hear us.

      Let us pray.

      O Lord Jesus Christ, You have said, "Ask and you shall receive, 
      seek, and you shall find, knock, 
      and it shall be opened to you." 
      Grant, we beg of You, to us who ask it, 
      the gift of Your most divine love, 
      that we may ever love You with our whole heart, 
      in word and deed, and never cease praising You.

      Give us, O Lord, 
      as much a lasting fear as a lasting love of Your Holy Name, 
      for You, who live and are King for ever and ever, 
      never fail to govern those whom You have solidly established in Your love. 
      R. Amen.',
          """,
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
          contentEn: """Come, Holy Spirit, fill the hearts of your faithful
          and kindle in them the fire of your love.

      Send forth your Spirit and they shall be created,
          and you shall renew the face of the earth.

      Let us pray.

          O God, who have taught the hearts of the faithful
      by the light of the Holy Spirit,
          grant that in the same Spirit we may be truly wise
      and ever rejoice in his consolation.
      Through Christ our Lord. Amen.""",
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
          contentEn: """Hail, Holy Queen, Mother of Mercy, 
          our life, our sweetness and our hope.
          To you do we cry,
          poor banished children of Eve.
      To you do we send up our sighs,
          mourning and weeping in this valley of tears
          Turn then, most gracious advocate,
          your eyes of mercy toward us,
          and after this exile
      show unto us the blessed fruit of thy womb,
          Jesus.
          O clement, O loving,
          O sweet Virgin Mary.""",
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
