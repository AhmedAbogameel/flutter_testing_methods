import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing_methods/features/home/view.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_testing_methods/main.dart' as app;

main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('App Integration Test', () {
    testWidgets('Success Login', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      final emailFieldFinder = find.byType(TextFormField).first;
      await tester.enterText(emailFieldFinder, 'jemi@dev.com');
      await tester.pumpAndSettle();

      final passwordFieldFinder = find.byType(TextFormField).last;
      await tester.enterText(passwordFieldFinder, '123123');
      await tester.pumpAndSettle();

      await tester.tap(find.byType(CheckboxListTile));
      await tester.pumpAndSettle();

      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      expect(find.byType(HomeView), findsOneWidget);
    });

    testWidgets('Unselected check box should do nothing', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      final emailFieldFinder = find.byType(TextFormField).first;
      await tester.enterText(emailFieldFinder, 'jemi@dev.com');
      await tester.pumpAndSettle();

      final passwordFieldFinder = find.byType(TextFormField).last;
      await tester.enterText(passwordFieldFinder, '123123');
      await tester.pumpAndSettle();

      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      expect(find.byType(HomeView), findsNothing);
    });
  });

}