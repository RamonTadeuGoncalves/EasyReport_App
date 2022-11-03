import 'package:easy_report_app/data/api_data.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/relatorio_servico.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class RelatorioServicoForm extends StatefulWidget {
  const RelatorioServicoForm({Key? key}) : super(key: key);

  @override
  State<RelatorioServicoForm> createState() => _RelatorioServicoFormState();
}

class _RelatorioServicoFormState extends State<RelatorioServicoForm> {
  final _formKey = GlobalKey<FormState>();

  List serviceOrdersItemList = [];
  Future getServiceOrders() async {
    const url = 'http://10.0.2.2:8000/api/ordem_servico';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      setState(() {
        serviceOrdersItemList = jsonData;
      });
    }
  }

  List clientesItemList = [];
  Future getClientes() async {
    const url = 'http://10.0.2.2:8000/api/cliente';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      setState(() {
        clientesItemList = jsonData;
      });
    }
  }

  List tipoServicoItemList = [];
  Future getTipoServico() async {
    const url = 'http://10.0.2.2:8000/api/tipo_servico';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      setState(() {
        tipoServicoItemList = jsonData;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getServiceOrders();
    getClientes();
    getTipoServico();
  }

  var serviceOrderDropDownValue;
  var clienteDropDownValue;
  var tipoServicoDropDownValue;

  Future<Relatorio>? _relatorio;

  final ApiDataRelatorioServico api = ApiDataRelatorioServico();

  final TextEditingController _relatorioNumeroController =
      TextEditingController();

  final TextEditingController _relatorioFuncRegistroController =
      TextEditingController();

  final TextEditingController _relatorioDescricaoController =
      TextEditingController();

  final TextEditingController _relatorioContatoClienteController =
      TextEditingController();

  final TextEditingController _relatorioSetorClicenteController =
      TextEditingController();

  final TextEditingController relatorioData = TextEditingController();
  DateTime _relatorioData = DateTime.now();

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      final relatorioNumero =
          int.tryParse(_relatorioNumeroController.text) ?? 0;
      final relatorioOsNumero = int.tryParse(serviceOrderDropDownValue) ?? 0;
      final relatorioFuncRegistro =
          int.tryParse(_relatorioFuncRegistroController.text) ?? 0;
      final relatorioClienteRegistro = int.tryParse(clienteDropDownValue) ?? 0;
      final relatorioDescricao = _relatorioDescricaoController.text;
      final relatorioContatoCliente = _relatorioContatoClienteController.text;
      final relatorioSetorClicente = _relatorioSetorClicenteController.text;
      final relatorioTipoServico = int.tryParse(tipoServicoDropDownValue) ?? 0;

      dynamic _relatorioServicoRes = await api.addRelatorio(
          relatorioNumero,
          relatorioOsNumero,
          relatorioFuncRegistro,
          relatorioClienteRegistro,
          relatorioDescricao,
          relatorioContatoCliente,
          relatorioSetorClicente,
          _relatorioData,
          relatorioTipoServico);

      setState(() {
        Navigator.of(context).pop();
      });
    }
  }

  _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _relatorioData = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Cadastrar Relatório de Serviço'),
        ),
        body: Form(
          key: _formKey,
          child: Container(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            child: SingleChildScrollView(
              child: Column(children: [
                Container(
                  padding: const EdgeInsets.only(right: 130, bottom: 8),
                  child: DropdownButtonFormField(
                    validator: (value) {
                      if (value == null) {
                        return 'Selecione o úmero da O.S.';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        labelText: 'Ordem de Servico',
                        hintText: 'Número da O.S.'),
                    items: serviceOrdersItemList.map((item) {
                      return DropdownMenuItem(
                        value: item['osNumero'].toString(),
                        child: Text(item['osNumero'].toString()),
                      );
                    }).toList(),
                    onChanged: (newVal) {
                      setState(() {
                        serviceOrderDropDownValue = newVal;
                      });
                    },
                    value: serviceOrderDropDownValue,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(right: 130, bottom: 8),
                  child: TextFormField(
                    controller: _relatorioFuncRegistroController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Informe o seu registro';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        labelText: 'Funcionario',
                        hintText: 'N. do seu registro'),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(right: 130, bottom: 8),
                  child: DropdownButtonFormField(
                    validator: (value) {
                      if (value == null) {
                        return 'Selecione o nome do cliente';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        labelText: 'Cliente', hintText: 'Nome do cliente'),
                    items: clientesItemList.map((item) {
                      return DropdownMenuItem(
                        value: item['clienteRegistro'].toString(),
                        child: Text(item['clienteNome'].toString()),
                      );
                    }).toList(),
                    onChanged: (newVal) {
                      setState(() {
                        clienteDropDownValue = newVal;
                      });
                    },
                    value: clienteDropDownValue,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: TextFormField(
                    controller: _relatorioSetorClicenteController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Informe o nome do setor';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                        labelText: 'Setor',
                        hintText: 'Setor onde o serviço foi realizado'),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: TextFormField(
                    controller: _relatorioContatoClienteController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Informe um nome de contato';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                        labelText: 'Contato',
                        hintText: 'Informe um nome de contato do cliente'),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(right: 130, bottom: 8),
                  child: DropdownButtonFormField(
                    validator: (value) {
                      if (value == null) {
                        return 'Selecione o tipo de serviço';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        labelText: 'Tipo Servico',
                        hintText: 'Tipo de serviço realizado'),
                    items: tipoServicoItemList.map((item) {
                      return DropdownMenuItem(
                        value: item['servRegistro'].toString(),
                        child: Text(item['servDescricao'].toString()),
                      );
                    }).toList(),
                    onChanged: (newVal) {
                      setState(() {
                        tipoServicoDropDownValue = newVal;
                      });
                    },
                    value: tipoServicoDropDownValue,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: TextFormField(
                    maxLength: 200,
                    controller: _relatorioDescricaoController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Informe a descrição do serviço';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                        labelText: 'Descricao',
                        hintText: 'Informe uma descrição'),
                    maxLines: 5,
                  ),
                ),
                SizedBox(
                  height: 70,
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          _relatorioData == null
                              ? 'Nenhuma data selecionada!'
                              : 'Data selecionada: ${DateFormat('dd/MM/y').format(_relatorioData)}',
                        ),
                      ),
                      TextButton(
                        child: const Text(
                          'Selecionar data',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {
                          _showDatePicker();
                        },
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: _submitForm,
                      child: const Text(
                        'Novo Relatório',
                      ),
                    ),
                  ],
                )
              ]),
            ),
          ),
        ),
      );
}
