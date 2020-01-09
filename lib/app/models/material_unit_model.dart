import 'dart:convert';

MaterialUnitModel materialUnitModelFromJson(String str) => MaterialUnitModel.fromJson(json.decode(str));

String materialUnitModelToJson(MaterialUnitModel data) => json.encode(data.toJson());

class MaterialUnitModel {
    int id;
    String code;
    String description;

    MaterialUnitModel({
        this.id,
        this.code,
        this.description,
    });

    factory MaterialUnitModel.fromJson(Map<String, dynamic> json) => MaterialUnitModel(
        id: json["id"],
        code: json["code"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "description": description,
    };
}