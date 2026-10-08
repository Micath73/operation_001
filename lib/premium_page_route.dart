import 'package:flutter/material.dart';

/// One transition, reused for every "open a prayer" push in the app.
///
/// It's deliberately boring: a short opacity fade plus a small upward
/// translate, both pure compositor-layer operations. No [BackdropFilter]
/// (blur is one of the single most expensive things you can animate on
/// Android — it forces a full-screen re-blur every frame), no [Opacity]
/// wrapping a large subtree (that forces Flutter into an offscreen
/// buffer for the whole child, which is exactly what a "manuscript
/// sliding up" sheet usually does by accident), and nothing here
/// triggers a `setState` rebuild during the animation — the transition
/// widgets (`FadeTransition`, `SlideTransition`) drive themselves off
/// the animation controller directly.
Route<T> premiumPageRoute<T>(Widget page) {
  return PageRouteBuilder<T>(
    transitionDuration: const Duration(milliseconds: 280),
    reverseTransitionDuration: const Duration(milliseconds: 220),
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final curved = CurvedAnimation(
        parent: animation,
        curve: Curves.easeOutCubic,
      );
      return FadeTransition(
        opacity: curved,
        child: SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, 0.04),
            end: Offset.zero,
          ).animate(curved),
          child: child,
        ),
      );
    },
  );
}