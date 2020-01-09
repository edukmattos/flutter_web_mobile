import 'package:flutter_web_mobile/app/modules/material_unit/material_unit_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_web_mobile/app/modules/material_unit/material_unit_page.dart';

class MaterialUnitModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => MaterialUnitController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => MaterialUnitPage()),
      ];

  static Inject get to => Inject<MaterialUnitModule>.of();
}
