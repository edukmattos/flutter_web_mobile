import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_connect/hasura_connect.dart';

class ClientRepository extends Disposable {

  final HasuraConnect hasuraConnection;

  ClientRepository(this.hasuraConnection);

  

  //dispose will be called automatically
  @override
  void dispose() {}
}

