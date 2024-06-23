// lib/bar_graph/bar_graph.dart

import 'package:flutter/material.dart';

class BarGraph extends StatelessWidget {
  const BarGraph({super.key, required this.data, required this.colors, required this.titles});

  // 外部からListにデータを渡す変数
  final List<double> data;
  final List<Color> colors;
  final List<String> titles;

  @override
  Widget build(BuildContext context) {

    return Column(
          children: [
            Spacer(),
            Flexible(
              // グラフの高さを固定
              flex: 1,
              fit: FlexFit.tight,
              child: Container(
                width: double.infinity,
                // 数値に合わせて高さ調整
                height: 300 * 10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(data.length, (index) {
                    return Column(
                      children: [
                        Container(
                          width: 60,
                          height: 200,
                          child: CustomPaint(
                            size: Size(60, 200),
                            painter: BarGraphPainter([data[index]], [colors[index]]),
                          ),
                        ),
                        Text(titles[index]),
                      ],
                    );
                  }),
                ),
              ),
            ),
          ],
        );
  }
}

class BarGraphPainter extends CustomPainter {
  final List<double> data;
  final List<Color> colors;

  BarGraphPainter(this.data, this.colors);

  @override
  void paint(Canvas canvas, Size size) {
    final barWidth = size.width;

    for (var i = 0; i < data.length; i++) {
      final dx = 0.0;
      final dy = size.height * (1 - data[i] / 10);
      final barRect = Rect.fromLTWH(dx, dy, barWidth, size.height - dy);

      final paint = Paint()
        ..color = colors[i]
        ..style = PaintingStyle.fill;
      canvas.drawRect(barRect, paint);

      final outlinePaint = Paint()
        ..color = Colors.grey
        ..strokeWidth = 2
        ..style = PaintingStyle.stroke;
      canvas.drawRect(barRect, outlinePaint);
    }
  }

  @override
  bool shouldRepaint(covariant BarGraphPainter oldDelegate) {
    return oldDelegate.data != data || oldDelegate.colors != colors;
  }
}