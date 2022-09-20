import 'dart:convert';

Usuarios usuarioFromJson(String str) => Usuarios.fromJson(json.decode(str));
String usuarioToJson(Usuarios data) => json.encode(data.toJson());

class Usuarios {
  // final int id;
  final String password;
  final String username;
  // final String email;

  Usuarios({
    // required this.id,
    required this.password,
    required this.username,
    // required this.email,
  });

  factory Usuarios.fromJson(Map<String, dynamic> json) => Usuarios(
        // id: json['id'] as int,
        password: json['password'] as String,
        username: json['username'] as String,
        // email: json['email'] as String);
      );

  Map<String, dynamic> toJson() => {
        // 'id': id,
        'password': password,
        'username': username,
        // 'email': email,
      };
}
