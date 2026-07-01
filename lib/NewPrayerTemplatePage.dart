import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:operation_001/prayer_data.dart';
import 'package:operation_001/prayer_model.dart';

class Newprayertemplatepage extends StatefulWidget {
  final String prayerTitle;
  final String prayerImage;

  Newprayertemplatepage({
    required this.prayerTitle,
    required this.prayerImage,
  });

  @override
  State<Newprayertemplatepage> createState() => _NewprayertemplatepageState();
}

class _NewprayertemplatepageState extends State<Newprayertemplatepage> with TickerProviderStateMixin {
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
    final steps = prayer_data.masterPrayerDB[widget.prayerTitle];

    final double fullHeight = MediaQuery.of(context).size.height;
    final double dynamicImageHeight = isPraying ? fullHeight * 0.45 : fullHeight;
    final double manuscriptTop = isPraying ? fullHeight * 0.38 : fullHeight;

    return PopScope(
      canPop: !isPraying,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        if (isPraying) {
          if (_focusedStepIndex != null) _glowControllers[_focusedStepIndex!]?.reverse();
          setState(() {
            isPraying = false;
            _focusedStepIndex = null;
          });
        }
      },
      child: Scaffold(
        backgroundColor: const Color(0xFF1A0F2E), // Premium deep ink background
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Color(0xFFE8B84B), size: 20),
            onPressed: () {
              if (isPraying) {
                if (_focusedStepIndex != null) _glowControllers[_focusedStepIndex!]?.reverse();
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
                      decoration: const BoxDecoration(
                        gradient: RadialGradient(
                          center: Alignment(0.0, -0.3),
                          radius: 1.4,
                          colors: [Color(0xFF3D1F5C), Color(0xFF1E0E38), Color(0xFF0D0718)],
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
                          const Color(0xFF1A0F2E).withOpacity(0.4),
                          const Color(0xFF1A0F2E).withOpacity(0.85),
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
                        color: const Color(0xFF1A0F2E).withOpacity(0.45),
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(color: const Color(0xFFC9922A).withOpacity(0.2)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'MOMENT OF PEACE',
                            style: TextStyle(
                              fontFamily: 'Georgia',
                              color: Color(0xFFE8B84B),
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
                              color: Color(0xFFC9922A),
                            ),
                          ),
                          const Spacer(),
                          FloatingActionButton.extended(
                            backgroundColor: const Color(0xFFF5EFD7),
                            elevation: 4,
                            onPressed: () => setState(() => isPraying = true),
                            label: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: Text(
                                'LET US PRAY',
                                style: TextStyle(
                                  fontFamily: 'Georgia',
                                  color: Color(0xFF1A0F2E),
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
                    decoration: const BoxDecoration(
                      color: Color(0xFFF5EFD7), // Premium Vellum
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(28),
                        topRight: Radius.circular(28),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x66000000),
                          blurRadius: 30,
                          offset: Offset(0, -10),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        // Drag Handle / Indicator Top Padding
                        Padding(
                          padding: const EdgeInsets.only(top: 14, bottom: 6),
                          child: Container(
                            width: 42,
                            height: 4,
                            decoration: BoxDecoration(
                              color: const Color(0xFFEDE3C0),
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                        ),

                        // Scrollable Body Content
                        Expanded(
                          child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            padding: const EdgeInsets.fromLTRB(24, 8, 24, 32),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                // Title Header Eyebrow
                                Row(
                                  children: [
                                    Container(width: 3, height: 14, color: const Color(0xFFC9922A)),
                                    const SizedBox(width: 8),
                                    const Text(
                                      'CATHOLIC DEVOTIONAL',
                                      style: TextStyle(
                                        fontFamily: 'Georgia',
                                        fontSize: 10,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFFC9922A),
                                        letterSpacing: 2.5,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  widget.prayerTitle,
                                  style: const TextStyle(
                                    fontFamily: 'Georgia',
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF2D1B4E),
                                    height: 1.2,
                                  ),
                                ),
                                const SizedBox(height: 16),

                                // Beautiful Gold Ornamental Liturgical Rule
                                Row(
                                  children: [
                                    Expanded(child: Container(height: 0.5, color: const Color(0xFFC9922A).withOpacity(0.4))),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 12),
                                      child: CustomPaint(
                                        size: const Size(12, 12),
                                        painter: _CrossOrnamentPainter(),
                                      ),
                                    ),
                                    Expanded(child: Container(height: 0.5, color: const Color(0xFFC9922A).withOpacity(0.4))),
                                  ],
                                ),
                                const SizedBox(height: 24),

                                // Looping through sections dynamically
                                if (steps != null)
                                  for (int i = 0; i < steps.length; i++) ...[
                                    Builder(
                                      builder: (context) {
                                        final bool isFocused = (_focusedStepIndex == i);
                                        final bool isDimmed = (_focusedStepIndex != null && _focusedStepIndex != i);
                                        final animation = _getGlowAnimation(i);
                                        final stepData = steps[i];

                                        return GestureDetector(
                                          onTap: () => _onTapParagraph(i),
                                          behavior: HitTestBehavior.opaque,
                                          child: AnimatedBuilder(
                                            animation: animation,
                                            builder: (context, child) {
                                              return AnimatedOpacity(
                                                duration: const Duration(milliseconds: 300),
                                                opacity: isDimmed ? 0.38 : 1.0,
                                                child: Stack(
                                                  children: [
                                                    // Sacred Candle Glow Highlighting Container
                                                    if (isFocused || animation.value > 0.0)
                                                      Positioned.fill(
                                                        child: Opacity(
                                                          opacity: animation.value,
                                                          child: Container(
                                                            decoration: BoxDecoration(
                                                              color: const Color(0xFFFFF3C4).withOpacity(0.65),
                                                              borderRadius: BorderRadius.circular(10),
                                                              border: Border.all(
                                                                color: const Color(0xFFE8B84B).withOpacity(0.35 * animation.value),
                                                              ),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: const Color(0xFFC9922A).withOpacity(0.15 * animation.value),
                                                                  blurRadius: 16,
                                                                  spreadRadius: 1,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),

                                                    // Text Layout Padding
                                                    Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          // Display Custom Label Line if present and not 'reading focus'
                                                          if (stepData.sectionHeader != null && stepData.sectionHeader != 'reading focus') ...[
                                                            Row(
                                                              children: [
                                                                Container(width: 16, height: 1, color: const Color(0xFF5C1A6B).withOpacity(0.4)),
                                                                const SizedBox(width: 8),
                                                                Text(
                                                                  stepData.sectionHeader!.toUpperCase(),
                                                                  style: const TextStyle(
                                                                    fontFamily: 'Georgia',
                                                                    fontSize: 11,
                                                                    fontWeight: FontWeight.bold,
                                                                    color: Color(0xFF5C1A6B),
                                                                    letterSpacing: 2.2,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            const SizedBox(height: 10),
                                                          ],

                                                          // Core Content Logic (Initial Drop-Cap vs Standard Block)
                                                          (i == 0)
                                                              ? _buildDropCapBody(stepData.contentEn)
                                                              : _buildStandardBody(stepData.contentEn),
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
                                    if (i < steps.length - 1) const SizedBox(height: 16),
                                  ],

                                // Bottom Finishing Ornament
                                const SizedBox(height: 32),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(width: 50, height: 0.5, color: const Color(0xFFC9922A).withOpacity(0.4)),
                                    const Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 12),
                                      child: Text('✦', style: TextStyle(color: Color(0xFFC9922A), fontSize: 12)),
                                    ),
                                    Container(width: 50, height: 0.5, color: const Color(0xFFC9922A).withOpacity(0.4)),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                const Center(
                                  child: Text(
                                    'Deo Gratias',
                                    style: TextStyle(
                                      fontFamily: 'Georgia',
                                      fontSize: 12,
                                      fontStyle: FontStyle.italic,
                                      color: Color(0x732D1B4E),
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

  // Helper Widget: Renders the Illuminated Manuscript Giant Drop Cap
  Widget _buildDropCapBody(String text) {
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
            style: const TextStyle(
              fontFamily: 'Georgia',
              fontSize: 16.5,
              color: Color(0xFF1A0F2E),
              height: 1.6,
              letterSpacing: 0.15,
            ),
          ),
        ),
      ],
    );
  }

  // Helper Widget: Standard Book Body Paragraphs
  Widget _buildStandardBody(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontFamily: 'Georgia',
        fontSize: 16.5,
        color: Color(0xFF1A0F2E),
        height: 1.6,
        letterSpacing: 0.15,
      ),
    );
  }
}

// Custom Painter: Draws Elegant Liturgical Cross in the middle of lines
class _CrossOrnamentPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFC9922A)
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawLine(Offset(size.width / 2, 0), Offset(size.width / 2, size.height), paint);
    canvas.drawLine(Offset(0, size.height * 0.35), Offset(size.width, size.height * 0.35), paint);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Custom Painter: Draws Gothic Arch overlay paths for background asset failure fallback
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