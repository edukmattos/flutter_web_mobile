import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:flutter_web_mobile/app/modules/material/material_page.dart';

main() {
  testWidgets('MaterialPage has title', (WidgetTester tester) async {
    await tester
        .pumpWidget(buildTestableWidget(MaterialPage(title: 'Material')));
    final titleFinder = find.text('Material');
    expect(titleFinder, findsOneWidget);
  });
}
