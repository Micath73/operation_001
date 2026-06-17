import 'package:flutter/material.dart';

class SunRevealClipper extends CustomClipper<Path> {
  final double revealPercent;
  final Offset center; // The starting point (the button)

  SunRevealClipper(this.revealPercent, this.center);

  @override
  Path getClip(Size size) {
    Path path = Path();
    // 1. The full screen "Curtain"
    path.addRect(Rect.fromLTWH(0, 0, size.width, size.height));

    // 2. The expanding "Window"
    // We calculate a radius large enough to cover the whole screen eventually
    double maxRadius = size.longestSide * 1.5;
    double radius = maxRadius * revealPercent;

    Path circlePath = Path()
      ..addOval(Rect.fromCircle(
        center: center,
        radius: radius,
      ));

    // 3. Subtract the circle from the rectangle (The "Hole" effect)
    return Path.combine(PathOperation.difference, path, circlePath);
  }

  @override
  bool shouldReclip(SunRevealClipper oldClipper) =>
      revealPercent != oldClipper.revealPercent || center != oldClipper.center;
}