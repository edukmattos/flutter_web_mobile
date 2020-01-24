import 'package:flutter_web_mobile/app/modules/auth/recover/recover_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_web_mobile/app/modules/auth/recover/recover_page.dart';

class RecoverModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => RecoverController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => RecoverPage()),
      ];

  static Inject get to => Inject<RecoverModule>.of();
}
