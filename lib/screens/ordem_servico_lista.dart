import 'package:easy_report_app/models/ordem_servico.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../data/api_data.dart';
import 'ordem_servico_page.dart';

class ServiceList extends StatefulWidget {
  const ServiceList({Key? key}) : super(key: key);

  @override
  State<ServiceList> createState() => _ServiceListState();
}

class _ServiceListState extends State<ServiceList> {
  Future<List<ServiceOrder>> serviceOrdersFuture =
      ApiDataOrdemServico.getServiceOrders();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<List<ServiceOrder>>(
          future: serviceOrdersFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Erro ao carregar ${snapshot.error}');
            } else if (snapshot.hasData) {
              final serviceOrders = snapshot.data!;
              if (serviceOrders.isEmpty) {
                return SizedBox(
                  height: 500,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Nenhuma Ordem de Servico Recebida :(',
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
                return buildServiceOrders(serviceOrders);
              }
            } else {
              return const Text('Nenhuma Ordem de Servico Recebida :(');
            }
          },
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () async {
      //     ApiDataOrdemServico.getServiceOrders().then((value) {
      //       setState(() {
      //         widget.createState();
      //       });
      //     });
      //   },
      //   tooltip: 'Update',
      //   child: const Icon(Icons.update),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget buildServiceOrders(List<ServiceOrder> serviceOrders) =>
      ListView.builder(
        itemCount: serviceOrders.length,
        itemBuilder: (context, index) {
          final serviceOrder = serviceOrders[index];
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                radius: 28,
                backgroundColor: Theme.of(context).colorScheme.primary,
                child: Text('${serviceOrder.osNumero.toString()}'),
              ),
              title:
                  Text('Ordem de Servico: ${serviceOrder.osNumero.toString()}'),
              subtitle: Text(
                  DateFormat('dd/MM/y').format(serviceOrder.osDataAbertura)),
              trailing: const Icon(Icons.description_outlined),
              onTap: () {
                // Navigator.pushNamed(context, '/report');
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        ServiceOrderPage(serviceOrder: serviceOrder),
                  ),
                );
              },
            ),
          );
        },
      );
}
