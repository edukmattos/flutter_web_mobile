import 'dart:convert';

ClientModel clientModelFromJson(String str) => ClientModel.fromJson(json.decode(str));

String clientModelToJson(ClientModel data) => json.encode(data.toJson());

class ClientModel {
    int id;
    String einssa;
    String name;
    String email;

    ClientModel({
        this.id,
        this.einssa,
        this.name,
        this.email,
    });

    factory ClientModel.fromJson(Map<String, dynamic> json) => ClientModel(
        id: json["id"],
        einssa: json["einssa"],
        name: json["name"],
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "einssa": einssa,
        "name": name,
        "email": email,
    };
}
