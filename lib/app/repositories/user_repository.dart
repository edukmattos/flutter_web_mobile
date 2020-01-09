import 'package:flutter_modular/flutter_modular.dart';

import '../models/user_model.dart';
import 'package:hasura_connect/hasura_connect.dart';

class UserRepository extends Disposable {
  final HasuraConnect hasuraConnection;

  UserRepository(this.hasuraConnection);

  Future<UserModel> saveUser(String name, String email) async {
    var insert = """
      saveUser(\$name:String!, \$email:String!) {
        insert_users(objects: {name: \$name, email: \$email}) {
          returning {
            id
          }
        }
      }
    """;
    var data = await hasuraConnection.mutation(insert);
    var id = data["data"]["insert_users"]["returning"][0]["id"];

    return UserModel(
      id: id,
      name: name,
      email: email
    );
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}

