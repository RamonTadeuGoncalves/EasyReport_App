import 'dart:convert';
import 'package:easy_report_app/models/ordem_servico.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'ordem_servico_page.dart';

class ServiceList extends StatefulWidget {
  const ServiceList({Key? key}) : super(key: key);

  @override
  State<ServiceList> createState() => _ServiceListState();
}

class _ServiceListState extends State<ServiceList> {
  Future<List<ServiceOrder>> serviceOrdersFuture = getServiceOrders();

  static Future<List<ServiceOrder>> getServiceOrders() async {
    const url = 'http://10.0.2.2:8000/api/ordem_servico';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      List<ServiceOrder> serviceOrders =
          body.map((dynamic item) => ServiceOrder.fromJson(item)).toList();
      return serviceOrders;
    } else {
      throw 'Falha ao carregar';
    }
  }

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
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          getServiceOrders().then((value) {
            setState(() {
              widget.createState();
            });
          });
        },
        tooltip: 'Update',
        child: const Icon(Icons.update),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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
              ),
              title:
                  Text('Ordem de Servico: ${serviceOrder.osNumero.toString()}'),
              subtitle: Text(
                  DateFormat('dd/MM/y').format(serviceOrder.osDataAbertura)),
              trailing: const Icon(Icons.arrow_forward),
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
