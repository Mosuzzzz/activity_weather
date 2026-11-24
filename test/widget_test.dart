import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:activity_weather/main.dart';
import 'package:activity_weather/screens/activity_form_page.dart';

void main() {
  testWidgets('App smoke test: Navigation to form and back',
      (WidgetTester tester) async {
    // Build app
    await tester.pumpWidget(const MyApp());

    // Verify activity list page is shown
    expect(find.text('กิจกรรม'), findsOneWidget);
    expect(find.byKey(const Key('add_activity_fab')), findsOneWidget);

    // Tap FloatingActionButton to go to form
    await tester.tap(find.byKey(const Key('add_activity_fab')));
    await tester.pumpAndSettle();

    // Verify ActivityFormPage is open
    expect(find.byType(ActivityFormPage), findsOneWidget);
    expect(find.text('เพิ่มกิจกรรม'), findsOneWidget);

    // Fill valid data
    await tester.enterText(find.byKey(const Key('name_input')), 'ทดสอบกิจกรรมใหม่');

    // Select category
    await tester.tap(find.byKey(const Key('category_dropdown')));
    await tester.pumpAndSettle();
    await tester.tap(find.text('พักผ่อน').last);
    await tester.pumpAndSettle();

    // Fill note
    await tester.enterText(find.byKey(const Key('note_input')), 'รายละเอียดทดสอบ');

    // Submit form
    await tester.tap(find.byKey(const Key('submit_button')));
    await tester.pumpAndSettle();

    // Verify returning to list and new item is visible
    expect(find.byType(ActivityFormPage), findsNothing);
    expect(find.text('ทดสอบกิจกรรมใหม่'), findsOneWidget);
    expect(find.text('พักผ่อน'), findsWidgets);
  });
}
