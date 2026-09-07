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

class _NewPrayerTemplatePageState extends State<NewPrayerTemplatePage> {
  bool isPraying = false;
  int? _focusedStepIndex;

  void _onTapParagraph(int index) {
    HapticFeedback.selectionClick();
    setState(() {
      if (_focusedStepIndex == index) {
        _focusedStepIndex = null;
      } else {
        _focusedStepIndex = index;
      }
    });
  }

  void _resetPrayerState() {
    setState(() {
      isPraying = false;
      _focusedStepIndex = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final steps = PrayerData.masterPrayerDB[widget.prayerTitle];

    final double fullHeight = MediaQuery.of(context).size.height;
    final double dynamicImageHeight =
    isPraying ? fullHeight * 0.45 : fullHeight;
    final double manuscriptTop = isPraying ? fullHeight * 0.38 : fullHeight;

    final goldAccent = theme.colorScheme.secondary;
    final deepGold =
    isDark ? const Color(0xFFE5C158) : theme.colorScheme.primary;

    final vellumSheetBg =
    isDark ? const Color(0xFF1C1A18) : const Color(0xFFF3EFE0);

    final textBodyColor =
    isDark ? const Color(0xFFECE6DA) : const Color(0xFF2C2523);

    return PopScope(
      canPop: !isPraying,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        if (isPraying) {
          _resetPrayerState();
        }
      },
      child: Scaffold(
        backgroundColor:
        isDark ? const Color(0xFF121212) : const Color(0xFF2A2421),
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: goldAccent,
              size: 20,
            ),
            onPressed: () {
              if (isPraying) {
                _resetPrayerState();
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
                      child: CustomPaint(
                        painter: _GothicArchPainter(
                          color: deepGold.withValues(alpha: 0.15),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withValues(alpha: 0.4),
                          Colors.black.withValues(alpha: 0.75),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // ── 2. Welcome State Heavy Backdrop Blur ─────────────────────────
            if (!isPraying)
              Positioned.fill(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
                  child: Container(
                    color: Colors.black.withValues(alpha: 0.45),
                  ),
                ),
              ),

            // ── 3. Intro Dashboard Glass Card ────────────────────────────────
            if (!isPraying)
              Center(
                child: _IntroDashboardCard(
                  prayerTitle: widget.prayerTitle,
                  goldAccent: goldAccent,
                  deepGold: deepGold,
                  isDark: isDark,
                  onStartPrayer: () => setState(() => isPraying = true),
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
                          color: Colors.black.withValues(alpha: 0.5),
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
                              color: deepGold.withValues(alpha: 0.5),
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
                                    Text(
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
                                    color: textBodyColor,
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
                                        painter: _CrossOrnamentPainter(
                                          color: deepGold,
                                        ),
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
                                    _PrayerStepItem(
                                      index: i,
                                      stepData: steps[i],
                                      isFocused: _focusedStepIndex == i,
                                      isDimmed: _focusedStepIndex != null &&
                                          _focusedStepIndex != i,
                                      isDark: isDark,
                                      deepGold: deepGold,
                                      goldAccent: goldAccent,
                                      textBodyColor: textBodyColor,
                                      onTap: () => _onTapParagraph(i),
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
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12),
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
}

class _PrayerStepItem extends StatefulWidget {
  final int index;
  final PrayerStep stepData;
  final bool isFocused;
  final bool isDimmed;
  final bool isDark;
  final Color deepGold;
  final Color goldAccent;
  final Color textBodyColor;
  final VoidCallback onTap;

  const _PrayerStepItem({
    required this.index,
    required this.stepData,
    required this.isFocused,
    required this.isDimmed,
    required this.isDark,
    required this.deepGold,
    required this.goldAccent,
    required this.textBodyColor,
    required this.onTap,
  });

  @override
  State<_PrayerStepItem> createState() => _PrayerStepItemState();
}

class _PrayerStepItemState extends State<_PrayerStepItem>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 350),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    );
  }

  @override
  void didUpdateWidget(covariant _PrayerStepItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isFocused != oldWidget.isFocused) {
      if (widget.isFocused) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      behavior: HitTestBehavior.opaque,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: widget.isDimmed ? 0.38 : 1.0,
            child: Stack(
              children: [
                if (widget.isFocused || _animation.value > 0.0)
                  Positioned.fill(
                    child: Opacity(
                      opacity: _animation.value,
                      child: Container(
                        decoration: BoxDecoration(
                          color: widget.isDark
                              ? widget.deepGold.withValues(alpha: 0.15)
                              : widget.deepGold.withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: widget.goldAccent.withValues(
                                alpha: 0.35 * _animation.value),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: widget.deepGold.withValues(
                                  alpha: 0.15 * _animation.value),
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
                      if (widget.stepData.sectionHeader != null &&
                          widget.stepData.sectionHeader != 'reading focus') ...[
                        Row(
                          children: [
                            Container(
                              width: 16,
                              height: 1,
                              color: widget.deepGold.withValues(alpha: 0.8),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              widget.stepData.sectionHeader!.toUpperCase(),
                              style: TextStyle(
                                fontFamily: 'Georgia',
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: widget.deepGold,
                                letterSpacing: 2.2,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                      ],
                      (widget.index == 0)
                          ? _buildDropCapBody(
                        widget.stepData.contentEn,
                        widget.textBodyColor,
                        widget.deepGold,
                      )
                          : _buildStandardBody(
                        widget.stepData.contentEn,
                        widget.textBodyColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildDropCapBody(
      String text, Color textBodyColor, Color dropColor) {
    if (text.isEmpty) return const SizedBox.shrink();
    final dropLetter = text[0];
    final remainder = text.substring(1);

    return Text.rich(
      TextSpan(
        children: [
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: Padding(
              padding: const EdgeInsets.only(right: 6.0),
              child: Text(
                dropLetter,
                style: TextStyle(
                  fontFamily: 'Georgia',
                  fontSize: 54,
                  fontWeight: FontWeight.bold,
                  color: dropColor,
                  height: 0.85,
                ),
              ),
            ),
          ),
          TextSpan(
            text: remainder,
            style: TextStyle(
              fontFamily: 'Georgia',
              fontSize: 16.5,
              color: textBodyColor,
              height: 1.6,
              letterSpacing: 0.15,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.left,
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

class _IntroDashboardCard extends StatelessWidget {
  final String prayerTitle;
  final Color goldAccent;
  final Color deepGold;
  final bool isDark;
  final VoidCallback onStartPrayer;

  const _IntroDashboardCard({
    required this.prayerTitle,
    required this.goldAccent,
    required this.deepGold,
    required this.isDark,
    required this.onStartPrayer,
  });

  @override
  Widget build(BuildContext context) {
    final welcomeCardBg = isDark
        ? Colors.black.withValues(alpha: 0.75)
        : const Color(0xFF2A2421).withValues(alpha: 0.88);

    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.86,
          height: MediaQuery.of(context).size.height * 0.54,
          padding: const EdgeInsets.all(28),
          decoration: BoxDecoration(
            color: welcomeCardBg,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: deepGold.withValues(alpha: 0.45),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.5),
                blurRadius: 25,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
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
                prayerTitle,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'Georgia',
                  color: Color(0xFFF5F0E6),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    '"At dawn let me hear of your mercy,\nfor in you I trust.\nShow me the path I should walk,\nfor I lift up my soul to you."',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Georgia',
                      color: const Color(0xFFE2DCD0).withValues(alpha: 0.9),
                      fontSize: 16,
                      height: 1.6,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '— Psalm 143:8',
                style: TextStyle(
                  fontFamily: 'Georgia',
                  fontSize: 13,
                  color: deepGold,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              FloatingActionButton.extended(
                backgroundColor: goldAccent,
                foregroundColor: Colors.black,
                elevation: 4,
                onPressed: onStartPrayer,
                label: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'LET US PRAY',
                    style: TextStyle(
                      fontFamily: 'Georgia',
                      color: Colors.black,
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
    );
  }
}

class _CrossOrnamentPainter extends CustomPainter {
  final Color color;

  _CrossOrnamentPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
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
  bool shouldRepaint(covariant _CrossOrnamentPainter oldDelegate) =>
      oldDelegate.color != color;
}

class _GothicArchPainter extends CustomPainter {
  final Color color;

  _GothicArchPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
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
  bool shouldRepaint(covariant _GothicArchPainter oldDelegate) =>
      oldDelegate.color != color;
}