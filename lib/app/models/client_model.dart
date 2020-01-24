import 'dart:convert';

ClientModel clientModelFromJson(String str) => ClientModel.fromJson(json.decode(str));

String clientModelToJson(ClientModel data) => json.encode(data.toJson());

class ClientModel {
    int id;
    String name;

    ClientModel({
        this.id,
        this.name,
    });

    ClientModel copyWith({
        int id,
        String name,
    }) => 
        ClientModel(
            id: id ?? this.id,
            name: name ?? this.name,
        );

    factory ClientModel.fromJson(Map<String, dynamic> json) => ClientModel(
        id: json["id"],
        name: json["name"]
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };

    static List<ClientModel> fromJsonList(List list) {
      if (list == null) return null;

      return list
        .map<ClientModel>((item) => ClientModel.fromJson(item))
        .toList();
    }
}