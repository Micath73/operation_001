import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:operation_001/prayer_model.dart';
import 'package:operation_001/rosary_completion_screen.dart';

class prayer_session extends StatefulWidget {
  final List<PrayerStep> prayerSteps;
  final bool isAmharic;

  const prayer_session({
    super.key,
    required this.prayerSteps,
    this.isAmharic = false,
  });

  @override
  State<prayer_session> createState() => _prayer_sessionState();
}

class _prayer_sessionState extends State<prayer_session> {
  int _currentIndex = 0;
  double _currentPosition = 0.0;
  final double _totalDuration = 150.0;
  bool _isPlaying = false;

  String _formatDuration(double seconds) {
    int totalSeconds = seconds.toInt();
    int minutes = totalSeconds ~/ 60;
    int remainingSeconds = totalSeconds % 60;
    String secondsStr = remainingSeconds < 10 ? '0$remainingSeconds' : '$remainingSeconds';
    return '$minutes:$secondsStr';
  }

  void _nextPrayer() {
    if (_currentIndex < widget.prayerSteps.length - 1) {
      setState(() {
        _currentIndex++;
        _currentPosition = 0.0;
      });
    } else {
      // Navigate to the Completion Screen instead of showing a SnackBar
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => RosaryCompletionScreen(
            isAmharic: widget.isAmharic,
            mysteryTitle: widget.prayerSteps.first.sectionHeader ??
                (widget.isAmharic ? 'መደበኛ ጸሎት' : 'Rosary Session'),
          ),
        ),
      );
    }
  }

  void _previousPrayer() {
    if (_currentIndex > 0) {
      setState(() {
        _currentIndex--;
        _currentPosition = 0.0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentStep = widget.prayerSteps[_currentIndex];
    final String currentTitle = widget.isAmharic ? currentStep.titleAm : currentStep.titleEn;
    final String currentContent = widget.isAmharic ? currentStep.contentAm : currentStep.contentEn;

    final bool isMysteryStep = currentStep.sectionHeader == null &&
        (currentTitle.contains('Mystery') || currentTitle.contains('ምሥጢር'));

    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          currentStep.sectionHeader ?? (widget.isAmharic ? 'የጸሎት ጊዜ' : 'Prayer Session'),
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              child: Image.asset(
                currentStep.imagePath,
                key: ValueKey<String>(currentStep.imagePath),
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          ),
          Positioned.fill(
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
                child: Container(
                  color: Colors.black.withOpacity(0.40),
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Glassmorphic Audio Player Card
                          Container(
                            height: 110,
                            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(color: Colors.white.withOpacity(0.18), width: 1.2),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                                child: Container(
                                  color: Colors.white.withOpacity(0.08),
                                  padding: const EdgeInsets.symmetric(horizontal: 12),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: 80,
                                        width: 80,
                                        decoration: BoxDecoration(
                                          color: Colors.white24,
                                          image: DecorationImage(
                                            image: AssetImage(currentStep.imagePath),
                                            fit: BoxFit.cover,
                                          ),
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    currentTitle,
                                                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
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
                                                    _isPlaying ? Icons.pause : Icons.play_arrow,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 4),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Text(_formatDuration(_currentPosition), style: TextStyle(fontSize: 12, color: Colors.white.withOpacity(0.6))),
                                                Expanded(
                                                  child: SliderTheme(
                                                    data: SliderTheme.of(context).copyWith(
                                                      trackHeight: 3,
                                                      activeTrackColor: Colors.white,
                                                      inactiveTrackColor: Colors.white.withOpacity(0.2),
                                                      thumbColor: Colors.white,
                                                      thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6),
                                                      overlayShape: const RoundSliderOverlayShape(overlayRadius: 14),
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
                                                Text(_formatDuration(_totalDuration), style: TextStyle(fontSize: 12, color: Colors.white.withOpacity(0.6))),
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
                          const SizedBox(height: 16),

                          // Transparent Edge-Gradient Card for Scripture / Prayer
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: CustomPaint(
                              painter: GradientBorderPainter(
                                strokeWidth: 1.5,
                                radius: 20,
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.white.withOpacity(0.65),
                                    Colors.white.withOpacity(0.10),
                                    Colors.purpleAccent.withOpacity(0.35),
                                    Colors.white.withOpacity(0.50),
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                              ),
                              child: Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(22.0),
                                decoration: BoxDecoration(
                                  // Translucent tint lets background blur shine through
                                  color: Colors.black.withOpacity(0.22),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      currentTitle,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24,
                                        color: Colors.white,
                                        shadows: [
                                          Shadow(blurRadius: 8, color: Colors.black.withOpacity(0.5), offset: Offset(0, 2))
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    Divider(color: Colors.white.withOpacity(0.25), thickness: 1),
                                    const SizedBox(height: 12),
                                    Text(
                                      currentContent,
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white.withOpacity(0.95),
                                        height: 1.6,
                                        shadows: [
                                          Shadow(blurRadius: 6, color: Colors.black.withOpacity(0.8), offset: Offset(1, 1))
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          // Interactive/Separated Prayer Sequence Badges for Mysteries
                          if (isMysteryStep) ...[
                            const SizedBox(height: 18),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 4.0, bottom: 8.0),
                                    child: Text(
                                      widget.isAmharic ? 'የምስጢሩ ጸሎቶች sequence:' : 'PRAYER SEQUENCE',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.amber.shade200,
                                        letterSpacing: 1.1,
                                      ),
                                    ),
                                  ),
                                  Wrap(
                                    spacing: 8.0,
                                    runSpacing: 8.0,
                                    children: [
                                      _buildPrayerBadge(widget.isAmharic ? 'አባታችን ሆይ' : 'Our Father'),
                                      _buildPrayerBadge(widget.isAmharic ? '10x ጸጋ የሞለሽ' : '10x Hail Mary'),
                                      _buildPrayerBadge(widget.isAmharic ? 'ስብሐት ለአብ' : 'Glory Be'),
                                      _buildPrayerBadge(widget.isAmharic ? 'የፋጢማ ጸሎት' : 'Fatima Prayer'),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],

                          const SizedBox(height: 30),
                        ],
                      ),
                    ),
                  ),

                  // Bottom Action Buttons
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (_currentIndex > 0)
                          OutlinedButton.icon(
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: Colors.white.withOpacity(0.3)),
                              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                            ),
                            onPressed: _previousPrayer,
                            icon: const Icon(Icons.arrow_back, color: Colors.white, size: 18),
                            label: Text(
                              widget.isAmharic ? 'ወደ ኋላ' : 'BACK',
                              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                          )
                        else
                          const SizedBox.shrink(),
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurpleAccent,
                            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                            elevation: 6,
                          ),
                          onPressed: _nextPrayer,
                          label: Text(
                            _currentIndex == widget.prayerSteps.length - 1
                                ? (widget.isAmharic ? 'ጨርስ' : 'FINISH')
                                : (widget.isAmharic ? 'ቀጣይ ጸሎት' : 'NEXT PRAYER'),
                            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          icon: Icon(
                            _currentIndex == widget.prayerSteps.length - 1 ? Icons.check_circle : Icons.arrow_forward,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPrayerBadge(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.12),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.2)),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 13,
          fontWeight: FontWeight.w600,
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
    final Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..shader = gradient.createShader(rect);

    canvas.drawRRect(rrect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}