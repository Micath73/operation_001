import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:operation_001/angelus_prayer_session.dart';

class AngelusScreen extends StatefulWidget {
  final bool isAmharic;

  const AngelusScreen({super.key, this.isAmharic = false});

  @override
  State<AngelusScreen> createState() => _AngelusScreenState();
}

// Backward compatibility aliases so legacy code doesn't break
typedef Angelus = AngelusScreen;
typedef angelus = AngelusScreen;

class _AngelusScreenState extends State<AngelusScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final double fullHeight = MediaQuery.of(context).size.height;
    final double fullWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Stack(
        children: [
          // 1. Background Image Asset
          SizedBox.expand(
            child: Image.asset('assets/img_19.png', fit: BoxFit.cover),
          ),

          // 2. Fixed Dark Blur Scrim
          Positioned.fill(
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 12.0, sigmaY: 12.0),
                child: Container(color: Colors.black.withValues(alpha: 0.55)),
              ),
            ),
          ),

          // 3. Central Glassmorphic Card
          Center(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaY: 10, sigmaX: 10),
                  child: Container(
                    width: fullWidth * 0.86,
                    constraints: BoxConstraints(
                      maxHeight: fullHeight * 0.60,
                      minHeight: 320,
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 22,
                      vertical: 24,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black.withValues(alpha: 0.63),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.16),
                        width: 1.2,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // --- TITLE ---
                        Text(
                          widget.isAmharic ? 'የመልአኩ ሰላምታ' : 'THE ANGELUS',
                          textAlign: TextAlign.center,
                          style: theme.textTheme.titleMedium?.copyWith(
                            color: theme.colorScheme.secondary,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.8,
                            shadows: [
                              Shadow(
                                blurRadius: 10.0,
                                color: theme.colorScheme.secondary.withValues(
                                  alpha: 0.5,
                                ),
                                offset: const Offset(0, 0),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 12),

                        // Accent Divider
                        Container(
                          width: 40,
                          height: 1.5,
                          color: theme.colorScheme.secondary.withValues(
                            alpha: 0.7,
                          ),
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
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: Colors.white.withValues(alpha: 0.9),
                                  fontStyle: FontStyle.italic,
                                  fontSize: 16,
                                  height: 1.5,
                                  shadows: [
                                    Shadow(
                                      blurRadius: 6,
                                      color: Colors.black.withValues(
                                        alpha: 0.7,
                                      ),
                                      offset: const Offset(1, 1),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),

                        // Citation
                        Text(
                          '— Luke 1:38',
                          style: theme.textTheme.labelMedium?.copyWith(
                            color: theme.colorScheme.secondary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 20),

                        // --- ACTION BUTTON ---
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: theme.colorScheme.primary,
                              foregroundColor: theme.colorScheme.onPrimary,
                              elevation: 6,
                              padding: const EdgeInsets.symmetric(
                                vertical: 14,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  transitionDuration: const Duration(
                                    milliseconds: 550,
                                  ),
                                  reverseTransitionDuration: const Duration(
                                    milliseconds: 400,
                                  ),
                                  pageBuilder: (
                                      context,
                                      animation,
                                      secondaryAnimation,
                                      ) => AngelusPrayerSession(
                                    isAmharic: widget.isAmharic,
                                  ),
                                  transitionsBuilder: (
                                      context,
                                      animation,
                                      secondaryAnimation,
                                      child,
                                      ) {
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
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: theme.colorScheme.onPrimary,
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
          ),
        ],
      ),
    );
  }
}