import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:operation_001/prayer_completion_screen.dart';
import 'package:operation_001/db_helper.dart';

class DivineMercyChaplet extends StatefulWidget {
  final bool isAmharic;

  const DivineMercyChaplet({super.key, this.isAmharic = false});

  @override
  State<DivineMercyChaplet> createState() => _DivineMercyChapletState();
}

class _DivineMercyChapletState extends State<DivineMercyChaplet> {
  double _currentPosition = 0.0;
  final double _totalDuration = 300.0;
  bool _isPlaying = false;

  String _formatDuration(double seconds) {
    int totalSeconds = seconds.toInt();
    int minutes = totalSeconds ~/ 60;
    int remainingSeconds = totalSeconds % 60;
    String secondsStr = remainingSeconds < 10
        ? '0$remainingSeconds'
        : '$remainingSeconds';
    return '$minutes:$secondsStr';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          widget.isAmharic ? 'የማሕሪው ኢየሱስ ጸሎት' : 'Divine Mercy Chaplet',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('assets/img_3.png', fit: BoxFit.cover),
          ),
          Positioned.fill(
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
                child: Container(color: Colors.black.withAlpha(140)),
              ),
            ),
          ),
          Positioned.fill(
            child: SafeArea(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // --- Mini Glassmorphic Audio Player Card ---
                    Container(
                      height: 110,
                      margin: const EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Colors.white.withAlpha(46),
                          width: 1.2,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                          child: Container(
                            color: Colors.white.withAlpha(20),
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    color: Colors.white24,
                                    image: const DecorationImage(
                                      image: AssetImage('assets/img_3.png'),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              widget.isAmharic
                                                  ? 'የማሕሪው ኢየሱስ ድምፅ'
                                                  : 'Divine Mercy Chaplet Audio',
                                              style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          IconButton(
                                            padding: EdgeInsets.zero,
                                            constraints: const BoxConstraints(),
                                            onPressed: () {
                                              setState(() {
                                                _isPlaying = !_isPlaying;
                                              });
                                            },
                                            icon: Icon(
                                              _isPlaying
                                                  ? Icons.pause_circle_filled
                                                  : Icons.play_circle_fill,
                                              color:
                                              theme.colorScheme.secondary,
                                              size: 32,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 4),
                                      Row(
                                        children: [
                                          Text(
                                            _formatDuration(_currentPosition),
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.white.withAlpha(
                                                153,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: SliderTheme(
                                              data: SliderTheme.of(
                                                context,
                                              ).copyWith(
                                                trackHeight: 3,
                                                activeTrackColor:
                                                theme.colorScheme.secondary,
                                                inactiveTrackColor: Colors.white
                                                    .withAlpha(51),
                                                thumbColor:
                                                theme.colorScheme.secondary,
                                                thumbShape:
                                                const RoundSliderThumbShape(
                                                  enabledThumbRadius: 6,
                                                ),
                                                overlayShape:
                                                const RoundSliderOverlayShape(
                                                  overlayRadius: 14,
                                                ),
                                              ),
                                              child: Slider(
                                                value: _currentPosition,
                                                min: 0.0,
                                                max: _totalDuration,
                                                onChanged: (newValue) {
                                                  setState(() {
                                                    _currentPosition = newValue;
                                                  });
                                                },
                                              ),
                                            ),
                                          ),
                                          Text(
                                            _formatDuration(_totalDuration),
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.white.withAlpha(
                                                153,
                                              ),
                                            ),
                                          ),
                                        ],
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

                    // --- Step 1: Sign of the Cross & Opening Prayers ---
                    _buildPrayerCard(
                      theme: theme,
                      title: widget.isAmharic
                          ? '1. የመክፈቻ ጸሎት'
                          : '1. Opening Prayers',
                      content: widget.isAmharic
                          ? 'በአብ፡ በወልድ፡ ወመንፈስ ቅዱስ ስም አሐዱ አምላክ አሜን።\n\n'
                          'አቤቱ ኢየሱስ ሆይ፡ ሞትክ፡ ነገር ግን የሕይወት ምንጭ ለነፍሳት ፈሰሰ፤ የምሕረትም ውቅያኖስ ለመላው ዓለም ተከፈተ። እጅግ ጥልቅ የሆነ የምሕረት ምንጭ ሆይ፡ መላውን ዓለም ሸፍን፡ እራስህንም በእኛ ላይ አፍስስ።\n\n'
                          'እኛን የሚምር የኢየሱስ ልብ ሆይ፡ ከአንተ የፈሰሰው ደምና ውኃ፡ በእንተ እተማመናለሁ! (3 ጊዜ)'
                          : 'In the name of the Father, and of the Son, and of the Holy Spirit. Amen.\n\n'
                          'You expired, Jesus, but the source of life gushed forth for souls, and the ocean of mercy opened up for the whole world. O Fount of Life, unfathomable Divine Mercy, enfold the whole world and empty Yourself out upon us.\n\n'
                          'O Blood and Water, which gushed forth from the Heart of Jesus as a fount of mercy for us, I trust in You! (Repeat 3 times)',
                    ),
                    const SizedBox(height: 16),

                    // --- Step 2: Preparatory Prayers ---
                    _buildPrayerCard(
                      theme: theme,
                      title: widget.isAmharic
                          ? '2. የመዘጋጃ ጸሎቶች'
                          : '2. Preparatory Prayers',
                      content: widget.isAmharic
                          ? 'አባታችን ሆይ በሰማያት የምትኖር… (አባታችን ሆይ)\n\n'
                          'ጸጋን የሞላብሽ ማርያም ሆይ ሰላም ለአንቺ ይሁን… (ሰላም ለአንቺ ይሁን)\n\n'
                          'የሐዋርያት እምነት ጸሎት (ሃይማኖተ አበው):\n'
                          'ሁሉን በሚችል በሰማይና በምድር በታየውና ባልታየው በፈጠረ በአንድ አምላክ በእግዚአብሔር አብ እንስማማለን…'
                          : 'Our Father, Who art in heaven, hallowed be Thy name; Thy kingdom come; Thy will be done on earth as it is in heaven. Give us this day our daily bread; and forgive us our trespasses as we forgive those who trespass against us; and lead us not into temptation, but deliver us from evil. Amen.\n\n'
                          'Hail Mary, full of grace. The Lord is with thee. Blessed art thou among women, and blessed is the fruit of thy womb, Jesus. Holy Mary, Mother of God, pray for us sinners, now and at the hour of our death. Amen.\n\n'
                          'The Apostles\' Creed:\n'
                          'I believe in God, the Father Almighty, Creator of heaven and earth, and in Jesus Christ, His only Son, our Lord, who was conceived by the Holy Spirit, born of the Virgin Mary, suffered under Pontius Pilate, was crucified, died and was buried; He descended into hell; on the third day He rose again from the dead; He ascended into heaven, and is seated at the right hand of God the Father Almighty; from there He will come to judge the living and the dead. I believe in the Holy Spirit, the holy catholic Church, the communion of saints, the forgiveness of sins, the resurrection of the body, and life everlasting. Amen.',
                    ),
                    const SizedBox(height: 16),

                    // --- Step 3: The 5 Decades ---
                    _buildPrayerCard(
                      theme: theme,
                      title: widget.isAmharic
                          ? '3. አምስቱ አስርቶች'
                          : '3. The 5 Decades',
                      content: widget.isAmharic
                          ? 'ለእያንዳንዱ 5 አስርቶች የሚከተለውን ይጸልዩ:\n\n'
                          'በትልቁ እንቁላል ላይ:\n'
                          '"ዘላላማዊ አባት ሆይ፡ ስለ እኛና ስለ መላው ዓለም ኃጢአት ማስተስረያ፡ የተወደደውን ልጅህን የጌታችንን የኢየሱስ ክርስቶስን ሥጋውንና ደሙን ነፍሱንና አምላክነቱን ለአንተ እናቀርባለን።"\n\n'
                          'በ 10 ትናንሽ እንቁላሎች ላይ:\n'
                          '"ስለ ሕማማቱና ስለ ሞቱ፡ በእኛና በመላው ዓለም ላይ ምሕረት አድርግ።"'
                          : 'For each of the 5 Decades, pray the following:\n\n'
                          'On the Large Bead (Eternal Father):\n'
                          '"Eternal Father, I offer You the Body and Blood, Soul and Divinity of Your Dearly Beloved Son, Our Lord, Jesus Christ, in atonement for our sins and those of the whole world." \n\n'
                          'On the 10 Small Beads (Sorrowful Passion):\n'
                          '"For the sake of His sorrowful Passion, have mercy on us and on the whole world."',
                    ),
                    const SizedBox(height: 16),

                    // --- Step 4: Concluding Doxology ---
                    _buildPrayerCard(
                      theme: theme,
                      title: widget.isAmharic
                          ? '4. የማጠቃለያ ጸሎት'
                          : '4. Concluding Doxology',
                      content: widget.isAmharic
                          ? 'ቅዱስ እግዚአብሔር፡ ቅዱስ ኃያል፡ ቅዱስ ሕያው የማይሞት፡ በእኛና በመላው ዓለም ላይ ምሕረት አድርግ። (3 ጊዜ)\n\n'
                          'የመዝጊያ ጸሎት:\n'
                          'ዘላለማዊ አምላክ ሆይ፡ ምሕረትህ አያልቅም፡ የርኅራኄህም መዝገብ አይጨረስም፤ በጭንቅ ጊዜ ተስፋ እንዳንቆርጥ፡ በታላቅ እምነት ወደ ቅዱስ ፈቃድህ እንድንመለስ በምሕረትህ ተመልከተን። አሜን።'
                          : 'Holy God, Holy Mighty One, Holy Immortal One, have mercy on us and on the whole world.\n(Repeat 3 times)\n\n'
                          'Closing Prayer:\n'
                          'Eternal God, in whom mercy is endless and the treasury of compassion — inexhaustible, look kindly upon us and increase Your mercy in us, that in difficult moments we might not despair nor become despondent, but with great confidence submit ourselves to Your holy will, which is Love and Mercy itself. Amen.',
                    ),
                    const SizedBox(height: 32),

                    // --- Amen Finish Button ---
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 24.0),
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: theme.colorScheme.primary,
                            foregroundColor: theme.colorScheme.onPrimary,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 40,
                              vertical: 16,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            elevation: 8,
                          ),
                          onPressed: () async {
                            await DatabaseHelper.instance.logPrayerCompletion(
                              prayerType: 'Chaplet',
                              prayerName: 'Divine Mercy Chaplet',
                            );

                            if (!context.mounted) return;

                            Navigator.of(context).pushReplacement(
                              PageRouteBuilder(
                                transitionDuration: const Duration(
                                  milliseconds: 650,
                                ),
                                reverseTransitionDuration: const Duration(
                                  milliseconds: 400,
                                ),
                                pageBuilder:
                                    (
                                    context,
                                    animation,
                                    secondaryAnimation,
                                    ) => PrayerCompletionScreen(
                                  isAmharic: widget.isAmharic,
                                  detailValue: widget.isAmharic
                                      ? 'የማሕሪው ኢየሱስ ጸሎት'
                                      : 'Divine Mercy Chaplet',
                                  detailLabelEn: 'Devotional',
                                  detailLabelAm: 'ጸሎት',
                                  titleEn: 'Chaplet Completed',
                                  titleAm: 'ጸሎቱ በስኬት ተጠናቋል',
                                  subtitleEn:
                                  'May His Divine Mercy shine upon you',
                                  subtitleAm: 'ምህረቱ እና ጸጋው ከእርስዎ ጋር ይሁን',
                                  bgImagePath: 'assets/img_3.png',
                                ),
                                transitionsBuilder: (
                                    context,
                                    animation,
                                    secondaryAnimation,
                                    child,
                                    ) {
                                  final fadeAnimation = CurvedAnimation(
                                    parent: animation,
                                    curve: Curves.easeOutCubic,
                                  );

                                  final scaleAnimation =
                                  Tween<double>(
                                    begin: 0.95,
                                    end: 1.0,
                                  ).animate(
                                    CurvedAnimation(
                                      parent: animation,
                                      curve: Curves.easeOutCubic,
                                    ),
                                  );

                                  return FadeTransition(
                                    opacity: fadeAnimation,
                                    child: ScaleTransition(
                                      scale: scaleAnimation,
                                      child: child,
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                          icon: Icon(
                            Icons.check_circle,
                            color: theme.colorScheme.onPrimary,
                            size: 24,
                          ),
                          label: Text(
                            widget.isAmharic ? 'አሜን' : 'AMEN',
                            style: TextStyle(
                              color: theme.colorScheme.onPrimary,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPrayerCard({
    required ThemeData theme,
    required String title,
    required String content,
  }) {
    return CustomPaint(
      painter: GradientBorderPainter(
        strokeWidth: 1.5,
        radius: 20,
        gradient: LinearGradient(
          colors: [
            theme.colorScheme.secondary.withAlpha(166),
            Colors.white.withAlpha(26),
            theme.colorScheme.primary.withAlpha(89),
            Colors.white.withAlpha(128),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.black.withAlpha(64),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: theme.colorScheme.secondary,
                shadows: [
                  Shadow(
                    blurRadius: 8,
                    color: Colors.black.withAlpha(153),
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Divider(color: Colors.white.withAlpha(64), thickness: 1),
            const SizedBox(height: 10),
            Text(
              content,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.white.withAlpha(242),
                height: 1.55,
                shadows: [
                  Shadow(
                    blurRadius: 6,
                    color: Colors.black.withAlpha(204),
                    offset: const Offset(1, 1),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GradientBorderPainter extends CustomPainter {
  final double strokeWidth;
  final double radius;
  final Gradient gradient;

  GradientBorderPainter({
    required this.strokeWidth,
    required this.radius,
    required this.gradient,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Offset.zero & size;
    final RRect rrect = RRect.fromRectAndRadius(rect, Radius.circular(radius));
    final Paint paint =
    Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..shader = gradient.createShader(rect);

    canvas.drawRRect(rrect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}