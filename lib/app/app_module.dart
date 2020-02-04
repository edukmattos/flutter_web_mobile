import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_web_mobile/app/modules/welcome/welcome_module.dart';
import 'package:hasura_connect/hasura_connect.dart';

import 'app_controller.dart';
import 'app_widget.dart';
import 'config/hasura_config.dart';
import 'modules/auth/login/login_module.dart';
import 'modules/client/client_module.dart';
import 'modules/splash/splash_module.dart';
import 'repositories/auth/login_repository.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind((i) => HasuraConnect(hasura_config_url)),
      ];

  @override
  List<Router> get routers => [
        Router('/', module: LoginModule()),
        Router('/welcome', module: WelcomeModule()),
        Router('/login', module: LoginModule()),
        Router('/client', module: ClientModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
