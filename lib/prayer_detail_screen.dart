import 'package:flutter/material.dart';
import 'package:operation_001/novena_combo.dart';
import 'package:operation_001/prayer_data.dart';
import 'package:operation_001/prayer_model.dart';

class NovenaPrayerDetailScreen extends StatefulWidget {
  const NovenaPrayerDetailScreen({super.key, required this.prayer});

  final NovenaCombo prayer;

  @override
  State<NovenaPrayerDetailScreen> createState() => _NovenaPrayerDetailScreenState();
}

class _NovenaPrayerDetailScreenState extends State<NovenaPrayerDetailScreen> {
  int? _focusedStepIndex;

  late final List<PrayerStep> _steps = _resolveSteps();
  late final String _image = _resolveImage();

  List<PrayerStep> _resolveSteps() {
    final entry = PrayerData.masterPrayerDB.entries.firstWhere(
          (e) => e.key.trim().toLowerCase() == widget.prayer.text.trim().toLowerCase(),
      orElse: () => MapEntry(widget.prayer.text, const <PrayerStep>[]),
    );
    return entry.value;
  }

  String _resolveImage() {
    final path = widget.prayer.imagePath;
    final isPlaceholder = path.isEmpty ||
        path.contains('sunrise') ||
        path.contains('rosary');
    return isPlaceholder ? PrayerData.getImagePath(widget.prayer.text) : path;
  }

  void _onTapStep(int index) {
    setState(() {
      _focusedStepIndex = _focusedStepIndex == index ? null : index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final deepGold =
    isDark ? const Color(0xFFE5C158) : theme.colorScheme.primary;
    final vellumSheetBg =
    isDark ? const Color(0xFF1C1A18) : const Color(0xFFF3EFE0);
    final textBodyColor =
    isDark ? const Color(0xFFECE6DA) : const Color(0xFF2C2523);

    return Scaffold(
      backgroundColor: vellumSheetBg,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            stretch: true,
            backgroundColor: vellumSheetBg,
            iconTheme: IconThemeData(color: deepGold),
            flexibleSpace: FlexibleSpaceBar(
              titlePadding:
              const EdgeInsets.only(left: 56, right: 16, bottom: 16),
              title: Text(
                widget.prayer.text,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontFamily: 'Georgia',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  shadows: [Shadow(blurRadius: 8, color: Colors.black54)],
                ),
              ),
              background: Hero(
                tag: 'prayer-image-${widget.prayer.text}',
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      _image,
                      fit: BoxFit.cover,
                      // Focus alignment to top center so heads/halos are never cut off
                      alignment: Alignment.topCenter,
                      errorBuilder: (_, __, ___) => Container(
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
                      ),
                    ),
                    const DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.transparent, Colors.black87],
                          stops: [0.4, 1.0],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: RepaintBoundary(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 28, 24, 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Container(width: 3, height: 14, color: deepGold),
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
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: CustomPaint(
                            size: const Size(12, 12),
                            painter: _CrossOrnamentPainter(color: deepGold),
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
                    if (_steps.isEmpty)
                      Text(
                        'The text for this prayer is being added soon.',
                        style: TextStyle(
                          fontFamily: 'Georgia',
                          fontStyle: FontStyle.italic,
                          color: textBodyColor.withValues(alpha: 0.7),
                          fontSize: 16,
                        ),
                      )
                    else
                      for (int i = 0; i < _steps.length; i++) ...[
                        _PrayerStepItem(
                          index: i,
                          stepData: _steps[i],
                          isFocused: _focusedStepIndex == i,
                          isDimmed: _focusedStepIndex != null &&
                              _focusedStepIndex != i,
                          isDark: isDark,
                          deepGold: deepGold,
                          textBodyColor: textBodyColor,
                          onTap: () => _onTapStep(i),
                        ),
                        if (i < _steps.length - 1) const SizedBox(height: 16),
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
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Text('✦',
                              style: TextStyle(color: deepGold, fontSize: 12)),
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
          ),
        ],
      ),
    );
  }
}

class _PrayerStepItem extends StatelessWidget {
  const _PrayerStepItem({
    required this.index,
    required this.stepData,
    required this.isFocused,
    required this.isDimmed,
    required this.isDark,
    required this.deepGold,
    required this.textBodyColor,
    required this.onTap,
  });

  final int index;
  final PrayerStep stepData;
  final bool isFocused;
  final bool isDimmed;
  final bool isDark;
  final Color deepGold;
  final Color textBodyColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 250),
        opacity: isDimmed ? 0.38 : 1.0,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOut,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          decoration: BoxDecoration(
            color: isFocused
                ? deepGold.withValues(alpha: isDark ? 0.15 : 0.12)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: isFocused
                  ? deepGold.withValues(alpha: 0.35)
                  : Colors.transparent,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (stepData.sectionHeader != null &&
                  stepData.sectionHeader!.toLowerCase() != 'reading focus') ...[
                Row(
                  children: [
                    Container(width: 16, height: 1, color: deepGold.withValues(alpha: 0.8)),
                    const SizedBox(width: 8),
                    Text(
                      stepData.sectionHeader!.toUpperCase(),
                      style: TextStyle(
                        fontFamily: 'Georgia',
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: deepGold,
                        letterSpacing: 2.2,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
              ],
              index == 0
                  ? _DropCapBody(
                text: stepData.contentEn ?? '',
                textColor: textBodyColor,
                dropColor: deepGold,
              )
                  : _StandardBody(
                text: stepData.contentEn ?? '',
                textColor: textBodyColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DropCapBody extends StatelessWidget {
  const _DropCapBody({
    required this.text,
    required this.textColor,
    required this.dropColor,
  });

  final String text;
  final Color textColor;
  final Color dropColor;

  @override
  Widget build(BuildContext context) {
    if (text.isEmpty) return const SizedBox.shrink();
    final dropLetter = text[0];
    final remainder = text.substring(1);

    return Text.rich(
      TextSpan(
        children: [
          WidgetSpan(
            alignment: PlaceholderAlignment.baseline,
            baseline: TextBaseline.alphabetic,
            child: Padding(
              padding: const EdgeInsets.only(right: 6.0),
              child: Text(
                dropLetter,
                style: TextStyle(
                  fontFamily: 'Georgia',
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: dropColor,
                  height: 1.0,
                ),
              ),
            ),
          ),
          TextSpan(
            text: remainder,
            style: TextStyle(
              fontFamily: 'Georgia',
              fontSize: 16.5,
              color: textColor,
              height: 1.6,
              letterSpacing: 0.15,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.left,
    );
  }
}

class _StandardBody extends StatelessWidget {
  const _StandardBody({required this.text, required this.textColor});

  final String text;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Georgia',
        fontSize: 16.5,
        color: textColor,
        height: 1.6,
        letterSpacing: 0.15,
      ),
    );
  }
}

class _CrossOrnamentPainter extends CustomPainter {
  _CrossOrnamentPainter({required this.color});

  final Color color;

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