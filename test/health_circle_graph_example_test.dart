import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jboygraph/health_circle_graph.dart';

void main() {
  testWidgets('HealthCircleGraph renders correctly', (WidgetTester tester) async {
    // HealthCircleGraphウィジェットをテストハーネスにロードします。
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: HealthCircleGraph(
          healthValue: 25,
          linePercentColor: Colors.red,
        ),
      ),
    ));

    // HealthCircleGraphウィジェットが存在することを確認します。
    expect(find.byType(HealthCircleGraph), findsOneWidget);

    // 指定されたhealthValueが正しく表示されていることを確認します。
    expect(find.text('25'), findsOneWidget);

    // 指定されたlinePercentColorが正しく適用されているかどうかは、
    // カスタムペインターのテストが難しいため、このテストでは直接確認できません。
    // 代わりに、ウィジェットのビジュアルテスト（ゴールデンファイルテストなど）を検討してください。
  });
}