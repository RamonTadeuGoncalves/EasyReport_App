import 'package:easy_report_app/models/relatorio_servico.dart';
import 'package:flutter/material.dart';

class ServiceReport extends StatelessWidget {
  final Relatorio relatorioDeServico;

  const ServiceReport({Key? key, required this.relatorioDeServico})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Detalhes Relatorio de Servico'),
        ),
        body: Center(
          child: Column(
            children: [
              Text(relatorioDeServico.relatorioDescricao),
            ],
          ),
        ),
      );
}
