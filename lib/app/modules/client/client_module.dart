import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_connect/hasura_connect.dart';

import '../../repositories/client_repository.dart';
import 'client_controller.dart';
import 'client_page.dart';

class ClientModule extends ChildModule {
  
  @override
  List<Bind> get binds => [
        Bind((i) => ClientController()),
        Bind((i) => ClientRepository(i.get<HasuraConnect>())),
        Bind((i) => HasuraConnect("https://hero-siges.herokuapp.com/v1/graphql")),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => ClientPage()),
      ];

  static Inject get to => Inject<ClientModule>.of();
}
