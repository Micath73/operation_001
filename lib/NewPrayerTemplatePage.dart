import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:operation_001/prayer_data.dart';
import 'package:operation_001/prayer_model.dart';
class Newprayertemplatepage extends StatefulWidget {

  final String prayerTitle;
  final String prayerImage;

  Newprayertemplatepage({
    required this.prayerTitle, required this.prayerImage,
});

  @override
  State<Newprayertemplatepage> createState() => _NewprayertemplatepageState();
}

class _NewprayertemplatepageState extends State<Newprayertemplatepage> {

  bool isPraying=false;
  double _scrollOffset = 0.0;

  @override
  Widget build(BuildContext context) {
    final steps = prayer_data.masterPrayerDB[widget.prayerTitle];
    final String prayerContent = (steps != null && steps.isNotEmpty)
        ? steps[0].contentEn
        : 'Prayer text coming soon...';
    return PopScope(
      canPop: !isPraying,
      onPopInvokedWithResult: (didPop,result){
        if(didPop) return;
        if(isPraying==true){
          setState(() {
            isPraying=false;
          });
        }
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFF5EFD7),
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: isPraying ? null : Text(widget.prayerTitle,style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              if (isPraying == true) {
                setState(() {
                  isPraying = false; // Gracefully step back out to the card view
                });
              } else {
                Navigator.pop(context); // Pop the screen back to the homepage
              }
            },
          ),
        ),
        body: Stack(
          fit: StackFit.expand,
              children: [
                Positioned(
          top: -(_scrollOffset * 0.38), // This math creates the parallax speed!
          left: 0,
          right: 0,
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: Image.asset(
                    widget.prayerImage,
                    fit: BoxFit.cover,
                    width: double.infinity),
                ),

                Positioned(
                  top: -(_scrollOffset * 0.38), // This math creates the parallax speed!
                  left: 0,
                  right: 0,
                  height: MediaQuery.of(context).size.height * 0.5,

                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      child: Container(
                        height: double.infinity,
                        width: double.infinity,
                        color: Colors.black.withOpacity(0.45),
                      ),
                    ),
                  ),
                ),

                if(isPraying==false) ...[

                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.85,
                          height: MediaQuery.of(context).size.height * 0.49,
                          padding: EdgeInsets.all(25),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.4), // Semi-transparent dark background
                            borderRadius: BorderRadius.circular(20.0), // Rounded modern corners
                            border: Border.all(color: Colors.white10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'MOMENT OF PEACE',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 2.5, // Spreads out the letters for a modern aesthetic
                                ),
                              ),
                              const SizedBox(height: 6),

                              Text(
                                'Peace That Surpasses',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 26,
                                  fontWeight: FontWeight.w800,
                                  letterSpacing: 0.5,
                                ),
                              ),
                              const SizedBox(height: 24),

                              Text(
                                '"At dawn let me hear of your mercy,\nfor in you I trust.\nShow me the path I should walk,\nfor I lift up my soul to you."',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  height: 1.5,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                '— Psalm 143:8',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const Spacer(),

                              Text(
                                'Find Stillness. \nLet His Presence Fill You.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.white38.withOpacity(0.7), // Beautifully muted gray-white
                                  letterSpacing: 0.5,

                                ),
                              ),

                              SizedBox(height: 20),
                              FloatingActionButton.extended(
                                backgroundColor: Colors.white.withOpacity(0.9), // Bright, glowing premium button face
                                elevation: 0,
                                onPressed: () {
                                  setState(() {
                                    isPraying = true;
                                  });
                                },
                                label: Text(
                                  'LET US PRAY',
                                  style: TextStyle(
                                    color: Colors.black87, // Dark text on light background ensures perfect contrast
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.5,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ]
                else ...[

                  SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: SafeArea(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(prayerContent,style: TextStyle(color: Colors.white),
                          ),
                        ),
                      )
                  ),
                ],
              ],
            ),

      ),
    );
  }
}
