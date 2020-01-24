import 'package:flutter_web_mobile/app/repositories/auth/login_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_web_mobile/app/modules/auth/login/login_module.dart';
import 'package:hasura_connect/hasura_connect.dart';

import 'app_controller.dart';
import 'app_widget.dart';
import 'config/hasura_config.dart';
import 'modules/client/client_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => LoginRepository()),
        Bind((i) => AppController()),
        Bind((i) => HasuraConnect(hasura_config_url)),
      ];

  @override
  List<Router> get routers => [
        Router('/', module: LoginModule()),
        Router('/client', module: ClientModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
