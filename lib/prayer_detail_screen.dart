import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:operation_001/controllers/language_controller.dart';
import 'package:operation_001/novena_combo.dart';
import 'package:operation_001/prayer_data.dart';
import 'package:operation_001/prayer_model.dart';
import 'package:share_plus/share_plus.dart';

class NovenaPrayerDetailScreen extends StatefulWidget {
  const NovenaPrayerDetailScreen({super.key, required this.prayer});

  final NovenaCombo prayer;

  @override
  State<NovenaPrayerDetailScreen> createState() =>
      _NovenaPrayerDetailScreenState();
}

class _NovenaPrayerDetailScreenState extends State<NovenaPrayerDetailScreen>
    with SingleTickerProviderStateMixin {
  int? _focusedStepIndex;
  double _fontSizeOffset = 0.0; // Dynamic font scaling (-4.0 to +8.0)

  late final List<PrayerStep> _steps = _resolveSteps();
  late final String _image = _resolveImage();

  late final AnimationController _animController;
  late final Animation<double> _fadeAnimation;

  List<PrayerStep> _resolveSteps() {
    return PrayerData.getPrayer(widget.prayer.text);
  }

  String _resolveImage() {
    final path = widget.prayer.imagePath;
    final isPlaceholder =
        path.isEmpty || path.contains('sunrise') || path.contains('rosary');
    return isPlaceholder ? PrayerData.getImagePath(widget.prayer.text) : path;
  }

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _animController,
      curve: Curves.easeOut,
    );
    _animController.forward();
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  void _onTapStep(int index) {
    setState(() {
      _focusedStepIndex = _focusedStepIndex == index ? null : index;
    });
  }

  void _zoomIn() {
    setState(() {
      if (_fontSizeOffset < 8.0) _fontSizeOffset += 2.0;
    });
  }

  void _zoomOut() {
    setState(() {
      if (_fontSizeOffset > -4.0) _fontSizeOffset -= 2.0;
    });
  }

  void _resetZoom() {
    setState(() {
      _fontSizeOffset = 0.0;
    });
  }

  void _sharePrayer(String title, String langCode) {
    final buffer = StringBuffer();
    buffer.writeln('🕊️ $title\n');
    for (var step in _steps) {
      if (step.sectionHeader != null && step.sectionHeader!.isNotEmpty) {
        buffer.writeln('--- ${step.sectionHeader} ---');
      }
      buffer.writeln(step.getContent(langCode));
      buffer.writeln();
    }
    buffer.writeln('Shared via Ethiopian Catholic Devotional App');
    Share.share(buffer.toString());
  }

  void _copyPrayerText(String langCode) {
    final buffer = StringBuffer();
    for (var step in _steps) {
      buffer.writeln(step.getContent(langCode));
      buffer.writeln();
    }
    Clipboard.setData(ClipboardData(text: buffer.toString()));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Prayer text copied to clipboard'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final deepGold =
    isDark ? const Color(0xFFE5C158) : const Color(0xFFC5A059);
    final sheetBg =
    isDark ? const Color(0xFF1C1A18) : const Color(0xFFF3EFE0);
    final textColor =
    isDark ? const Color(0xFFECE6DA) : const Color(0xFF2C2523);

    return ListenableBuilder(
      listenable: LanguageController.instance,
      builder: (context, child) {
        final isAmharic = LanguageController.instance.isAmharic;
        final String langCode = isAmharic ? 'am' : 'en';

        final String displayTitle = PrayerData.getMainTitle(widget.prayer.text, langCode);

        return Scaffold(
          backgroundColor: isDark ? Colors.black : const Color(0xFF12100E),
          body: FadeTransition(
            opacity: _fadeAnimation,
            child: Stack(
              fit: StackFit.expand,
              children: [
                // 1. Immersive Background Sacred Artwork
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  height: MediaQuery.of(context).size.height * 0.58,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(
                        _image,
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                        errorBuilder: (_, __, ___) => Container(color: sheetBg),
                      ),
                      const DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.black87,
                              Colors.transparent,
                              Colors.black54,
                            ],
                            stops: [0.0, 0.4, 1.0],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // 2. Floating Header Action Bar (Back, Zoom, Share, 3-Dot Menu)
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: SafeArea(
                    child: Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Back Button
                          IconButton(
                            icon: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.black.withValues(alpha: 0.5),
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: deepGold.withValues(alpha: 0.5)),
                              ),
                              child: Icon(Icons.arrow_back_rounded,
                                  color: deepGold, size: 20),
                            ),
                            onPressed: () => Navigator.of(context).pop(),
                          ),

                          // Pro Action Tools (Zoom A-, Zoom A+, Share, 3-Dot Menu)
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // Zoom Out Button (A-)
                              IconButton(
                                tooltip: 'Decrease Text Size',
                                icon: Container(
                                  padding: const EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                    color: Colors.black.withValues(alpha: 0.5),
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: deepGold.withValues(alpha: 0.4)),
                                  ),
                                  child: Text(
                                    'A-',
                                    style: TextStyle(
                                      fontFamily: 'Georgia',
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                      color: deepGold,
                                    ),
                                  ),
                                ),
                                onPressed: _zoomOut,
                              ),
                              // Zoom In Button (A+)
                              IconButton(
                                tooltip: 'Increase Text Size',
                                icon: Container(
                                  padding: const EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                    color: Colors.black.withValues(alpha: 0.5),
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: deepGold.withValues(alpha: 0.4)),
                                  ),
                                  child: Text(
                                    'A+',
                                    style: TextStyle(
                                      fontFamily: 'Georgia',
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                      color: deepGold,
                                    ),
                                  ),
                                ),
                                onPressed: _zoomIn,
                              ),
                              // Share Button
                              IconButton(
                                tooltip: 'Share Prayer',
                                icon: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Colors.black.withValues(alpha: 0.5),
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: deepGold.withValues(alpha: 0.4)),
                                  ),
                                  child: Icon(Icons.share_rounded,
                                      color: deepGold, size: 16),
                                ),
                                onPressed: () =>
                                    _sharePrayer(displayTitle, langCode),
                              ),
                              // Pro 3-Dot Overflow Menu
                              PopupMenuButton<String>(
                                icon: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Colors.black.withValues(alpha: 0.5),
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: deepGold.withValues(alpha: 0.4)),
                                  ),
                                  child: Icon(Icons.more_vert_rounded,
                                      color: deepGold, size: 16),
                                ),
                                color: sheetBg,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14),
                                  side: BorderSide(
                                      color: deepGold.withValues(alpha: 0.3)),
                                ),
                                onSelected: (value) {
                                  if (value == 'copy') {
                                    _copyPrayerText(langCode);
                                  } else if (value == 'reset_zoom') {
                                    _resetZoom();
                                  }
                                },
                                itemBuilder: (BuildContext context) => [
                                  PopupMenuItem<String>(
                                    value: 'copy',
                                    child: Row(
                                      children: [
                                        Icon(Icons.copy_rounded,
                                            size: 16, color: deepGold),
                                        const SizedBox(width: 10),
                                        Text(
                                          isAmharic ? 'ጽሑፍ ቅዳ' : 'Copy Prayer Text',
                                          style: TextStyle(
                                            fontFamily: 'Georgia',
                                            fontSize: 13,
                                            color: textColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  PopupMenuItem<String>(
                                    value: 'reset_zoom',
                                    child: Row(
                                      children: [
                                        Icon(Icons.format_size_rounded,
                                            size: 16, color: deepGold),
                                        const SizedBox(width: 10),
                                        Text(
                                          isAmharic ? 'የፊደል መጠን መደበኛ አድርግ' : 'Reset Text Size',
                                          style: TextStyle(
                                            fontFamily: 'Georgia',
                                            fontSize: 13,
                                            color: textColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // 3. Curvy Vellum Reading Sheet
                DraggableScrollableSheet(
                  initialChildSize: 0.52,
                  minChildSize: 0.42,
                  maxChildSize: 0.92,
                  builder: (context, scrollController) {
                    return Container(
                      decoration: BoxDecoration(
                        color: sheetBg,
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(36),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.45),
                            blurRadius: 20,
                            offset: const Offset(0, -6),
                          ),
                        ],
                      ),
                      child: ListView(
                        controller: scrollController,
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.fromLTRB(24, 12, 24, 48),
                        children: [
                          Center(
                            child: Container(
                              width: 40,
                              height: 4,
                              margin: const EdgeInsets.only(bottom: 22),
                              decoration: BoxDecoration(
                                color: deepGold.withValues(alpha: 0.5),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          Text(
                            displayTitle,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Georgia',
                              fontSize: 22 + _fontSizeOffset,
                              fontWeight: FontWeight.bold,
                              color: textColor,
                              letterSpacing: 0.3,
                            ),
                          ),
                          const SizedBox(height: 14),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  width: 40,
                                  height: 0.5,
                                  color: deepGold.withValues(alpha: 0.5)),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: CustomPaint(
                                  size: const Size(10, 10),
                                  painter: _CrossOrnamentPainter(color: deepGold),
                                ),
                              ),
                              Container(
                                  width: 40,
                                  height: 0.5,
                                  color: deepGold.withValues(alpha: 0.5)),
                            ],
                          ),
                          const SizedBox(height: 24),
                          if (_steps.isEmpty)
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 40),
                              child: Text(
                                isAmharic
                                    ? 'የዚህ ጸሎት ጽሑፍ በቅርቡ ይታከላል።'
                                    : 'The text for this prayer is being added soon.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Georgia',
                                  fontStyle: FontStyle.italic,
                                  color: textColor.withValues(alpha: 0.7),
                                  fontSize: 16 + _fontSizeOffset,
                                ),
                              ),
                            )
                          else
                            for (int i = 0; i < _steps.length; i++) ...[
                              _PrayerStepItem(
                                index: i,
                                stepData: _steps[i],
                                langCode: langCode,
                                isAmharic: isAmharic,
                                fontSizeOffset: _fontSizeOffset,
                                isFocused: _focusedStepIndex == i,
                                isDimmed: _focusedStepIndex != null &&
                                    _focusedStepIndex != i,
                                isDark: isDark,
                                deepGold: deepGold,
                                textColor: textColor,
                                onTap: () => _onTapStep(i),
                              ),
                              if (i < _steps.length - 1)
                                const SizedBox(height: 18),
                            ],
                          const SizedBox(height: 36),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  width: 50,
                                  height: 0.5,
                                  color: deepGold.withValues(alpha: 0.4)),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 12),
                                child: Text('✦',
                                    style: TextStyle(
                                        color: deepGold, fontSize: 12)),
                              ),
                              Container(
                                  width: 50,
                                  height: 0.5,
                                  color: deepGold.withValues(alpha: 0.4)),
                            ],
                          ),
                          const SizedBox(height: 14),
                          Center(
                            child: Text(
                              'Deo Gratias',
                              style: TextStyle(
                                fontFamily: 'Georgia',
                                fontSize: 13,
                                fontStyle: FontStyle.italic,
                                color: textColor.withValues(alpha: 0.5),
                                letterSpacing: 1.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _PrayerStepItem extends StatelessWidget {
  const _PrayerStepItem({
    required this.index,
    required this.stepData,
    required this.langCode,
    required this.isAmharic,
    required this.fontSizeOffset,
    required this.isFocused,
    required this.isDimmed,
    required this.isDark,
    required this.deepGold,
    required this.textColor,
    required this.onTap,
  });

  final int index;
  final PrayerStep stepData;
  final String langCode;
  final bool isAmharic;
  final double fontSizeOffset;
  final bool isFocused;
  final bool isDimmed;
  final bool isDark;
  final Color deepGold;
  final Color textColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final contentText = stepData.getContent(langCode);

    // Null-safe resolution for header
    final String? rawHeader = isAmharic
        ? ((stepData.sectionHeaderAm != null && stepData.sectionHeaderAm!.isNotEmpty)
        ? stepData.sectionHeaderAm
        : stepData.sectionHeader)
        : stepData.sectionHeader;

    final bool hasHeader = rawHeader != null && rawHeader.trim().isNotEmpty;
    final String header = hasHeader ? rawHeader.trim() : '';

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 250),
        opacity: isDimmed ? 0.38 : 1.0,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOut,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isFocused
                ? deepGold.withValues(alpha: isDark ? 0.18 : 0.12)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: isFocused
                  ? deepGold.withValues(alpha: 0.4)
                  : Colors.transparent,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (hasHeader && header.toLowerCase() != 'reading focus') ...[
                Row(
                  children: [
                    Container(
                        width: 14,
                        height: 1,
                        color: deepGold.withValues(alpha: 0.8)),
                    const SizedBox(width: 8),
                    Text(
                      header.toUpperCase(),
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
                text: contentText,
                textColor: textColor,
                dropColor: deepGold,
                fontSizeOffset: fontSizeOffset,
              )
                  : _StandardBody(
                text: contentText,
                textColor: textColor,
                fontSizeOffset: fontSizeOffset,
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
    required this.fontSizeOffset,
  });

  final String text;
  final Color textColor;
  final Color dropColor;
  final double fontSizeOffset;

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
                  fontSize: 46 + fontSizeOffset,
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
              fontSize: 16.5 + fontSizeOffset,
              color: textColor,
              height: 1.65,
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
  const _StandardBody({
    required this.text,
    required this.textColor,
    required this.fontSizeOffset,
  });

  final String text;
  final Color textColor;
  final double fontSizeOffset;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Georgia',
        fontSize: 16.5 + fontSizeOffset,
        color: textColor,
        height: 1.65,
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