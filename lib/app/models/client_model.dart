import 'dart:convert';

ClientModel clientModelFromJson(String str) => ClientModel.fromJson(json.decode(str));

String clientModelToJson(ClientModel data) => json.encode(data.toJson());

class ClientModel {
    String name;

    ClientModel({
        this.name,
    });

    ClientModel copyWith({
        String name,
    }) => 
        ClientModel(
            name: name ?? this.name,
        );

    factory ClientModel.fromJson(Map<String, dynamic> json) => ClientModel(
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
    };

    static List<ClientModel> fromJsonList(List list) {
      if (list == null) return null;

      return list
        .map<ClientModel>((item) => ClientModel.fromJson(item))
        .toList();
    }
}