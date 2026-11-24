import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:activity_weather/screens/activity_form_page.dart';

void main() {
  Widget createFormWidget() {
    return const MaterialApp(
      home: ActivityFormPage(),
    );
  }

  group('Activity Form Validation Test Cases (Reference Table)', () {
    testWidgets('เคสที่ 1: ชื่อว่างหรือมีแต่ช่องว่าง -> แจ้งให้กรอกชื่อ',
        (WidgetTester tester) async {
      await tester.pumpWidget(createFormWidget());

      // ทดสอบกรณีปล่อยว่าง (Empty)
      await tester.tap(find.byKey(const Key('submit_button')));
      await tester.pumpAndSettle();

      expect(find.text('กรุณากรอกชื่อ'), findsOneWidget);

      // ทดสอบกรณีมีแต่ช่องว่าง (Whitespace only)
      await tester.enterText(find.byKey(const Key('name_input')), '     ');
      await tester.tap(find.byKey(const Key('submit_button')));
      await tester.pumpAndSettle();

      expect(find.text('กรุณากรอกชื่อ'), findsOneWidget);
    });

    testWidgets('เคสที่ 2: ชื่อ 60 ตัวอักษร -> ผ่านการตรวจ',
        (WidgetTester tester) async {
      await tester.pumpWidget(createFormWidget());

      final name60 = 'A' * 60;
      await tester.enterText(find.byKey(const Key('name_input')), name60);

      await tester.tap(find.byKey(const Key('submit_button')));
      await tester.pumpAndSettle();

      // ต้องไม่แสดงข้อความเตือนเกี่ยวกับชื่อ
      expect(find.text('กรุณากรอกชื่อ'), findsNothing);
      expect(find.text('ชื่อยาวเกิน 60 ตัวอักษร'), findsNothing);
    });

    testWidgets('เคสที่ 3: ชื่อ 61 ตัวอักษร -> แจ้งว่าชื่อยาวเกิน',
        (WidgetTester tester) async {
      await tester.pumpWidget(createFormWidget());

      final name61 = 'A' * 61;
      await tester.enterText(find.byKey(const Key('name_input')), name61);

      await tester.tap(find.byKey(const Key('submit_button')));
      await tester.pumpAndSettle();

      expect(find.text('ชื่อยาวเกิน 60 ตัวอักษร'), findsOneWidget);
    });

    testWidgets('เคสที่ 4: ไม่เลือกหมวดหมู่ -> แจ้งให้เลือกหมวดหมู่',
        (WidgetTester tester) async {
      await tester.pumpWidget(createFormWidget());

      // กรอกชื่อให้ผ่าน แต่ไม่เลือกหมวดหมู่
      await tester.enterText(find.byKey(const Key('name_input')), 'วิ่งตอนเช้า');

      await tester.tap(find.byKey(const Key('submit_button')));
      await tester.pumpAndSettle();

      expect(find.text('กรุณาเลือกหมวดหมู่'), findsOneWidget);
    });

    testWidgets('เคสที่ 5: หมายเหตุว่าง -> ผ่านการตรวจ',
        (WidgetTester tester) async {
      await tester.pumpWidget(createFormWidget());

      // ปล่อยหมายเหตุว่างไว้
      await tester.enterText(find.byKey(const Key('name_input')), 'อ่านหนังสือ');

      // เลือกหมวดหมู่
      await tester.tap(find.byKey(const Key('category_dropdown')));
      await tester.pumpAndSettle();
      await tester.tap(find.text('การเรียน').last);
      await tester.pumpAndSettle();

      // Submit
      await tester.tap(find.byKey(const Key('submit_button')));
      await tester.pumpAndSettle();

      // ต้องไม่แสดงข้อความเตือนหมายเหตุ และผ่านการตรวจ
      expect(find.text('หมายเหตุยาวเกิน 240 ตัวอักษร'), findsNothing);
    });

    testWidgets('เคสที่ 6: หมายเหตุ 240 ตัวอักษร -> ผ่านการตรวจ',
        (WidgetTester tester) async {
      await tester.pumpWidget(createFormWidget());

      final note240 = 'B' * 240;
      await tester.enterText(find.byKey(const Key('name_input')), 'ว่ายน้ำ');
      await tester.enterText(find.byKey(const Key('note_input')), note240);

      // เลือกหมวดหมู่
      await tester.tap(find.byKey(const Key('category_dropdown')));
      await tester.pumpAndSettle();
      await tester.tap(find.text('สุขภาพ').last);
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key('submit_button')));
      await tester.pumpAndSettle();

      // ต้องผ่านการตรวจ ไม่มี error ของหมายเหตุ
      expect(find.text('หมายเหตุยาวเกิน 240 ตัวอักษร'), findsNothing);
    });

    testWidgets('เคสที่ 7: หมายเหตุ 241 ตัวอักษร -> แจ้งว่าหมายเหตุยาวเกิน',
        (WidgetTester tester) async {
      await tester.pumpWidget(createFormWidget());

      final note241 = 'B' * 241;
      await tester.enterText(find.byKey(const Key('note_input')), note241);

      await tester.tap(find.byKey(const Key('submit_button')));
      await tester.pumpAndSettle();

      expect(find.text('หมายเหตุยาวเกิน 240 ตัวอักษร'), findsOneWidget);
    });
  });
}
