import 'package:flutter_modular/flutter_modular.dart';

import '../models/client_model.dart';
import 'package:hasura_connect/hasura_connect.dart';

class ClientRepository extends Disposable {
  final HasuraConnect hasuraConnection;

  ClientRepository(this.hasuraConnection);

  Future<ClientModel> saveClient(String name, String email) async {
    var insert = """
      saveClient(\$name:String!, \$email:String!) {
        insert_clients(objects: {name: \$name, email: \$email}) {
          returning {
            id
          }
        }
      }
    """;
    var data = await hasuraConnection.mutation(insert);
    var id = data["data"]["insert_clients"]["returning"][0]["id"];

    return ClientModel(
      id: id,
      name: name,
      email: email
    );
  }

  Future<List> allClients() async {
    var select = """
      allClients {
        name
      }
    """;
    var data = await hasuraConnection.query(select);

    print(data);

    return data;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}

