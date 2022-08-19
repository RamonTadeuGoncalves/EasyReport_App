import 'dart:convert';
import 'package:easy_report_app/models/service_order.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'serviceOrderPage.dart';

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
    final body = json.decode(response.body);
    return body.map<ServiceOrder>(ServiceOrder.fromJson).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Service Order Screen'),
      ),
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
              return buildServiceOrders(serviceOrders);
            } else {
              return const Text('Nenhuma Ordem de Servico recebida :(');
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          getServiceOrders();
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
              subtitle: Text(serviceOrder.osDataAbertura),
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