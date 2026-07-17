import 'package:flutter/material.dart';
import 'dart:ui';

class prayer_session extends StatefulWidget {
  const prayer_session({super.key});

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
      // 1. CRITICAL: Allows the background artwork underneath to show through the Scaffold
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Introduction', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Stack(
        children: [
          // 2. Full screen base layout image so there's always something to blur
          Positioned.fill(
            child: Image.asset(
              'assets/wmremove-transformed (3).jpeg',
              fit: BoxFit.cover,
            ),
          ),

          // 3. FULL SCREEN BLUR & DIM CONTAINER
          Positioned.fill(
            child: ClipRect( // Prevents full screen blur from bleeding into top status bars
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0), // Frosts the entire wallpaper
                child: Container(
                  color: Colors.black.withOpacity(0.55), // Dims the entire screen beautifully
                ),
              ),
            ),
          ),

          // 4. Interactive Player UI Elements
          SafeArea(
            child: Column(
              children: [
                Container(
                  height: 110,
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    // The crisp glass-lining catches the light perfectly now!
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
                                image: const DecorationImage(
                                  image: AssetImage('assets/wmremove-transformed (3).jpeg'),
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
                                      const Text(
                                        'Sign Of The Cross',
                                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                                      ),
                                      const Spacer(),
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
                SizedBox(height: 30),
                Text('Sign Of The Cross',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.white)),
                SizedBox(height: 20),
                Text('In The Name Of The Father,\nAnd Of The Son,\nAnd Of The Holy Spirit\nAmen',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white))
              ],
            ),
          ),
        ],
      ),
    );
  }
}