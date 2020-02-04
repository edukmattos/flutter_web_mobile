import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_connect/hasura_connect.dart';

class LoginRepository extends Disposable {

  final HasuraConnect hasuraConnection;

  LoginRepository(this.hasuraConnection);

  //dispose will be called automatically
  @override
  void dispose() {}
}

