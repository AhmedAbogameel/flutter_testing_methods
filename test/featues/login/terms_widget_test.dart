import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing_methods/core/router/router.dart';
import 'package:flutter_testing_methods/features/home/view.dart';
import 'package:flutter_testing_methods/features/login/view.dart';
import 'package:flutter_testing_methods/main.dart';
import 'package:flutter_testing_methods/widgets/loading_indicator.dart';

main() {

  final rootView = MaterialApp(
    home: const LoginView(),
    navigatorKey: navigatorKey,
  );

  testWidgets('Login Smoke Test', (tester) async {

    await tester.pumpWidget(rootView);

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
}