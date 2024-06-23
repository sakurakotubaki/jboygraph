import 'package:flutter/material.dart';

class LineChartPainter extends CustomPainter {
  final List<Offset> points;

  LineChartPainter({required this.points});

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

class LineChartExample extends StatelessWidget {
  const LineChartExample({super.key});

  @override
  Widget build(BuildContext context) {
    // グラフのデータポイント
    final points = [
      // Listに代入して良い値の数は、最大で、7個まで
      Offset(0, 0),
      Offset(50, 100),
      Offset(100, 150),
      Offset(150, 100),
      Offset(200, 150),
      Offset(250, 100),
      Offset(300, 150),
    ];

    return CustomPaint(
      size: Size(300, 200),
      painter: LineChartPainter(points: points),
    );
  }
}

// List<Offset> generatePoints(int count, Size size) {
//   List<Offset> points = [];
//   final double maxX = size.width - 50.0; // 右のマージンを考慮
//   final double maxY = size.height - 50.0; // 下のマージンを考慮
//   final double intervalX = maxX / (count - 1); // X座標の間隔を計算

//   for (int i = 0; i < count; i++) {
//     final x = intervalX * i; // X座標は等間隔に調整
//     final y = (i % 2 == 0) ? maxY * 0.5 : maxY * 0.75; // Y座標は枠内に収まるように調整
//     points.add(Offset(x, y));
//   }
//   return points;
// }

// class LineChartExample extends StatelessWidget {
//   const LineChartExample({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // グラフのデータポイントを動的に生成
//   final size = Size(300, 200); // CustomPaintのサイズ
//   final points = generatePoints(10, size); // サイズを渡してポイントを生成

//     return CustomPaint(
//       size: size,
//       painter: LineChartPainter(points: points),
//     );
//   }
// }

void main() => runApp(MaterialApp(home: Scaffold(body: Center(child: LineChartExample()))));