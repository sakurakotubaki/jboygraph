import 'package:flutter/material.dart';

class LineChart extends CustomPainter {
  final List<Offset> points;

  LineChart({required this.points});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    // 外枠を描画
    final borderPaint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), borderPaint);

    // メモリ線を描画
    final memoryLinePaint = Paint()
      ..color = Colors.grey[300]!
      ..strokeWidth = 0.5;
    final memoryLineCount = 5;
    final memoryLineSpacing = size.height / memoryLineCount;
    for (int i = 1; i < memoryLineCount; i++) {
      final y = memoryLineSpacing * i;
      canvas.drawLine(Offset(0, y), Offset(size.width, y), memoryLinePaint);
    }

    // ポイントを結ぶ線を描画
    for (int i = 0; i < points.length - 1; i++) {
      canvas.drawLine(points[i], points[i + 1], paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}