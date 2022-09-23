import 'dart:convert';
import 'package:easy_report_app/data/api_data.dart';
import 'package:flutter/material.dart';
import '../models/usuarios.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  Future<Usuarios>? _usuario;

  final ApiDataLogin api = ApiDataLogin();

  final TextEditingController _usuarioPasswordController =
      TextEditingController();

  final TextEditingController _usuarioUsernameController =
      TextEditingController();

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      final usuarioUsername = _usuarioUsernameController.text;
      final usuarioPassword = _usuarioPasswordController.text;
      final usuarioPasswordBytes = utf8.encode(usuarioPassword);
      final usuarioPasswordBase64 = base64Encode(usuarioPasswordBytes);

      dynamic _usuario = await api.loginUser(
        usuarioPasswordBase64,
        usuarioUsername,
      );

      setState(() {
        print(_usuario);
        if (_usuario != 'userError') {
          Navigator.pop(context);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Usuario e/ou senha invalidos...')));
          body(context);
        }
      });
    }
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
        // onPressed: _submitForm,
        onPressed: _login,
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
