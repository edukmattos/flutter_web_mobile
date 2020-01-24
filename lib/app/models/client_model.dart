import 'dart:convert';

ClientModel clientModelFromJson(String str) => ClientModel.fromJson(json.decode(str));

String clientModelToJson(ClientModel data) => json.encode(data.toJson());

class ClientModel {
    int id;
    String name;
    String email;

    ClientModel({
        this.id,
        this.name,
        this.email
    });

    ClientModel copyWith({
        int id,
        String name,
        String email,
    }) => 
        ClientModel(
            id: id ?? this.id,
            name: name ?? this.name,
            email: email ?? this.email,
        );

    factory ClientModel.fromJson(Map<String, dynamic> json) => 
      ClientModel(
        id: json["id"] as int,
        name: json["name"] as String,
        email: json["email"] as String
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email
    };

    static List<ClientModel> fromJsonList(List list) {
      if (list == null) return null;

      return list
        .map<ClientModel>((item) => ClientModel.fromJson(item))
        .toList();
    }
}