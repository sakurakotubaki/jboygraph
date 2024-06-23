import 'package:flutter/material.dart';
import 'package:jboygraph/pie_chart.dart';

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
      home: const PiChartExample(),
    );
  }
}

class PiChartExample extends StatelessWidget {
  const PiChartExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pi Chart Example'),
      ),
      body: Center(
        child: PieChart(
          data: [
            PieChartData(value: 40, title: "Section 1", color: Colors.red),
            PieChartData(value: 30, title: "Section 2", color: Colors.blue),
            PieChartData(value: 20, title: "Section 3", color: Colors.green),
            PieChartData(value: 10, title: "Section 4", color: Colors.yellow),
          ],
        ),
      ),
    );
  }
}