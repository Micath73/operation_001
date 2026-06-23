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

    'Morning Psalm Prayers':[
      PrayerStep(
          titleEn: 'Morning Psalm Prayers',
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

    'The Benedictus':[
      PrayerStep(
          titleEn: 'The Benedictus',
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
          imagePath: 'assets/My Daily Journal.jpg')
    ],

    'Angelus':[
      PrayerStep(
          titleEn: 'Angelus',
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

    'Act Of Contrition':[
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

    'Prayer for the Hour of Mercy':[
      PrayerStep(
          titleEn: 'Prayer for the Hour of Mercy',
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

    'Prayer to St. Michael the Archangel':[
      PrayerStep(
          titleEn: 'Prayer to St. Michael the Archangel',
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

    'Divine Mercy Chaplet':[
      PrayerStep(
          titleEn: 'Divine Mercy Chaplet',
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

    'Litany Of The Holy Name Of Jesus':[
      PrayerStep(
          titleEn: 'Litany Of The Holy Name Of Jesus',
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
