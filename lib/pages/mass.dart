import 'package:flutter/material.dart';
import 'package:operation_001/controllers/language_controller.dart'; // Import your controller
import 'package:operation_001/daily_readings_screen.dart';
import 'package:operation_001/l10n/app_localizations.dart';

class UserMass extends StatefulWidget {
  final int initialTabIndex;

  const UserMass({
    super.key,
    this.initialTabIndex = 0,
  });

  @override
  State<UserMass> createState() => _UserMassState();
}

class _UserMassState extends State<UserMass> {
  List<Map<String, dynamic>> _getMassSections(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final bool isAmharic = LanguageController.instance.isAmharic; // Check current language

    return [
      {
        "en": l10n.introductoryRitesEn,
        "am": l10n.introductoryRitesAm,
        "desc": l10n.introductoryRitesDesc,
        "image": "assets/church interior.jpeg",
        "content": [
          {
            // 1. Localize the section title
            "title": isAmharic ? "1. መግቢያ ሥርዓት (Entrance)" : "1. Entrance",
            "lines": [
              {
                "type": "rubric",
                // 2. Localize rubric instructions
                "text": isAmharic
                    ? "ሕዝብ ሲሰበሰብ ካህኑ ከዲያቆናት(ከሌሎች ካህናት)፤አገልጋዮች ጋር ወደ መሠዊያው(ኦልታር) ይቀርባሉ፤ በዚህ ጊዜ የመግቢያ መዝሙር ይዘመራል።"
                    : "When the people are gathered, the Priest approaches the altar with the ministers while the Entrance Chant is sung."
              },
              {
                "type": "rubric",
                "text": isAmharic
                    ? "ወደ መሠዊያው(ኦልታር) ሲደርሱ ካህኑ ከአገልጋዮቹ ጋር አጎንብሰዉ ሰግደው መሠዊያውን በመሳም ይሳለማሉ፤ መስቀሉንና መሠዊያውን ዕጣን ያጥናሉ።"
                    : "When he has arrived at the altar, after making a profound bow with the ministers, the Priest venerates the altar with a kiss, followed by incensing..."
              },
              {
                "type": "rubric",
                "text": isAmharic
                    ? "የመግቢያ መዝሙር ሲያልቅ ካህኑ እና ሕዝቡ ቆመው በመስቀል ምልክት ራሳቸውን ይባርካሉ፤ ካህኑም ወደ ሕዝቡ ዞር ብሎ እንዲህ ይላል፦"
                    : "When the Entrance Chant is concluded, the Priest and the faithful, standing, sign themselves with the Sign of the Cross..."
              },
              {
                "type": "dialogue",
                // 3. Localize dialogue roles (Priest -> ካህን)
                "role": isAmharic ? "ካህን" : "Priest",
                // 4. Localize spoken dialogue text
                "text": isAmharic
                    ? "በስመ አብ ወወልድ ወመንፈስ ቅዱስ አሐዱ አምላክ።"
                    : "In the name of the Father, and of the Son, and of the Holy Spirit."
              },
              {
                "type": "dialogue",
                "role": isAmharic ? "ሕዝብ" : "People",
                "text": "አሜን።"
                // Amen is the same/universal, but can be localized if needed
              },
            ]
          },
          {
            "title": isAmharic ? "2. ሰላምታ" : "2. Greeting",
            "lines": [
              {
                "type": "rubric",
                "text": isAmharic
                    ? "ቀጥሎም ካህኑ እጆቹን ዘርግቶ ሕዝቡን እንዲህ ሲል ሰላምታ ይሰጣል፦"
                    : "Then the Priest, extending his hands, greets the people, saying:"
              },
              {
                "type": "dialogue",
                "role": isAmharic ? "ካህን" : "Priest",
                "text": isAmharic
                    ? "የጌታችን የኢየሱስ ክርስቶስ ጸጋ፥ የእግዚአብሔርም ፍቅር፥ የመንፈስ ቅዱስም ኅብረት ከሁላችሁ ጋር ይሁን።"
                    : "The grace of our Lord Jesus Christ, and the love of God, and the communion of the Holy Spirit be with you all."
              },
              {
                "type": "rubric",
                "text": isAmharic ? "ወይም፦" : "Or:"
              },
              {
                "type": "dialogue",
                "role": isAmharic ? "ካህን" : "Priest",
                "text": isAmharic
                    ? "ከእግዚአብሔር ከአባታችን ከጌታችንም ከኢየሱስ ክርስቶስ ጸጋና ሰላም ለእናንተ ይሁን።"
                    : "Grace to you and peace from God our Father and the Lord Jesus Christ."
              },
              {
                "type": "rubric",
                "text": isAmharic ? "ወይም፦" : "Or:"
              },
              {
                "type": "dialogue",
                "role": isAmharic ? "ካህን" : "Priest",
                "text": isAmharic
                    ? "ጌታ ከሁላችሁ ጋር ይሁን።"
                    : "The Lord be with you."
              },
              {
                "type": "dialogue",
                "role": isAmharic ? "ሕዝብ" : "People",
                "text": isAmharic
                    ? "ከመንፈስህም ጋር።"
                    : "And with your spirit."
              },
              {
                "type": "rubric",
                "text": isAmharic
                    ? "በዚህ የመጀመሪያ ሰላምታ ጊዜ ጳጳሱ «ጌታ ከሁላችሁ ጋር ይሁን» ከማለት ፈንታ እንዲህ ይላል፦"
                    : "In this first greeting a Bishop, instead of The Lord be with you, says:"
              },
              {
                "type": "dialogue",
                "role": isAmharic ? "ጳጳስ" : "Bishop",
                "text": isAmharic
                    ? "ሰላም ለእናንተ ይሁን።"
                    : "Peace be with you."
              },
              {
                "type": "dialogue",
                "role": isAmharic ? "ሕዝብ" : "People",
                "text": isAmharic
                    ? "ከመንፈስህም ጋር።"
                    : "And with your spirit."
              },
            ]
          },
          {
            "title": isAmharic
                ? "3. የዕለቱ ቅዳሴ መግቢያ"
                : "3. Introduction to the Mass of the Day",
            "lines": [
              {
                "type": "rubric",
                "text": isAmharic
                    ? "ካህኑ፣ ዲያቆኑ ወይም ሌላ አገልጋይ ለሕዝቡ ስለዕለቱ ቅዳሴ በአጭሩ ሊያስተዋውቁ ይችላሉ።"
                    : "The Priest, or a Deacon, or another minister, may very briefly introduce the faithful to the Mass of the day."
              },
              {
                "type": "rubric",
                "text": isAmharic
                    ? "በእሁድ ቀናት፣ ካህናቱ መሰዊያዉን ከተሳለሙ በኋላ (ከመሳለማቸዉ በፊት) ጥምቀታችንን እንድናስታዉስ የውሃ ቡራኬና መርጨት ይደረጋል።"
                    : "From time to time on Sundays, especially in Easter Time, instead of the customary Penitential Act, the blessing and sprinkling of water may take place as a reminder of Baptism."
              },
            ]
          },
          {
            "title": isAmharic
                ? "4. የንስሐ ሥርዓት — ሀ"
                : "4. Penitential Act — Form A",
            "lines": [
              {
                "type": "rubric",
                "text": isAmharic
                    ? "ቀጥሎ የንስሐ ሥርዓት ይደረጋል፤ ካህኑም ሕዝቡን እንዲህ ሲል ይጋብዛል፦"
                    : "Then follows the Penitential Act, to which the Priest invites the faithful, saying:"
              },
              {
                "type": "dialogue",
                "role": isAmharic ? "ካህን" : "Priest",
                "text": isAmharic
                    ? "ወንድሞቼ ሆይ (ወንድሞቼና እህቶቼ ሆይ)፥ ቅዱሳን ምሥጢራትን ለመፈጸም የተገባን እንድንሆን፣ ኃጢኣታችንን እንናዘዝ።"
                    : "Brethren (brothers and sisters), let us acknowledge our sins, and so prepare ourselves to celebrate the sacred mysteries."
              },
              {
                "type": "rubric",
                "text": isAmharic
                    ? "ትንሽ የጸጥታ ጊዜ ይሆናል። ከዚያም ሁሉም በጋራ የኃጢአት ኑዛዜ ቃል ይጸልያሉ፦"
                    : "A brief pause for silence follows. Then all recite together the formula of general confession:"
              },
              {
                "type": "dialogue",
                "role": isAmharic ? "ሁሉም" : "All",
                "text": isAmharic
                    ? "ሁሉን ለሚችል እግዚአብሔር፤ ለናንተም ወንድሞቼ እህቶቼ ፣ በማሰብ በመናገር በማድረግ ተግባሬንም ባለመፈጸም፤ ብዙ ኃጢአት መሥራቴን እናዘዛለሁ፤"
                    : "I confess to almighty God and to you, my brothers and sisters, that I have greatly sinned, in my thoughts and in my words, in what I have done and in what I have failed to do,"
              },
              {
                "type": "rubric",
                "text": isAmharic
                    ? "ደረታቸውን እየመቱም እንዲህ ይላሉ፦"
                    : "And, striking their breast, they say:"
              },
              {
                "type": "dialogue",
                "role": isAmharic ? "ሁሉም" : "All",
                "text": isAmharic
                    ? "በኔ ክፋት በኔ ክፋት በኔ ብዙ ክፋት ነውና፤"
                    : "through my fault, through my fault, through my most grievous fault;"
              },
              {
                "type": "rubric",
                "text": isAmharic ? "ቀጥለውም እንዲህ ይላሉ፦" : "Then they continue:"
              },
              {
                "type": "dialogue",
                "role": isAmharic ? "ሁሉም" : "All",
                "text": isAmharic
                    ? "ስለዚህ ዘወትር ድንግል በሆነችው እመቤታችን ቅድስት ድንግል ማርያም ፤ መላእክትና ቅዱሳንም ሁሉ እናንተም ወንድሞቼን እህቶቼም ከጌታችን ከአምላካችን ታማልዱኝ ዘንድ እለምናለሁ።"
                    : "therefore I ask blessed Mary ever-Virgin, all the Angels and Saints, and you, my brothers and sisters, to pray for me to the Lord our God."
              },
              {
                "type": "rubric",
                "text": isAmharic
                    ? "ቀጥሎም በካህኑ የሚደረግ የይቅርታ ቃል ይከተላል፦"
                    : "The absolution by the Priest follows:"
              },
              {
                "type": "dialogue",
                "role": isAmharic ? "ካህን" : "Priest",
                "text": isAmharic
                    ? "ሁሉን የሚችል እግዚአብሔር በምሕረቱ ኃጢአታችንን ይቅር ብሎ ወደ ዘለዓለም ሕይወት ያግባን። አሜን!"
                    : "May almighty God have mercy on us, forgive us our sins, and bring us to everlasting life."
              },
              {
                "type": "dialogue",
                "role": isAmharic ? "ሕዝብ" : "People",
                "text": "አሜን።"
              },
            ]
          },
          {
            "title": isAmharic
                ? "5. የንስሐ ሥርዓት — ለ"
                : "5. Penitential Act — Form B",
            "lines": [
              {
                "type": "rubric",
                "text": isAmharic
                    ? "ካህኑ ሕዝቡን የንስሐ ሥርዓት እንዲያደርጉ ይጋብዛል፦"
                    : "The Priest invites the faithful to make the Penitential Act:"
              },
              {
                "type": "dialogue",
                "role": isAmharic ? "ካህን" : "Priest",
                "text": isAmharic
                    ? "ወንድሞቼ ሆይ (ወንድሞቼና እህቶቼ ሆይ)፥ ቅዱሳን ምሥጢራትን ለመፈጸም የተገባን እንድንሆን፣ ኃጢኣታችንን እንናዘዝ።"
                    : "Brethren (brothers and sisters), let us acknowledge our sins, and so prepare ourselves to celebrate the sacred mysteries."
              },
              {
                "type": "rubric",
                "text": isAmharic
                    ? "ትንሽ የጸጥታ ጊዜ ይሆናል። ከዚያም ካህኑ እንዲህ ይላል፦"
                    : "A brief pause for silence follows. The Priest then says:"
              },
              {
                "type": "dialogue",
                "role": isAmharic ? "ካህን" : "Priest",
                "text": isAmharic ? "ጌታ ሆይ ማረን..." : "Have mercy on us, O Lord."
              },
              {
                "type": "dialogue",
                "role": isAmharic ? "ሕዝብ" : "People",
                "text": isAmharic
                    ? "ባንተ ላይ ኃጢአት ሠርተናልና።"
                    : "For we have sinned against you."
              },
              {
                "type": "dialogue",
                "role": isAmharic ? "ካህን" : "Priest",
                "text": isAmharic
                    ? "አቤቱ፥ ምህረትህን አሳየን።"
                    : "Show us, O Lord, your mercy."
              },
              {
                "type": "dialogue",
                "role": isAmharic ? "ሕዝብ" : "People",
                "text": isAmharic
                    ? "ማዳንህንም ስጠን።"
                    : "And grant us your salvation."
              },
              {
                "type": "rubric",
                "text": isAmharic
                    ? "ቀጥሎም በካህኑ የሚደረግ የይቅርታ ቃል ይቀጥላል፦"
                    : "The absolution by the Priest follows:"
              },
              {
                "type": "dialogue",
                "role": isAmharic ? "ካህን" : "Priest",
                "text": isAmharic
                    ? "ሁሉን የሚችል እግዚአብሔር በምሕረቱ ኃጢአታችንን ይቅር ብሎ ወደ ዘለዓለም ሕይወት ያግባን። አሜን!"
                    : "May almighty God have mercy on us, forgive us our sins, and bring us to everlasting life."
              },
              {
                "type": "dialogue",
                "role": isAmharic ? "ሕዝብ" : "People",
                "text": "አሜን።"
              },
            ]
          },
          {
            "title": isAmharic
                ? "6. የንስሐ ሥርዓት — ሐ"
                : "6. Penitential Act — Form C",
            "lines": [
              {
                "type": "rubric",
                "text": isAmharic
                    ? "ካህኑ ሕዝቡን የንስሐ ሥርዓት እንዲያደርጉ ይጋብዛል፦"
                    : "The Priest invites the faithful to make the Penitential Act:"
              },
              {
                "type": "dialogue",
                "role": isAmharic ? "ካህን" : "Priest",
                "text": isAmharic
                    ? "ወንድሞቼ ሆይ (ወንድሞቼና እህቶቼ ሆይ)፥ ቅዱሳን ምሥጢራትን ለመፈጸም የተገባን እንድንሆን፣ ኃጢኣታችንን እንናዘዝ።"
                    : "Brethren (brothers and sisters), let us acknowledge our sins, and so prepare ourselves to celebrate the sacred mysteries."
              },
              {
                "type": "rubric",
                "text": isAmharic
                    ? "ትንሽ የጸጥታ ጊዜ ይሆናል።"
                    : "A brief pause for silence follows."
              },
              {
                "type": "rubric",
                "text": isAmharic
                    ? "ካህኑ ወይም ዲያቆኑ ወይም ሌላ አገልጋይ የሚከተሉትን ወይም ሌሎችን ጸሎቶች ከ«ኪርያላይሶ» (አቤቱ ማረን) ጋር ይላል፦"
                    : "The Priest, or a Deacon or another minister, then says the following or other invocations with Kyrie, eleison (Lord, have mercy):"
              },
              {
                "type": "dialogue",
                "role": isAmharic ? "ካህን" : "Priest",
                "text": isAmharic
                    ? "የተሰበረ ልብ ያላቸውን ልትፈውስ ተልከሃል፡ ጌታ ሆይ ማረን። (ወይም፡ ኪርያላይሶ።)"
                    : "You were sent to heal the contrite of heart: Lord, have mercy. (Or: Kyrie, eleison.)"
              },
              {
                "type": "dialogue",
                "role": isAmharic ? "ሕዝብ" : "People",
                "text": isAmharic
                    ? "ጌታ ሆይ ማረን። (ወይም፡ ኪርያላይሶ።)"
                    : "Lord, have mercy. (Or: Kyrie, eleison.)"
              },
              {
                "type": "dialogue",
                "role": isAmharic ? "ካህን" : "Priest",
                "text": isAmharic
                    ? "ኃጢአተኞችን ልትጠራ መጥተሃል፡ ክርስቶስ ሆይ ማረን። (ወይም፡ ኪርያላይሶ።)"
                    : "You came to call sinners: Christ, have mercy. (Or: Christe, eleison.)"
              },
              {
                "type": "dialogue",
                "role": isAmharic ? "ሕዝብ" : "People",
                "text": isAmharic
                    ? "ክርስቶስ ሆይ ማረን። (ወይም፡ ኪርያላይሶ።)"
                    : "Christ, have mercy. (Or: Christe, eleison.)"
              },
              {
                "type": "dialogue",
                "role": isAmharic ? "ካህን" : "Priest",
                "text": isAmharic
                    ? "ስለእኛ ልትማልድ በአብ ቀኝ ተቀምጠሃል፡ ጌታ ሆይ ማረን። (ወይም፡ ኪርያላይሶ።)"
                    : "You are seated at the right hand of the Father to intercede for us: Lord, have mercy. (Or: Kyrie, eleison.)"
              },
              {
                "type": "dialogue",
                "role": isAmharic ? "ሕዝብ" : "People",
                "text": isAmharic
                    ? "ጌታ ሆይ ማረን። (ወይም፡ ኪርያላይሶ።)"
                    : "Lord, have mercy. (Or: Kyrie, eleison.)"
              },
              {
                "type": "rubric",
                "text": isAmharic
                    ? "ቀጥሎም በካህኑ የሚደረግ የይቅርታ ቃል ይቀጥላል፦"
                    : "The absolution by the Priest follows:"
              },
              {
                "type": "dialogue",
                "role": isAmharic ? "ካህን" : "Priest",
                "text": isAmharic
                    ? "ሁሉን የሚችል እግዚአብሔር በምሕረቱ ኃጢአታችንን ይቅር ብሎ ወደ ዘለዓለም ሕይወት ያግባን። አሜን!"
                    : "May almighty God have mercy on us, forgive us our sins, and bring us to everlasting life."
              },
              {
                "type": "dialogue",
                "role": isAmharic ? "ሕዝብ" : "People",
                "text": "አሜን።"
              },
            ]
          },
          {
            "title": isAmharic ? "7. ኪርያላይሶ (ጌታ ሆይ ማረን)" : "7. The Kyrie",
            "lines": [
              {
                "type": "rubric",
                "text": isAmharic
                    ? "የንስሐ ሥርዓት(Penitential Act) ባልተደረገበት ጊዜ (ወይም ካልተካተተ) 'ኪርያላይሶ' (ጌታ ሆይ ማረን) ጸሎት ይቀጥላል።"
                    : "The Kyrie eleison (Lord, have mercy) invocations follow, unless they have just occurred in a formula of the Penitential Act."
              },
              {
                "type": "dialogue",
                "role": isAmharic ? "ካህን" : "V",
                "text": isAmharic ? "ጌታ ሆይ ማረን" : "Lord, have mercy."
              },
              {
                "type": "dialogue",
                "role": isAmharic ? "ሕዝብ" : "R",
                "text": isAmharic ? "ጌታ ሆይ ማረን" : "Lord, have mercy."
              },
              {
                "type": "dialogue",
                "role": isAmharic ? "ካህን" : "V",
                "text": isAmharic ? "ክርስቶስ ሆይ ማረን።" : "Christ, have mercy."
              },
              {
                "type": "dialogue",
                "role": isAmharic ? "ሕዝብ" : "R",
                "text": isAmharic ? "ክርስቶስ ሆይ ማረን።" : "Christ, have mercy."
              },
              {
                "type": "dialogue",
                "role": isAmharic ? "ካህን" : "V",
                "text": isAmharic ? "ጌታ ሆይ ማረን" : "Lord, have mercy."
              },
              {
                "type": "dialogue",
                "role": isAmharic ? "ሕዝብ" : "R",
                "text": isAmharic ? "ጌታ ሆይ ማረን" : "Lord, have mercy."
              },
              {
                "type": "rubric",
                "text": isAmharic ? "ወይም፦" : "Or:"
              },
              {
                "type": "dialogue",
                "role": isAmharic ? "ካህን" : "V",
                "text": isAmharic ? "ኪርያላይሶ" : "Kyrie, eleison."
              },
              {
                "type": "dialogue",
                "role": isAmharic ? "ሕዝብ" : "R",
                "text": isAmharic ? "ኪርያላይሶ" : "Kyrie, eleison."
              },
              {
                "type": "dialogue",
                "role": isAmharic ? "ካህን" : "V",
                "text": isAmharic ? "ክርስቴ ያላይሶ" : "Christe, eleison."
              },
              {
                "type": "dialogue",
                "role": isAmharic ? "ሕዝብ" : "R",
                "text": isAmharic ? "ክርስቴ ያላይሶ" : "Christe, eleison."
              },
              {
                "type": "dialogue",
                "role": isAmharic ? "ካህን" : "V",
                "text": isAmharic ? "ኪርያላይሶ" : "Kyrie, eleison."
              },
              {
                "type": "dialogue",
                "role": isAmharic ? "ሕዝብ" : "R",
                "text": isAmharic ? "ኪርያላይሶ" : "Kyrie, eleison."
              },
            ]
          },
          {
            "title": isAmharic ? "8. የክብር መዝሙር (ግሎሪያ)" : "8. The Gloria",
            "lines": [
              {
                "type": "rubric",
                "text": isAmharic
                    ? "በታዘዘባቸው ቀናት ይህ መዝሙር ይዘመራል ወይም ይነበባል፦"
                    : "Then, when it is prescribed, this hymn is either sung or said:"
              },
              {
                "type": "dialogue",
                "text": isAmharic
                    ? "በሰማያት ለእግዚአብሔር ምስጋና፤ በምድርም በጐ ፈቃድ ለአላቸው ሰዎች ሰላም ይሁን፤ ሁሉን የምትችል አብ ሰማያዊ ንጉሥ ጌታ አምላክ ሆይ:- እናሞግስሃለን፤ እንወድስሃለን፤ እንሰግድልሃለን፤ እናከብርሃለን፤ ስለታላቁ ክብርህ ምሥጋናን እናቀርብልሃለን።"
                    : "Glory to God in the highest, and on earth peace to people of good will. We praise you, we bless you, we adore you, we glorify you, we give you thanks for your great glory, Lord God, heavenly King, O God, almighty Father."
              },
              {
                "type": "dialogue",
                "text": isAmharic
                    ? "የዓለምን ኃጢአት የምታጠፋ የእግዚአብሔር በግ፤ የአብ አንድ ልጅ አምላክ የሆንህ ጌታችን ኢየሱስ ክርስቶስ ሆይ ይቅር በለን፤ የዓለምን ኃጢአት የምታጠፋ ትሑት ጸሎታችንን ተቀበል፤ በአብ ቀኝ የምትቀመጥ ይቅር በለን።"
                    : "Lord Jesus Christ, Only Begotten Son, Lord God, Lamb of God, Son of the Father, you take away the sins of the world, have mercy on us; you take away the sins of the world, receive our prayer; you are seated at the right hand of the Father, have mercy on us."
              },
              {
                "type": "dialogue",
                "text": isAmharic
                    ? "ኢየሱስ ክርስቶስ ሆይ ቅዱስ አንተ ብቻ ነህ፤ ጌታ አንተ ብቻ ነህ፤ ልዑል አንተ ብቻነህ። ከመንፈስ ቅዱስም ጋር በእግዚአብሔር አብ ከብረህ ትኖራለህ ። አሜን!"
                    : "For you alone are the Holy One, you alone are the Lord, you alone are the Most High, Jesus Christ, with the Holy Spirit, in the glory of God the Father. Amen."
              },
            ]
          },
          {
            "title": isAmharic ? "9. የማሳረጊያ ጸሎት (ኮሌክት)" : "9. The Collect",
            "lines": [
              {
                "type": "rubric",
                "text": isAmharic
                    ? "ይህ መዝሙር ሲያልቅ ካህኑ እጆቹን ዘርግቶ እንዲህ ይላል፦"
                    : "When this hymn is concluded, the Priest, with hands joined, says:"
              },
              {
                "type": "dialogue",
                "role": isAmharic ? "ካህን" : "Priest",
                "text": isAmharic ? "እንጸልይ" : "Let us pray."
              },
              {
                "type": "rubric",
                "text": isAmharic
                    ? "ከዚያም ሁሉም ከካህኑ ጋር ለተወሰነ ጊዜ በጸጥታ ይጸልያሉ።"
                    : "And all pray in silence with the Priest for a while."
              },
              {
                "type": "rubric",
                "text": isAmharic
                    ? "ቀጥሎም ካህኑ እጆቹን ዘርግቶ የማሳረጊያ ጸሎት (ኮሌክት)፤ በጸሎቱ ማጠናቀቂያ ላይ ሕዝቡ እንዲህ ብሎ ይቀበላል፦"
                    : "Then the Priest, with hands extended, says the Collect prayer, at the end of which the people acclaim:"
              },
              {
                "type": "dialogue",
                "role": isAmharic ? "ሕዝብ" : "People",
                "text": "አሜን።"
              },
            ]
          },
        ],
      },
      {
        "en": l10n.liturgyOfTheWordEn,
        "am": l10n.liturgyOfTheWordAm,
        "desc": l10n.liturgyOfTheWordDesc,
        "image": "assets/bible reading.jpg",
        "content": [
          {
            "title": isAmharic ? "10. የመጀመሪያ ንባብ" : "10. First Reading",
            "lines": [
              {
                "type": "rubric",
                "text": isAmharic
                    ? "ቀጥሎ አንባቢው ወደ መድረክ (አምቦ) ሄዶ የመጀመሪያውን ንባብ ያነባል፤ ሕዝቡም ሁሉ ተቀምጦ ያዳምጣል።"
                    : "Then the reader goes to the ambo and reads the First Reading, while all sit and listen."
              },
              {
                "type": "rubric",
                "text": isAmharic
                    ? "የንባቡን ማጠናቀቂያ ለማመልከት አንባቢው እንዲህ ይላል፦"
                    : "To indicate the end of the reading, the reader acclaims:"
              },
              {
                "type": "dialogue",
                "role": isAmharic ? "አንባቢ" : "Reader",
                "text": isAmharic
                    ? "ይህ የእግዚአብሔር ቃል ነው፡፡"
                    : "The word of the Lord."
              },
              {
                "type": "dialogue",
                "role": isAmharic ? "ሕዝብ" : "People",
                "text": isAmharic ? "ለእግዚአብሔር ምስጋና ይሁን።" : "Thanks be to God."
              },
            ]
          },
          {
            "title": isAmharic ? "11. የምላሽ መዝሙር" : "11. Responsorial Psalm",
            "lines": [
              {
                "type": "rubric",
                "text": isAmharic
                    ? "ከመጀመሪያ ንባብ በኋላ፤ መዝሙረ ዳዊት ይነበባል( አገልጋዮች በዝማሬ ሊያጅቡ ይችላሉ) ሕዝቡም የመዝሙሩን መልስ ይመልሳሉ።"
                    : "The psalmist or cantor sings or says the Psalm, with the people making the response."
              },
            ]
          },
          {
            "title": isAmharic ? "12. ሁለተኛ ንባብ" : "12. Second Reading",
            "lines": [
              {
                "type": "rubric",
                "text": isAmharic
                    ? "ከዚህ በኋላ ሁለተኛ ንባብ፥ ከላይ እንደተገለጸው አንባቢው ከመድረክ (አምቦ) ያነባል።"
                    : "After this, if there is to be a Second Reading, a reader reads it from the ambo, as above."
              },
              {
                "type": "rubric",
                "text": isAmharic
                    ? "የንባቡን መጠናቀቅ ለማመልከት አንባቢው እንዲህ ይላል፦"
                    : "To indicate the end of the reading, the reader acclaims:"
              },
              {
                "type": "dialogue",
                "role": isAmharic ? "አንባቢ" : "Reader",
                "text": isAmharic
                    ? "ይህ የእግዚአብሔር ቃል ነው ፡፡"
                    : "The word of the Lord."
              },
              {
                "type": "dialogue",
                "role": isAmharic ? "ሕዝብ" : "People",
                "text": isAmharic ? "ለእግዚአብሔር ምስጋና ይሁን።" : "Thanks be to God."
              },
            ]
          },
          {
            "title": isAmharic
                ? "13. የምስጋና መዝሙር (ሀሌሉያ)"
                : "13. Gospel Acclamation",
            "lines": [
              {
                "type": "rubric",
                "text": isAmharic
                    ? "እንደ ሥርዓተ ጸሎቱ ወቅት 'ሀሌሉያ' ወይም ሌላ መዝሙር ይቀጥላል።"
                    : "There follows the Alleluia or another chant laid down by the rubrics, as the liturgical time requires."
              },
            ]
          },
          {
            "title": isAmharic
                ? "14. ከወንጌል በፊት የሚደረግ ቡራኬ"
                : "14. Blessing Before the Gospel",
            "lines": [
              {
                "type": "rubric",
                "text": isAmharic
                    ? "በዚህ መሀል ካህኑ ወንጌል የሚያነብ ከሆነ፤ ወንጌሉን በዕጣን ያጥነዋል። ወንጌሉን የሚያነብበው ዲያቆን ከሆነ፤ በካህኑ ፊት አጎንብሶ በለስላሳ ድምፅ ቡራኬ እንዲህ ሲል ይጠይቃል፦"
                    : "Meanwhile, if incense is used, the Priest puts some into the thurible. After this, the Deacon who is to proclaim the Gospel, bowing profoundly before the Priest, asks for the blessing, saying in a low voice:"
              },
              {
                "type": "dialogue",
                "role": isAmharic ? "ዲያቆን" : "Deacon",
                "text": isAmharic ? "አባት ሆይ ባርከኝ።" : "Your blessing, Father."
              },
              {
                "type": "rubric",
                "text": isAmharic
                    ? "ካህኑ በለስላሳ ድምፅ እንዲህ ይላል፦"
                    : "The Priest says in a low voice:"
              },
              {
                "type": "dialogue",
                "role": isAmharic ? "ካህን" : "Priest",
                "text": isAmharic
                    ? "ወንጌሉን በሚገባና በትክክል ለማሰማት እንድትችል፡ ጌታ በልብህና በከንፈሮችህ ይኑር። በአብ በወልድና በመንፈስ ቅዱስ ስም። አሜን።"
                    : "May the Lord be in your heart and on your lips, that you may proclaim his Gospel worthily and well, in the name of the Father and of the Son + and of the Holy Spirit."
              },
              {
                "type": "rubric",
                "text": isAmharic
                    ? "ዲያቆኑ በመስቀል ምልክት ራሱን ባርኮ ይመልሳል፦"
                    : "The Deacon signs himself with the Sign of the Cross and replies:"
              },
              {
                "type": "dialogue",
                "role": isAmharic ? "ዲያቆን" : "Deacon",
                "text": "አሜን።"
              },
              {
                "type": "rubric",
                "text": isAmharic
                    ? "ነገር ግን ዲያቆን ከሌለ ካህኑ በመሠዊያው ፊት ሰግዶ በድብቅ እንዲህ ይላል፦"
                    : "If, however, a Deacon is not present, the Priest, bowing before the altar, says quietly:"
              },
              {
                "type": "dialogue",
                "role": isAmharic ? "ካህን" : "Priest",
                "text": isAmharic
                    ? "ሁሉን የምትችል አምላክ ሆይ፤ ቅዱስ ወንጌልህን በሚገባ ለማሰማት እንድችል፤ ልቤንና ከንፈሮቼን ንጹሕ አድርጋቸው"
                    : "Cleanse my heart and my lips, almighty God, that I may worthily proclaim your holy Gospel."
              },
            ]
          },
          {
            "title": isAmharic ? "15. ወንጌል" : "15. The Gospel",
            "lines": [
              {
                "type": "rubric",
                "text": isAmharic
                    ? "ካህኑ (ዲያቆኑ)፤ ወንጌል ለማንበብ በቆመበት፤ የኦልታር አገልጋዮች ሻማ ይዘዉ ከካህኑ ጋር አብረዋቸው ይቆማሉ። በዚያም ካህኑ (ዲያቆኑ) እንዲህ ይላል፦"
                    : "The Deacon, or the Priest, then proceeds to the ambo, accompanied, if appropriate, by ministers with incense and candles. There he says:"
              },
              {
                "type": "dialogue",
                "role": isAmharic ? "ካህን / ዲያቆን" : "Priest",
                "text": isAmharic
                    ? "እግዚአብሔር ከናንተ ጋር ይሁን ።"
                    : "The Lord be with you."
              },
              {
                "type": "dialogue",
                "role": isAmharic ? "ሕዝብ" : "People",
                "text": isAmharic ? "ከመንፈስህም ጋር።" : "And with your spirit."
              },
              {
                "type": "dialogue",
                "role": isAmharic ? "ካህን / ዲያቆን" : "Priest",
                "text": isAmharic
                    ? "የጌታችን ኢየሱስ ክርስቶስ ወንጌል፤ ቅዱስ ...እንደጻፈው።"
                    : "A reading from the holy Gospel according to N."
              },
              {
                "type": "rubric",
                "text": isAmharic
                    ? "በተመሳሳይ ጊዜ በመጽሐፉ ላይ እና በግንባሩ፣ በከንፈሮቹና በደረቱ ላይ የመስቀል ምልክት ያደርጋል።"
                    : "and, at the same time, he makes the Sign of the Cross on the book and on his forehead, lips, and breast."
              },
              {
                "type": "dialogue",
                "role": isAmharic ? "ሕዝብ" : "People",
                "text": isAmharic
                    ? "ጌታ ሆይ ምስጋና ላንተ ይሁን።"
                    : "Glory to you, O Lord."
              },
              {
                "type": "rubric",
                "text": isAmharic
                    ? "ከዚያም ዲያቆኑ ወይም ካህኑ መጽሐፉን ያጥናሉ፥ ወንጌሉንም ያውጃሉ።"
                    : "Then the Deacon, or the Priest, incenses the book, if incense is used, and proclaims the Gospel."
              },
            ]
          },
          {
            "title": isAmharic ? "16. የወንጌል ማጠናቀቂያ" : "16. End of the Gospel",
            "lines": [
              {
                "type": "rubric",
                "text": isAmharic
                    ? "የወንጌል ንባብ ሲያልቅ ዲያቆኑ ወይም ካህኑ እንዲህ ብለው ያውጃሉ፦"
                    : "At the end of the Gospel, the Deacon, or the Priest, acclaims:"
              },
              {
                "type": "dialogue",
                "role": isAmharic ? "ካህን / ዲያቆን" : "Priest",
                "text": isAmharic
                    ? "ይህ የክርስቶስ ቃል ነው ።"
                    : "The Gospel of the Lord."
              },
              {
                "type": "dialogue",
                "role": isAmharic ? "ሕዝብ" : "People",
                "text": isAmharic
                    ? "ክርስቶስ ሆይ ምስጋና ላንተ ይሁን ።"
                    : "Praise to you, Lord Jesus Christ."
              },
              {
                "type": "rubric",
                "text": isAmharic
                    ? "ከዚያም መጽሐፉን በጸጥታ እየሳመ እንዲህ ይላል፦"
                    : "Then he kisses the book, saying quietly:"
              },
              {
                "type": "dialogue",
                "role": isAmharic ? "ካህን / ዲያቆን" : "Priest",
                "text": isAmharic
                    ? "በወንጌል ቃላት ኃጢአታችን ይደምሰስ።"
                    : "Through the words of the Gospel may our sins be wiped away."
              },
            ]
          },
          {
            "title": isAmharic ? "17. ስብከት (ትምህርተ ወንጌል)" : "17. The Homily",
            "lines": [
              {
                "type": "rubric",
                "text": isAmharic
                    ? "ቀጥሎም በሰንበት ቀናትና በለሎችም ቀናት በካህን ወይም በዲያቆን የሚሰበከው ስብከት ይቀጥላል።"
                    : "Then follows the Homily, which is to be preached by a Priest or Deacon on all Sundays and Holydays of Obligation; on other days, it is recommended."
              },
            ]
          },
          {
            "title": isAmharic
                ? "ጸሎተ ሃይማኖት ፩"
                : "18. The Niceno-Constantinopolitan Creed",
            "lines": [
              {
                "type": "rubric",
                "text": isAmharic
                    ? "ስብከት ሲያልቅ፣ ጸሎተ ሃይማኖት ይቀጥላል፦"
                    : "At the end of the Homily, the Symbol or Profession of Faith or Creed, when prescribed, is either said or sung:"
              },
              {
                "type": "dialogue",
                "role": isAmharic ? "ሁሉም" : "All",
                "text": isAmharic
                    ? "ሰማይና ምድርን የሚታየውንና የማይታየውን በፈጠረ፡ በአንድ እግዚአብሔር ሁሉን በሚችል ኣብ አምናለሁ ።"
                    : "I believe in one God, the Father almighty, maker of heaven and earth, of all things visible and invisible."
              },
              {
                "type": "dialogue",
                "role": isAmharic ? "ሁሉም" : "All",
                "text": isAmharic
                    ? "በአብ አንድ ልጅ በአንድ ጌታ በኢየሱስ ክርስቶስ ኣምናለሁ - እርሱ ከዘመን ሁሉ በፊት ከአብ ተወለደ • አምላክ ከአምላክ • ብርሃን ከብርሃን • እውነተኛው አምላክ ከእውነተኛው አምላክ ተወለደ እንጂ አልተፈጠረም - በመለኮቱ ከአብ ጋር እኩል ሆኖ ሁሉም በእርሱ ተፈጠረ ስለ ሰው ደኅንነታችንም ከሰማያት ወረደ"
                    : "I believe in one Lord Jesus Christ, the Only Begotten Son of God, born of the Father before all ages. God from God, Light from Light, true God from true God, begotten, not made, consubstantial with the Father; through him all things were made. For us men and for our salvation he came down from heaven,"
              },
              {
                "type": "rubric",
                "text": isAmharic
                    ? "(ከዚህ ቀጥሎ እስከ 'ሰውም ሆነ' ባሉት ቃላት ሁሉም ይሰግዳሉ።)"
                    : "(At the words that follow up to and including 'and became man,' all bow.)"
              },
              {
                "type": "dialogue",
                "role": isAmharic ? "ሁሉም" : "All",
                "text": isAmharic
                    ? "• በመንፈስ ቅዱስ ከድንግል ማርያም ሥጋ ለበሰ ሰውም ሆነ ።"
                    : "and by the Holy Spirit was incarnate of the Virgin Mary, and became man."
              },
              {
                "type": "dialogue",
                "role": isAmharic ? "ሁሉም" : "All",
                "text": isAmharic
                    ? "በጴንጤናዊ ጲላጦስ ገዢነት ስለኛ ብሎ ተሰቀለ ተሰቃየ ሞተ ተቀበረም እንደ መጻሕፍት ቃል በሦስተኛው ቀን ከሙታን ተነሣ • ወደ ሰማይ ወጣ በአብ ቀኝም ተቀመጠ - ሕያዋንንና ሙታንን ሊፈርድ ዳግመኛ በክብር ይመጣል • ለመንግሥቱም ፍጻሜ የለውም።"
                    : "For our sake he was crucified under Pontius Pilate, he suffered death and was buried, and rose again on the third day in accordance with the Scriptures. He ascended into heaven and is seated at the right hand of the Father. He will come again in glory to judge the living and the dead and his kingdom will have no end."
              },
              {
                "type": "dialogue",
                "role": isAmharic ? "ሁሉም" : "All",
                "text": isAmharic
                    ? "ሕይወትን በሚሰጥ አምላክ በሆነው • ከአብና ከወልድ በሚሠርፀው • ከአብና ከወልድ ጋር አብሮ በሚከበረውና በሚወደሰው - በነቢያትም አፍ በተናገረው በመንፈስ ቅዱስ አምናለሁ ።"
                    : "I believe in the Holy Spirit, the Lord, the giver of life, who proceeds from the Father and the Son, who with the Father and the Son is adored and glorified, who has spoken through the prophets."
              },
              {
                "type": "dialogue",
                "role": isAmharic ? "ሁሉም" : "All",
                "text": isAmharic
                    ? "አንዲት ቅድስት እውነተኛ ሐዋርያዊትም በሆነችው በ(ካቶሊካዊት)ቤተ ክርስትያን አምናለሁ ። በሙታን ትንሣኤና በሚመጣው ዓለም ሕይወት ተስፋ አደርጋለሁ ። አሜን ።"
                    : "I believe in one, holy, catholic and apostolic Church. I confess one baptism for the forgiveness of sins and I look forward to the resurrection of the dead and the life of the world to come. Amen."
              },
            ]
          },
          {
            "title": isAmharic
                ? "ጸሎተ ሃይማኖት ፪"
                : "19. The Apostles' Creed (Alternative)",
            "lines": [
              {
                "type": "rubric",
                "text": isAmharic
                    ? "በኒቂያ፡ቁስጥንጥንያ ጸሎተ ሃይማኖት ፈንታ፣ በተለይም በጾም እና በፋሲካ ወቅት፣ የሮማን ካቶሊክ ቤተ ክርስቲያን የእምነት መግለጫ የሆነው የሚከተለዉን የሐዋርያት ጸሎተ ሃይማኖት መጠቀም ይችላል።"
                    : "Instead of the Niceno-Constantinopolitan Creed, especially during Lent and Easter time, the baptismal Symbol of the Roman Church, known as the Apostles' Creed, may be used."
              },
              {
                "type": "dialogue",
                "role": isAmharic ? "ሁሉም" : "All",
                "text": isAmharic
                    ? "ሁሉን በሚችል ሰማይንና ምድርን በፈጠረ - በእግዚአብሔር አብ አምናለሁ ። የእብ አንድ ልጅ በሆነው በጌታችን በኢየሱስ ክርስቶስ አምናለሁ"
                    : "I believe in God, the Father almighty, Creator of heaven and earth, and in Jesus Christ, his only Son, our Lord,"
              },
              {
                "type": "rubric",
                "text": isAmharic
                    ? "(ከዚህ ቀጥሎ 'ከቅድስት ድንግል ማርያም ተወለደ' እስከሚለዉ ድረስ ሁሉም ይሰግዳሉ።)"
                    : "(At the words that follow, up to and including 'the Virgin Mary,' all bow.)"
              },
              {
                "type": "dialogue",
                "role": isAmharic ? "ሁሉም" : "All",
                "text": isAmharic
                    ? "– እርሱ በመንፈስ ቅዱስ ተጸንሶ ከቅድስት ድንግል ማርያም ተወለደ – በጴንጤናዊው ጲላጦስ ገዢነት ተሰቃየ ተሰቀለ ሞተ ተቀበረም • ወደ ሲኦልም ወረደ – በሶስተኛው ቀንም ከሙታን ተለይቶ ተነሣ ወደ ሰማይ ወጣ • ሁሉን በሚችል በእግዚአብሔር አብ ቀኝም ተቀመጠ – ያሉትንና የሞቱትን ሊፈርድ ይመጣል ።"
                    : "who was conceived by the Holy Spirit, born of the Virgin Mary, suffered under Pontius Pilate, was crucified, died and was buried; he descended into hell; on the third day he rose again from the dead; he ascended into heaven, and is seated at the right hand of God the Father almighty; from there he will come to judge the living and the dead."
              },
              {
                "type": "dialogue",
                "role": isAmharic ? "ሁሉም" : "All",
                "text": isAmharic
                    ? "በመንፈስ ቅዱስ አምናለሁ ። ቅድስትና እውነተኛ በሆነችው በ(ካቶሊካዊት)ቤተ ክርስቲያን • በቅዱሳንም አንድነት አምናለሁ ። በኃጢአት ሥርየት በሙታን ትንሣኤ • በዘላለም ሕይወትም አምናለሁ። አሜን ።"
                    : "I believe in the Holy Spirit, the holy catholic Church, the communion of saints, the forgiveness of sins, the resurrection of the body, and life everlasting. Amen."
              },
            ]
          },
          {
            "title": isAmharic
                ? "20. የሕዝብ ጸሎት (አጠቃላይ ጸሎት)"
                : "20. The Universal Prayer",
            "lines": [
              {
                "type": "rubric",
                "text": isAmharic
                    ? "ቀጥሎም የሕዝብ ጸሎት (ወይም የምልጃ ጸሎት) ይቀጥላል።"
                    : "Then follows the Universal Prayer, that is, the Prayer of the Faithful or Bidding Prayers."
              },
            ]
          },
        ],
      },
      {
        "en": l10n.liturgyOfTheEucharistEn,
        "am": l10n.liturgyOfTheEucharistAm,
        "desc": l10n.liturgyOfTheEucharistDesc,
        "image": "assets/bread and wine.jpg",
        "content": [
          {
            "title": isAmharic ? "21–22. የመሠዊያና የስጦታዎች ዝግጅት" : "21–22. Preparation of the Altar and Gifts",
            "lines": [
              {
                "type": "rubric",
                "text": isAmharic
                    ? "ይህ ሁሉ ከተደረገ በኋላ የመባ መዝሙር ይጀመራል። በዚህ መሀል አገልጋዮች ለቅዱስ ቁርባን ስርዓት የሚያገለግሉ ንዋየ ቅድሳትን (መዘርጊያውን (ኮርፖራል)፣ ክደን፤ ዓውደ ነቅዕ፤ ንዋየ ላህም፤ ሣህን፤ ጽዋውን፣ መሸፈኛውን፤ የቅዳሴ መጽሐፍን... ) በመሠዊያው ላይ ያስቀምጣሉ።"
                    : "When all this has been done, the Offertory Chant begins. Meanwhile, the ministers place the corporal, the purificator, the chalice, the pall, and the Missal on the altar."
              },
              {
                "type": "rubric",
                "text": isAmharic
                    ? "ለቅዳሴ አገልግሎት የሚሆን እንጀራና (ህብስት) ወይን ጠጅ፤ እንዲሁም ለቤተ ክርስቲያን እና ለድሆች ፍላጎት የሚረዱ ሌሎች ስጦታዎችን(የመስዋዕት ሳንቲም)፤ ስዕለትም በማቅረብ ሕዝቡ ይሳተፋል።"
                    : "It is desirable that the faithful express their participation by making an offering, bringing forward bread and wine for the celebration of the Eucharist and perhaps other gifts to relieve the needs of the Church and of the poor."
              },
            ]
          },
          {
            "title": isAmharic ? "28.5. መሥዋዕትን የማቅረብ ጸሎትና ምላሽ" : "28.5. Prayer Over the Offerings",
            "lines": [
              {
                "type": "rubric",
                "text": isAmharic
                    ? "ካህኑ ሕዝቡን እንዲህ ሲል ይጋብዛል፦"
                    : "The Priest invites the faithful, saying:"
              },
              {
                "type": "dialogue",
                "role": isAmharic ? "ካህን" : "Priest",
                "text": isAmharic
                    ? "ወንድሞቼ(እና እህቶቼ) ሆይ የኔና የናንተ መሥዋዕት ሁሉን ለሚችል ለእግዚኣብሔር አብ ደስ እንዲያሰኝ ጸልዩ።"
                    : "Pray, brethren, that my sacrifice and yours may be acceptable to God, the almighty Father."
              },
              {
                "type": "dialogue",
                "role": isAmharic ? "ሕዝብ" : "People",
                "text": isAmharic
                    ? "ስለ ስሙ ክብርና ምስጋና፤ ስለ መላው ሕዝበ ክርስቲያንም ደኅንነት፤ እግዚአብሔር ይህንን መስዋዕት ከእጅህ ይቀበል።"
                    : "May the Lord accept the sacrifice at your hands for the praise and glory of his name, for our good and the good of all his holy Church."
              },
              {
                "type": "rubric",
                "text": isAmharic
                    ? "ከዚያም ካህኑ በመባዎቹ ላይ ጸሎቱን ያደርሳል።"
                    : "Then the Priest says the prayer over the offerings. The people rise, if they were seated."
              },
            ]
          },

          {
            "title": isAmharic ? "29. የአኰቴተ ቍርባን ውይይት (የፕሬፋስ ውይይት)" : "29. The Preface Dialogue",
            "lines": [
              {
                "type": "rubric",
                "text": isAmharic
                    ? "የእግዚአብሔር ሕዝብ ከካህኑ ጋር በመሆን የኢንካሪስቱን (የቁርባን) ታላቅ ምሥጢር ለማክበር ሕዝቡም ከተቀመጡበት ይነሣሉ። ራሳቸውንም ያዘጋጃሉ፦"
                    : "The Priest begins the Eucharistic Prayer, lifting up the hearts of the faithful to the Lord in prayer and thanksgiving."
              },
              {
                "type": "dialogue",
                "role": isAmharic ? "ካህን" : "Priest",
                "text": isAmharic ? "እግዚአብሔር ከእናንተ ጋር ይሁን።" : "The Lord be with you."
              },
              {
                "type": "dialogue",
                "role": isAmharic ? "ሕዝብ" : "People",
                "text": isAmharic ? "ከመንፈስህም ጋር።" : "And with your spirit."
              },
              {
                "type": "dialogue",
                "role": isAmharic ? "ካህን" : "Priest",
                "text": isAmharic ? "መንፈሳችንን ከፍ እናደርግ።" : "Lift up your hearts."
              },
              {
                "type": "dialogue",
                "role": isAmharic ? "ሕዝብ" : "People",
                "text": isAmharic ? "መንፈሳችን በእግዚአብሔር ዘንድ ነው።" : "We have lifted them up to the Lord."
              },
              {
                "type": "dialogue",
                "role": isAmharic ? "ካህን" : "Priest",
                "text": isAmharic ? "ለጌታ ለአምላካችን ምስጋናን እናቅርብ።" : "Let us give thanks to the Lord our God."
              },
              {
                "type": "dialogue",
                "role": isAmharic ? "ሕዝብ" : "People",
                "text": isAmharic ? "ተገቢና ትክክለኛ ነው።" : "It is right and just."
              },
            ]
          },
          {
            "title": isAmharic ? "30. የአኰቴተ ቍርባን መቅደም (ፕሬፋስ)" : "30. The Preface",
            "lines": [
              {
                "type": "rubric",
                "text": isAmharic
                    ? "ካህኑ እጆቹን ዘርግቶ የምስጋና ጸሎቱን ይቀጥላል፦"
                    : "The Priest, with hands extended, continues the Preface:"
              },
              {
                "type": "dialogue",
                "role": isAmharic ? "ካህን" : "Priest",
                "text": isAmharic
                    ? "እግዚኣብሔር ቅዱስ አባት ሁሉን የምትችል ዘለዓለማዊ ኣምላክ ሆይ ሁሉ ጊዜ በሁሉ ስፍራ አንተን ማመስገን በእውነት ተገቢና አስፈላጊ ነዉ። ኣንተ በደግነትህ ሰውን ፈጥረሃል፤ በሚገባ የተፈረደበትንም በጌታችን በኢየሱስ ክርስቶስ አድነሃልና ። በርሱ ስም መላእክት ግርማህን ያመሰግናሉ፤ ሊቃነ መላእክት ይሰግዱልሃል ፡ ሥልጣናት በፍርሃት ያከብሩሃል ፡ የሰማይ ኃይላት ሱራፌልም በደስታ ያመሰግኑሃል። እኛም ድምፃችንን ከነርሱ ጋር አስተባብረን እንዲህ ብለን እንድንወድስህ ፍቀድልን ።"
                    : "It is truly right and just, our duty and our salvation, always and everywhere to give you thanks, Lord, holy Father, almighty and eternal God. For in your goodness you created man, and when he was justly condemned, you redeemed him through our Lord Jesus Christ. Through him the Angels praise your Majesty, the Dominions adore and the Powers tremble before you. Heaven and the Virtues of heaven and the blessed Seraphim worship together with exultation. May our voices, we pray, join with theirs in humble praise, as we acclaim:"
              }
            ]
          },
          {
            "title": isAmharic ? "31. ቅዱስ፤ ቅዱስ፤ ቅዱስ (ሳንክቱስ)" : "31. The Sanctus",
            "lines": [
              {
                "type": "rubric",
                "text": isAmharic
                    ? "ካህኑ ከሕዝቡ ጋር በመሆን ይህንን የሰማይ መዝሙር በኅብረት ይዘምራሉ፦"
                    : "The Priest joins with the people in singing or saying the Sanctus:"
              },
              {
                "type": "dialogue",
                "role": isAmharic ? "ሁሉም" : "All",
                "text": isAmharic
                    ? "ቅዱስ ቅዱስ ቅዱስ እግዚአብሔር የሠራዊት ጌታ፤ ሰማያትና ምድር በክብርህ የተሞሉ ናቸው። ሆሣዕና በሰማያት፤ በእግዚአብሔር ስም የሚመጣ የተባረከ ነው። ሆሣዕና በሰማያት ።"
                    : "Holy, Holy, Holy Lord God of hosts. Heaven and earth are full of your glory. Hosanna in the highest. Blessed is he who comes in the name of the Lord. Hosanna in the highest."
              },
            ]
          },
          {
            "title": isAmharic ? "23. የእንጀራ (የህብስት) ማቅረቢያ" : "23. Offering of the Bread",
            "lines": [
              {
                "type": "rubric",
                "text": isAmharic
                    ? "ቅዱስ ቅዱስ ከተዘመረ በኋላ ሁሉም ሕዝብ ይንበረከካል:: ካህኑ በመሠዊያው ቆሞ ህብስቱን የያዘውን ሰሃን (ፓተን) ወስዶ በሁለቱ እጆቹ ከመሠዊያው በላይ ከፍ አድርጎ በለስላሳ ድምፅ ይላል፦"
                    : "The Priest, standing at the altar, takes the paten with the bread and holds it slightly raised above the altar with both hands, saying in a low voice:"
              },
              {
                "type": "dialogue",
                "role": isAmharic ? "ካህን" : "Priest",
                "text": isAmharic
                    ? "ሁሉን የፈጠርህ አምላክ እግዚአብሔር ሆይ፥ አንተን ክብር ይገባሃል። ከቸርነትህ የተነሣ ያቀረብነውን ይህን ህብስት ተቀብለናልና፤ እርሱም የምድር ፍሬ እና የሰው እጅ ሥራ ነው፥ የሕይወትም እንጀራ ይሆንልናል።"
                    : "Blessed are you, Lord God of all creation, for through your goodness we have received the bread we offer you: fruit of the earth and work of human hands, it will become for us the bread of life."
              },
              {
                "type": "rubric",
                "text": isAmharic
                    ? "ከዚያም ህብስቱ ያለበትን ሰሃን በመዘርጊያው (ኮርፖራል) ላይ ያስቀምጠዋል።"
                    : "Then he places the paten with the bread on the corporal."
              },
              {
                "type": "rubric",
                "text": isAmharic
                    ? "የመባ መዝሙር ካልተዘመረ ካህኑ እነዚህን ቃላት ድምፁን ከፍ አድርጎ ማለት ይችላል፤ በማጠናቀቂያውም ሕዝቡ እንዲህ ብሎ ይቀበላል፦"
                    : "If the Offertory Chant is not sung, the Priest may speak these words aloud; at the end, the people may acclaim:"
              },
              {
                "type": "dialogue",
                "role": isAmharic ? "ሕዝብ" : "People",
                "text": isAmharic ? "እግዚአብሔር ለዘላለም የተባረከ ይሁን።" : "Blessed be God for ever."
              },
            ]
          },
          {
            "title": isAmharic ? "24. የውሃና የወይን ጠጅ መቀላቀል" : "24. Mingling of Water and Wine",
            "lines": [
              {
                "type": "rubric",
                "text": isAmharic
                    ? "ዲያቆኑ ወይም ካህኑ ወይን ጠጅና ጥቂት ውሃ ወደ ጽዋው እየቀላቀሉ በድብቅ እንዲህ ይላሉ፦"
                    : "The Deacon, or the Priest, pours wine and a little water into the chalice, saying quietly:"
              },
              {
                "type": "dialogue",
                "role": isAmharic ? "ካህን" : "Priest",
                "text": isAmharic
                    ? "በዚህ በውሃና በወይን ጠጅ ምሥጢር፥ ሰብአዊነታችንን ሊካፈል ራሱን ባዋረደው በክርስቶስ መለኮትነት ተካፋዮች እንድንሆን አድርገን።"
                    : "By the mystery of this water and wine may we come to share in the divinity of Christ who humbled himself to share in our humanity."
              },
            ]
          },
          {
            "title": isAmharic ? "25. የመሠዋዕተ ጽዋ (የወይን ጠጅ) ማቅረቢያ" : "25. Offering of the Chalice",
            "lines": [
              {
                "type": "rubric",
                "text": isAmharic
                    ? "ከዚያም ካህኑ ጽዋውን ወስዶ በሁለቱ እጆቹ ከመሠዊያው በላይ ከፍ አድርጎ በለስላሳ ድምፅ ይላል፦"
                    : "The Priest then takes the chalice and holds it slightly raised above the altar with both hands, saying in a low voice:"
              },
              {
                "type": "dialogue",
                "role": isAmharic ? "ካህን" : "Priest",
                "text": isAmharic
                    ? "ሁሉን የፈጠርህ አምላክ እግዚአብሔር ሆይ፥ አንተን ክብር ይገባሃል። ከቸርነትህ የተነሣ ያቀረብነውን ይህን የወይን ጠጅ ተቀብለናልና፤ እርሱም የወይን ፍሬ እና የሰው እጅ ሥራ ነው፥ የመንፈስ መጠጥም ይሆንልናል።"
                    : "Blessed are you, Lord God of all creation, for through your goodness we have received the wine we offer you: fruit of the vine and work of human hands, it will become our spiritual drink."
              },
              {
                "type": "rubric",
                "text": isAmharic
                    ? "ከዚያም ጽዋውን በመዘርጊያው ላይ ያስቀምጠዋል።"
                    : "Then he places the chalice on the corporal."
              },
              {
                "type": "rubric",
                "text": isAmharic
                    ? "የመባ መዝሙር ካልተዘመረ ካህኑ እነዚህን ቃላት ድምፁን ከፍ አድርጎ ማለት ይችላል፤ በማጠናቀቂያውም ሕዝቡ እንዲህ ብሎ ይቀበላል፦"
                    : "If the Offertory Chant is not sung, the Priest may speak these words aloud; at the end, the people may acclaim:"
              },
              {
                "type": "dialogue",
                "role": isAmharic ? "ሕዝብ" : "People",
                "text": isAmharic ? "እግዚአብሔር ለዘላለም የተባረከ ይሁን።" : "Blessed be God for ever."
              },
            ]
          },
          {
            "title": isAmharic ? "26. በትሕትና መንፈስ የሚደረግ ጸሎት" : "26. Prayer in a Humble Spirit",
            "lines": [
              {
                "type": "rubric",
                "text": isAmharic
                    ? "ከዚህ በኋላ ካህኑ ጥልቅ ሰግዶ በድብቅ እንዲህ ይላል፦"
                    : "After this, the Priest, bowing profoundly, says quietly:"
              },
              {
                "type": "dialogue",
                "role": isAmharic ? "ካህን" : "Priest",
                "text": isAmharic
                    ? "አቤቱ፥ በትሕትና መንፈስና በተሰበረ ልብ እንቀበል ዘንድ አንተ ውሰደን፤ ዛሬም በعينህ ፊት የምናቀርበው መሥዋዕት አምላክ እግዚአብሔር ሆይ፥ በእጅጉ ደስ ያሰኝህ።"
                    : "With humble spirit and contrite heart may we be accepted by you, O Lord, and may our sacrifice in your sight this day be pleasing to you, Lord God."
              },
            ]
          },
          {
            "title": isAmharic ? "27. ዕጣን ማጠን" : "27. Incensation",
            "lines": [
              {
                "type": "rubric",
                "text": isAmharic
                    ? "ከተቻለ መባውን፣ መስቀሉንና መሠዊያውን ያጠናል። ከዚያም ዲያቆኑ ወይም ሌላ አገልጋይ ካህኑንና ሕዝቡን ያጥናል።"
                    : "If appropriate, he also incenses the offerings, the cross, and the altar. A Deacon or other minister then incenses the Priest and the people."
              },
            ]
          },
          {
            "title": isAmharic ? "28. እጅ መታጠብ" : "28. Washing of Hands",
            "lines": [
              {
                "type": "rubric",
                "text": isAmharic
                    ? "ቀጥሎም ካህኑ በመሠዊያው ጎን ቆሞ እጆቹን እየታጠበ በድብቅ እንዲህ ይላል፦"
                    : "Then the Priest, standing at the side of the altar, washes his hands, saying quietly:"
              },
              {
                "type": "dialogue",
                "role": isAmharic ? "ካህን" : "Priest",
                "text": isAmharic
                    ? "አቤቱ፥ ከእኩይ ሥራዬ አጥበኝ፥ ከኃጢአቴም አንጻኝ።"
                    : "Wash me, O Lord, from my iniquity and cleanse me from my sin."
              },
            ]
          },
          {
            "title": "29. Invitation to Prayer",
            "lines": [
              {
                "type": "rubric",
                "text": "Standing at the middle of the altar, facing the people, extending and then joining his hands, he says:"
              },
              {
                "type": "dialogue",
                "role": "Priest",
                "text": "Pray, brethren (brothers and sisters), that my sacrifice and yours may be acceptable to God, the almighty Father."
              },
              {
                "type": "rubric",
                "text": "The people rise and reply:"
              },
              {
                "type": "dialogue",
                "role": "People",
                "text": "May the Lord accept the sacrifice at your hands for the praise and glory of his name, for our good and the good of all his holy Church."
              },
            ]
          },
          {
            "title": "30. Prayer over the Offerings",
            "lines": [
              {
                "type": "rubric",
                "text": "Then the Priest, with hands extended, says the Prayer over the Offerings, at the end of which the people acclaim:"
              },
              {
                "type": "dialogue",
                "role": "People",
                "text": "Amen."
              },
            ]
          },

          {
            "title": "32. The Eucharistic Prayer",
            "lines": [
              {
                "type": "rubric",
                "text": "In all Masses, the Priest celebrant is permitted to sing parts of the Eucharistic Prayer, especially the principal parts."
              },
              {
                "type": "rubric",
                "text": "In Eucharistic Prayer I, the Roman Canon, the words included in brackets may be omitted."
              },
            ]
          },
        ],
      },
      {
        "en": l10n.communionRiteEn,
        "am": l10n.communionRiteAm,
        "desc": l10n.communionRiteDesc,
        "image": "assets/holy communion given.jpg",
        "content": [
          {
            "title": "124. The Lord's Prayer",
            "lines": [
              {
                "type": "rubric",
                "text": "After the chalice and paten have been set down, the Priest, with hands joined, says:"
              },
              {
                "type": "dialogue",
                "role": "Priest",
                "text": "At the Savior's command and formed by divine teaching, we dare to say:"
              },
              {
                "type": "rubric",
                "text": "He extends his hands and, together with the people, continues:"
              },
              {
                "type": "dialogue",
                "role": "All",
                "text": "Our Father, who art in heaven, hallowed be thy name; thy kingdom come, thy will be done on earth as it is in heaven. Give us this day our daily bread, and forgive us our trespasses, as we forgive those who trespass against us; and lead us not into temptation, but deliver us from evil."
              },
            ]
          },
          {
            "title": "125. Embolism",
            "lines": [
              {
                "type": "rubric",
                "text": "With hands extended, the Priest alone continues, saying:"
              },
              {
                "type": "dialogue",
                "role": "Priest",
                "text": "Deliver us, Lord, we pray, from every evil, graciously grant peace in our days, that, by the help of your mercy, we may be always free from sin and safe from all distress, as we await the blessed hope and the coming of our Savior, Jesus Christ."
              },
              {
                "type": "rubric",
                "text": "He joins his hands. The people conclude the prayer, acclaiming:"
              },
              {
                "type": "dialogue",
                "role": "People",
                "text": "For the kingdom, the power and the glory are yours now and for ever."
              },
            ]
          },
          {
            "title": "126–127. Prayer and Sign of Peace",
            "lines": [
              {
                "type": "rubric",
                "text": "Then the Priest, with hands extended, says aloud:"
              },
              {
                "type": "dialogue",
                "role": "Priest",
                "text": "Lord Jesus Christ, who said to your Apostles: Peace I leave you, my peace I give you; look not on our sins, but on the faith of your Church, and graciously grant her peace and unity in accordance with your will."
              },
              {
                "type": "rubric",
                "text": "He joins his hands."
              },
              {
                "type": "dialogue",
                "role": "Priest",
                "text": "Who live and reign for ever and ever."
              },
              {
                "type": "dialogue",
                "role": "People",
                "text": "Amen."
              },
              {
                "type": "rubric",
                "text": "The Priest, turned towards the people, extending and then joining his hands, adds:"
              },
              {
                "type": "dialogue",
                "role": "Priest",
                "text": "The peace of the Lord be with you always."
              },
              {
                "type": "dialogue",
                "role": "People",
                "text": "And with your spirit."
              },
            ]
          },
          {
            "title": "128. Sign of Peace",
            "lines": [
              {
                "type": "rubric",
                "text": "Then, if appropriate, the Deacon, or the Priest, adds:"
              },
              {
                "type": "dialogue",
                "role": "Priest",
                "text": "Let us offer each other the sign of peace."
              },
              {
                "type": "rubric",
                "text": "And all offer one another a sign, in keeping with local customs, that expresses peace, communion, and charity. The Priest gives the sign of peace to a Deacon or minister."
              },
            ]
          },
          {
            "title": "129–130. Fraction and Lamb of God",
            "lines": [
              {
                "type": "rubric",
                "text": "Then he takes the Host, breaks it over the paten, and places a small piece in the chalice, saying quietly:"
              },
              {
                "type": "dialogue",
                "role": "Priest",
                "text": "May this mingling of the Body and Blood of our Lord Jesus Christ bring eternal life to us who receive it."
              },
              {
                "type": "rubric",
                "text": "Meanwhile the following is sung or said:"
              },
              {
                "type": "dialogue",
                "role": "All",
                "text": "Lamb of God, you take away the sins of the world, have mercy on us."
              },
              {
                "type": "dialogue",
                "role": "All",
                "text": "Lamb of God, you take away the sins of the world, have mercy on us."
              },
              {
                "type": "dialogue",
                "role": "All",
                "text": "Lamb of God, you take away the sins of the world, grant us peace."
              },
              {
                "type": "rubric",
                "text": "The invocation may be repeated several times if the fraction is prolonged. Only the final time, however, is 'grant us peace' said."
              },
            ]
          },
          {
            "title": "131. Private Preparation of the Priest",
            "lines": [
              {
                "type": "rubric",
                "text": "Then the Priest, with hands joined, says quietly:"
              },
              {
                "type": "dialogue",
                "role": "Priest",
                "text": "Lord Jesus Christ, Son of the living God, who, by the will of the Father and the work of the Holy Spirit, through your Death gave life to the world, free me by this, your most holy Body and Blood, from all my sins and from every evil; keep me always faithful to your commandments, and never let me be parted from you."
              },
              {
                "type": "rubric",
                "text": "Or:"
              },
              {
                "type": "dialogue",
                "role": "Priest",
                "text": "May the receiving of your Body and Blood, Lord Jesus Christ, not bring me to judgment and condemnation, but through your loving mercy be for me protection in mind and body and a healing remedy."
              },
            ]
          },
          {
            "title": "132. Invitation to Communion",
            "lines": [
              {
                "type": "rubric",
                "text": "The Priest genuflects, takes the host and, holding it slightly raised above the paten or above the chalice, while facing the people, says aloud:"
              },
              {
                "type": "dialogue",
                "role": "Priest",
                "text": "Behold the Lamb of God, behold him who takes away the sins of the world. Blessed are those called to the supper of the Lamb."
              },
              {
                "type": "rubric",
                "text": "And together with the people he adds once:"
              },
              {
                "type": "dialogue",
                "role": "All",
                "text": "Lord, I am not worthy that you should enter under my roof, but only say the word and my soul shall be healed."
              },
            ]
          },
          {
            "title": "133. Communion of the Priest",
            "lines": [
              {
                "type": "rubric",
                "text": "The Priest, facing the altar, says quietly:"
              },
              {
                "type": "dialogue",
                "role": "Priest",
                "text": "May the Body of Christ keep me safe for eternal life."
              },
              {
                "type": "rubric",
                "text": "And he reverently consumes the Body of Christ. Then he takes the chalice and says quietly:"
              },
              {
                "type": "dialogue",
                "role": "Priest",
                "text": "May the Blood of Christ keep me safe for eternal life."
              },
              {
                "type": "rubric",
                "text": "And he reverently consumes the Blood of Christ."
              },
            ]
          },
          {
            "title": "134. Communion of the Faithful",
            "lines": [
              {
                "type": "rubric",
                "text": "After this, he takes the paten or ciborium and approaches the communicants. The Priest raises a host slightly and shows it to each of the communicants, saying:"
              },
              {
                "type": "dialogue",
                "role": "Priest",
                "text": "The Body of Christ."
              },
              {
                "type": "dialogue",
                "role": "People",
                "text": "Amen."
              },
              {
                "type": "rubric",
                "text": "and receives Holy Communion. If a Deacon also distributes Holy Communion, he does so in the same manner."
              },
            ]
          },
          {
            "title": "136–137. Communion Chant and Purification",
            "lines": [
              {
                "type": "rubric",
                "text": "While the Priest is receiving the Body of Christ, the Communion Chant begins."
              },
              {
                "type": "rubric",
                "text": "When the distribution of Communion is over, the Priest or a Deacon or an acolyte purifies the paten over the chalice and also the chalice itself."
              },
              {
                "type": "rubric",
                "text": "While he carries out the purification, the Priest says quietly:"
              },
              {
                "type": "dialogue",
                "role": "Priest",
                "text": "What has passed our lips as food, O Lord, may we possess in purity of heart, that what has been given to us in time may be our healing for eternity."
              },
            ]
          },
          {
            "title": "138–139. Silence and Prayer after Communion",
            "lines": [
              {
                "type": "rubric",
                "text": "Then the Priest may return to the chair. If appropriate, a sacred silence may be observed for a while, or a psalm or other canticle of praise or a hymn may be sung."
              },
              {
                "type": "rubric",
                "text": "Then, standing at the altar or at the chair and facing the people, with hands joined, the Priest says:"
              },
              {
                "type": "dialogue",
                "role": "Priest",
                "text": "Let us pray."
              },
              {
                "type": "rubric",
                "text": "All pray in silence with the Priest for a while, unless silence has just been observed. Then the Priest, with hands extended, says the Prayer after Communion, at the end of which the people acclaim:"
              },
              {
                "type": "dialogue",
                "role": "People",
                "text": "Amen."
              },
            ]
          },
        ],
      },
      {
        "en": l10n.concludingRitesEn,
        "am": l10n.concludingRitesAm,
        "desc": l10n.concludingRitesDesc,
        "image": "assets/priest blessing.jpeg",
        "content": [
          {
            "title": "140. Announcements",
            "lines": [
              {
                "type": "rubric",
                "text": "If they are necessary, any brief announcements to the people follow here."
              },
            ]
          },
          {
            "title": "141. The Dismissal and Blessing",
            "lines": [
              {
                "type": "rubric",
                "text": "Then the dismissal takes place. The Priest, facing the people and extending his hands, says:"
              },
              {
                "type": "dialogue",
                "role": "Priest",
                "text": "The Lord be with you."
              },
              {
                "type": "dialogue",
                "role": "People",
                "text": "And with your spirit."
              },
              {
                "type": "rubric",
                "text": "The Priest blesses the people, saying:"
              },
              {
                "type": "dialogue",
                "role": "Priest",
                "text": "May almighty God bless you, the Father, and the Son, + and the Holy Spirit."
              },
              {
                "type": "dialogue",
                "role": "People",
                "text": "Amen."
              },
            ]
          },
          {
            "title": "142. Solemn Formula (Optional)",
            "lines": [
              {
                "type": "rubric",
                "text": "On certain days or occasions, this formula of blessing is preceded, in accordance with the rubrics, by another more solemn formula of blessing or by a prayer over the people."
              },
            ]
          },
          {
            "title": "144. Words of Dismissal",
            "lines": [
              {
                "type": "rubric",
                "text": "Then the Deacon, or the Priest himself, with hands joined and facing the people, says:"
              },
              {
                "type": "dialogue",
                "role": "Priest",
                "text": "Go forth, the Mass is ended."
              },
              {
                "type": "rubric",
                "text": "Or:"
              },
              {
                "type": "dialogue",
                "role": "Priest",
                "text": "Go and announce the Gospel of the Lord."
              },
              {
                "type": "rubric",
                "text": "Or:"
              },
              {
                "type": "dialogue",
                "role": "Priest",
                "text": "Go in peace, glorifying the Lord by your life."
              },
              {
                "type": "rubric",
                "text": "Or:"
              },
              {
                "type": "dialogue",
                "role": "Priest",
                "text": "Go in peace."
              },
              {
                "type": "dialogue",
                "role": "People",
                "text": "Thanks be to God."
              },
            ]
          },
          {
            "title": "145. Veneration of the Altar",
            "lines": [
              {
                "type": "rubric",
                "text": "Then the Priest venerates the altar as usual with a kiss, as at the beginning. After making a profound bow with the ministers, he withdraws."
              },
            ]
          },
          {
            "title": "146. Note",
            "lines": [
              {
                "type": "rubric",
                "text": "If any liturgical action follows immediately, the rites of dismissal are omitted."
              },
            ]
          },
        ],
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = AppLocalizations.of(context)!;

    return DefaultTabController(
      length: 2,
      initialIndex: widget.initialTabIndex,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 68,
          titleSpacing: 20,
          title: Text(
            l10n.holyMass,
            style: const TextStyle(
              fontFamily: 'Georgia',
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 1.2,
            ),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(52),
            child: Container(
              color: colorScheme.surface,
              child: TabBar(
                indicatorColor: colorScheme.secondary,
                indicatorWeight: 3.5,
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: colorScheme.primary,
                unselectedLabelColor: colorScheme.onSurfaceVariant,
                labelStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
                unselectedLabelStyle: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
                tabs: [
                  Tab(
                    icon: const Icon(Icons.calendar_today_rounded, size: 20),
                    text: l10n.dailyReadings,
                  ),
                  Tab(
                    icon: const Icon(Icons.auto_stories_rounded, size: 20),
                    text: l10n.orderOfMass,
                  ),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            _buildReadingsTab(context),
            _buildOrderOfMassTab(context),
          ],
        ),
      ),
    );
  }

  Widget _buildReadingsTab(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = AppLocalizations.of(context)!;

    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(16.0),
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                colorScheme.primary,
                Color.lerp(colorScheme.primary, Colors.black, 0.3)!,
              ],
            ),
            border: Border.all(
              color: colorScheme.secondary.withAlpha(100),
              width: 1.2,
            ),
            boxShadow: [
              BoxShadow(
                color: colorScheme.primary.withAlpha(60),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DailyReadingsScreen(),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: colorScheme.secondary.withAlpha(40),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.auto_stories_rounded,
                            color: colorScheme.secondary,
                            size: 26,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                l10n.dailyLiturgy,
                                style: TextStyle(
                                  color: colorScheme.secondary,
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.5,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                l10n.todaysMassReadings,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.white70,
                          size: 16,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      l10n.dailyLiturgyDescription,
                      style: TextStyle(
                        color: Colors.white.withAlpha(220),
                        fontSize: 13.5,
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 18),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: colorScheme.secondary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.menu_book_rounded,
                            size: 16,
                            color: colorScheme.onSecondary,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            l10n.openFullReader,
                            style: TextStyle(
                              color: colorScheme.onSecondary,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            Container(
              width: 3,
              height: 16,
              color: colorScheme.secondary,
            ),
            const SizedBox(width: 8),
            Text(
              l10n.quickNavigation,
              style: TextStyle(
                color: colorScheme.onSurfaceVariant,
                fontSize: 12,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _buildQuickTile(
                context,
                title: l10n.gospelReading,
                subtitle: l10n.todaysGoodNews,
                icon: Icons.menu_book_outlined,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DailyReadingsScreen(
                        scrollToGospel: true,
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildQuickTile(
                context,
                title: l10n.liturgicalCalendar,
                subtitle: l10n.feastsAndSeasons,
                icon: Icons.calendar_month_outlined,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DailyReadingsScreen(
                        openCalendarOnLaunch: true,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildQuickTile(
      BuildContext context, {
        required String title,
        required String subtitle,
        required IconData icon,
        required VoidCallback onTap,
      }) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: theme.colorScheme.outlineVariant.withAlpha(120),
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  icon,
                  color: theme.colorScheme.primary,
                  size: 24,
                ),
                const SizedBox(height: 12),
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 11,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOrderOfMassTab(BuildContext context) {
    final theme = Theme.of(context);
    final massSections = _getMassSections(context);

    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: massSections.length,
      itemBuilder: (context, index) {
        final item = massSections[index];
        return Card(
          elevation: 0,
          color: theme.colorScheme.surfaceContainerHigh,
          margin: const EdgeInsets.only(bottom: 12.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: theme.colorScheme.primary.withAlpha(38)),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            leading: CircleAvatar(
              backgroundColor: theme.colorScheme.primary,
              foregroundColor: theme.colorScheme.onPrimary,
              child: Text(
                "${index + 1}",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            title: Text(
              item["en"] as String,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.onSurface,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item["am"] as String,
                  style: TextStyle(
                    color: theme.colorScheme.secondary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  item["desc"] as String,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
            trailing: Icon(
              Icons.chevron_right_rounded,
              color: theme.colorScheme.primary,
            ),
            onTap: () => _openSectionDetail(context, item),
          ),
        );
      },
    );
  }

  void _openSectionDetail(BuildContext context, Map<String, dynamic> section) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OrderDetailScreen(section: section),
      ),
    );
  }
}

class OrderDetailScreen extends StatelessWidget {
  final Map<String, dynamic> section;

  const OrderDetailScreen({super.key, required this.section});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final List<Map<String, dynamic>> content =
    List<Map<String, dynamic>>.from(section["content"]);

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              section["image"] as String,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                color: theme.colorScheme.primary,
              ),
            ),
          ),
          Positioned.fill(
            child: Container(
              color: Colors.black.withAlpha(209),
            ),
          ),
          SafeArea(
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  iconTheme: const IconThemeData(color: Colors.white),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        section["en"] as String,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        section["am"] as String,
                        style: TextStyle(
                          color: theme.colorScheme.secondary,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.all(16.0),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                          (context, index) {
                        final item = content[index];
                        return Container(
                          margin: const EdgeInsets.only(bottom: 16.0),
                          padding: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            color: Colors.white.withAlpha(20),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors.white.withAlpha(38),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item["title"] as String,
                                style: TextStyle(
                                  color: theme.colorScheme.secondary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                              ),
                              const Divider(
                                color: Colors.white24,
                                height: 20,
                              ),
                              _buildFormattedDialogue(
                                context,
                                item["lines"] as List<dynamic>,
                              ),
                            ],
                          ),
                        );
                      },
                      childCount: content.length,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFormattedDialogue(
      BuildContext context, List<dynamic> rawLines) {
    final theme = Theme.of(context);
    final goldColor = theme.colorScheme.secondary;
    final lines = List<Map<String, dynamic>>.from(rawLines);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: lines.map((line) {
        final isRubric = line["type"] == "rubric";
        final role = line["role"] as String?;
        final text = line["text"] as String? ?? "";

        if (isRubric) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white70,
                fontStyle: FontStyle.italic,
                fontSize: 14.0,
                height: 1.4,
              ),
            ),
          );
        }

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 3.0),
          child: Text.rich(
            TextSpan(
              children: [
                if (role != null && role.isNotEmpty)
                  TextSpan(
                    text: '$role: ',
                    style: TextStyle(
                      color: goldColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.5,
                    ),
                  ),
                TextSpan(
                  text: text,
                  style: TextStyle(
                    color: goldColor,
                    fontSize: 15.0,
                    height: 1.45,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}