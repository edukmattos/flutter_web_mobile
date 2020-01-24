import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:flutter_web_mobile/app/modules/auth/recover/recover_page.dart';

main() {
  testWidgets('RecoverPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(RecoverPage(title: 'Recover')));
    final titleFinder = find.text('Recover');
    expect(titleFinder, findsOneWidget);
  });
}
