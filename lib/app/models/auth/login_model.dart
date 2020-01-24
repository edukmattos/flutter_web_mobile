import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
    String email;
    String password;

    LoginModel({
        this.email,
        this.password
    });

    LoginModel copyWith({
        String email,
        String password,
    }) => 
        LoginModel(
            email: email ?? this.email,
            password: password ?? this.password,
        );

    factory LoginModel.fromJson(Map<String, dynamic> json) => 
      LoginModel(
        email: json["email"] as String,
        password: json["password"] as String
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
    };

    static List<LoginModel> fromJsonList(List list) {
      if (list == null) return null;
      return list
        .map<LoginModel>((item) => LoginModel.fromJson(item))
        .toList();
    }
}