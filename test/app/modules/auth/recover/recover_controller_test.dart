import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:flutter_web_mobile/app/modules/auth/recover/recover_controller.dart';
import 'package:flutter_web_mobile/app/modules/auth/recover/recover_module.dart';

void main() {
  initModule(RecoverModule());
  RecoverController recover;

  setUp(() {
    recover = RecoverModule.to.get<RecoverController>();
  });

  group('RecoverController Test', () {
    test("First Test", () {
      expect(recover, isInstanceOf<RecoverController>());
    });

    test("Set Value", () {
      expect(recover.value, equals(0));
      recover.increment();
      expect(recover.value, equals(1));
    });
  });
}
