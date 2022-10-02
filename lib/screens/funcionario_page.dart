import 'package:easy_report_app/data/api_data.dart';
import 'package:easy_report_app/models/funcionario.dart';
import 'package:easy_report_app/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FuncionarioInfo extends StatefulWidget {
  const FuncionarioInfo({Key? key}) : super(key: key);

  @override
  State<FuncionarioInfo> createState() => _FuncionarioInfoState();
}

String funcEmail = '';

class _FuncionarioInfoState extends State<FuncionarioInfo> {
  // String funcEmail = '';

  @override
  void initState() {
    super.initState();
    loadData();
    loadDataFromApi();
    _FuncionarioInfoState();
  }

  loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      funcEmail = (prefs.getString('email') ?? '');
    });
  }

  loadDataFromApi() {
    Future<List<Funcionarios>> funcionariosFuture =
        ApiDataFuncionario.getFuncionarios(funcEmail);
    return funcionariosFuture;
  }

  logoutUser() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<List<Funcionarios>>(
          future: loadDataFromApi(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Erro ao carregar ${snapshot.error}');
            } else if (snapshot.hasData) {
              final funcionarios = snapshot.data!;
              if (funcionarios.isEmpty) {
                return SizedBox(
                  height: 500,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      // Text(funcEmail),
                      Text(
                        'Nenhuma Info Cadastrada :(',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 200,
                        child: Image.asset(
                          'assets/images/waiting.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return buildFuncionarios(funcionarios);
              }
            } else {
              return const Text('Nenhuma Info Cadastrada 2 :(');
            }
          },
        ),
      ),
    );
  }

  Widget buildFuncionarios(List<Funcionarios> funcionarios) => ListView.builder(
        itemCount: funcionarios.length,
        itemBuilder: (context, index) {
          final funcionario = funcionarios[index];
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                radius: 28,
                backgroundColor: Theme.of(context).colorScheme.primary,
              ),
              title: Text('Nome: ${funcionario.funcNome.toString()}'),
              subtitle:
                  Text('Sobrenome: ${funcionario.funcSobrenome.toString()}'),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.clear();
                CircularProgressIndicator;
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
            ),
          );
        },
      );
}
