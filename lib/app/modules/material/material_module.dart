import 'package:flutter_web_mobile/app/modules/material/material_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_web_mobile/app/modules/material/material_page.dart';

class MaterialModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => MaterialController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => MaterialPage()),
      ];

  static Inject get to => Inject<MaterialModule>.of();
}
