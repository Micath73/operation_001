import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:operation_001/AngelusPrayerSession.dart';

class angelus extends StatefulWidget {
  final bool isAmharic;

  const angelus({
    super.key,
    this.isAmharic = false,
  });

  @override
  State<angelus> createState() => _angelusState();
}

class _angelusState extends State<angelus> {
  @override
  Widget build(BuildContext context) {
    final double fullHeight = MediaQuery.of(context).size.height;
    final double fullWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Stack(
        children: [
          // Background Image
          SizedBox.expand(
            child: Image.asset(
              'assets/img_19.png',
              fit: BoxFit.cover,
            ),
          ),

          // Central Frosted Glass Card
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaY: 8, sigmaX: 8),
                child: Container(
                  width: fullWidth * 0.86,
                  height: fullHeight * 0.54,
                  padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 24),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: const Color(0xFF1A0F2E).withOpacity(0.55),
                    border: Border.all(
                      color: const Color(0xFFC9922A).withOpacity(0.35),
                      width: 1.2,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // --- TITLE ---
                      Text(
                        widget.isAmharic ? 'የመልአኩ ሰላምታ' : 'THE ANGELUS',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontFamily: 'Georgia',
                          color: Color(0xFFE8B84B),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.8,
                          shadows: [
                            Shadow(
                              blurRadius: 10.0,
                              color: Color(0xFFC9922A),
                              offset: Offset(0, 0),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),

                      // Accent Divider
                      Container(
                        width: 40,
                        height: 1.5,
                        color: const Color(0xFFC9922A).withOpacity(0.6),
                      ),
                      const SizedBox(height: 20),

                      // --- QUOTE TEXT ---
                      Expanded(
                        child: Center(
                          child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: Text(
                              widget.isAmharic
                                  ? '"የእግዚአብሔር መልአክ ማርያምን አበሠራት፤ እርሷም በመንፈስ ቅዱስ ፀነሰች።"'
                                  : '"The Angel of the Lord declared unto Mary, and she conceived of the Holy Spirit."',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Georgia',
                                color: const Color(0xFFF5EFD7).withOpacity(0.95),
                                fontSize: 15,
                                fontStyle: FontStyle.italic,
                                height: 1.5,
                              ),
                            ),
                          ),
                        ),
                      ),

                      // Citation
                      Text(
                        '— Luke 1:38',
                        style: TextStyle(
                          fontFamily: 'Georgia',
                          color: const Color(0xFFE8B84B).withOpacity(0.8),
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 20),

                      // --- ACTION BUTTON ---
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFE8B84B),
                            foregroundColor: const Color(0xFF1A0F2E),
                            elevation: 4,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {
                            // Seamless In-Place Cross-Fade
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                transitionDuration: const Duration(milliseconds: 550),
                                reverseTransitionDuration: const Duration(milliseconds: 400),
                                pageBuilder: (context, animation, secondaryAnimation) =>
                                    AngelusPrayerSession(isAmharic: widget.isAmharic),
                                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                  return FadeTransition(
                                    opacity: CurvedAnimation(
                                      parent: animation,
                                      curve: Curves.easeInOut,
                                    ),
                                    child: child,
                                  );
                                },
                              ),
                            );
                          },
                          child: Text(
                            widget.isAmharic ? 'እንጸልይ' : 'LET US PRAY',
                            style: const TextStyle(
                              fontFamily: 'Georgia',
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.2,
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
        ],
      ),
    );
  }
}