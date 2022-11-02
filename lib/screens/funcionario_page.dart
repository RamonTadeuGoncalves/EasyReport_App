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
          return Container(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 5, bottom: 20),
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Text(
                      ('${funcionario.funcNome} ${funcionario.funcSobrenome}')
                          .toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 35),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(right: 40),
                          child: const Text(
                            'N. Registro',
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(
                              right: 200, top: 5, bottom: 20),
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: Colors.black,
                                width: 0.75,
                              )),
                          child: Text(
                            ('${(funcionario.funcRegistro)}').toString(),
                            style: const TextStyle(fontSize: 18),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(right: 40, top: 10),
                          child: const Text(
                            'CPF',
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(left: 20, top: 10),
                          child: const Text(
                            'CNH',
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(
                              right: 20, top: 5, bottom: 20),
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: Colors.black,
                                width: 0.75,
                              )),
                          child: Text(
                            (funcionario.funcCpf).toString(),
                            style: const TextStyle(fontSize: 18),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(
                              left: 20, top: 5, bottom: 20),
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: Colors.black,
                                width: 0.75,
                              )),
                          child: Text(
                            (funcionario.funcCnh).toString(),
                            style: const TextStyle(fontSize: 18),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(right: 40, top: 10),
                          child: const Text(
                            'Função',
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 400,
                    margin: const EdgeInsets.only(top: 5, bottom: 20),
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: Colors.black,
                          width: 0.75,
                        )),
                    child: Text(
                      funcionario.funcFuncao,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(right: 40, top: 10),
                          child: const Text(
                            'Departamento',
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 400,
                    margin: const EdgeInsets.only(top: 5, bottom: 20),
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: Colors.black,
                          width: 0.75,
                        )),
                    child: Text(
                      funcionario.funcDpto,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(right: 40, top: 10),
                          child: const Text(
                            'Telefone',
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 400,
                    margin: const EdgeInsets.only(top: 5, bottom: 20),
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: Colors.black,
                          width: 0.75,
                        )),
                    child: Text(
                      funcionario.funcTelefone,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(right: 40, top: 10),
                          child: const Text(
                            'E-Mail',
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 400,
                    margin: const EdgeInsets.only(top: 5, bottom: 20),
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: Colors.black,
                          width: 0.75,
                        )),
                    child: Text(
                      funcionario.funcEmail,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
}
