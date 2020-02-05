import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_connect/hasura_connect.dart';

import 'app_controller.dart';
import 'app_widget.dart';
import 'config/hasura_config.dart';
import 'modules/auth/auth_module.dart';
import 'modules/client/client_module.dart';
import 'modules/splash/splash_page.dart';
import 'modules/welcome/welcome_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind((i) => HasuraConnect(hasura_config_url)),
      ];

  @override
  List<Router> get routers => [
        //Router('/', module: SplashModule()),
        Router('/', child: (_, args) => SplashPage()),
        Router('/welcome', module: WelcomeModule(), transition: TransitionType.rightToLeft),
        Router('/auth', module: AuthModule(), transition: TransitionType.rightToLeft),
        Router('/client', module: ClientModule(), transition: TransitionType.rightToLeft),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
