import 'dart:math';
import 'package:flutter/material.dart';
import '../components/relatorio_servico_form.dart';
import '../components/relatorio_servico_lista.dart';
import '../models/relatorio_servico.dart';

class ServiceReport extends StatefulWidget {
  const ServiceReport({Key? key}) : super(key: key);

  @override
  State<ServiceReport> createState() => _ServiceReportState();
}

class _ServiceReportState extends State<ServiceReport> {
  final List<Relatorio> _transactions = [];

  List<Relatorio> get _recentTransctions {
    return _transactions.where((tr) {
      return tr.relatorioData.isAfter(DateTime.now().subtract(
        const Duration(days: 7),
      ));
    }).toList();
  }

  _addTransaction(
    int relatorioNumero,
    int relatorioOsNumero,
    int relatorioFuncRegistro,
    int relatorioClienteRegistro,
    String relatorioDescricao,
    String relatorioContatoCliente,
    String relatorioSetorClicente,
    DateTime relatorioData,
    bool relatorioEstado,
    String relatorioObservacao,
    String relatorioFoto,
    String relatorioComentarioCliente,
    String relatorioOutros,
    String relatorioTipoServico,
  ) {
    final newTransaction = Relatorio(
      relatorioNumero: Random().nextInt(100),
      relatorioOsNumero: relatorioOsNumero,
      relatorioFuncRegistro: relatorioFuncRegistro,
      relatorioClienteRegistro: relatorioClienteRegistro,
      relatorioDescricao: relatorioDescricao,
      relatorioContatoCliente: relatorioContatoCliente,
      relatorioSetorClicente: relatorioSetorClicente,
      relatorioData: relatorioData,
      relatorioEstado: relatorioEstado,
      relatorioObservacao: relatorioObservacao,
      relatorioFoto: relatorioFoto,
      relatorioComentarioCliente: relatorioComentarioCliente,
      relatorioOutros: relatorioOutros,
      relatorioTipoServico: relatorioTipoServico,
    );
    setState(() {
      _transactions.add(newTransaction);
      Navigator.of(context).pop();
    });
  }

  _removeTransaction(String id) {
    setState(() {
      _transactions.removeWhere((tr) => tr.relatorioNumero == id);
    });
  }

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return TransactionFom(_addTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TransactionList(_transactions, _removeTransaction),
            // _relatorioForm,
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        // onPressed: () => _openTransactionFormModal(context),
        onPressed: () => Navigator.pushNamed(context, '/report_form'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
