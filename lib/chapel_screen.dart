import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:operation_001/divine_mercy_chaplet.dart';

class ChapletScreen extends StatefulWidget {
  const ChapletScreen({super.key});

  @override
  State<ChapletScreen> createState() => _ChapletScreenState();
}

// Retain aliases for backward compatibility across project imports
typedef Chaplet = ChapletScreen;
typedef chaplet = ChapletScreen;

class _ChapletScreenState extends State<ChapletScreen> {
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
            child: Image.asset('assets/img_3.png', fit: BoxFit.cover),
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
                          'THE DIVINE MERCY CHAPLET',
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
                                '"My daughter, encourage souls to say the chaplet which I have given you. It pleases Me to grant everything they ask of Me by saying the chaplet."',
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
                          '— Diary, 1541',
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
                              padding: const EdgeInsets.symmetric(vertical: 14),
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
                                      ) => const DivineMercyChaplet(),
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
                              'LET US PRAY',
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