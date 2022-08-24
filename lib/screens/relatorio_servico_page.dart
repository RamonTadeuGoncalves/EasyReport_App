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
  final List<Transaction> _transactions = [];

  List<Transaction> get _recentTransctions {
    return _transactions.where((tr) {
      return tr.date.isAfter(DateTime.now().subtract(
        const Duration(days: 7),
      ));
    }).toList();
  }

  _addTransaction(String title, DateTime date) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      date: date,
    );
    setState(() {
      _transactions.add(newTransaction);
      Navigator.of(context).pop();
    });
  }

  _removeTransaction(String id) {
    setState(() {
      _transactions.removeWhere((tr) => tr.id == id);
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
      appBar: AppBar(
        title: const Text('Relatorio de Servico'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TransactionList(_transactions, _removeTransaction),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _openTransactionFormModal(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
