import 'package:flutter/material.dart';
import '../models/roadmap_models.dart';

class PilgrimTrailPainter extends CustomPainter {
  final List<Offset> mainNodePositions;
  final Map<int, Offset> sideChapelPositions; // Maps main node index -> side chapel position
  final Color activeColor;
  final Color inactiveColor;

  PilgrimTrailPainter({
    required this.mainNodePositions,
    required this.sideChapelPositions,
    required this.activeColor,
    required this.inactiveColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (mainNodePositions.isEmpty) return;

    final linePaint = Paint()
      ..strokeWidth = 3.5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final sideLinePaint = Paint()
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    // 1. Draw connecting curved path for Main Spine
    final Path mainPath = Path();
    mainPath.moveTo(mainNodePositions.first.dx, mainNodePositions.first.dy);

    for (int i = 0; i < mainNodePositions.length - 1; i++) {
      final p1 = mainNodePositions[i];
      final p2 = mainNodePositions[i + 1];

      // Gentle S-curve between vertically stacked nodes
      final controlY = (p1.dy + p2.dy) / 2;
      mainPath.cubicTo(p1.dx, controlY, p2.dx, controlY, p2.dx, p2.dy);
    }

    linePaint.color = activeColor.withValues(alpha: 0.6);
    canvas.drawPath(mainPath, linePaint);

    // 2. Draw branching dashed lines to Side Chapels
    sideChapelPositions.forEach((mainIndex, sidePos) {
      if (mainIndex < mainNodePositions.length) {
        final mainPos = mainNodePositions[mainIndex];

        sideLinePaint.color = inactiveColor.withValues(alpha: 0.4);

        final sidePath = Path();
        sidePath.moveTo(mainPos.dx, mainPos.dy);

        final controlX = (mainPos.dx + sidePos.dx) / 2;
        sidePath.cubicTo(controlX, mainPos.dy, controlX, sidePos.dy, sidePos.dx, sidePos.dy);

        canvas.drawPath(sidePath, sideLinePaint);
      }
    });
  }

  @override
  bool shouldRepaint(covariant PilgrimTrailPainter oldDelegate) {
    return oldDelegate.mainNodePositions != mainNodePositions ||
        oldDelegate.sideChapelPositions != sideChapelPositions ||
        oldDelegate.activeColor != activeColor;
  }
}