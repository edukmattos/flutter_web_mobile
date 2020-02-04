import 'package:flutter_web_mobile/app/config/hasura_config.dart';
import 'package:flutter_web_mobile/app/modules/auth/login/login_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_web_mobile/app/modules/auth/login/login_page.dart';
import 'package:flutter_web_mobile/app/repositories/auth/login_repository.dart';
import 'package:hasura_connect/hasura_connect.dart';

class LoginModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => LoginController()),
        Bind((i) => LoginRepository(i.get<HasuraConnect>())),
        Bind((i) => HasuraConnect(hasura_config_url)),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => LoginPage()),
      ];

  static Inject get to => Inject<LoginModule>.of();
}
