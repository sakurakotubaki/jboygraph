import 'package:flutter/material.dart';

class Bubble {
  final double x;
  final double y;
  final double radius;
  final Color color;

  Bubble({required this.x, required this.y, required this.radius, required this.color});
}

class BubbleChartPainter extends CustomPainter {
  BubbleChartPainter({
    required this.bubbles,
  });
  final List<Bubble> bubbles;

  @override
  void paint(Canvas canvas, Size size) {
    for (final bubble in bubbles) {
      final paint = Paint()..color = bubble.color;
      canvas.drawCircle(Offset(bubble.x, bubble.y), bubble.radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}