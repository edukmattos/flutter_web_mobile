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

  Future<List<ClientModel>> allClients() async {
    var select = """
      clients {
        name
      }
    """;
    var result = await hasuraConnection.query(select);

    var dynamics = result["data"]["clients"]
      .map((item) => ClientModel.fromJson(item))
      .toList(); 

    var clients = List<ClientModel>();

    for (var din in dynamics) {
      clients.add(din as ClientModel);
    }

    return clients;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}

