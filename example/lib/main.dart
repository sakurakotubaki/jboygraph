import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: BarChartAnimated(),
        ),
      ),
    );
  }
}

class BarChartAnimated extends StatefulWidget {
  const BarChartAnimated({super.key});

  @override
  _BarChartAnimatedState createState() => _BarChartAnimatedState();
}

class _BarChartAnimatedState extends State<BarChartAnimated> with TickerProviderStateMixin {
  final List<AnimationController> _controllers = [];
  final List<Animation<double>> _animations = [];
  final List<Color> _colors = [Colors.red, Colors.green, Colors.blue, Colors.orange, Colors.purple];
  final List<double> _values = [160.0, 120.0, 140.0, 100.0, 200.0];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 5; i++) {
      var controller = AnimationController(vsync: this, duration: Duration(seconds: 2));
      var animation = Tween(begin: 0.0, end: _values[i]).animate(controller)
        ..addListener(() {
          setState(() {});
        });
      _controllers.add(controller);
      _animations.add(animation);
      _controllers[i].forward();
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(200, 200), // Adjust the size as needed
      painter: BarChartPainter(_animations, _colors),
    );
  }
}

class BarChartPainter extends CustomPainter {
  final List<Animation<double>> animations;
  final List<Color> colors;

  BarChartPainter(this.animations, this.colors);

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < animations.length; i++) {
      var paint = Paint()
        ..color = colors[i]
        ..style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(0, i * 40.0, animations[i].value, 30), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}