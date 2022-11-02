import 'package:flutter/material.dart';
import '../models/ordem_servico.dart';

class ServiceOrderPage extends StatelessWidget {
  final ServiceOrder serviceOrder;

  const ServiceOrderPage({Key? key, required this.serviceOrder})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Detalhes Ordem de Serviço'),
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
                    'N. ${serviceOrder.osNumero.toString()}',
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
                          ('${(serviceOrder.osDataAbertura).day}/${(serviceOrder.osDataAbertura).month}/${(serviceOrder.osDataAbertura).year}')
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
                          'Código Funcionário',
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 20, top: 10),
                        child: const Text(
                          'Código Veículo',
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
                          (serviceOrder.osFuncRegistro).toString(),
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
                          (serviceOrder.osVeicRegistro).toString(),
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
                          (serviceOrder.osClienteRegistro).toString(),
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
                          (serviceOrder.osTipoServico).toString(),
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
                    serviceOrder.osDescricao,
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
