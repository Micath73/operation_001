import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:operation_001/prayer_completion_screen.dart';

class AngelusPrayerSession extends StatefulWidget {
  final bool isAmharic;

  const AngelusPrayerSession({super.key, this.isAmharic = false});

  @override
  State<AngelusPrayerSession> createState() => _AngelusPrayerSessionState();
}

class _AngelusPrayerSessionState extends State<AngelusPrayerSession> {
  // Audio Player State
  double _currentPosition = 0.0;
  final double _totalDuration = 180.0; // 3 minutes
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

  // English Prayer Content
  static const String _angelusEnglish =
      "V. The Angel of the Lord declared unto Mary.\n"
      "R. And she conceived of the Holy Spirit.\n\n"
      "Hail Mary, full of grace, the Lord is with you!\n"
      "Blessed are you among women, and blessed is the fruit of your womb, Jesus.\n"
      "Holy Mary, Mother of God, pray for us sinners, now and at the hour of our death. Amen.\n\n"
      "V. Behold the handmaid of the Lord.\n"
      "R. Be it done unto me according to your word.\n\n"
      "Hail Mary, full of grace...\n\n"
      "V. And the Word was made Flesh.\n"
      "R. And dwelt among us.\n\n"
      "Hail Mary, full of grace...\n\n"
      "V. Pray for us, O holy Mother of God.\n"
      "R. That we may be made worthy of the promises of Christ.\n\n"
      "Let us pray:\n"
      "Pour forth we beseech you, O Lord, your grace into our hearts, that we, to whom the incarnation of Christ your Son was made known by the message of an angel, may by his passion and cross be brought to the glory of his resurrection. Through the same Christ Our Lord. Amen.";

  // Amharic Prayer Content
  static const String _angelusAmharicText =
      "V. የእግዚአብሔር መልአክ ማርያምን አበሠራት፡፡\n"
      "R. እርሷም በመንፈስ ቅዱስ ፀነሰች፡፡\n\n"
      "ጸጋ የመላሽ ማርያም ሆይ… ቅድስት ማርያም…\n\n"
      "V. እነሆኝ የእግዚአብሔር አገልጋይ፡፡\n"
      "R. እንዳልከኝ ይሁንልኝ፡፡\n\n"
      "ጸጋ የመላሽ ማርያም ሆይ… ቅድስት ማርያም…\n\n"
      "V. ቃል ሥጋ ሆነ፡፡\n"
      "R. በኛም አደረ፡፡\n\n"
      "ጸጋ የመላሽ ማርያም ሆይ… ቅድስት ማርያም…\n\n"
      "V. ቅድስት የአምላክ እናት ሆይ ለምኝልን፡፡\n"
      "R. ክርስቶስ ለሰጠን ተስፋ የተገባን እንድንሆን፡፡\n\n"
      "እንጸልይ:\n"
      "እግዚአብሔር ሆይ በመልአኩ ምስራች የልጅህን የኢየሱስ ክርስቶስን ሰው መሆኑን እንዳወቅን፤ በህማሙና በመስቀሉ ወደ ትንሣኤ ክብር እንድንደርስ ጸጋህን ስጠን፡፡ በጌታችን ኢየሱስ ክርስቶስ ስም እንለምንሃለን፡፡ አሜን፡፡";

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final String content = widget.isAmharic
        ? _angelusAmharicText
        : _angelusEnglish;

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          widget.isAmharic ? 'መልአኩ ሰላምታ' : 'The Angelus',
          style: theme.textTheme.titleLarge?.copyWith(
            color: theme.colorScheme.onSurface,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back, color: theme.colorScheme.onSurface),
        ),
      ),
      body: Stack(
        children: [
          // 1. Shared Asset Background
          Positioned.fill(
            child: Image.asset('assets/img_19.png', fit: BoxFit.cover),
          ),

          // 2. Adaptive Blurred Overlay
          Positioned.fill(
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 18.0, sigmaY: 18.0),
                child: Container(
                  color: theme.colorScheme.surface.withAlpha(200),
                ),
              ),
            ),
          ),

          // 3. Scrollable Prayer View
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
                    // --- Mini Glassmorphic Audio Player ---
                    Container(
                      height: 110,
                      margin: const EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: theme.colorScheme.outline.withAlpha(80),
                          width: 1.2,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
                          child: Container(
                            color: theme.colorScheme.surface.withAlpha(120),
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    color: theme.colorScheme.surface.withAlpha(51),
                                    image: const DecorationImage(
                                      image: AssetImage('assets/img_19.png'),
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
                                                  ? 'የመልአኩ ሰላምታ ድምፅ'
                                                  : 'The Angelus Audio',
                                              style: theme.textTheme.bodyMedium?.copyWith(
                                                fontWeight: FontWeight.bold,
                                                color: theme.colorScheme.onSurface,
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
                                              color: theme.colorScheme.primary,
                                              size: 36,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 4),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            _formatDuration(_currentPosition),
                                            style: theme.textTheme.labelSmall?.copyWith(
                                              color: theme.colorScheme.onSurface
                                                  .withAlpha(160),
                                            ),
                                          ),
                                          Expanded(
                                            child: SliderTheme(
                                              data: SliderTheme.of(context).copyWith(
                                                trackHeight: 3,
                                                activeTrackColor:
                                                theme.colorScheme.primary,
                                                inactiveTrackColor: theme
                                                    .colorScheme
                                                    .onSurface
                                                    .withAlpha(51),
                                                thumbColor:
                                                theme.colorScheme.primary,
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
                                            style: theme.textTheme.labelSmall?.copyWith(
                                              color: theme.colorScheme.onSurface
                                                  .withAlpha(160),
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

                    // --- Prayer Content Card ---
                    CustomPaint(
                      painter: GradientBorderPainter(
                        strokeWidth: 1.5,
                        radius: 20,
                        gradient: LinearGradient(
                          colors: [
                            theme.colorScheme.primary.withAlpha(180),
                            theme.colorScheme.secondary.withAlpha(140),
                            theme.colorScheme.primary.withAlpha(120),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(22.0),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.surface.withAlpha(230),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.isAmharic
                                  ? 'የመክፈቻ ጸሎት'
                                  : 'Devotional Text',
                              style: theme.textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: theme.colorScheme.secondary,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Divider(
                              color: theme.colorScheme.outline.withAlpha(60),
                              thickness: 1,
                            ),
                            const SizedBox(height: 12),
                            Text(
                              content,
                              style: theme.textTheme.bodyLarge?.copyWith(
                                color: theme.colorScheme.onSurface,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 32),

                    // --- AMEN Finish Button ---
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 24.0),
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: theme.colorScheme.primary,
                            foregroundColor: theme.colorScheme.onPrimary,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 44,
                              vertical: 16,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            elevation: 4,
                          ),
                          onPressed: () {
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
                                      ? 'መልአኩ ሰላምታ'
                                      : 'The Angelus',
                                  detailLabelEn: 'Devotional',
                                  detailLabelAm: 'ጸሎት',
                                  titleEn: 'Angelus Completed',
                                  titleAm: 'የመልአኩ ሰላምታ ተጠናቋል',
                                  subtitleEn:
                                  'May the grace of His Incarnation fill your heart',
                                  subtitleAm: 'የምስራቹ ጸጋ ከእርስዎ ጋር ይሁን',
                                  bgImagePath: 'assets/img_19.png',
                                ),
                                transitionsBuilder:
                                    (
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
                            style: theme.textTheme.titleMedium?.copyWith(
                              color: theme.colorScheme.onPrimary,
                              fontWeight: FontWeight.bold,
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
    final Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..shader = gradient.createShader(rect);

    canvas.drawRRect(rrect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}