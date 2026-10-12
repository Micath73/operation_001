import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:operation_001/controllers/language_controller.dart'; // adjust path if yours differs
import 'package:operation_001/l10n/app_localizations.dart'; // adjust path if yours differs
import 'package:operation_001/prayer_completion_screen.dart';

class AngelusPrayerSession extends StatefulWidget {
  /// Ignored. Language now comes from [LanguageController.instance]; this
  /// parameter only remains so existing call sites keep compiling.
  @Deprecated('Language now comes from LanguageController.instance')
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

  @override
  Widget build(BuildContext context) {
    // Rebuilds when the user toggles language. Audio position / play state
    // live in this State object, so they survive the rebuild.
    return ListenableBuilder(
      listenable: LanguageController.instance,
      builder: (context, _) => _buildScreen(context),
    );
  }

  Widget _buildScreen(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    final bool isAmharic = LanguageController.instance.isAmharic;
    final String content = l10n.angelusPrayerText;

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          l10n.angelusTitle,
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
          // 1. Asset Background
          Positioned.fill(
            child: Image.asset('assets/img_19.png', fit: BoxFit.cover),
          ),

          // 2. Fixed Dark Blur Scrim
          Positioned.fill(
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
                child: Container(color: Colors.black.withValues(alpha: 0.55)),
              ),
            ),
          ),

          // 3. Scrollable Content Layer
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
                          color: Colors.white.withValues(alpha: 0.18),
                          width: 1.2,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                          child: Container(
                            color: Colors.black.withValues(alpha: 0.25),
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
                                              l10n.angelusAudioTitle,
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
                                              color: theme.colorScheme.secondary,
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
                                              color: Colors.white.withValues(
                                                alpha: 0.6,
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
                                                    .withValues(alpha: 0.2),
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
                                              color: Colors.white.withValues(
                                                alpha: 0.6,
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

                    // --- Prayer Content Card ---
                    CustomPaint(
                      painter: GradientBorderPainter(
                        strokeWidth: 1.5,
                        radius: 20,
                        gradient: LinearGradient(
                          colors: [
                            theme.colorScheme.secondary.withValues(alpha: 0.65),
                            Colors.white.withValues(alpha: 0.1),
                            theme.colorScheme.primary.withValues(alpha: 0.35),
                            Colors.white.withValues(alpha: 0.5),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.25),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              l10n.angelusTextHeading,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: theme.colorScheme.secondary,
                                shadows: [
                                  Shadow(
                                    blurRadius: 8,
                                    color: Colors.black.withValues(alpha: 0.6),
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 8),
                            Divider(
                              color: Colors.white.withValues(alpha: 0.25),
                              thickness: 1,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              content,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.white.withValues(alpha: 0.95),
                                height: 1.55,
                                shadows: [
                                  Shadow(
                                    blurRadius: 6,
                                    color: Colors.black.withValues(alpha: 0.8),
                                    offset: const Offset(1, 1),
                                  ),
                                ],
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
                              horizontal: 40,
                              vertical: 16,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            elevation: 8,
                          ),
                          // Locate the onPressed inside AngelusPrayerSession (around line 250):
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              PageRouteBuilder(
                                transitionDuration: const Duration(milliseconds: 650),
                                reverseTransitionDuration: const Duration(milliseconds: 400),
                                pageBuilder: (context, animation, secondaryAnimation) =>
                                    PrayerCompletionScreen(
                                      isAmharic: isAmharic,
                                      detailValue: l10n.angelusTitle,
                                      // Updated to explicitly match PrayerType enum's dbValue
                                      prayerType: 'angelus',
                                      detailLabelEn: l10n.devotionalLabelEn,
                                      detailLabelAm: l10n.devotionalLabelAm,
                                      titleEn: l10n.angelusCompletedTitleEn,
                                      titleAm: l10n.angelusCompletedTitleAm,
                                      subtitleEn: l10n.angelusCompletedSubtitleEn,
                                      subtitleAm: l10n.angelusCompletedSubtitleAm,
                                      bgImagePath: 'assets/img_19.png',
                                    ),
                                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                  final fadeAnimation = CurvedAnimation(
                                    parent: animation,
                                    curve: Curves.easeOutCubic,
                                  );

                                  final scaleAnimation = Tween<double>(
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
                            l10n.amenButton,
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