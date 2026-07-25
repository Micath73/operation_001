import 'package:flutter/material.dart';
import 'dart:ui';

class prayer_session extends StatefulWidget {
  // 1. Declare parameters to pass in dynamically
  final String bgImage;
  final String title;
  final String prayerBody;

  const prayer_session({
    super.key,
    required this.bgImage,
    required this.title,
    required this.prayerBody,
  });

  @override
  State<prayer_session> createState() => _prayer_sessionState();
}

class _prayer_sessionState extends State<prayer_session> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // Using widget.title for the AppBar
        title: Text(widget.title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Stack(
        children: [
          // 1. DYNAMIC FULL-SCREEN BACKGROUND
          Positioned.fill(
            child: Image.asset(
              widget.bgImage,
              fit: BoxFit.cover,
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

          // 3. SCROLLABLE CONTENT LAYER
          Positioned.fill(
            child: SafeArea(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Mini-Player Card
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
                                      image: AssetImage(widget.bgImage), //
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
                                              widget.title, // 👈 Dynamic prayer title
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

                    // Left-aligned Dynamic Devotional Text
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.title,
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            widget.prayerBody,
                            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                        ],
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