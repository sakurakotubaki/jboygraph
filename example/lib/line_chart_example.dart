import 'package:flutter/material.dart';
import 'package:jboygraph/line_chart.dart';
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LineChartExample(),
    );
  }
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

    return Scaffold(
      body: Center(
        child: CustomPaint(
          size: Size(300, 200),
          painter: LineChart(points: points),
        ),
      ),
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
