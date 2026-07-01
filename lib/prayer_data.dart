import 'package:flutter/material.dart';
import 'package:operation_001/prayer_model.dart';

class prayer_data {
  static Map<String, List<PrayerStep>> masterPrayerDB = {

    'The Morning Offering': [
      PrayerStep(
        sectionHeader: 'reading focus',
        titleEn: 'The Morning Offering',
        titleAm: 'የጠዋት መስዋዕት',
        contentEn: 'O Jesus, through the Immaculate Heart of Mary, I offer You my prayers, works, joys and sufferings of this day for all the intentions of Your Sacred Heart,',
        contentAm: 'እግዚአብሔር፣ የኢየሱስ ልብ፣ ያለ አዳም ኃጢአት የተጸነስች እንዲሁም የቤተክርስቲያን እናት በሆነችዉ በማርያም በኩል፣',
        imagePath: 'assets/sunrise.jpeg',
      ),
      PrayerStep(
        sectionHeader: 'INVOCATION',
        titleEn: 'The Morning Offering',
        titleAm: 'የጠዋት መስዋዕት',
        contentEn: 'in union with the Holy Sacrifice of the Mass throughout the world, in reparation for my sins, for the intentions of all my relatives and friends,',
        contentAm: 'በቅዱስ ቁርባን መስዋዕት በኩል፣ ልመናዎቼን ሥራዎቼን ተስፋዎቼንና የዛሬ ቀን መከራዎቼን ለወንዶችና ለሴቶች፣',
        imagePath: 'assets/sunrise.jpeg',
      ),
      PrayerStep(
        sectionHeader: 'FINAL PETITION',
        titleEn: 'The Morning Offering',
        titleAm: 'የጠዋት መስዋዕት',
        contentEn: 'and in particular for the intentions of the Holy Father. Amen.',
        contentAm: 'ለሰው ልጆች ሁሉ ደህንነትና ለኃጢአቶች ካሣ እንዲሆን አቀርባለሁ፡፡ አሜን፡፡',
        imagePath: 'assets/sunrise.jpeg',
      ),
    ],

    'Prayer of St. Francis': [
      PrayerStep(
        sectionHeader: 'reading focus',
        titleEn: 'Prayer Of St. Francis',
        titleAm: 'የቅዱስ ፍራንቸስኮስ ጸሎት',
        contentEn: 'Lord, make me an instrument of your peace: where there is hatred, let me sow love; where there is injury, pardon; where there is doubt, faith; where there is despair, hope; where there is darkness, light; where there is sadness, joy.',
        contentAm: 'ጌታ ሆይ የሰላም መሳሪያ እንድሆን አድርገኝ፤ ጥል ባለበት ፍቅር፣ በደል ባለበት ይቅርታ፣ ክርክር ባለበት ስምምነት፣ ጥርጣሬ ባለበት እምነት፣ ስህተት ባለበት እዉነት፣ ተስፋ መቁረጥ ባለበት መጽናናት፣ ሓዘን ባለበት ደስታ፣ ጨለማ ባለበት ብርሃን እንዲገኝ አደርግ ዘንድ አብቃኝ፡፡',
        imagePath: 'assets/St. Francis.jpg',
      ),
      PrayerStep(
        sectionHeader: 'INVOCATION',
        titleEn: 'Prayer Of St. Francis',
        titleAm: 'የቅዱስ ፍራንቸስኮስ ጸሎት',
        contentEn: 'O divine Master, grant that I may not so much seek to be consoled as to console, to be understood as to understand, to be loved as to love.',
        contentAm: 'ጌታ ሆይ ከመጽናናት ማጽናናት፣ ከመግባባት ማግባባት፣ ከመወደድ መዉደድ፣',
        imagePath: 'assets/St. Francis.jpg',
      ),
      PrayerStep(
        sectionHeader: 'FINAL PETITION',
        titleEn: 'Prayer Of St. Francis',
        titleAm: 'የቅዱስ ፍራንቸስኮስ ጸሎት',
        contentEn: 'For it is in giving that we receive, it is in pardoning that we are pardoned, and it is in dying that we are born to eternal life. Amen.',
        contentAm: 'ከመቀበል መስጠት፣ ይቅር ለመባል ይቅር ማለት፣ የዘለዓለም ሕይወት ለማግኘት መሞት እንዳለብኝ ለማወቅ እርዳኝ፡፡ አሜን፡፡',
        imagePath: 'assets/St. Francis.jpg',
      ),
    ],

    'The Guardian Angel Prayer': [
      PrayerStep(
        sectionHeader: 'reading focus',
        titleEn: 'The Guardian Angel Prayer',
        titleAm: 'ፀሎት ወደ ቅዱስ ጠባቂ መልአክ',
        contentEn: 'Angel of God, my guardian dear, to whom God\'s love commits me here,',
        contentAm: 'ጠባቂዬ የሆንህ የእግዚአብሔር መልአክ ሆይ፣ አንተ እንድትጠብቀኝ በአምላክ ቸርነት ላንተ ተሰጥቼአለሁና፣',
        imagePath: 'assets/St. Francis.jpg',
      ),
      PrayerStep(
        sectionHeader: 'INVOCATION',
        titleEn: 'The Guardian Angel Prayer',
        titleAm: 'ፀሎት ወደ ቅዱስ ጠባቂ መልአክ',
        contentEn: 'Ever this day, be at my side, to light and guard, rule and guide. Amen.',
        contentAm: 'አዕምሮዬን አብራልኝ፣ ጠብቀኝ፣ ምራኝ፣ እርዳኝ፡፡ አሜን፡፡',
        imagePath: 'assets/St. Francis.jpg',
      ),
    ],

    'The Benedictus': [
      PrayerStep(
        sectionHeader: 'reading focus',
        titleEn: 'The Benedictus (Song of Zechariah)',
        titleAm: 'የዘካርያስ ጸሎት (ቤኔዲክቱስ)',
        contentEn: 'Blessed be the Lord, the God of Israel; he has come to his people and set them free. He has raised up for us a mighty savior, born of the house of his servant David. Through his holy prophets he promised of old that he would save us from our enemies, from the hands of all who hate us.',
        contentAm: '68 የእስራኤል ጌታ አምላክ ይባረክ፥ ጐብኝቶ ለሕዝቡ ቤዛ አድርጎአልና፤ 69-70 ከጥንት ጀምሮ በነበሩት በቅዱሳን ነቢያት አፍ እንደ ተናገረ፥ በብላቴናው በዳዊት ቤት የመዳን ቀንድን አስነስቶልናል፤ 71 ማዳኑም ከወደረኞቻችንና ከሚጠሉን ሁሉ እጅ ነው፤',
        imagePath: 'assets/My Daily Journal.jpg',
      ),
      PrayerStep(
        sectionHeader: 'INVOCATION',
        titleEn: 'The Benedictus (Song of Zechariah)',
        titleAm: 'የዘካርያስ ጸሎት (ቤኔዲክቱስ)',
        contentEn: 'He promised to show mercy to our fathers and to remember his holy covenant. This was the oath he swore to our father Abraham: to set us free from the hands of our enemies, free to worship him without fear, holy and righteous in his sight all the days of our life. You, my child, shall be called the prophet of the Most High; for you will go before the Lord to prepare his way, to give his people knowledge of salvation by the forgiveness of their sins.',
        contentAm: '72-73 እንደዚህ ለአባቶቻችን ምሕረት አደረገ፤ ለአባታችን ለአብርሃምም የማለውን መሐላውን ቅዱሱን ኪዳን አሰበ፤ 74-75 በእርሱም ከጠላቶቻችን እጅ ድነን በዘመናችን ሁሉ ያለ ፍርሃት በቅድስናና በጽድቅ በፊቱ እንድናገለግለው ሰጠን። 76 ደግሞም አንተ ሕፃን ሆይ፥ የልዑል ነቢይ ትባላለህ፥ መንገዱን ልትጠርግ በጌታ ፊት ትሄዳለህና፤ 77 እንደዚህም የኃጢአታቸው ስርየት የሆነውን የመዳን እውቀት ለሕዝቡ ትሰጣለህ፤',
        imagePath: 'assets/My Daily Journal.jpg',
      ),
      PrayerStep(
        sectionHeader: 'FINAL PETITION',
        titleEn: 'The Benedictus (Song of Zechariah)',
        titleAm: 'የዘካርያስ ጸሎት (ቤኔዲክቱስ)',
        contentEn: 'In the tender compassion of our God the dawn from on high shall break upon us, to shine on those who dwell in darkness and the shadow of death, and to guide our feet into the way of peace. Glory to the Father and to the Son and to the Holy Spirit, as it was in the beginning, is now, and will be forever. Amen.',
        contentAm: '78 ይህም ከላይ የመጣ ብርሃን በጐበኘበት በአምላካችን ምሕረትና ርኅራኄ ምክንያት ነው፤ 79 ብርሃኑም በጨለማና በሞት ጥላ ተቀምጠው ላሉት ያበራል እግሮቻችንንም በሰላም መንገድ ያቀናል። ለአብ፥ ለወልድና ለመንፈስ ቅዱስ ምስጋና ይሁን አሁንም ዘወትርም ለዘለዓለምም አሜን፡፡',
        imagePath: 'assets/My Daily Journal.jpg',
      ),
    ],

    'Act Of Contrition': [
      PrayerStep(
        sectionHeader: 'reading focus',
        titleEn: 'Act Of Contrition',
        titleAm: 'የንስሐ ጸሎት',
        contentEn: 'My God,\nI am sorry for my sins with all my heart.\nIn choosing to do wrong and failing to do good,\nI have sinned against you whom I should love above all things.',
        contentAm: 'አምላኬ ሆይ ፍጹም ተወዳጅ ነህ፣ ኃጢአትን የምትጠላ ነህ፤ በኃጢአቴ ስለበደልኩህ እጅግ አዝናለሁ፤ ማረኝ!',
        imagePath: 'assets/St. Francis.jpg',
      ),
      PrayerStep(
        sectionHeader: 'INVOCATION',
        titleEn: 'Act Of Contrition',
        titleAm: 'የንስሐ ጸሎት',
        contentEn: 'I firmly intend, with your help,\nto do penance,\nto sin no more,\nand to avoid whatever leads me to sin.',
        contentAm: 'ዳግመኛ ወደ ኃጢአት አልመለስም፤ በጸጋህ ከኃጢአት ምክንያት ሁሉ እርቃለሁ፡፡',
        imagePath: 'assets/St. Francis.jpg',
      ),
      PrayerStep(
        sectionHeader: 'FINAL PETITION',
        titleEn: 'Act Of Contrition',
        titleAm: 'የንስሐ ጸሎት',
        contentEn: 'Our Savior Jesus Christ suffered and died for us.\nIn his name, my God, have mercy.',
        contentAm: 'አሜን፡፡',
        imagePath: 'assets/St. Francis.jpg',
      ),
    ],

    'Prayer for the Hour of Mercy': [
      PrayerStep(
        sectionHeader: 'reading focus',
        titleEn: 'Prayer for the Hour of Mercy',
        titleAm: 'የምሕረት ሰዓት ጸሎት',
        contentEn: 'V: You expired Jesus, but the source of life gushed forth for souls, and the ocean of mercy opened up for the whole world.',
        contentAm: 'ጌታ ሆይ የሰላም መሳሪያ እንድሆን አድርገኝ፤\nጥል ባለበት ፍቅር፣ በደል ባለበት ይቅርታ።',
        imagePath: 'assets/St. Francis.jpg',
      ),
      PrayerStep(
        sectionHeader: 'INVOCATION',
        titleEn: 'Prayer for the Hour of Mercy',
        titleAm: 'የምሕረት ሰዓት ጸሎት',
        contentEn: 'All: O Fountain of Life, unfathomable Divine Mercy, envelop the whole world and empty Yourself out upon us.\n\nV: O Blood and Water which gushed forth from the Heart of Jesus as a fount of Mercy for us,\nAll: I trust in You.',
        contentAm: 'ከመጽናናት ማጽናናት፣ ከመግባባት ማግባባት፣ ከመወደድ መዉደድ፣ ከመቀበል መስጠት።',
        imagePath: 'assets/St. Francis.jpg',
      ),
      PrayerStep(
        sectionHeader: 'FINAL PETITION',
        titleEn: 'Prayer for the Hour of Mercy',
        titleAm: 'የምሕረት ሰዓት ጸሎት',
        contentEn: 'V: Mary, Mother of Mercy and our Mother,\nAll: Pray for us.\n\nV: Saint Faustina and Saint John Paul II,\nAll: Pray for us.',
        contentAm: 'ይቅር ለመባል ይቅር ማለት፣ የዘለዓለም ሕይወት ለማግኘት መሞት እንዳለብኝ ለማወቅ እርዳኝ፡፡ አሜን፡፡',
        imagePath: 'assets/St. Francis.jpg',
      ),
    ],

    'Prayer to St. Michael the Archangel': [
      PrayerStep(
        sectionHeader: 'reading focus',
        titleEn: 'Prayer to St. Michael the Archangel',
        titleAm: 'ጸሎት ወደ ቅዱስ ሚካኤል',
        contentEn: 'St. Michael the Archangel, defend us in battle.\nBe our defense against the wickedness and snares of the Devil.',
        contentAm: 'ጌታ ሆይ የሰላም መሳሪያ እንድሆን አድርገኝ፤\nጥል ባለበት ፍቅር፣ በደል ባለበት ይቅርታ።',
        imagePath: 'assets/St. Francis.jpg',
      ),
      PrayerStep(
        sectionHeader: 'INVOCATION',
        titleEn: 'Prayer to St. Michael the Archangel',
        titleAm: 'ጸሎት ወደ ቅዱስ ሚካኤል',
        contentEn: 'May God rebuke him, we humbly pray,\nand do thou, O Prince of the heavenly hosts, by the power of God,',
        contentAm: 'ከመጽናናት ማጽናናት፣ ከመግባባት ማግባባት፣ ከመወደድ መዉደድ፣ ከመቀበል መስጠት።',
        imagePath: 'assets/St. Francis.jpg',
      ),
      PrayerStep(
        sectionHeader: 'FINAL PETITION',
        titleEn: 'Prayer to St. Michael the Archangel',
        titleAm: 'ጸሎት ወደ ቅዱስ ሚካኤል',
        contentEn: 'thrust into hell Satan, and all the evil spirits, who prowl about the world seeking the ruin of souls. Amen.',
        contentAm: 'ይቅር ለመባል ይቅር ማለት፣ የዘለዓለም ሕይወት ለማግኘት መሞት እንዳለብኝ ለማወቅ እርዳኝ፡፡ አሜን፡፡',
        imagePath: 'assets/St. Francis.jpg',
      ),
    ],

    'Vespers (Evening Prayer)': [
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
            'ጥል ባለበት ፍቅር፤\n'
            'በደል ባለበት ይቅርታ፤\n'
            'ክርክር ባለበት ስምምነት፤\n'
            'ጥርጣሬ ባለበት እምነት፤\n'
            'ስህተት ባለበት እዉነት፤\n'
            'ተስፋ መቁረጥ ባለበት መጽናናት፤\n'
            'ሓዘን ባለበት ደስታ፤\n'
            'ጨለማ ባለበት ብርሃን እንዲገኝ አደርግ ዘንድ አብቃኝ፡፡\n'
            'ጌታ ሆይ\n'
            'ከመጽናናት ማጽናናት፤\n'
            'ከመግባባት ማግባባት፤\n'
            'ከመወደድ መዉደድ፤\n'
            'ከመቀበል መስጠት፤\n'
            'ይቅር ለመባል ይቅር ማለት፤\n'
            'የዘለዓለም ሕይወት ለማግኘት መሞት እንዳለብኝ ለማወቅ እርዳኝ፡፡\n'
            'አሜን፡፡',
        imagePath: 'assets/St. Francis.jpg',
      )
    ],

    'The Magnificat': [
      PrayerStep(
        sectionHeader: 'reading focus',
        titleEn: 'The Magnificat',
        titleAm: 'የማርያም የምስጋና ጸሎት',
        contentEn: 'My soul proclaims the greatness of the Lord,\nmy spirit rejoices in God my Savior,\nfor he has looked with favor on his lowly servant.\nFrom this day all generations will call me blessed:',
        contentAm: '46 ማርያምም እንዲህ አለች።\n47 ነፍሴ ጌታን ታከብረዋለች፥ መንፈሴም በአምላኬ በመድኃኒቴ ሐሴት ታደርጋለች፤\n48 የባሪያይቱን ውርደት ተመልክቶአልና። እነሆም፥ ከዛሬ ጀምሮ ትውልድ ሁሉ ብፅዕት ይሉኛል፤',
        imagePath: 'assets/St. Francis.jpg',
      ),
      PrayerStep(
        sectionHeader: 'INVOCATION',
        titleEn: 'The Magnificat',
        titleAm: 'የማርያም የምስጋና ጸሎት',
        contentEn: 'the Almighty has done great things for me,\nand holy is his Name.\nHe has mercy on those who fear him\nin every generation.\nHe has shown the strength of his arm,\nhe has scattered the proud in their conceit.',
        contentAm: '49 ብርቱ የሆነ እርሱ በእኔ ታላቅ ሥራ አድርጎአልና፤ ስሙም ቅዱስ ነው።\n50 ምሕረቱም ለሚፈሩት እስከ ትውልድና ትውልድ ይኖራል።\n51 በክንዱ ኃይል አድርጎአል፤ ትዕቢተኞችን በልባቸው አሳብ በትኖአል፤',
        imagePath: 'assets/St. Francis.jpg',
      ),
      PrayerStep(
        sectionHeader: 'FINAL PETITION',
        titleEn: 'The Magnificat',
        titleAm: 'የማርያም የምስጋና ጸሎት',
        contentEn: 'He has cast down the mighty from their thrones,\nand has lifted up the lowly.\nHe has filled the hungry with good things,\nand the rich he has sent away empty.\nHe has come to the help of his servant Israel\nfor he has remembered his promise of mercy,\nthe promise he made to our fathers,\nto Abraham and his children forever.\nGlory to the Father and to the Son and to the Holy Spirit,\nas it was in the beginning, is now, and will be forever. Amen.',
        contentAm: '52 ገዥዎችን ከዙፋናቸው አዋርዶአል፤ ትሑታንንም ከፍ አድርጎአል፤\n53 የተራቡትን በበጎ ነገር አጥግቦአል፤ ባለ ጠጎችንም ባዶአቸውን ሰዶአቸዋል።\n54 -\n55 ለአባቶቻችን እንደ ተናገረ፥ ለአብርሃምና ለዘሩ ለዘላለም ምሕረቱ ትዝ እያለው እስራኤልን ብላቴናውን ረድቶአል።',
        imagePath: 'assets/St. Francis.jpg',
      ),
    ],

    'Prayer of St. Augustine': [
      PrayerStep(
        sectionHeader: 'reading focus',
        titleEn: 'Prayer of St. Augustine',
        titleAm: 'የቅዱስ አውግስጢኖስ ጸሎት',
        contentEn: 'Lord Jesus,\nlet me know myself and know you\nand desire nothing save only you.\nLet me hate myself and love you.\nLet me humble myself and exalt you.\nLet me think nothing except you.\nLet me die to myself and live in you.',
        contentAm: 'ጌታ ሆይ የሰላም መሳሪያ እንድሆን አድርገኝ፤\nጥል ባለበት ፍቅር፣ በደል ባለበት ይቅርታ።',
        imagePath: 'assets/St. Francis.jpg',
      ),
      PrayerStep(
        sectionHeader: 'INVOCATION',
        titleEn: 'Prayer of St. Augustine',
        titleAm: 'የቅዱስ አውግስጢኖስ ጸሎት',
        contentEn: 'Let me accept whatever happens as from you.\nLet me banish myself and follow you,\nand ever desire to follow you.\nLet me fly from myself and take refuge in you,\nthat I may deserve to be defended by you.',
        contentAm: 'ከመጽናናት ማጽናናት፣ ከመግባባት ማግባባት፣ ከመወደድ መዉደድ፣ ከመቀበል መስጠት።',
        imagePath: 'assets/St. Francis.jpg',
      ),
      PrayerStep(
        sectionHeader: 'FINAL PETITION',
        titleEn: 'Prayer of St. Augustine',
        titleAm: 'የቅዱስ አውግስጢኖስ ጸሎት',
        contentEn: 'Let me fear for myself, let me fear you,\nand let me be among those who are chosen by you.\nLet me be willing to obey for the sake of you.\nLet me cling to nothing save only to you,\nand let me be poor because of you.\nLook upon me, that I may love you.\nCall me that I may see you, and for ever enjoy you. Amen.',
        contentAm: 'ይቅር ለመባል ይቅር ማለት፣ የዘለዓለም ሕይወት ለማግኘት መሞት እንዳለብኝ ለማወቅ እርዳኝ፡፡ አሜን፡፡',
        imagePath: 'assets/St. Francis.jpg',
      ),
    ],

    'Compline (Night Prayer)': [
      // Compline fits naturally into a 2-part structure based on your format,
      // but let's break it into 3 parts to stay perfectly uniform with the UI engine!
      PrayerStep(
        sectionHeader: 'reading focus',
        titleEn: 'Compline (Night Prayer)',
        titleAm: 'የሌሊት ጸሎት',
        contentEn: 'Lord, make me an instrument of your peace:\nwhere there is hatred, let me sow love;\nwhere there is injury, pardon;\nwhere there is doubt, faith;',
        contentAm: 'ጌታ ሆይ የሰላም መሳሪያ እንድሆን አድርገኝ፤\nጥል ባለበት ፍቅር፣ በደል ባለበት ይቅርታ።',
        imagePath: 'assets/St. Francis.jpg',
      ),
      PrayerStep(
        sectionHeader: 'INVOCATION',
        titleEn: 'Compline (Night Prayer)',
        titleAm: 'የሌሊት ጸሎት',
        contentEn: 'where there is despair, hope;\nwhere there is darkness, light;\nwhere there is sadness, joy.',
        contentAm: 'ከመጽናናት ማጽናናት፣ ከመግባባት ማግባባት፣ ከመወደድ መዉደድ፣ ከመቀበል መስጠት።',
        imagePath: 'assets/St. Francis.jpg',
      ),
      PrayerStep(
        sectionHeader: 'FINAL PETITION',
        titleEn: 'Compline (Night Prayer)',
        titleAm: 'የሌሊት ጸሎት',
        contentEn: 'O divine Master, grant that I may not so much seek\nto be consoled as to console,\nto be understood as to understand,\nto be loved as to love.\nFor it is in giving that we receive,\nit is in pardoning that we are pardoned,\nand it is in dying that we are born to eternal life. Amen.',
        contentAm: 'ይቅር ለመባል ይቅር ማለት፣ የዘለዓለም ሕይወት ለማግኘት መሞት እንዳለብኝ ለማወቅ እርዳኝ፡፡ አሜን፡፡',
        imagePath: 'assets/St. Francis.jpg',
      ),
    ],

    'The Memorare': [
      PrayerStep(
        sectionHeader: 'reading focus',
        titleEn: 'The Memorare',
        titleAm: 'የምህረት እናት ንግስት ሆይ (memorare)',
        contentEn: 'Remember, O most gracious Virgin Mary, that never was it known that anyone who fled to thy protection, implored thy help, or sought thy intercession, was left unaided.',
        contentAm: 'እጅግ ርኅሩኅ ድንግል ማርያም ሆይ፤ ወደ አንቺ ጥገኝነት የሸሸ፣ ረድኤትሽን የለመነ ወይም አማላጅነትሽን የፈለገ ማንም ሰው ያለ ረዳት እንዳልቀረ በጭራሽ የተሰማ አለመሆኑን አስቢ።',
        imagePath: 'assets/sunrise.jpeg',
      ),
      PrayerStep(
        sectionHeader: 'INVOCATION',
        titleEn: 'The Memorare',
        titleAm: 'የምህረት እናት ንግስት ሆይ (memorare)',
        contentEn: 'Inspired by this confidence, I fly unto thee, O Virgin of virgins, my Mother. To thee do I come, before thee I stand, sinful and sorrowful.',
        contentAm: 'በዚህ እምነት ተደፋፍሬ፣ የደናግል ድንግል እናቴ ሆይ፣ ወደ አንቺ እመጣለሁ። በፊቶሽ እቆማለሁ፣ ኃጢአተኛና አዛኝ ነኝ።',
        imagePath: 'assets/sunrise.jpeg',
      ),
      PrayerStep(
        sectionHeader: 'FINAL PETITION',
        titleEn: 'The Memorare',
        titleAm: 'የምህረት እናት ንግስት ሆይ (memorare)',
        contentEn: 'O Mother of the Word Incarnate, despise not my petitions, but in thy mercy hear and answer me. Amen.',
        contentAm: 'የሥጋ የለበሰው ቃል እናት ሆይ፣ ልመናዬን አትንቂ፣ በምሕረትሽ ስሚኝና መልሽልኝ እንጂ። አሜን።',
        imagePath: 'assets/sunrise.jpeg',
      ),
    ],

    'Prayer to Saint Joseph': [
      PrayerStep(
        sectionHeader: 'reading focus',
        titleEn: 'Prayer to Saint Joseph',
        titleAm: 'ወደ ቅዱስ ዮሴፍ ጸሎት',
        contentEn: 'Oh, St. Joseph, whose protection is so great, so prompt, so strong, before the throne of God, I place in you all my interests and desires. Oh, St. Joseph, do assist me by your powerful intercession, and obtain for me from your Divine Son all spiritual blessings, through Jesus Christ, our Lord.',
        contentAm: 'ቅዱስ ዮሴፍ ሆይ፣ በእግዚአብሔር ዙፋን ፊት ጥበቃህ እጅግ ታላቅ፣ ፈጣንና ብርቱ የሆነ፣ ፍላጎቶቼንና ምኞቶቼን ሁሉ በአንተ ላይ አኖራለሁ። በኃያል አማላጅነትህ እርዳኝ፣ ከመለኮታዊ ልጅህም በመንፈሳዊ በረከቶች ሁሉ በጌታችን በኢየሱስ ክርስቶስ በኩል አሰጥኝ።',
        imagePath: 'assets/St. Francis.jpg',
      ),
      PrayerStep(
        sectionHeader: 'INVOCATION',
        titleEn: 'Prayer to Saint Joseph',
        titleAm: 'ወደ ቅዱስ ዮሴፍ ጸሎት',
        contentEn: 'So that, having engaged here below your heavenly power, I may offer my thanksgiving and homage to the most loving of fathers. Oh, St. Joseph, I never weary contemplating you and Jesus asleep in your arms; I dare not approach while he reposes near your heart.',
        contentAm: 'በዚህም በምድር ላይ ሰማያዊ ኃይልህን አግኝቼ፣ ከሁሉም አባቶች ይበልጥ ለሆንከው አፍቃሪ አባት ምስጋናዬንና ክብሬን አቀርባለሁ። ቅዱስ ዮሴፍ ሆይ፣ አንተንና በእቅፍህ የተኛውን ኢየሱስን ከመመልከት በጭራሽ አልሰለችም፤ በልብህ አቅራቢያ ሲያርፍ ለመቅረብ አልደፍርም።',
        imagePath: 'assets/St. Francis.jpg',
      ),
      PrayerStep(
        sectionHeader: 'FINAL PETITION',
        titleEn: 'Prayer to Saint Joseph',
        titleAm: 'ወደ ቅዱስ ዮሴፍ ጸሎት',
        contentEn: 'Press him in my name and kiss his fine head for me and ask him to return the kiss when I draw my dying breath. St. Joseph, patron of departing souls - pray for me. Amen.',
        contentAm: 'በስሜ እቀፈው፣ ውብ ራሱንም ሳምልኝ፣ እኔም የመጨረሻ ትንፋሼን ስተነፍስ ያንን ሳም እንዲመልስልኝ ለምነው። የሟች ነፍሳት ጠባቂ ቅዱስ ዮሴፍ ሆይ - ስለ እኔ ጸልይ። አሜን።',
        imagePath: 'assets/St. Francis.jpg',
      ),
    ],

    'Prayer to St. Francis of Assisi': [
      PrayerStep(
        sectionHeader: 'reading focus',
        titleEn: 'Prayer to St. Francis of Assisi',
        titleAm: 'የቅዱስ ፍራንቸስኮስ ጸሎት',
        contentEn: 'Lord, make me an instrument of your peace:\nwhere there is hatred, let me sow love;\nwhere there is injury, pardon;\nwhere there is doubt, faith;',
        contentAm: 'ጌታ ሆይ የሰላም መሳሪያ እንድሆን አድርገኝ፤\nጥል ባለበት ፍቅር፣\nበደል ባለበት ይቅርታ፣\nጥርጣሬ ባለበት እምነት እንዲገኝ አደርግ ዘንድ አብቃኝ።',
        imagePath: 'assets/St. Francis.jpg',
      ),
      PrayerStep(
        sectionHeader: 'INVOCATION',
        titleEn: 'Prayer to St. Francis of Assisi',
        titleAm: 'የቅዱስ ፍራንቸስኮስ ጸሎት',
        contentEn: 'where there is despair, hope;\nwhere there is darkness, light;\nwhere there is sadness, joy.',
        contentAm: 'ተስፋ መቁረጥ ባለበት መጽናናት፣\nጨለማ ባለበት ብርሃን፣\nሓዘን ባለበት ደስታ እንዲገኝ አደርግ ዘንድ አብቃኝ።',
        imagePath: 'assets/St. Francis.jpg',
      ),
      PrayerStep(
        sectionHeader: 'FINAL PETITION',
        titleEn: 'Prayer to St. Francis of Assisi',
        titleAm: 'የቅዱስ ፍራንቸስኮስ ጸሎት',
        contentEn: 'O divine Master, grant that I may not so much seek\nto be consoled as to console,\nto be understood as to understand,\nto be loved as to love.\nFor it is in giving that we receive,\nit is in pardoning that we are pardoned,\nand it is in dying that we are born to eternal life. Amen.',
        contentAm: 'ጌታ ሆይ ከማጽናናት ይልቅ ለማጽናናት፣ ከመረዳት ይልቅ ለመረዳት፣ ከመወደድ ይልቅ ለመውደድ እንድተጋ እርዳኝ። በመስጠት እናገኛለንና፣ ይቅር በማለት ይቅር እንባላለንና፣ በመሞትም ለዘላለም ሕይወት እንወለዳለንና። አሜን።',
        imagePath: 'assets/St. Francis.jpg',
      ),
    ],

    'The Litany of the Saints': [
      PrayerStep(
        sectionHeader: 'reading focus',
        titleEn: 'The Litany of the Saints (Part I)',
        titleAm: 'የቅዱሳን ሊታንያ (ክፍል ፩)',
        contentEn: 'Lord, have mercy on us. Christ, have mercy on us. Lord, have mercy on us. Christ, hear us. Christ, graciously hear us. God, the Father of Heaven, have mercy on us. God the Son, Redeemer of the world, have mercy on us. God the Holy Spirit, have mercy on us. Holy Trinity, one God, have mercy on us.',
        contentAm: 'ጌታ ሆይ ማረን። ክርስቶስ ሆይ ማረን። ጌታ ሆይ ማረን። ክርስቶስ ሆይ ስማን። የሰማይ አባት እግዚአብሔር ሆይ ማረን። ዓለምን ያዳንክ ወልድ እግዚአብሔር ሆይ ማረን። መንፈስ ቅዱስ እግዚአብሔር ሆይ ማረን። ቅድስት ሥላሴ አንድ አምላክ ሆይ ማረን።',
        imagePath: 'assets/St. Francis.jpg',
      ),
      PrayerStep(
        sectionHeader: 'INVOCATION',
        titleEn: 'The Litany of the Saints (Part II)',
        titleAm: 'የቅዱሳን ሊታንያ (ክፍል ፪)',
        contentEn: 'Holy Mary, Holy Mother of God, Holy Virgin of Virgins, St. Michael, St. Gabriel, St. Raphael, All you Holy Angels and Archangels, St. John the Baptist, St. Joseph, All you Holy Patriarchs and Prophets, St. Peter, St. Paul, St. Andrew, St. John, St. Stephen, St. Lawrence, St. Augustine, St. Anthony, St. Benedict, St. Dominic, St. Francis, St. Mary Magdalene, St. Clare, All you Holy Saints of God, pray for us.',
        contentAm: 'ቅድስት ማርያም ሆይ፣ ቅድስት የእግዚአብሔር እናት፣ ቅዱስ ሚካኤል፣ ቅዱስ ገብርኤል፣ ቅዱስ ሩፋኤል፣ ቅዱስ ዮሐንስ መጥምቅ፣ ቅዱስ ዮሴፍ፣ ቅዱስ ጴጥሮስና ጳውሎስ፣ ቅዱስ እስጢፋኖስ፣ ቅዱስ አውግስጢኖስ፣ ቅዱስ ፍራንቸስኮስ፣ ቅድስት ማርያም መግደላዊት፣ የእግዚአብሔር ቅዱሳንና ቅዱሳት ሁሉ ሆይ፤ ስለ እኛ ማልዱ።',
        imagePath: 'assets/St. Francis.jpg',
      ),
      PrayerStep(
        sectionHeader: 'FINAL PETITION',
        titleEn: 'The Litany of the Saints (Part III)',
        titleAm: 'የቅዱሳን ሊታንያ (ክፍል ፫)',
        contentEn: 'From all evil, Lord, save your people. From all sin, Lord, save your people. By your Cross and Passion, Lord, save your people. By your Holy Resurrection, Lord, save your people. Be merciful to us sinners, Lord, hear our prayer. Lamb of God, who takes away the sins of the world, spare us, O Lord! Lamb of God, Have mercy on us. Christ, hear us, Lord Jesus, hear our prayer. Amen.',
        contentAm: 'ከክፉ ሁሉ፣ ከኃጢአት ሁሉ ጌታ ሆይ አድነን። በጭንቅህና በስቅላትህ፣ በትንሣኤህም ጌታ ሆይ አድነን። እኛን ኃጢአተኞቹን ስማን። የዓለምን ኃጢአት የምታስወግድ የእግዚአብሔር በግ ሆይ፣ ማረን። ክርስቶስ ሆይ ስማን፣ ጌታ ኢየሱስ ሆይ ጸሎታችንን ተቀበል። አሜን።',
        imagePath: 'assets/St. Francis.jpg',
      ),
    ],

    'Prayer of Abandonment': [
      PrayerStep(
        sectionHeader: 'reading focus',
        titleEn: 'Prayer of Abandonment',
        titleAm: 'ራስን ለእግዚአብሔር የመስጠት ጸሎት',
        contentEn: 'Father, I abandon myself into your hands; do with me what you will. Whatever you may do, I thank you: I am ready for all, I accept all.',
        contentAm: 'አባቴ ሆይ፤ ራሴን በእጆችህ ላይ አኖራለሁ፤ በኔ የምትፈልገውን ሁሉ አድርግ። ለምታደርገው ነገር ሁሉ አመሰግንሃለሁ፤ ለሁሉም ዝግጁ ነኝ፣ ሁሉንም እቀበላለሁ።',
        imagePath: 'assets/St. Francis.jpg',
      ),
      PrayerStep(
        sectionHeader: 'INVOCATION',
        titleEn: 'Prayer of Abandonment',
        titleAm: 'ራስን ለእግዚአብሔር የመስጠት ጸሎት',
        contentEn: 'Let only your will be done in me, and in all your creatures - I wish no more than this, O Lord.',
        contentAm: 'ጌታ ሆይ፤ በአንተ ፈቃድ ብቻ በእኔና በፍጥረታትህ ሁሉ ላይ ይፈጸም - ከዚህ ውጪ ሌላ ምንም አልመኝም።',
        imagePath: 'assets/St. Francis.jpg',
      ),
      PrayerStep(
        sectionHeader: 'FINAL PETITION',
        titleEn: 'Prayer of Abandonment',
        titleAm: 'ራስን ለእግዚአብሔር የመስጠት ጸሎት',
        contentEn: 'Into your hands I commend my soul: I offer it to you with all the love of my heart, for I love you, Lord, and so need to give myself, to surrender myself into your hands without reserve, and with boundless confidence, for you are my Father.',
        contentAm: 'ነፍሴን በእጆችህ አደራ እሰጣለሁ፤ በልቤ ፍቅር ሁሉ ለአንተ እሰጣታለሁ፤ ጌታ ሆይ እወድሃለሁና ራሴን ለአንተ መስጠት አለብኝ፣ ያለምንም ገደብና ወሰን በሌለው እምነት ራሴን በእጆችህ ላይ አሳልፌ እሰጣለሁ፣ አንተ አባቴ ነህና።',
        imagePath: 'assets/St. Francis.jpg',
      ),
    ],

    'Anima Christi': [
      PrayerStep(
        sectionHeader: 'reading focus',
        titleEn: 'Anima Christi',
        titleAm: 'የክርስቶስ ነፍስ ሆይ',
        contentEn: 'Soul of Christ, sanctify me. Body of Christ, save me. Blood of Christ, inebriate me. Water from the side of Christ, wash me. Passion of Christ, strengthen me.',
        contentAm: 'የክርስቶስ ነፍስ ሆይ፣ ቀድሺኝ። የክርስቶስ ሥጋ ሆይ፣ አድኚኝ። የክርስቶስ ደም ሆይ, አርኪኝ። ከክርስቶስ ጎን የፈሰሰው ውኃ ሆይ፣ እጠቢኝ። የክርስቶስ መከራ ሆይ፣ አበርቺኝ።',
        imagePath: 'assets/St. Francis.jpg',
      ),
      PrayerStep(
        sectionHeader: 'INVOCATION',
        titleEn: 'Anima Christi',
        titleAm: 'የክርስቶስ ነፍስ ሆይ',
        contentEn: 'O good Jesus, hear me. Within Thy Wounds hide me. Suffer me not to be separated from Thee. From the malignant enemy, defend me.',
        contentAm: 'ቸሩ ኢየሱስ ሆይ፣ ስማኝ። በቆሰሉት ቁስሎችህ ውስጥ ደብቀኝ። ከአንተ እንድለይ አትፍቀድብኝ። ከክፉ ጠላት ጠብቀኝ።',
        imagePath: 'assets/St. Francis.jpg',
      ),
      PrayerStep(
        sectionHeader: 'FINAL PETITION',
        titleEn: 'Anima Christi',
        titleAm: 'የክርስቶስ ነፍስ ሆይ',
        contentEn: 'In the hour of my death, call me, And bid me to come to Thee. That with Thy saints, I may praise Thee. Forever and ever. Amen.',
        contentAm: 'በሞቴ ሰዓት ጥራኝ፣ ወደ አንተም እንድመጣ እዘዘኝ። ከቅዱሳንህ ጋር ለዘላለም አመሰግንህ ዘንድ። አሜን።',
        imagePath: 'assets/St. Francis.jpg',
      ),
    ],

    'Litany of the Holy Name of Jesus': [
      PrayerStep(
        sectionHeader: 'reading focus',
        titleEn: 'Litany of the Holy Name of Jesus (Part I)',
        titleAm: 'የኢየሱስ ቅዱስ ስም ሊታንያ (ክፍል ፩)',
        contentEn: 'Lord, have mercy on us. Christ, have mercy on us. God the Father of Heaven, have mercy on us. God the Son, Redeemer of the world, have mercy on us. God the Holy Spirit, have mercy on us. Holy Trinity, one God, have mercy on us. Jesus, Son of the living God, have mercy on us. Jesus, King of glory, sun of justice, brightness of eternal light, have mercy on us.',
        contentAm: 'ጌታ ሆይ ማረን። ክርስቶስ ሆይ ማረን። የሰማይ አባት እግዚአብሔር ሆይ ማረን። ዓለምን ያዳንክ ወልድ እግዚአብሔር ሆይ ማረን። መንፈስ ቅዱስ እግዚአብሔር ሆይ ማረን። ቅድስት ሥላሴ አንድ አምላክ ሆይ ማረን። የሕያው እግዚአብሔር ልጅ ኢየሱስ ሆይ ማረን። የክብር ንጉሥ፣ የጽድቅ ፀሐይ፣ የዘላለም ብርሃን የሆንክ ኢየሱስ ሆይ ማረን።',
        imagePath: 'assets/St. Francis.jpg',
      ),
      PrayerStep(
        sectionHeader: 'INVOCATION',
        titleEn: 'Litany of the Holy Name of Jesus (Part II)',
        titleAm: 'የኢየሱስ ቅዱስ ስም ሊታንያ (ክፍል ፪)',
        contentEn: 'Jesus, most powerful, most patient, most obedient, meek and humble of heart. Jesus, lover of us, God of peace, author of life, our refuge, father of the poor, good Shepherd, true light, eternal wisdom, our way and our life. Be merciful, spare us, O Jesus. Be merciful, graciously hear us, O Jesus.',
        contentAm: 'ሁሉን የምትችል፣ ታጋሽ፣ ታዛዥ፣ ልብህ የዋህና ትሑት የሆንክ ኢየሱስ ሆይ። እኛን የምትወድ፣ የሰላም አምላክ፣ የሕይወት መሥራች፣ መጠጊያችን፣ የድሆች አባት፣ መልካም እረኛ፣ እውነተኛ ብርሃን፣ የዘላለም ጥበብ፣ መንገዳችንና ሕይወታችን የሆንክ ኢየሱስ ሆይ። ማረን፣ ይቅር በለን ኢየሱስ ሆይ።',
        imagePath: 'assets/St. Francis.jpg',
      ),
      PrayerStep(
        sectionHeader: 'FINAL PETITION',
        titleEn: 'Litany of the Holy Name of Jesus (Part III)',
        titleAm: 'የኢየሱስ ቅዱስ ስም ሊታንያ (ክፍል ፫)',
        contentEn: 'From all evil, deliver us, O Jesus. From all sin, deliver us, O Jesus. By Your agony and passion, Your cross and sufferings, Your death and burial, Your Resurrection and Ascension, deliver us. Lamb of God, who takest away the sins of the world, have mercy on us. O Lord Jesus Christ, grant us the gift of Your most divine love. Amen.',
        contentAm: 'ከክፉ ሁሉ፣ ከኃጢአትም ሁሉ አድነን ኢየሱስ ሆይ። በሕማማትህ፣ በስቅላትህ፣ በሞትህና በትንሣኤህ አድነን። የዓለምን ኃጢአት የምታስወግድ የእግዚአብሔር በግ ሆይ፣ ማረን። ጌታ ኢየሱስ ክርስቶስ ሆይ፣ የመለኮታዊ ፍቅርህን ስጦታ ስጠን። አሜን።',
        imagePath: 'assets/St. Francis.jpg',
      ),
    ],

    'Come, Holy Spirit': [
      PrayerStep(
        sectionHeader: 'reading focus',
        titleEn: 'Come, Holy Spirit',
        titleAm: 'መንፈስ ቅዱስ ሆይ ና',
        contentEn: 'Come, Holy Spirit, fill the hearts of your faithful and kindle in them the fire of your love.',
        contentAm: 'መንፈስ ቅዱስ ሆይ ና፤ የጓደኞችህን ልብ ሙሉ፣ በፍቅርህም እሳት አነሳሳቸው።',
        imagePath: 'assets/St. Francis.jpg',
      ),
      PrayerStep(
        sectionHeader: 'INVOCATION',
        titleEn: 'Come, Holy Spirit',
        titleAm: 'መንፈስ ቅዱስ ሆይ ና',
        contentEn: 'Send forth your Spirit and they shall be created, and you shall renew the face of the earth.',
        contentAm: 'መንፈስህን ላክ ይፈጠራሉም፤ የምድርንም ገጽ ታድሳለህ።',
        imagePath: 'assets/St. Francis.jpg',
      ),
      PrayerStep(
        sectionHeader: 'FINAL PETITION',
        titleEn: 'Come, Holy Spirit',
        titleAm: 'መንፈስ ቅዱስ ሆይ ና',
        contentEn: 'O God, who have taught the hearts of the faithful by the light of the Holy Spirit, grant that in the same Spirit we may be truly wise and ever rejoice in his consolation. Through Christ our Lord. Amen.',
        contentAm: 'የታመኑትን ልብ በመንፈስ ቅዱስ ብርሃን ያስተማርክ እግዚአብሔር አምላክ ሆይ፤ በእርሱ መንፈስ እውነተኛ ጥበበኞች እንድንሆንና ሁልጊዜ በመጽናናቱ ደስ እንዲለን ስጠን። በክርስቶስ በጌታችን። አሜን።',
        imagePath: 'assets/St. Francis.jpg',
      ),
    ],

    'Hail Holy Queen': [
      PrayerStep(
        sectionHeader: 'reading focus',
        titleEn: 'Hail Holy Queen',
        titleAm: 'ሰላም ላንቺ ይሁን ንግሥት ሆይ',
        contentEn: 'Hail, Holy Queen, Mother of Mercy, our life, our sweetness and our hope. To you do we cry, poor banished children of Eve.',
        contentAm: 'ሰላም ላንቺ ይሁን እመቤታችን፣ የምሕረት እናት፣ ሕይወታችን፣ ጣፋጭነታችንና ተስፋችን ሆይ ሰላም ላንቺ ይሁን። እኛ የተሰደድን የሔዋን ልጆች ወደ አንቺ እንጮኻለን።',
        imagePath: 'assets/St. Francis.jpg',
      ),
      PrayerStep(
        sectionHeader: 'INVOCATION',
        titleEn: 'Hail Holy Queen',
        titleAm: 'ሰላም ላንቺ ይሁን ንግሥት ሆይ',
        contentEn: 'To you do we send up our sighs, mourning and weeping in this valley of tears. Turn then, most gracious advocate, your eyes of mercy toward us,',
        contentAm: 'በዚህ በለቅሶ ሸለቆ ውስጥ እየተጨነቅንና እያለቀስን ትንፋሻችንን ወደ አንቺ እንልካለን። እንግዲህ፣ አቅኚ ጠበቃችን ሆይ፣ የምሕረት ዓይኖችሽን ወደ እኛ መልሽ፤',
        imagePath: 'assets/St. Francis.jpg',
      ),
      PrayerStep(
        sectionHeader: 'FINAL PETITION',
        titleEn: 'Hail Holy Queen',
        titleAm: 'ሰላም ላንቺ ይሁን ንግሥት ሆይ',
        contentEn: 'and after this exile show unto us the blessed fruit of thy womb, Jesus. O clement, O loving, O sweet Virgin Mary. Amen.',
        contentAm: 'ከዚህ ስደት በኋላም የተባረከውን የሆድሽን ፍሬ ኢየሱስን አሳዪን። አንቺ ርኅሩኅ፣ አፍቃሪ፣ ጣፋጭ ድንግል ማርያም ሆይ። አሜን።',
        imagePath: 'assets/St. Francis.jpg',
      ),
    ],
  };
}