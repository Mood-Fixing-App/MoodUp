import 'dart:convert';
// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);


User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    String email;
    String password;
    String name;

    User({
        required this.email,
        required this.password,
        required this.name,
    });

    User copyWith({
        String? email,
        String? password,
        String? name,
    }) => 
        User(
            email: email ?? this.email,
            password: password ?? this.password,
            name: name ?? this.name,
        );

    factory User.fromJson(Map<String, dynamic> json) => User(
        email: json["email"],
        password: json["password"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "name": name,
    };
}
