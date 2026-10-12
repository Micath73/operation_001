import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:operation_001/prayer_completion_screen.dart';

import 'package:operation_001/l10n/app_localizations.dart';
// ⚠ Change this one to wherever LanguageController lives in your project.
import 'package:operation_001/controllers/language_controller.dart';

class DivineMercyChaplet extends StatefulWidget {
  const DivineMercyChaplet({
    super.key,
    @Deprecated('Language now comes from LanguageController.instance.')
    bool? isAmharic,
  });

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

    return ListenableBuilder(
      listenable: LanguageController.instance,
      builder: (context, _) {
        // Resolved straight from the controller (not AppLocalizations.of)
        // so the text follows `isAmharic` even if MaterialApp.locale
        // isn't bound to it.
        final l10n = lookupAppLocalizations(
          Locale(LanguageController.instance.isAmharic ? 'am' : 'en'),
        );
        return _buildScaffold(context, theme, l10n);
      },
    );
  }

  Widget _buildScaffold(
      BuildContext context,
      ThemeData theme,
      AppLocalizations l10n,
      ) {
    return Scaffold(
      backgroundColor: Colors.black, // Hardcoded dark base
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          l10n.chapletTitle,
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
          // 1. Background Image Asset
          Positioned.fill(
            child: Image.asset('assets/img_3.png', fit: BoxFit.cover),
          ),

          // 2. Fixed Dark Blur Scrim (Immune to Light/Dark Mode switch)
          Positioned.fill(
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
                child: Container(
                  color: Colors.black.withValues(alpha: 0.55),
                ),
              ),
            ),
          ),

          // 3. Scrollable Prayer Content
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
                                              l10n.chapletAudioTitle,
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

                    // --- Step 1: Sign of the Cross & Opening Prayers ---
                    _buildPrayerCard(
                      theme: theme,
                      title: l10n.chapletStep1Title,
                      content: l10n.chapletStep1Body,
                    ),
                    const SizedBox(height: 16),

                    // --- Step 2: Preparatory Prayers ---
                    _buildPrayerCard(
                      theme: theme,
                      title: l10n.chapletStep2Title,
                      content: l10n.chapletStep2Body,
                    ),
                    const SizedBox(height: 16),

                    // --- Step 3: The 5 Decades ---
                    _buildPrayerCard(
                      theme: theme,
                      title: l10n.chapletStep3Title,
                      content: l10n.chapletStep3Body,
                    ),
                    const SizedBox(height: 16),

                    // --- Step 4: Concluding Doxology ---
                    _buildPrayerCard(
                      theme: theme,
                      title: l10n.chapletStep4Title,
                      content: l10n.chapletStep4Body,
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
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              PageRouteBuilder(
                                transitionDuration: const Duration(milliseconds: 650),
                                reverseTransitionDuration: const Duration(milliseconds: 400),
                                pageBuilder: (context, animation, secondaryAnimation) =>
                                    PrayerCompletionScreen(
                                      isAmharic:
                                      LanguageController.instance.isAmharic,
                                      detailValue: l10n.chapletTitle,
                                      // Updated to match PrayerType.chaplet.dbValue
                                      prayerType: 'chaplet',
                                      // l10n is already in the active language, so the
                                      // En/Am pair gets the same string — the completion
                                      // screen picks by its own isAmharic flag.
                                      detailLabelEn: l10n.chapletDetailLabel,
                                      detailLabelAm: l10n.chapletDetailLabel,
                                      titleEn: l10n.chapletCompletedTitle,
                                      titleAm: l10n.chapletCompletedTitle,
                                      subtitleEn: l10n.chapletCompletedSubtitle,
                                      subtitleAm: l10n.chapletCompletedSubtitle,
                                      bgImagePath: 'assets/img_3.png',
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
                            l10n.chapletAmen.toUpperCase(),
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
              title,
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
            Divider(color: Colors.white.withValues(alpha: 0.25), thickness: 1),
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
  bool shouldRepaint(covariant GradientBorderPainter oldDelegate) {
    return oldDelegate.strokeWidth != strokeWidth ||
        oldDelegate.radius != radius ||
        oldDelegate.gradient != gradient;
  }
}