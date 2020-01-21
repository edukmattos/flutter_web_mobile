import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:flutter_web_mobile/app/modules/material/material_controller.dart';
import 'package:flutter_web_mobile/app/modules/material/material_module.dart';

void main() {
  initModule(MaterialModule());
  MaterialController material;

  setUp(() {
    material = MaterialModule.to.get<MaterialController>();
  });

  group('MaterialController Test', () {
    test("First Test", () {
      expect(material, isInstanceOf<MaterialController>());
    });

    test("Set Value", () {
      expect(material.value, equals(0));
      material.increment();
      expect(material.value, equals(1));
    });
  });
}
