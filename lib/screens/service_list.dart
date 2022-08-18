import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ServiceList extends StatefulWidget {
  const ServiceList({Key? key}) : super(key: key);

  @override
  State<ServiceList> createState() => _ServiceListState();
}

class _ServiceListState extends State<ServiceList> {
  final client = Dio(
    BaseOptions(baseUrl: 'http://10.0.2.2:8000/api'),
  );

  List<dynamic> ordemDeServicos = [];

  Future<void> getServiceOrder() async {
    final response = await client.get('/ordem_servico');
    ordemDeServicos = response.data;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Service Order Screen'),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: ordemDeServicos.length,
          itemBuilder: (ctx, index) {
            return Card(
              elevation: 5,
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  radius: 30,
                ),
                title: Text(ordemDeServicos[index]['osNumero'].toString()),
                subtitle: Text(ordemDeServicos[index]['osDataAbertura']),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          getServiceOrder();
        },
        tooltip: 'Update',
        child: const Icon(Icons.update),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
