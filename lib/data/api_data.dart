import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class ApiData {
  final String apiUrl = 'http://10.0.2.2:8000/api/usuario/';

  Future<Object> loginUser(
    String password,
    String username,
  ) async {
    Map data = {
      'password': password,
      'username': username,
    };

    final Response response = await http.post(
      Uri.parse(apiUrl),
      body: jsonEncode(data),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      },
    );

    if (response.statusCode == 201) {
      return username;
      // return Usuarios.fromJson(json.decode(response.body));
    }
    if (response.statusCode == 200) {
      print('Usuario e/ou Senha invalidos');
      username = 'userError';
      // final String responseString = response.body;
      // return usuarioFromJson(responseString);
      return username;
      // return Usuarios.fromJson(json.decode(response.body));
    } else {
      throw Exception('Falha...');
    }
  }
}
