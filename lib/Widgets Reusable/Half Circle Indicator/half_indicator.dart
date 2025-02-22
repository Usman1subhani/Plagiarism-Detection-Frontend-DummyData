import 'package:flutter/material.dart';

class HalfCirclePainter extends CustomPainter {
  final double progress;
  final Color color;
  final Color backgroundColor;

  HalfCirclePainter({
    required this.progress,
    required this.color,
    required this.backgroundColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint backgroundPaint = Paint()
      ..color = backgroundColor
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Paint progressPaint = Paint()
      ..color = color
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    // Draw background half-circle
    canvas.drawArc(
      Rect.fromCircle(
          center: Offset(size.width / 2, size.height), radius: size.width / 2),
      -3.14, // Start angle at the left side
      3.14, // Sweep angle for half-circle
      false,
      backgroundPaint,
    );

    // Draw progress half-circle
    canvas.drawArc(
      Rect.fromCircle(
          center: Offset(size.width / 2, size.height), radius: size.width / 2),
      -3.14, // Start angle
      3.14 * progress, // Sweep angle based on progress
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
