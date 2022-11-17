import 'dart:convert';
import 'package:easy_report_app/models/relatorio_servico.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/shimmer_relatorio_servico.dart';

class ServiceReport extends StatefulWidget {
  final Relatorio relatorioDeServico;

  const ServiceReport({Key? key, required this.relatorioDeServico})
      : super(key: key);

  @override
  State<ServiceReport> createState() => _ServiceReportState();
}

class _ServiceReportState extends State<ServiceReport> {
  List clientesItemList = [];
  Future getClientes() async {
    const url =
        'http://www.relatoriofacil.kinghost.net/relatorio_facil/api/cliente';
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
    const url =
        'http://www.relatoriofacil.kinghost.net/relatorio_facil/api/tipo_servico';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      setState(() {
        tipoServicoItemList = jsonData;
      });
    }
  }

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1)).then((value) {
      setState(() {
        isLoading = false;
      });
    });
    getClientes();
    getTipoServico();
  }

  @override
  Widget build(BuildContext context) {
    const percent = 3;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes Relatório de Serviço'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            child: SingleChildScrollView(
              child: isLoading
                  ? const ShimmerRelatorioServico()
                  : Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 5, bottom: 20),
                          padding: const EdgeInsets.only(left: 100, right: 100),
                          child: Text(
                            'N. ${widget.relatorioDeServico.relatorioNumero.toString()}',
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
                                  'Data Abertura',
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
                                  ('${(widget.relatorioDeServico.relatorioData).day}/${(widget.relatorioDeServico.relatorioData).month}/${(widget.relatorioDeServico.relatorioData).year}')
                                      .toString(),
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
                                margin:
                                    const EdgeInsets.only(right: 40, top: 10),
                                child: const Text(
                                  'Número da O.S.',
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin:
                                    const EdgeInsets.only(left: 20, top: 10),
                                child: const Text(
                                  'Matrícula Funcionário',
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
                                  (widget.relatorioDeServico.relatorioOsNumero)
                                      .toString(),
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
                                  (widget.relatorioDeServico
                                          .relatorioFuncRegistro)
                                      .toString(),
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
                                margin:
                                    const EdgeInsets.only(right: 40, top: 10),
                                child: const Text(
                                  'Nome Cliente',
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin:
                                    const EdgeInsets.only(left: 20, top: 10),
                                child: const Text(
                                  'Setor Cliente',
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
                                  clientesItemList.isNotEmpty
                                      ? (getClienteNome(
                                          widget.relatorioDeServico
                                              .relatorioClienteRegistro,
                                          clientesItemList))
                                      : '',
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
                                  (widget.relatorioDeServico
                                          .relatorioSetorClicente)
                                      .toString(),
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
                                margin:
                                    const EdgeInsets.only(right: 40, top: 10),
                                child: const Text(
                                  'Contato Cliente',
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin:
                                    const EdgeInsets.only(left: 20, top: 10),
                                child: const Text(
                                  'Tipo de Serviço',
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
                                  (widget.relatorioDeServico
                                          .relatorioContatoCliente)
                                      .toString(),
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
                                  clientesItemList.isNotEmpty
                                      ? (getServicoNome(
                                          widget.relatorioDeServico
                                              .relatorioTipoServico,
                                          tipoServicoItemList))
                                      : '',
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
                                margin:
                                    const EdgeInsets.only(right: 40, top: 10),
                                child: const Text(
                                  'Descrição',
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
                            widget.relatorioDeServico.relatorioDescricao,
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
      ),
    );
  }
}

String getClienteNome(int clienteRegistro, List listaCliente) {
  var clientesItemList = listaCliente;

  var result = [...clientesItemList].map((e) => {e['clienteNome'].toString()});
  return (result.elementAt(clienteRegistro - 1)).toList().first;
}

String getServicoNome(int tipoServico, List listaServicos) {
  var tipoServicosItemList = listaServicos;

  var result =
      [...tipoServicosItemList].map((e) => {e['servDescricao'].toString()});
  return (result.elementAt(tipoServico - 1)).toList().first;
}
