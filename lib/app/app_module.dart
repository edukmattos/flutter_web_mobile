import 'package:flutter_web_mobile/app/repositories/material_unit_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_connect/hasura_connect.dart';

import 'app_controller.dart';
import 'app_widget.dart';
import 'modules/client/client_module.dart';
import 'repositories/client_repository.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => MaterialUnitRepository()),
        Bind((i) => ClientRepository(i.get<HasuraConnect>())),
        Bind((i) => AppController()),
        Bind((i) =>
            HasuraConnect("https://hero-siges.herokuapp.com/v1/graphql")),
      ];

  @override
  List<Router> get routers => [
        Router('/', module: ClientModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
