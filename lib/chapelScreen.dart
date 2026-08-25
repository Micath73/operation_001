import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:operation_001/Divine_Mercy_Chaplet.dart';

class chaplet extends StatefulWidget {
  const chaplet({super.key});

  @override
  State<chaplet> createState() => _chapletState();
}

class _chapletState extends State<chaplet> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final double fullHeight = MediaQuery.of(context).size.height;
    final double fullWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: theme.colorScheme.onSurface),
      ),
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset(
              'assets/img_3.png',
              fit: BoxFit.cover,
            ),
          ),
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
                    color: theme.colorScheme.surface.withOpacity(0.85),
                    border: Border.all(
                      color: theme.colorScheme.secondary.withOpacity(0.5),
                      width: 1.2,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // --- TITLE ---
                      Text(
                        'THE DIVINE MERCY CHAPLET',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Georgia',
                          color: theme.colorScheme.secondary,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.8,
                          shadows: [
                            Shadow(
                              blurRadius: 10.0,
                              color: theme.colorScheme.secondary.withOpacity(0.4),
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
                        color: theme.colorScheme.secondary.withOpacity(0.6),
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
                              style: TextStyle(
                                fontFamily: 'Georgia',
                                color: theme.colorScheme.onSurface,
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
                        '— Diary, 1541',
                        style: TextStyle(
                          fontFamily: 'Georgia',
                          color: theme.colorScheme.secondary,
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
                            backgroundColor: theme.colorScheme.primary,
                            foregroundColor: theme.colorScheme.onPrimary,
                            elevation: 4,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {
                            // Smooth In-Place Cross-Fade Transition
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                transitionDuration: const Duration(milliseconds: 550),
                                reverseTransitionDuration: const Duration(milliseconds: 400),
                                pageBuilder: (context, animation, secondaryAnimation) =>
                                const DivineMercyChaplet(),
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
                          child: const Text(
                            'LET US PRAY',
                            style: TextStyle(
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