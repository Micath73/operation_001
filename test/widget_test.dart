// This is a basic Flutter widget test for operation_001.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package.

import 'package:flutter_test/flutter_test.dart';
import 'package:operation_001/main.dart';

void main() {
  testWidgets('App initialization smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const CatholicApp());

    // Verify that the application initializes successfully.
    expect(find.byType(CatholicApp), findsOneWidget);
  });
}