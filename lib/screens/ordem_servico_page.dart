import 'package:flutter/material.dart';
import '../models/ordem_servico.dart';

class ServiceOrderPage extends StatelessWidget {
  final ServiceOrder serviceOrder;

  const ServiceOrderPage({Key? key, required this.serviceOrder})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Detalhes Ordem de Servico'),
        ),
        body: Center(
          child: Column(
            children: [
              Text(serviceOrder.osDescricao),
            ],
          ),
        ),
      );
}
