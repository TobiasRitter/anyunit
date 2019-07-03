import 'package:cleverconvert/main.dart';
import 'package:cleverconvert/view/inputscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("app initially shows input screen", (WidgetTester tester) async {
    await tester.pumpWidget(CleverConvertApp());
    Finder fabFinder = find.byType(InputScreen);
    expect(fabFinder, findsOneWidget);
  });
  testWidgets("fab is initially not visible", (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: InputScreen(),
      ),
    );
    Finder fabFinder = find.byType(FloatingActionButton);
    expect(fabFinder, findsNothing);
  });
  testWidgets("textfield is initially empty", (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: InputScreen(),
      ),
    );
    Finder fabFinder = find.byType(TextField);
    expect(fabFinder, findsOneWidget);
    expect(find.text("Enter a value"), findsOneWidget);
  });
}
