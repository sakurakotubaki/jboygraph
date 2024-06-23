import 'package:flutter/material.dart';
import 'package:jboygraph/bar_graph.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const BarGraphExample(),
    );
  }
}

class BarGraphExample extends StatelessWidget {
  const BarGraphExample({super.key});

  @override
  Widget build(BuildContext context) {
    List<double> data = [10.0, 20.0, 40.0, 60.0, 80.0];
    List<Color> colors = [Colors.red, Colors.blue, Colors.green, Colors.yellow, Colors.orange];
    List<String> titles = ['喜び', '悲しみ', '怒り', '驚き', '恐れ'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bar Graph Example'),
      ),
      body: Center(
        child: BarGraph(
          data: data,
          colors: colors,
          titles: titles,
        ),
    ),
    );
  }
}