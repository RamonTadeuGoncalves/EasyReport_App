import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/usuarios.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

Future<Usuarios> addUsuario(
  String password,
  String username,
) async {
  const String apiUrl = 'http://10.0.2.2:8000/api/usuario/';

  final response = await http.post(
    Uri.parse(apiUrl),
    body: jsonEncode({
      'password': password,
      'username': username,
    }),
    headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
    },
  );

  // print(username);
  // print(password);

  if (response.statusCode == 201) {
    // print(username);
    // print(password);
    final String responseString = response.body;
    return usuarioFromJson(responseString);
  }
  if (response.statusCode == 200) {
    print('Usuario e/ou Senha invalidos');
    final String responseString = response.body;
    return usuarioFromJson(responseString);
  } else {
    throw Exception('Falha...');
  }
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  Future<Usuarios>? _usuario;

  final TextEditingController _usuarioPasswordController =
      TextEditingController();

  final TextEditingController _usuarioUsernameController =
      TextEditingController();

  _submitForm() {
    final usuarioUsername = _usuarioUsernameController.text;
    final usuarioPassword = _usuarioPasswordController.text;
    final usuarioPasswordBytes = utf8.encode(usuarioPassword);
    final usuarioPasswordBase64 = base64Encode(usuarioPasswordBytes);

    setState(() {
      if (_formKey.currentState!.validate()) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Processando informacao...')));
        _usuario = addUsuario(
          usuarioPasswordBase64,
          usuarioUsername,
        );
        Navigator.pop(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(16),
          child: (_usuario == null) ? body(context) : body(context)),
    );
  }

  body(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        children: <Widget>[
          TextFormField(
            controller: _usuarioUsernameController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Informe o Login';
              }
              return null;
            },
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
                labelText: 'Usuario', hintText: 'Informe o nome de usuario'),
          ),
          TextFormField(
            controller: _usuarioPasswordController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Informe a Senha';
              }
              return null;
            },
            obscureText: true,
            decoration: const InputDecoration(
                labelText: 'Senha', hintText: 'Informe a senha'),
          ),
          containerButton(context)
        ],
      ),
    );
  }

  containerButton(BuildContext context) {
    return Container(
      height: 40,
      margin: const EdgeInsets.only(top: 10),
      child: ElevatedButton(
        onPressed: _submitForm,
        child: const Text('Entrar'),
      ),
    );
  }
}

Widget buildUsuarios(List<Usuarios> usuarios) => ListView.builder(
      itemCount: usuarios.length,
      itemBuilder: (context, index) {
        final usuario = usuarios[index];
        return Card(
          child: ListTile(
            leading: CircleAvatar(
              radius: 28,
              backgroundColor: Theme.of(context).colorScheme.primary,
            ),
            title: Text('Usuario ID: ${usuario.username}'),
            subtitle: Text('Usuario Senha: ${usuario.password}'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              // Navigator.pushNamed(context, '/report');
            },
          ),
        );
      },
    );
