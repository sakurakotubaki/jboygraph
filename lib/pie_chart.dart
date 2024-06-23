import 'dart:math';
import 'package:flutter/material.dart';

class PieChartData {
  final double value;
  final String title;
  final Color color;

  PieChartData({required this.value, required this.title, required this.color});
}

class PieChart extends StatelessWidget {
  final List<PieChartData> data;

  const PieChart({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(200, 200), // PieChartのサイズ
      painter: PieChartPainter(data),
    );
  }
}

class PieChartPainter extends CustomPainter {
  List<PieChartData> data;
  PieChartPainter(this.data);

  @override
  void paint(Canvas canvas, Size size) {
    double total = data.fold(0, (sum, item) => sum + item.value);
    double startRadian = -pi / 2;
    final textPainter = TextPainter(
      textDirection: TextDirection.ltr,
    );
    final radius = size.width / 2;

    for (var section in data) {
      final paint = Paint()
        ..color = section.color
        ..style = PaintingStyle.fill;

      double sweepRadian = (section.value / total) * 2 * pi;
      canvas.drawArc(
        Rect.fromCenter(center: Offset(size.width / 2, size.height / 2), width: size.width, height: size.height),
        startRadian,
        sweepRadian,
        true,
        paint,
      );

      // タイトルの位置を計算
      final labelX = radius * cos(startRadian + sweepRadian / 2) + size.width / 2;
      final labelY = radius * sin(startRadian + sweepRadian / 2) + size.height / 2;

      // タイトルテキストを描画
      textPainter.text = TextSpan(
        text: section.title,
        style: TextStyle(color: Colors.black, fontSize: 14),
      );
      textPainter.layout();
      textPainter.paint(canvas, Offset(labelX - textPainter.width / 2, labelY - textPainter.height / 2));

      startRadian += sweepRadian;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}