import 'package:flutter/material.dart';
import 'package:operation_001/prayer_model.dart';

class PrayerData {
  static final Map<String, List<PrayerStep>> masterPrayerDB = {
    'The Morning Offering': [
      PrayerStep(
        sectionHeader: 'reading focus',
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
        sectionHeader: 'reading focus',
        titleEn: 'Hail Holy Queen',
        titleAm: 'ሰላም ለኪ እመቤታችን',
        contentEn:
        'Hail, Holy Queen, Mother of Mercy, our life, our sweetness and our hope.',
        contentAm:
        'የምህረት እናት ንግስት ሆይ ሰላም ለአንቺ ይሁን፤ ህይወታችን፣ ጣፋጭነታችንና ተስፋችን ሆይ ሰላም ለአንቺ ይሁን።',
        imagePath: 'assets/sunrise.jpeg',
      ),
    ],
  };
}