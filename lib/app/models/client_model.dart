import 'dart:convert';

ClientModel clientModelFromJson(String str) => ClientModel.fromJson(json.decode(str));

String clientModelToJson(ClientModel data) => json.encode(data.toJson());

class ClientModel {
    int id;
    String ein_ssa;
    String name;
    String email;

    ClientModel({
        this.id,
        this.ein_ssa,
        this.name,
        this.email
    });

    ClientModel copyWith({
        int id,
        String ein_ssa,
        String name,
        String email,
    }) => 
        ClientModel(
            id: id ?? this.id,
            ein_ssa: ein_ssa ?? this.ein_ssa,
            name: name ?? this.name,
            email: email ?? this.email,
        );

    factory ClientModel.fromJson(Map<String, dynamic> json) => 
      ClientModel(
        id: json["id"] as int,
        ein_ssa: json["ein_ssa"] as String,
        name: json["name"] as String,
        email: json["email"] as String
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "ein_ssa": ein_ssa,
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