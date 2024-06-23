import 'dart:math';

import 'package:flutter/material.dart';
import 'package:jboygraph/bubble_chart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BabbleChartExample(),
    );
  }
}

class BabbleChartExample extends StatelessWidget {
  const BabbleChartExample({super.key});
  

  @override
  Widget build(BuildContext context) {
  //   final List<Bubble> bubbles = [
  //   Bubble(x: 100, y: 100, radius: 30, color: Colors.blue),
  //   Bubble(x: 200, y: 150, radius: 40, color: Colors.green),
  //   Bubble(x: 50, y: 250, radius: 20, color: Colors.red),
  //   Bubble(x: 150, y: 200, radius: 50, color: Colors.yellow),
  //   Bubble(x: 250, y: 50, radius: 10, color: Colors.purple),
  // ];

  // for文を使用して、要素の数だけBubbleを作成
  // それぞれのBubbleはランダムな位置と色を持つ
  final bubbles = List.generate(
    100,
    (index) => Bubble(
      x: Random().nextDouble() * 300,
      y: Random().nextDouble() * 300,
      radius: Random().nextDouble() * 20,
      color: Color.fromRGBO(
        Random().nextInt(256),
        Random().nextInt(256),
        Random().nextInt(256),
        1,
      ),
    ),
  );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bubble Chart Example'),
      ),
      body: CustomPaint(
        size: Size(300, 300),
        painter: BubbleChartPainter(
          bubbles: bubbles,
        ),
      ),
    );
  }
}