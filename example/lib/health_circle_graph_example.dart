import 'package:flutter/material.dart';
import 'package:jboygraph/health_circle_graph.dart';

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
      home: const HealthCircleGraphExample(),
    );
  }
}

class HealthCircleGraphExample extends StatelessWidget {
  const HealthCircleGraphExample({super.key});

  @override
  Widget build(BuildContext context) {
    /// Variables to pass values ​​to the constructor
    /// [Passing a Number]
    var healthValue = 75.0;
    /// Pass Color
    Color linePercentColor = Colors.green;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Health Circle Graph Example'),
      ),
      body: Center(
        child: HealthCircleGraph(healthValue: healthValue, linePercentColor: linePercentColor),
      ),
    );
  }
}
