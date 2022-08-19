import 'package:flutter/material.dart';
import '../models/service_order.dart';

class ServiceOrderPage extends StatelessWidget {
  final ServiceOrder serviceOrder;

  const ServiceOrderPage({Key? key, required this.serviceOrder})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Service Order Screen'),
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
