import 'package:easy_report_app/models/relatorio_servico.dart';
import 'package:flutter/material.dart';

class ServiceReport extends StatelessWidget {
  final Relatorio relatorioDeServico;

  const ServiceReport({Key? key, required this.relatorioDeServico})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Detalhes Relatório de Serviço'),
        ),
        body: Container(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 5, bottom: 20),
                  padding: const EdgeInsets.only(left: 100, right: 100),
                  child: Text(
                    'N. ${relatorioDeServico.relatorioNumero.toString()}',
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
                          ('${(relatorioDeServico.relatorioData).day}/${(relatorioDeServico.relatorioData).month}/${(relatorioDeServico.relatorioData).year}')
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
                        margin: const EdgeInsets.only(right: 40, top: 10),
                        child: const Text(
                          'Número da O.S.',
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 20, top: 10),
                        child: const Text(
                          'Registro Funcionário',
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
                          (relatorioDeServico.relatorioOsNumero).toString(),
                          style: const TextStyle(fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin:
                            const EdgeInsets.only(left: 20, top: 5, bottom: 20),
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: Colors.black,
                              width: 0.75,
                            )),
                        child: Text(
                          (relatorioDeServico.relatorioFuncRegistro).toString(),
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
                          'Código Cliente',
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 20, top: 10),
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
                          (relatorioDeServico.relatorioClienteRegistro)
                              .toString(),
                          style: const TextStyle(fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin:
                            const EdgeInsets.only(left: 20, top: 5, bottom: 20),
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: Colors.black,
                              width: 0.75,
                            )),
                        child: Text(
                          (relatorioDeServico.relatorioSetorClicente)
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
                        margin: const EdgeInsets.only(right: 40, top: 10),
                        child: const Text(
                          'Contato Cliente',
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 20, top: 10),
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
                          (relatorioDeServico.relatorioContatoCliente)
                              .toString(),
                          style: const TextStyle(fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin:
                            const EdgeInsets.only(left: 20, top: 5, bottom: 20),
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: Colors.black,
                              width: 0.75,
                            )),
                        child: Text(
                          (relatorioDeServico.relatorioTipoServico).toString(),
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
                    relatorioDeServico.relatorioDescricao,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
