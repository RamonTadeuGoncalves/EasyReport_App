import 'package:easy_report_app/data/api_data.dart';
import 'package:easy_report_app/models/relatorio_servico.dart';
import 'package:easy_report_app/screens/relatorio_servico_form.dart';
import 'package:easy_report_app/screens/relatorio_servico_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RelatorioDeServicoLista extends StatefulWidget {
  const RelatorioDeServicoLista({Key? key}) : super(key: key);

  @override
  State<RelatorioDeServicoLista> createState() =>
      _RelatorioDeServicoListaState();
}

class _RelatorioDeServicoListaState extends State<RelatorioDeServicoLista> {
  final List<Relatorio> _relatorios = [];

  Future<List<Relatorio>> relatorioDeServicoFuture =
      ApiDataRelatorioServico.getRelatoriosDeServico();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<List<Relatorio>>(
          future: relatorioDeServicoFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Erro ao carregar ${snapshot.error}');
            } else if (snapshot.hasData) {
              final relatoriosDeServico = snapshot.data!;
              if (relatoriosDeServico.isEmpty) {
                return SizedBox(
                  height: 500,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Nenhum Relatorio Cadastrado :(',
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
                return buildRelatoriosDeServico(relatoriosDeServico);
              }
            } else {
              return const Text('Nenhuma Ordem de Servico Recebida :(');
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const RelatorioServicoForm(),
              ),
            );
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget buildRelatoriosDeServico(List<Relatorio> relatoriosDeServico) =>
      ListView.builder(
        itemCount: relatoriosDeServico.length,
        itemBuilder: (context, index) {
          final relatorioDeServico = relatoriosDeServico[index];
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                radius: 28,
                backgroundColor: Theme.of(context).colorScheme.primary,
                child: Text('${relatorioDeServico.relatorioNumero.toString()}'),
              ),
              title: Text(
                  'Relatorio De Servico: ${relatorioDeServico.relatorioNumero.toString()}'),
              subtitle: Text(DateFormat('dd/MM/y')
                  .format(relatorioDeServico.relatorioData)),
              trailing: const Icon(Icons.receipt_long_rounded),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        ServiceReport(relatorioDeServico: relatorioDeServico),
                  ),
                );
              },
            ),
          );
        },
      );
}
