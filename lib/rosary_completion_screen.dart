import 'dart:math' as math;
import 'package:flutter/material.dart';

class RosaryCompletionScreen extends StatefulWidget {
  final bool isAmharic;
  final String mysteryTitle;

  const RosaryCompletionScreen({
    super.key,
    required this.isAmharic,
    required this.mysteryTitle,
  });

  @override
  State<RosaryCompletionScreen> createState() => _RosaryCompletionScreenState();
}

class _RosaryCompletionScreenState extends State<RosaryCompletionScreen>
    with TickerProviderStateMixin {
  // One-time entry animation
  late AnimationController _entryController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _riseAnimation;

  // Gold ring completion animation
  late AnimationController _ringController;
  late Animation<double> _ringSweep;

  // Gentle breathing glow behind the badge
  late AnimationController _breathController;
  late Animation<double> _breathAnimation;

  // Exact color palette matching Newprayertemplatepage
  static const Color _ink = Color(0xFF1A0F2E);
  static const Color _inkDeep = Color(0xFF0D0718);
  static const Color _gold = Color(0xFFC9922A);
  static const Color _goldLight = Color(0xFFE8B84B);
  static const Color _vellum = Color(0xFFF5EFD7);

  @override
  void initState() {
    super.initState();

    _entryController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    _fadeAnimation = CurvedAnimation(parent: _entryController, curve: Curves.easeOut);
    _riseAnimation = Tween<Offset>(
      begin: const Offset(0, 0.04),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _entryController, curve: Curves.easeOutCubic));

    _ringController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1100),
    );
    _ringSweep = CurvedAnimation(parent: _ringController, curve: Curves.easeInOutCubic);

    _breathController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3200),
    )..repeat(reverse: true);
    _breathAnimation = Tween<double>(begin: 0.97, end: 1.03).animate(
      CurvedAnimation(parent: _breathController, curve: Curves.easeInOut),
    );

    _entryController.forward();
    Future.delayed(const Duration(milliseconds: 250), () {
      if (mounted) _ringController.forward();
    });
  }

  @override
  void dispose() {
    _entryController.dispose();
    _ringController.dispose();
    _breathController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final dateString = "${now.day}/${now.month}/${now.year}";

    return Scaffold(
      backgroundColor: _ink,
      body: Stack(
        children: [
          // Ambient Radial Glow matching the dark prayer background
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: const Alignment(0.0, -0.35),
                  radius: 1.2,
                  colors: [
                    _gold.withOpacity(0.12),
                    _ink,
                    _inkDeep,
                  ],
                  stops: const [0.0, 0.55, 1.0],
                ),
              ),
            ),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(flex: 3),

                  // Animated Gold Badge & Breathing Glow
                  FadeTransition(
                    opacity: _fadeAnimation,
                    child: SlideTransition(
                      position: _riseAnimation,
                      child: AnimatedBuilder(
                        animation: Listenable.merge([_ringController, _breathController]),
                        builder: (context, child) {
                          return SizedBox(
                            width: 128,
                            height: 128,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Transform.scale(
                                  scale: _breathAnimation.value,
                                  child: Container(
                                    width: 112,
                                    height: 112,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: _gold.withOpacity(0.20),
                                          blurRadius: 36,
                                          spreadRadius: 4,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                CustomPaint(
                                  size: const Size(128, 128),
                                  painter: _CompletionRingPainter(
                                    progress: _ringSweep.value,
                                    color: _goldLight,
                                  ),
                                ),
                                Container(
                                  width: 84,
                                  height: 84,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: _vellum,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.3),
                                        blurRadius: 14,
                                        offset: const Offset(0, 6),
                                      ),
                                    ],
                                  ),
                                  child: const Icon(
                                    Icons.check_rounded,
                                    color: _ink,
                                    size: 40,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),

                  const SizedBox(height: 32),

                  // Eyebrow Label (Matches CATHOLIC DEVOTIONAL style)
                  FadeTransition(
                    opacity: _fadeAnimation,
                    child: const Text(
                      'DEVOTIONAL COMPLETE',
                      style: TextStyle(
                        fontFamily: 'Georgia',
                        color: _goldLight,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 3.0,
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Title Text (Matches Page Titles)
                  FadeTransition(
                    opacity: _fadeAnimation,
                    child: Text(
                      widget.isAmharic ? 'ጸሎቱ በስኬት ተጠናቋል' : 'Rosary Completed',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontFamily: 'Georgia',
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: _vellum,
                        letterSpacing: 0.3,
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Subtitle (Matches Verse Style)
                  FadeTransition(
                    opacity: _fadeAnimation,
                    child: Text(
                      widget.isAmharic
                          ? 'እግዚአብሔር ጸሎትህን/ሽን ይስማ'
                          : 'May God hear your prayer today',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Georgia',
                        fontSize: 15,
                        fontStyle: FontStyle.italic,
                        color: _vellum.withOpacity(0.85),
                        height: 1.4,
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Liturgical Gold Cross Ornamental Divider
                  FadeTransition(
                    opacity: _fadeAnimation,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 0.5,
                            color: _gold.withOpacity(0.4),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: CustomPaint(
                            size: const Size(12, 12),
                            painter: _CrossOrnamentPainter(color: _gold),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 0.5,
                            color: _gold.withOpacity(0.4),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const Spacer(flex: 2),

                  // Summary Card (Matches Intro Card Styling)
                  FadeTransition(
                    opacity: _fadeAnimation,
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(22),
                      decoration: BoxDecoration(
                        color: _ink.withOpacity(0.45),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: _gold.withOpacity(0.25), width: 1),
                      ),
                      child: Column(
                        children: [
                          _SummaryRow(
                            label: widget.isAmharic ? 'የጸሎት ዓይነት' : 'Mystery',
                            value: widget.mysteryTitle,
                            vellum: _vellum,
                            gold: _goldLight,
                          ),
                          const SizedBox(height: 14),
                          Divider(color: _gold.withOpacity(0.2), thickness: 0.6, height: 1),
                          const SizedBox(height: 14),
                          _SummaryRow(
                            label: widget.isAmharic ? 'ቀን' : 'Date',
                            value: dateString,
                            vellum: _vellum,
                            gold: _goldLight,
                          ),
                        ],
                      ),
                    ),
                  ),

                  const Spacer(flex: 3),

                  // Bottom Action Button (Matches LET US PRAY Button Style)
                  FadeTransition(
                    opacity: _fadeAnimation,
                    child: SizedBox(
                      width: double.infinity,
                      height: 54,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _vellum,
                          foregroundColor: _ink,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(27),
                          ),
                          elevation: 4,
                        ),
                        onPressed: () {
                          Navigator.of(context).popUntil((route) => route.isFirst);
                        },
                        child: Text(
                          widget.isAmharic ? 'ወደ ዋና ገጽ' : 'RETURN HOME',
                          style: const TextStyle(
                            fontFamily: 'Georgia',
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2.0,
                            color: _ink,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  final String label;
  final String value;
  final Color vellum;
  final Color gold;

  const _SummaryRow({
    required this.label,
    required this.value,
    required this.vellum,
    required this.gold,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label.toUpperCase(),
          style: TextStyle(
            fontFamily: 'Georgia',
            color: gold,
            fontSize: 11,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
        Flexible(
          child: Text(
            value,
            textAlign: TextAlign.end,
            style: TextStyle(
              fontFamily: 'Georgia',
              color: vellum,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}

// Gold completion ring painter
class _CompletionRingPainter extends CustomPainter {
  final double progress;
  final Color color;

  _CompletionRingPainter({required this.progress, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 3;

    final paint = Paint()
      ..color = color.withOpacity(0.9)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.2
      ..strokeCap = StrokeCap.round;

    const startAngle = -math.pi / 2;
    final sweepAngle = 2 * math.pi * progress;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant _CompletionRingPainter oldDelegate) =>
      oldDelegate.progress != progress;
}

// Liturgical Cross Ornament matching _CrossOrnamentPainter from Newprayertemplatepage
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

    canvas.drawLine(Offset(size.width / 2, 0), Offset(size.width / 2, size.height), paint);
    canvas.drawLine(Offset(0, size.height * 0.35), Offset(size.width, size.height * 0.35), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}