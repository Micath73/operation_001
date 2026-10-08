// lib/widgets/completion_effects.dart
import 'dart:math' as math;
import 'package:flutter/material.dart';

/// Stagger wrapper helper
class StaggerIn extends StatelessWidget {
  final Animation<double> animation;
  final double start;
  final double end;
  final double dy;
  final Widget child;

  const StaggerIn({
    super.key,
    required this.animation,
    required this.start,
    required this.end,
    this.dy = 24.0,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        final t = CurvedAnimation(
          parent: animation,
          curve: Interval(start, end, curve: Curves.easeOutCubic),
        ).value;

        return Opacity(
          opacity: t.clamp(0.0, 1.0),
          child: Transform.translate(
            offset: Offset(0, (1.0 - t) * dy),
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}

/// Animated checkmark badge drawn on canvas
class DrawnCheckBadge extends StatelessWidget {
  final Animation<double> progress;
  final Color color;
  final double size;

  const DrawnCheckBadge({
    super.key,
    required this.progress,
    required this.color,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: progress,
      builder: (context, _) {
        final circleT = Interval(0.0, 0.55, curve: Curves.easeOutCubic)
            .transform(progress.value);
        final checkT = Interval(0.55, 0.85, curve: Curves.elasticOut)
            .transform(progress.value);

        return CustomPaint(
          size: Size(size, size),
          painter: _BadgePainter(
            circleProgress: circleT,
            checkProgress: checkT,
            color: color,
          ),
        );
      },
    );
  }
}

class _BadgePainter extends CustomPainter {
  final double circleProgress;
  final double checkProgress;
  final Color color;

  _BadgePainter({
    required this.circleProgress,
    required this.checkProgress,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    // Outer Glowing Ring
    final ringPaint = Paint()
      ..color = color.withValues(alpha: 0.25 * circleProgress)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0;
    canvas.drawCircle(center, radius * circleProgress, ringPaint);

    // Inner Solid Circle
    final bgPaint = Paint()
      ..color = color.withValues(alpha: 0.15 * circleProgress)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, radius * 0.85 * circleProgress, bgPaint);

    // Checkmark Path Animation
    if (checkProgress > 0) {
      final checkPaint = Paint()
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeWidth = 4.0
        ..strokeCap = StrokeCap.round
        ..strokeJoin = StrokeJoin.round;

      final path = Path();
      final p1 = Offset(size.width * 0.32, size.height * 0.50);
      final p2 = Offset(size.width * 0.46, size.height * 0.64);
      final p3 = Offset(size.width * 0.68, size.height * 0.38);

      if (checkProgress <= 0.5) {
        final t = checkProgress / 0.5;
        path.moveTo(p1.dx, p1.dy);
        path.lineTo(
          p1.dx + (p2.dx - p1.dx) * t,
          p1.dy + (p2.dy - p1.dy) * t,
        );
      } else {
        final t = (checkProgress - 0.5) / 0.5;
        path.moveTo(p1.dx, p1.dy);
        path.lineTo(p2.dx, p2.dy);
        path.lineTo(
          p2.dx + (p3.dx - p2.dx) * t,
          p2.dy + (p3.dy - p2.dy) * t,
        );
      }
      canvas.drawPath(path, checkPaint);
    }
  }

  @override
  bool shouldRepaint(covariant _BadgePainter oldDelegate) => true;
}

/// Floating ambient particle effect
class IncenseParticles extends StatefulWidget {
  final Color color;

  const IncenseParticles({super.key, required this.color});

  @override
  State<IncenseParticles> createState() => _IncenseParticlesState();
}

class _IncenseParticlesState extends State<IncenseParticles>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  final List<_Particle> _particles = [];

  @override
  void initState() {
    super.initState();
    final rng = math.Random();
    for (int i = 0; i < 18; i++) {
      _particles.add(_Particle(rng));
    }
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return CustomPaint(
          painter: _IncensePainter(
            particles: _particles,
            progress: _controller.value,
            color: widget.color,
          ),
        );
      },
    );
  }
}

class _Particle {
  double x;
  double y;
  double speed;
  double radius;
  double alpha;

  _Particle(math.Random rng)
      : x = rng.nextDouble(),
        y = rng.nextDouble(),
        speed = 0.05 + rng.nextDouble() * 0.1,
        radius = 1.5 + rng.nextDouble() * 2.5,
        alpha = 0.2 + rng.nextDouble() * 0.4;
}

class _IncensePainter extends CustomPainter {
  final List<_Particle> particles;
  final double progress;
  final Color color;

  _IncensePainter({
    required this.particles,
    required this.progress,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    for (final p in particles) {
      final currentY = (p.y - progress * p.speed) % 1.0;
      final offset = Offset(p.x * size.width, currentY * size.height);
      final paint = Paint()
        ..color = color.withValues(alpha: p.alpha * (1.0 - currentY))
        ..style = PaintingStyle.fill;
      canvas.drawCircle(offset, p.radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

/// Count-up text roll-up animation
class CountUpText extends StatelessWidget {
  final Animation<double> animation;
  final int from;
  final int to;
  final double start;
  final double end;
  final TextStyle style;

  const CountUpText({
    super.key,
    required this.animation,
    required this.from,
    required this.to,
    required this.start,
    required this.end,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, _) {
        final t = Interval(start, end, curve: Curves.easeOutCubic)
            .transform(animation.value);
        final val = (from + (to - from) * t).round();
        return Text('$val', style: style);
      },
    );
  }
}

/// Gradient border painter for glassmorphic cards
class GradientBorderPainter extends CustomPainter {
  final double strokeWidth;
  final double radius;
  final Gradient gradient;

  GradientBorderPainter({
    required this.strokeWidth,
    required this.radius,
    required this.gradient,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Offset.zero & size;
    final RRect rrect = RRect.fromRectAndRadius(rect, Radius.circular(radius));
    final Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..shader = gradient.createShader(rect);

    canvas.drawRRect(rrect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}