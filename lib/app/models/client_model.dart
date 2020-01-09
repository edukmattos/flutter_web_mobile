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
        this.email,
    });

    factory ClientModel.fromJson(Map<String, dynamic> json) => ClientModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
    };
}