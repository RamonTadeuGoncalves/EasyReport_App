import 'dart:convert';
import 'package:easy_report_app/data/api_data.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

  get constraints => null;

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

      if (_usuario != 'userError') {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.remove('email');
        prefs.setString('email', usuarioUsername);
      }

      setState(() {
        if (_usuario != 'userError') {
          Navigator.pop(context);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Usuário e/ou senha inválidos...')));
          body(context, constraints);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: LayoutBuilder(
        builder: (context, constrains) {
          return Padding(
              padding: const EdgeInsets.all(16),
              child: (_usuario == null)
                  ? body(context, constrains)
                  : body(context, constrains));
        },
      ),
    );
  }

  body(BuildContext context, constraints) {
    const percent = 6;
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 75, bottom: 100),
              child: Center(
                child: SizedBox(
                  width: 250,
                  height: 200,
                  child: Image.asset('assets/images/logo_00.png'),
                ),
              ),
            ),
            Container(
              width: constraints.maxWidth,
              // height: constraints.maxHeight / percent,
              padding: const EdgeInsets.fromLTRB(10, 40, 10, 30),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 0, bottom: 0),
                child: TextFormField(
                  controller: _usuarioUsernameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Informe o Login';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      fillColor: Colors.amber,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(90.0),
                      ),
                      labelText: 'Usuário',
                      hintText: 'Informe o e-mail'),
                ),
              ),
            ),
            Container(
              width: constraints.maxWidth,
              // height: constraints.maxHeight / percent,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
              decoration: const BoxDecoration(color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15.0, bottom: 0),
                child: TextFormField(
                  controller: _usuarioPasswordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Informe a Senha';
                    }
                    return null;
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(90.0),
                      ),
                      labelText: 'Senha',
                      hintText: 'Informe a senha'),
                ),
              ),
            ),
            Container(
              width: 375,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 30),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                  color: Colors.white),
              child: containerButton(context),
            ),
          ],
        ),
      ),
    );
  }

  containerButton(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 50.0, right: 50.0, top: 15.0, bottom: 0),
      child: Container(
          height: 40,
          margin: const EdgeInsets.only(top: 10),
          child: ElevatedButton(
            // onPressed: _submitForm,
            onPressed: _login,
            child: const Text('Entrar'),
          )),
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
            title: Text('Usuário ID: ${usuario.username}'),
            subtitle: Text('Usuário Senha: ${usuario.password}'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              // Navigator.pushNamed(context, '/report');
            },
          ),
        );
      },
    );
