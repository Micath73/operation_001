import 'package:operation_001/prayer_model.dart';

class PrayerData {
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
  };

  /// Safe accessor to retrieve a prayer by key or return a structural default
  static List<PrayerStep> getPrayer(String key) {
    return masterPrayerDB[key] ??
        [
          PrayerStep(
            sectionHeader: 'PRAYER',
            titleEn: key,
            titleAm: key,
            contentEn:
            'Opening prayer for $key...\n\nLord, hear our prayer. Amen.',
            contentAm: 'የቀን ጸሎት ለ $key...\n\nአምላክ ሆይ፣ ጸሎታችንን ስማ። አሜን።',
            imagePath: 'assets/sunrise.jpeg',
          ),
        ];
  }
}