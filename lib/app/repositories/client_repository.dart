import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_connect/hasura_connect.dart';

import '../models/client_model.dart';

class ClientRepository extends Disposable {
  final HasuraConnect hasuraConnection;

  ClientRepository(this.hasuraConnection);

  Future<ClientModel> saveClient(String name) async {
    var insert = """
      saveClient(\$name:String!) {
        insert_clients(objects: {name: \$name}) {
          returning {
            id
          }
        }
      }
    """;
    //var data = await hasuraConnection.mutation(insert);
    //var id = data["data"]["insert_clients"]["returning"][0]["id"];

    return ClientModel(
      name: name
    );
  }

  Future<List<ClientModel>> allClients() async {
    var select = """
      query {
        clients {
          id
          name
        }
      }
    """;
    var snapshot = await hasuraConnection.query(select);
    
    //print(snapshot);

    return ClientModel.fromJsonList(snapshot["data"]["clients"] as List);

  }

  //dispose will be called automatically
  @override
  void dispose() {}
}

