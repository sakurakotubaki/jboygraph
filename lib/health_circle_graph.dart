// lib/health_circle_graph/health_circle_graph.dart

import 'dart:math';
import 'package:flutter/material.dart';

class HealthCircleGraph extends StatelessWidget {
  final double healthValue;
  final Color linePercentColor;

  const HealthCircleGraph({
    super.key,
     required this.healthValue,
     required this.linePercentColor,
     });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end: 2 * pi * (healthValue / 50)),
          duration: Duration(seconds: 5),
          builder: (BuildContext context, double angle, Widget? child) {
            return CustomPaint(
              size: Size(200, 200),
              painter: CirclePainter(
                angle: angle,
                lineChildColor: linePercentColor,
              ),
            );
          },
        ),
        Text(
          '${healthValue.toInt()}',
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class CirclePainter extends CustomPainter {
  final double angle;
  final Color lineChildColor;

  CirclePainter({
    required this.angle,
    required this.lineChildColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final outlinePaint = Paint()
      ..color = Colors.grey[300]!
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke;

    final fillPaint = Paint()
      ..color = lineChildColor
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke;

    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(size.width / 2, size.height / 2),
        width: size.width,
        height: size.height,
      ),
      0,
      2 * pi,
      false,
      outlinePaint,
    );

    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(size.width / 2, size.height / 2),
        width: size.width,
        height: size.height,
      ),
      -pi / 2,
      angle,
      false,
      fillPaint,
    );
  }

  @override
  bool shouldRepaint(CirclePainter oldDelegate) => oldDelegate.angle != angle;
}