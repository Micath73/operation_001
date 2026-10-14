import 'package:flutter/material.dart';
import 'package:operation_001/controllers/language_controller.dart';
import 'package:operation_001/prayer_completion_screen.dart';
import 'package:operation_001/prayer_model.dart';

class RosaryConclusionScreen extends StatefulWidget {
  final String? bgImagePath;
  const RosaryConclusionScreen({super.key, this.bgImagePath});

  @override
  State<RosaryConclusionScreen> createState() =>
      _RosaryConclusionScreenState();
}

class _RosaryConclusionScreenState extends State<RosaryConclusionScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  double _textScale = 1.0; // Font size scale factor

  final List<PrayerStep> _conclusionPrayers = [
    PrayerStep(
      sectionHeader: 'SALVE REGINA',
      sectionHeaderAm: 'የምህረት እናት ንግስት ሆይ',
      titleEn: 'Hail Holy Queen',
      titleAm: 'የምህረት እናት ንግስት ሆይ',
      contentEn:
      'Hail, Holy Queen, Mother of Mercy,\nour life, our sweetness, and our hope.\nTo you do we cry, poor banished children of Eve.\nTo you do we send up our sighs,\nmourning and weeping in this valley of tears.\n\nTurn then, most gracious Advocate, your eyes of mercy toward us.\nAnd after this our exile,\nshow unto us the blessed fruit of your womb, Jesus.\nO clement, O loving, O sweet Virgin Mary.\nAmen.',
      contentAm:
      'ሰላም ላንቺ ይሁን ሕይወታችን፥ ደስታችን፥ ተስፋችን ሆይ፥ ሰላም ላንቺ ይሁን።\nእኛ የሔዋን ልጆች ስደተኞች ጩኸታችንን ወዳንቺ እናቀርባለን።\nበዚህ በለቅሶ ቆላ እተጨነቅንና እያለቀሰን ወደንቺ እንማጠናለን።\n\nእንግዲህ እባክሽ የኛ ጠበቃ ሆይ፥ በምህረት ዓይኖችሽ ወደ እኛ ተመልከቺ።\nደጊቱ፥ ቸሪቱ፥ መሐሪቱ ድንግል ማርያም ሆይ፥\nየተባረከውን የሆድሽን ፍሬ ኢየሱስን ከዚህ ከስደት በኋላ ለኛ እባክሽ አሳይን።\nአሜን።',
      imagePath: 'assets/img_18.png',
    ),
    PrayerStep(
      sectionHeader: 'UNDER THY PROTECTION',
      sectionHeaderAm: 'በክንፎችሽ ጥላ ሰውሪን',
      titleEn: 'Sub Tuum Praesidium',
      titleAm: 'በክንፎችሽ ጥላ ሰውሪን',
      contentEn:
      'We fly to your protection, O Holy Mother of God.\nDespise not our petitions in our necessities,\nbut deliver us always from all dangers,\nO glorious and blessed Virgin Mary.\nAmen.',
      contentAm:
      'ቅድስት የአምላክ እናት ሆይ፥ ጸሎታችንን አትናቂ፤\nበተቸገርን ጊዜ ከክፉ ሁሉ ሰውሪን።\nየተባረክሽ እና የተከበርሽ ድንግል ማርያም ሆይ፥ አሜን።',
      imagePath: 'assets/Mary.jpg',
    ),
    PrayerStep(
      sectionHeader: 'MARIAN INTERCESSION',
      sectionHeaderAm: 'የማርያም አማላጅነት',
      titleEn: 'The Memorare',
      titleAm: 'እጅግ ርህርት የሆንሽ ድንግል ማርያም ሆይ',
      contentEn:
      'Remember, O most gracious Virgin Mary,\nthat never was it known\nthat anyone who fled to your protection,\nimplored your help, or sought your intercession\nwas left unaided.\n\nInspired by this confidence, I fly unto you,\nO Virgin of virgins, my Mother.\nTo you I come; before you I stand, sinful and sorrowful.\nO Mother of the Word Incarnate, despise not my petitions,\nbut in your mercy hear and answer me.\nAmen.',
      contentAm:
      'ባንቺ ጥበቃ ከተማፀኑ፥ እርዳታሽን ከለመኑ፥ አማለጅነትሽን ከፈለጉ ሰዎች\nአንድስ እንኳን የተኮነነ እንዳልተሰማ አስቢ።\nየድንግሎች ድንግል የሆንሽ እናቴ ሆይ፤\nእኔም በዚህ እምነት ተጽናንቼ ወደ አንቺ እሮጣለሁ።\nበኀጢአቴም እየተጨነቅሁ በፊትሽ ቆሚያለሁ።\nየቃለ እግዚአብሔር እናት ሆይ፥ ራርተሽ ቃሌን ስሚ፤\nአድምጪ እንጂ ችላ አትበይ።\nአሜን።',
      imagePath: 'assets/img_11.png',
    ),
    PrayerStep(
      sectionHeader: 'LITANY OF OUR LADY',
      sectionHeaderAm: 'የእመቤታችን ሊጣንያ',
      titleEn: 'Litany of Our Lady',
      titleAm: 'የእመቤታችን ሊጣንያ',
      contentEn:
      'Lord, have mercy on us.\nChrist, have mercy on us.\nLord, have mercy on us.\nChrist, hear us.\nChrist, graciously hear us.\n\nGod, the Father of Heaven, have mercy on us.\nGod the Son, Redeemer of the world, have mercy on us.\nGod, the Holy Spirit, have mercy on us.\nHoly Trinity, one God, have mercy on us.\n\nHoly Mary, pray for us.\nHoly Mother of God, pray for us.\nHoly Virgin of virgins, pray for us.\nMother of Christ, pray for us.\nMother of divine grace, pray for us.\nMother most pure, pray for us.\nMother most chaste, pray for us.\nMother inviolate, pray for us.\nMother undefiled, pray for us.\nMother most amiable, pray for us.\nMother most admirable, pray for us.\nMother of good counsel, pray for us.\nMother of our Creator, pray for us.\nMother of our Savior, pray for us.\nVirgin most prudent, pray for us.\nVirgin most venerable, pray for us.\nVirgin most renowned, pray for us.\nVirgin most powerful, pray for us.\nVirgin most merciful, pray for us.\nVirgin most faithful, pray for us.\nMirror of justice, pray for us.\nSeat of wisdom, pray for us.\nCause of our joy, pray for us.\nSpiritual vessel, pray for us.\nVessel of honor, pray for us.\nSingular vessel of devotion, pray for us.\nMystical rose, pray for us.\nTower of David, pray for us.\nTower of ivory, pray for us.\nHouse of gold, pray for us.\nArk of the covenant, pray for us.\nGate of heaven, pray for us.\nMorning star, pray for us.\nHealth of the sick, pray for us.\nRefuge of sinners, pray for us.\nComforter of the afflicted, pray for us.\nHelp of Christians, pray for us.\nQueen of angels, pray for us.\nQueen of patriarchs, pray for us.\nQueen of prophets, pray for us.\nQueen of apostles, pray for us.\nQueen of martyrs, pray for us.\nQueen of confessors, pray for us.\nQueen of virgins, pray for us.\nQueen of all saints, pray for us.\nQueen conceived without original sin, pray for us.\nQueen assumed into heaven, pray for us.\nQueen of the most holy Rosary, pray for us.\nQueen of peace, pray for us.\n\nLamb of God, who takes away the sins of the world, spare us, O Lord.\nLamb of God, who takes away the sins of the world, graciously hear us, O Lord.\nLamb of God, who takes away the sins of the world, have mercy on us.\n\nPray for us, O Holy Mother of God,\nthat we may be made worthy of the promises of Christ.\n\nLet us pray.\nAlmighty and everlasting God, who by the cooperation of the Holy Spirit prepared the body and soul of the glorious Virgin Mary to become a worthy dwelling for Your Son, grant that we who rejoice in her commemoration may, by her loving intercession, be delivered from present evils and from everlasting death.\nThrough the same Christ our Lord.\nAmen.',
      contentAm:
      'ጌታ ሆይ • ማረን\nክርስቶስ ሆይ • ማረን\nጌታ ሆይ • ማረን\nክርስቶስ ሆይ • ስማን\nክርስቶስ ሆይ • አድምጠን\n\nሰማያዊ አብ አምላክ ሆይ • ማረን\nመድኃኔዓለም ወልድ አምላክ ሆይ • ማረን\nመንፈስ ቅዱስ አምላክ ሆይ • ማረን\nቅድስት ሥላሴ አንድ አምላክ ሆይ • ማረን\n\nቅድስት ማርያም ሆይ • ለምኝልን\nቅድስት የአምላክ እናት ሆይ • ለምኝልን\nቅድስት የድንግሎች ድንግል ሆይ • ለምኝልን\nየክርስቶስ እናት ሆይ • ለምኝልን\nየአምላካዊ ጸጋ እናት ሆይ • ለምኝልን\nእጅግ የጠራሽ እናት ሆይ • ለምኝልን\nእጅግ ንጽሕት እናት ሆይ • ለምኝልን\nየምተወደጂ እናት ሆይ • ለምኝልን\nየምትደነቂ እናት ሆይ • ለምኝልን\nየመልካም ምክር እናት ሆይ • ለምኝልን\nየፈጣሪ እናት ሆይ • ለምኝልን\nየመድኃኔዓለም እናት ሆይ • ለምኝልን\nእጅግ ጥበበኛ ድንግል ሆይ • ለምኝልን\nክብር የሚገባሽ ድንግል ሆይ • ለምኝልን\nምስጋና የሚገባሽ ድንግል ሆይ • ለምኝልን\nየምትራሪ ድንግል ሆይ • ለምኝልን\nየጽድቅ መስተዋት ሆይ • ለምኝልን\nየጥበብ ወንበር ሆይ • ለምኝልን\nየደስታችን ምክንያት ሆይ • ለምኝልን\nምስጢራዊት ጽጌረዳ ሆይ • ለምኝልን\nየኪዳን ታቦት ሆይ • ለምኝልን\nየሰማይ ደጃፍ ሆይ • ለምኝልን\nአጥቢያ ኮከብ ሆይ • ለምኝልን\nየበሽተኞች ፈውስ ሆይ • ለምኝልን\nየዳዊት ግንብ ሆይ • ለምኝልን\nየዝሆን ጥርስ ግንብ ሆይ • ለምኝልን\nየወርቅ ቤት ሆይ • ለምኝልን\nየኃጢአተኞች መማጠኛ ሆይ • ለምኝልን\nየሐዘንተኞች አፅናኝ ሆይ • ለምኝልን\nየክርስቲያኞች ረዳት ሆይ • ለምኝልን\nየመላእክት ንግሥት ሆይ • ለምኝልን\nየአባቶች ንግሥት ሆይ • ለምኝልን\nየነቢያት ንግሥት ሆይ • ለምኝልን\nየሐዋርያት ንግሥት ሆይ • ለምኝልን\nየሰማእታት ንግሥት ሆይ • ለምኝልን\nየጻድቃን ንግሥት ሆይ • ለምኝልን\nየድንግሎች ንግሥት ሆይ • ለምኝልን\nየምዕመናን ንግሥት ሆይ • ለምኝልን\nየቅዱሳን ሁሉ ንግሥት ሆይ • ለምኝልን\nያለአዳም ኃጢአት የተጸነሽ ንግሥት ሆይ • ለምኝልን\nወደ ሰማይ የወጣሽ ንግሥት ሆይ • ለምኝልን\nየሰላም ንግሥት ሆይ • ለምኝልን\n\nየዓለምን ኃጢአት የምታጠፋ የእግዚአብሔር በግ ሆይ • ራራልን\nየዓለምን ኃጢአት የምታጠፋ የእግዚአብሔር በግ ሆይ • አድምጠን\nየዓለምን ኃጢአት የምታጠፋ የእግዚአብሔር በግ ሆይ • ማረን\n\nቅድስት የአምላክ እናት ሆይ • ለምኝልን፥\nክርስቶስ ለሰጠን ተስፋ የተገባን እንድንሆን።\n\nእንጸልይ።\nእግዚአብሔር አምላክ ሆይ፥ ለነፍሳችንና ለሥጋችን በሚሆን ጤና ዘወትር ደስ እንዲለን፥\nበተመሰገነችው ዘወትር ድንግል በሆነችው በእመቤታችን ማርያም በከበረው አማላጅነቷ፥\nከዚህ ዓለም ሀዘን እንድንድንና የዘለዓለምን ደስታ እንድናገኝ ለኛ ለአገልጋዮችህ አድርግልን ብለን በጌታችን ኢየሱስ ክርስቶስ ስም እንለምናሃለን።\nአሜን።',
      imagePath: 'assets/img.png',
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _finishRosary() {
    final isAmharic = LanguageController.instance.isAmharic;
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => PrayerCompletionScreen(
          isAmharic: isAmharic,
          detailValue: isAmharic ? 'የቅዱስ መቁጠሪያ ጸሎት' : 'The Holy Rosary',
          prayerType: 'Rosary',
          bgImagePath:
          widget.bgImagePath ?? 'assets/wmremove-transformed (9).jpeg',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListenableBuilder(
      listenable: LanguageController.instance,
      builder: (context, child) {
        final isAmharic = LanguageController.instance.isAmharic;

        return Scaffold(
          appBar: AppBar(
            title: Text(
              isAmharic ? 'የመቁጠሪያ ማጠቃለያ ጸሎቶች' : 'Concluding Rosary Prayers',
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                if (_currentPage > 0) {
                  _pageController.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                } else {
                  Navigator.of(context).pop();
                }
              },
            ),
            actions: [
              IconButton(
                icon: const Text('A-',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.white)),
                tooltip: 'Decrease text size',
                onPressed: () => setState(
                        () => _textScale = (_textScale - 0.1).clamp(0.8, 1.6)),
              ),
              IconButton(
                icon: const Text('A+',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.white)),
                tooltip: 'Increase text size',
                onPressed: () => setState(
                        () => _textScale = (_textScale + 0.1).clamp(0.8, 1.6)),
              ),
              const SizedBox(width: 4),
            ],
          ),
          body: Column(
            children: [
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  _conclusionPrayers.length,
                      (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    height: 8,
                    width: _currentPage == index ? 24 : 8,
                    decoration: BoxDecoration(
                      color: _currentPage == index
                          ? theme.colorScheme.primary
                          : theme.colorScheme.outlineVariant,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: _conclusionPrayers.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    final step = _conclusionPrayers[index];
                    final String? headerText = isAmharic
                        ? ((step.sectionHeaderAm != null &&
                        step.sectionHeaderAm!.isNotEmpty)
                        ? step.sectionHeaderAm!
                        : step.sectionHeader)
                        : step.sectionHeader;

                    return SingleChildScrollView(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            headerText!,
                            style: theme.textTheme.labelLarge?.copyWith(
                              color: theme.colorScheme.primary,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.2,
                              fontSize: (theme.textTheme.labelLarge?.fontSize ??
                                  14) *
                                  _textScale,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            isAmharic ? step.titleAm : step.titleEn,
                            textAlign: TextAlign.center,
                            style: theme.textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: (theme.textTheme.headlineSmall
                                  ?.fontSize ??
                                  20) *
                                  _textScale,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.12),
                                  blurRadius: 16,
                                  offset: const Offset(0, 6),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: AspectRatio(
                                aspectRatio: 4 / 3,
                                child: Image.asset(
                                  step.imagePath,
                                  fit: BoxFit.cover,
                                  alignment: Alignment.topCenter,
                                  errorBuilder: (context, error, stackTrace) =>
                                      Container(
                                        color:
                                        theme.colorScheme.surfaceContainerHigh,
                                        child: const Icon(Icons.church_rounded,
                                            size: 48),
                                      ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: theme.colorScheme.surfaceContainerLow,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: theme.colorScheme.outlineVariant
                                    .withValues(alpha: 0.5),
                              ),
                            ),
                            child: Text(
                              isAmharic ? step.contentAm : step.contentEn,
                              style: theme.textTheme.bodyLarge?.copyWith(
                                height: 1.6,
                                fontSize:
                                (theme.textTheme.bodyLarge?.fontSize ?? 16) *
                                    _textScale,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_currentPage < _conclusionPrayers.length - 1) {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      } else {
                        _finishRosary();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.colorScheme.primary,
                      foregroundColor: theme.colorScheme.onPrimary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Text(
                      _currentPage < _conclusionPrayers.length - 1
                          ? (isAmharic ? 'ቀጣይ ጸሎት' : 'Next Prayer')
                          : (isAmharic ? 'ጸሎቱን አጠናቅቅ' : 'Complete Rosary'),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}