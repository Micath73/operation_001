import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:operation_001/prayer_data.dart';
import 'package:operation_001/prayer_model.dart';

class NewPrayerTemplatePage extends StatefulWidget {
  final String prayerTitle;
  final String prayerImage;

  const NewPrayerTemplatePage({
    super.key,
    required this.prayerTitle,
    required this.prayerImage,
  });

  @override
  State<NewPrayerTemplatePage> createState() => _NewPrayerTemplatePageState();
}

class _NewPrayerTemplatePageState extends State<NewPrayerTemplatePage>
    with TickerProviderStateMixin {
  bool isPraying = false;
  int? _focusedStepIndex;

  // Track dynamic animation states per paragraph section
  final Map<int, AnimationController> _glowControllers = {};
  final Map<int, Animation<double>> _glowAnimations = {};

  AnimationController _getGlowController(int index) {
    if (!_glowControllers.containsKey(index)) {
      final controller = AnimationController(
        duration: const Duration(milliseconds: 350),
        vsync: this,
      );
      _glowControllers[index] = controller;
      _glowAnimations[index] = CurvedAnimation(
        parent: controller,
        curve: Curves.easeOutCubic,
      );
    }
    return _glowControllers[index]!;
  }

  Animation<double> _getGlowAnimation(int index) {
    _getGlowController(index);
    return _glowAnimations[index]!;
  }

  void _onTapParagraph(int index) {
    HapticFeedback.selectionClick();

    if (_focusedStepIndex != null && _focusedStepIndex != index) {
      _glowControllers[_focusedStepIndex!]?.reverse();
    }

    setState(() {
      if (_focusedStepIndex == index) {
        _focusedStepIndex = null;
        _glowControllers[index]?.reverse();
      } else {
        _focusedStepIndex = index;
        _getGlowController(index).forward();
      }
    });
  }

  @override
  void dispose() {
    for (final c in _glowControllers.values) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    // FIX 1: Referenced PrayerData class properly with UpperCamelCase
    final steps = PrayerData.masterPrayerDB[widget.prayerTitle];

    final double fullHeight = MediaQuery.of(context).size.height;
    final double dynamicImageHeight =
    isPraying ? fullHeight * 0.45 : fullHeight;
    final double manuscriptTop = isPraying ? fullHeight * 0.38 : fullHeight;

    // Liturgical theme colors
    const goldAccent = Color(0xFFE8B84B);
    const deepGold = Color(0xFFC9922A);
    final vellumSheetBg =
    isDark ? const Color(0xFF1E1726) : const Color(0xFFF5EFD7);
    final textBodyColor =
    isDark ? const Color(0xFFE2DCED) : const Color(0xFF1A0F2E);
    final cardBgColor = isDark
        ? const Color(0xFF120B20).withValues(alpha: 0.65)
        : const Color(0xFF1A0F2E).withValues(alpha: 0.45);

    return PopScope(
      canPop: !isPraying,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        if (isPraying) {
          if (_focusedStepIndex != null) {
            _glowControllers[_focusedStepIndex!]?.reverse();
          }
          setState(() {
            isPraying = false;
            _focusedStepIndex = null;
          });
        }
      },
      child: Scaffold(
        backgroundColor: theme.colorScheme.surface,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: goldAccent,
              size: 20,
            ),
            onPressed: () {
              if (isPraying) {
                if (_focusedStepIndex != null) {
                  _glowControllers[_focusedStepIndex!]?.reverse();
                }
                setState(() {
                  isPraying = false;
                  _focusedStepIndex = null;
                });
              } else {
                Navigator.pop(context);
              }
            },
          ),
        ),
        body: Stack(
          children: [
            // ── 1. Parallax Art Layer ────────────────────────────────────────
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: dynamicImageHeight,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    widget.prayerImage,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      decoration: BoxDecoration(
                        gradient: RadialGradient(
                          center: const Alignment(0.0, -0.3),
                          radius: 1.4,
                          colors: [
                            theme.colorScheme.primary.withValues(alpha: 0.7),
                            theme.colorScheme.surface,
                            theme.colorScheme.surface,
                          ],
                        ),
                      ),
                      child: CustomPaint(painter: _GothicArchPainter()),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          theme.colorScheme.surface.withValues(alpha: 0.4),
                          theme.colorScheme.surface.withValues(alpha: 0.85),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // ── 2. Welcome State Backdrop Blur ───────────────────────────────
            if (!isPraying)
              Positioned.fill(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                  child: Container(color: Colors.transparent),
                ),
              ),

            // ── 3. Intro Dashboard Card ──────────────────────────────────────
            if (!isPraying)
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.86,
                      height: fullHeight * 0.54,
                      padding: const EdgeInsets.all(28),
                      decoration: BoxDecoration(
                        color: cardBgColor,
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(
                          color: deepGold.withValues(alpha: 0.3),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'MOMENT OF PEACE',
                            style: TextStyle(
                              fontFamily: 'Georgia',
                              color: goldAccent,
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 3.0,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            widget.prayerTitle,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontFamily: 'Georgia',
                              color: Color(0xFFF5EFD7),
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 24),
                          const Expanded(
                            child: SingleChildScrollView(
                              child: Text(
                                '"At dawn let me hear of your mercy,\nfor in you I trust.\nShow me the path I should walk,\nfor I lift up my soul to you."',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Georgia',
                                  color: Color(0xFFEDE3C0),
                                  fontSize: 16,
                                  height: 1.6,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            '— Psalm 143:8',
                            style: TextStyle(
                              fontFamily: 'Georgia',
                              fontSize: 13,
                              color: deepGold,
                            ),
                          ),
                          const Spacer(),
                          FloatingActionButton.extended(
                            backgroundColor: goldAccent,
                            foregroundColor: theme.colorScheme.surface,
                            elevation: 4,
                            onPressed: () => setState(() => isPraying = true),
                            label: Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 16),
                              child: Text(
                                'LET US PRAY',
                                style: TextStyle(
                                  fontFamily: 'Georgia',
                                  color: theme.colorScheme.surface,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 2.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

            // ── 4. Sliding Illuminated Manuscript Sheet ──────────────────────
            AnimatedPositioned(
              duration: const Duration(milliseconds: 600),
              curve: Curves.easeOutCubic,
              top: manuscriptTop,
              left: 0,
              right: 0,
              bottom: 0,
              child: IgnorePointer(
                ignoring: !isPraying,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 450),
                  opacity: isPraying ? 1.0 : 0.0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: vellumSheetBg,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(28),
                        topRight: Radius.circular(28),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: isDark
                              ? Colors.black.withValues(alpha: 0.6)
                              : const Color(0x66000000),
                          blurRadius: 30,
                          offset: const Offset(0, -10),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 14, bottom: 6),
                          child: Container(
                            width: 42,
                            height: 4,
                            decoration: BoxDecoration(
                              color: deepGold.withValues(alpha: 0.4),
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            padding: const EdgeInsets.fromLTRB(24, 8, 24, 32),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 3,
                                      height: 14,
                                      color: deepGold,
                                    ),
                                    const SizedBox(width: 8),
                                    const Text(
                                      'CATHOLIC DEVOTIONAL',
                                      style: TextStyle(
                                        fontFamily: 'Georgia',
                                        fontSize: 10,
                                        fontWeight: FontWeight.w600,
                                        color: deepGold,
                                        letterSpacing: 2.5,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  widget.prayerTitle,
                                  style: TextStyle(
                                    fontFamily: 'Georgia',
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    color: isDark
                                        ? theme.colorScheme.onSurface
                                        : const Color(0xFF2D1B4E),
                                    height: 1.2,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        height: 0.5,
                                        color: deepGold.withValues(alpha: 0.4),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12),
                                      child: CustomPaint(
                                        size: const Size(12, 12),
                                        painter: _CrossOrnamentPainter(),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        height: 0.5,
                                        color: deepGold.withValues(alpha: 0.4),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 24),
                                if (steps != null)
                                  for (int i = 0; i < steps.length; i++) ...[
                                    Builder(
                                      builder: (context) {
                                        final bool isFocused =
                                        (_focusedStepIndex == i);
                                        final bool isDimmed =
                                        (_focusedStepIndex != null &&
                                            _focusedStepIndex != i);
                                        final animation = _getGlowAnimation(i);
                                        final stepData = steps[i];

                                        return GestureDetector(
                                          onTap: () => _onTapParagraph(i),
                                          behavior: HitTestBehavior.opaque,
                                          child: AnimatedBuilder(
                                            animation: animation,
                                            builder: (context, child) {
                                              return AnimatedOpacity(
                                                duration: const Duration(
                                                    milliseconds: 300),
                                                opacity: isDimmed ? 0.38 : 1.0,
                                                child: Stack(
                                                  children: [
                                                    if (isFocused ||
                                                        animation.value > 0.0)
                                                      Positioned.fill(
                                                        child: Opacity(
                                                          opacity:
                                                          animation.value,
                                                          child: Container(
                                                            decoration:
                                                            BoxDecoration(
                                                              color: isDark
                                                                  ? theme.colorScheme.primary.withValues(alpha: 0.2)
                                                                  : const Color(0xFFFFF3C4).withValues(alpha: 0.65),
                                                              borderRadius:
                                                              BorderRadius.circular(10),
                                                              border: Border.all(
                                                                color: goldAccent.withValues(alpha: 0.35 * animation.value),
                                                              ),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: deepGold.withValues(alpha: 0.15 * animation.value),
                                                                  blurRadius: 16,
                                                                  spreadRadius: 1,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    Padding(
                                                      padding: const EdgeInsets.symmetric(
                                                        horizontal: 12,
                                                        vertical: 12,
                                                      ),
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          if (stepData.sectionHeader != null &&
                                                              stepData.sectionHeader != 'reading focus') ...[
                                                            Row(
                                                              children: [
                                                                Container(
                                                                  width: 16,
                                                                  height: 1,
                                                                  color: theme.colorScheme.primary.withValues(alpha: 0.6),
                                                                ),
                                                                const SizedBox(width: 8),
                                                                Text(
                                                                  stepData.sectionHeader!.toUpperCase(),
                                                                  style: TextStyle(
                                                                    fontFamily: 'Georgia',
                                                                    fontSize: 11,
                                                                    fontWeight: FontWeight.bold,
                                                                    color: theme.colorScheme.primary,
                                                                    letterSpacing: 2.2,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            const SizedBox(height: 10),
                                                          ],
                                                          (i == 0)
                                                              ? _buildDropCapBody(stepData.contentEn, textBodyColor)
                                                              : _buildStandardBody(stepData.contentEn, textBodyColor),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          ),
                                        );
                                      },
                                    ),
                                    if (i < steps.length - 1)
                                      const SizedBox(height: 16),
                                  ],
                                const SizedBox(height: 32),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 0.5,
                                      color: deepGold.withValues(alpha: 0.4),
                                    ),
                                    const Padding(
                                      padding:
                                      EdgeInsets.symmetric(horizontal: 12),
                                      child: Text(
                                        '✦',
                                        style: TextStyle(
                                          color: deepGold,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 50,
                                      height: 0.5,
                                      color: deepGold.withValues(alpha: 0.4),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                Center(
                                  child: Text(
                                    'Deo Gratias',
                                    style: TextStyle(
                                      fontFamily: 'Georgia',
                                      fontSize: 12,
                                      fontStyle: FontStyle.italic,
                                      color: textBodyColor.withValues(alpha: 0.5),
                                      letterSpacing: 1.5,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropCapBody(String text, Color textBodyColor) {
    if (text.isEmpty) return const SizedBox.shrink();
    final dropLetter = text[0];
    final remainder = text.substring(1);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8, bottom: 2),
          child: Text(
            dropLetter,
            style: const TextStyle(
              fontFamily: 'Georgia',
              fontSize: 68,
              fontWeight: FontWeight.bold,
              color: Color(0xFFC9922A),
              height: 0.85,
              letterSpacing: -2,
            ),
          ),
        ),
        Expanded(
          child: Text(
            remainder,
            style: TextStyle(
              fontFamily: 'Georgia',
              fontSize: 16.5,
              color: textBodyColor,
              height: 1.6,
              letterSpacing: 0.15,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStandardBody(String text, Color textBodyColor) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Georgia',
        fontSize: 16.5,
        color: textBodyColor,
        height: 1.6,
        letterSpacing: 0.15,
      ),
    );
  }
}

class _CrossOrnamentPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFC9922A)
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawLine(
      Offset(size.width / 2, 0),
      Offset(size.width / 2, size.height),
      paint,
    );
    canvas.drawLine(
      Offset(0, size.height * 0.35),
      Offset(size.width, size.height * 0.35),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _GothicArchPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0x12C9922A)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    for (int i = 0; i < 8; i++) {
      final x = size.width * (i / 7.0);
      final path = Path()
        ..moveTo(x, size.height)
        ..quadraticBezierTo(x, size.height * 0.2, size.width / 2, 0);
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}