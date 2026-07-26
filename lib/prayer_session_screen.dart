import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:operation_001/prayer_model.dart';

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
  double _totalDuration = 150.0;
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
        _currentPosition = 0.0; // Reset player audio state when advancing step
      });
    } else {
      // Reached the end of the prayer sequence!
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            widget.isAmharic ? 'ጸሎቱ ተጠናቋል!' : 'Rosary Session Completed!',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.deepPurpleAccent,
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
    // Grab the current active prayer step object from the list
    final currentStep = widget.prayerSteps[_currentIndex];

    // Choose current language fields dynamically
    final String currentTitle = widget.isAmharic ? currentStep.titleAm : currentStep.titleEn;
    final String currentContent = widget.isAmharic ? currentStep.contentAm : currentStep.contentEn;

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
          // 1. DYNAMIC FULL-SCREEN BACKGROUND IMAGE
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

          // 2. FULL-SCREEN BLUR & DIM TINT
          Positioned.fill(
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
                child: Container(
                  color: Colors.black.withOpacity(0.55),
                ),
              ),
            ),
          ),

          // 3. SCROLLABLE CONTENT & CONTROLS
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
                          // Glassmorphic Player Card
                          Container(
                            height: 110,
                            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.white.withOpacity(0.15), width: 1.5),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                                child: Container(
                                  color: Colors.white.withOpacity(0.06),
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

                          const SizedBox(height: 30),

                          // Left-aligned Devotional Text Body
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  currentTitle,
                                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  currentContent,
                                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white, height: 1.4),
                                ),
                                const SizedBox(height: 30),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // 4. NAVIGATION ACTION BAR (PREVIOUS / NEXT BUTTONS)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Previous Button (disabled on the first prayer)
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

                        // Next Prayer Button
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
}