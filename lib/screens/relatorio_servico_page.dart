import 'package:flutter/material.dart';
import '../components/relatorio_servico_lista.dart';
import '../models/relatorio_servico.dart';
import 'relatorio_servico_form.dart';

class ServiceReport extends StatefulWidget {
  const ServiceReport({Key? key}) : super(key: key);

  @override
  State<ServiceReport> createState() => _ServiceReportState();
}

class _ServiceReportState extends State<ServiceReport> {
  final List<Relatorio> _relatorios = [];

  List<Relatorio> get _recentTransctions {
    return _relatorios.where((tr) {
      return tr.relatorioData.isAfter(DateTime.now().subtract(
        const Duration(days: 7),
      ));
    }).toList();
  }

  _addRelatorio(
    int relatorioNumero,
    int relatorioOsNumero,
    int relatorioFuncRegistro,
    int relatorioClienteRegistro,
    String relatorioDescricao,
    String relatorioContatoCliente,
    String relatorioSetorClicente,
    DateTime relatorioData,
    String relatorioObservacao,
    String relatorioComentarioCliente,
    String relatorioOutros,
    String relatorioTipoServico,
  ) {
    final Relatorio novoRelatorio = Relatorio(
        relatorioNumero: relatorioNumero,
        relatorioOsNumero: relatorioOsNumero,
        relatorioFuncRegistro: relatorioFuncRegistro,
        relatorioClienteRegistro: relatorioClienteRegistro,
        relatorioDescricao: relatorioDescricao,
        relatorioContatoCliente: relatorioContatoCliente,
        relatorioSetorClicente: relatorioSetorClicente,
        relatorioData: relatorioData,
        // relatorioEstado: relatorioEstado,
        relatorioObservacao: relatorioObservacao,
        // relatorioFoto: relatorioFoto,
        relatorioComentarioCliente: relatorioComentarioCliente,
        relatorioOutros: relatorioOutros,
        relatorioTipoServico: relatorioTipoServico);
    print(novoRelatorio);
    setState(() {
      _relatorios.add(novoRelatorio);
      Navigator.of(context).pop();
    });
  }

  _removeTransaction(String id) {
    setState(() {
      _relatorios.removeWhere((tr) => tr.relatorioNumero.toString() == id);
    });
  }

  // _openTransactionFormModal(BuildContext context) {
  //   Navigator.of(context).push(MaterialPageRoute(
  //       builder: (context) => RelatorioServicoForm(_addRelatorio)));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TransactionList(_relatorios, _removeTransaction),
              // _relatorioForm,
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          // onPressed: () => _openTransactionFormModal(context),
          // onPressed: () => Navigator.pushNamed(context, '/report_form'),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => RelatorioServicoForm(_addRelatorio),
              ),
            );
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
