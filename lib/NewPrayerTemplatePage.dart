import 'dart:ui';
import 'package:flutter/material.dart';
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

class _NewprayertemplatepageState extends State<Newprayertemplatepage> {
  bool isPraying = false;
  double _scrollOffset = 0.0;

  @override
  Widget build(BuildContext context) {
    final steps = prayer_data.masterPrayerDB[widget.prayerTitle];
    final String prayerContent = (steps != null && steps.isNotEmpty)
        ? steps[0].contentEn
        : 'Prayer text coming soon...';

    final double fullHeight = MediaQuery.of(context).size.height;
    final double dynamicImageHeight = isPraying ? fullHeight * 0.5 : fullHeight;

    final double manuscriptTop    = isPraying ? fullHeight * 0.45 : fullHeight;
    final double manuscriptHeight = fullHeight * 0.55;

    return PopScope(
      canPop: !isPraying,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        if (isPraying) setState(() => isPraying = false);
      },
      child: Scaffold(
        backgroundColor: const Color(0xFF1A1A1A),
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: isPraying
              ? null
              : Text(widget.prayerTitle,
              style: const TextStyle(color: Colors.white)),
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              if (isPraying) {
                setState(() => isPraying = false);
              } else {
                Navigator.pop(context);
              }
            },
          ),
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [

            // ── 1. Background Image ──────────────────────────────────────────
            Positioned(
              top: -(_scrollOffset * 0.38),
              left: 0,
              right: 0,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOutCubic,
                height: dynamicImageHeight,
                child: Image.asset(
                  widget.prayerImage,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),

            // ── 2. Full-Screen Blur (welcome state only) ─────────────────────
            if (!isPraying) ...[
              Positioned(
                top: -(_scrollOffset * 0.38),
                left: 0,
                right: 0,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOutCubic,
                  height: dynamicImageHeight,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      child: Container(
                        color: Colors.black.withOpacity(0.45),
                      ),
                    ),
                  ),
                ),
              ),
            ],

            // ── 3. "Moment of Peace" Card (welcome state only) ───────────────
            if (!isPraying) ...[
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      height: fullHeight * 0.49,
                      padding: const EdgeInsets.all(25),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(color: Colors.white10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'MOMENT OF PEACE',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2.5,
                            ),
                          ),
                          const SizedBox(height: 6),
                          const Text(
                            'Peace That Surpasses',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 0.5,
                            ),
                          ),
                          const SizedBox(height: 24),
                          const Text(
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
                          const Text(
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
                              color: Colors.white38.withOpacity(0.7),
                              letterSpacing: 0.5,
                            ),
                          ),
                          const SizedBox(height: 20),
                          FloatingActionButton.extended(
                            backgroundColor: Colors.white.withOpacity(0.9),
                            elevation: 0,
                            onPressed: () => setState(() => isPraying = true),
                            label: const Text(
                              'LET US PRAY',
                              style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.5,
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

            // ── 4. Sliding Manuscript ────────────────────────────────────────
            // ✅ AnimatedPositioned is now the DIRECT child of Stack.
            // IgnorePointer and AnimatedOpacity live inside it, so Stack's
            // StackFit.expand can no longer inflate them to full screen.
            AnimatedPositioned(
              duration: const Duration(milliseconds: 550),
              curve: Curves.easeOutCubic,
              top: manuscriptTop,
              left: 0,
              right: 0,
              height: manuscriptHeight,
              child: IgnorePointer(
                ignoring: !isPraying,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 450),
                  opacity: isPraying ? 1.0 : 0.0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFF5EFD7),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 10,
                          offset: const Offset(0, -5),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            Center(
                              child: Container(
                                margin: const EdgeInsets.symmetric(vertical: 20),
                                width: 40,
                                height: 4,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFD6CDB0),
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              ),
                            ),
                            const Text(
                              'CATHOLIC DEVOTIONAL',
                              style: TextStyle(
                                color: Color(0xFFC9922A),
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2.0,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 30),
                              child: Text(
                                widget.prayerTitle.toUpperCase(),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Color(0xFF1A0F2E),
                                  fontSize: 24,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 60),
                              child: Divider(
                                color: const Color(0xFFC9922A).withOpacity(0.5),
                                thickness: 1,
                              ),
                            ),
                            const SizedBox(height: 30),

                            // ── Embed prayer text content below this line ──
                          ],
                        ),
                      ),
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
}