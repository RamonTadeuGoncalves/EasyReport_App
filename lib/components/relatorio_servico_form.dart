import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionFom extends StatefulWidget {
  final void Function(
    int,
    int,
    int,
    int,
    String,
    String,
    String,
    DateTime,
    bool,
    String,
    String,
    String,
    String,
    String,
  ) onSubmit;

  const TransactionFom(this.onSubmit, {Key? key}) : super(key: key);

  @override
  State<TransactionFom> createState() => _TransactionFomState();
}

class _TransactionFomState extends State<TransactionFom> {
  // final _titleController = TextEditingController();
  // final _valueController = TextEditingController();
  final _relatorioNumeroController = TextEditingController();
  final _relatorioOsNumeroController = TextEditingController();
  final _relatorioFuncRegistroController = TextEditingController();
  final _relatorioClienteRegistroController = TextEditingController();
  final _relatorioDescricaoController = TextEditingController();
  final _relatorioContatoClienteController = TextEditingController();
  final _relatorioSetorClicenteController = TextEditingController();
  // final relatorioData = TextEditingController();
  final _relatorioEstadoController = TextEditingController();
  final _relatorioObservacaoController = TextEditingController();
  final _relatorioFotoController = TextEditingController();
  final _relatorioComentarioClienteController = TextEditingController();
  final _relatorioOutrosController = TextEditingController();
  final _relatorioTipoServicoController = TextEditingController();
  DateTime _relatorioData = DateTime.now();

  _submitForm() {
    // final title = _titleController.text;
    // final value = double.tryParse(_valueController.text) ?? 0.0;

    // if (title.isEmpty || _selectedDate == null) {
    //   return;
    final relatorioNumero = int.tryParse(_relatorioNumeroController.text) ?? 0;
    final relatorioOsNumero =
        int.tryParse(_relatorioOsNumeroController.text) ?? 0;
    final relatorioFuncRegistro =
        int.tryParse(_relatorioFuncRegistroController.text) ?? 0;
    final relatorioClienteRegistro =
        int.tryParse(_relatorioClienteRegistroController.text) ?? 0;
    final relatorioDescricao = _relatorioDescricaoController.text;
    final relatorioContatoCliente = _relatorioContatoClienteController.text;
    final relatorioSetorClicente = _relatorioSetorClicenteController.text;
    // final relatorioData = TextEditingController();
    final relatorioEstado =
        bool.fromEnvironment(_relatorioEstadoController.text);
    final relatorioObservacao = _relatorioObservacaoController.text;
    final relatorioFoto = _relatorioFotoController.text;
    final relatorioComentarioCliente =
        _relatorioComentarioClienteController.text;
    final relatorioOutros = _relatorioOutrosController.text;
    final relatorioTipoServico = _relatorioTipoServicoController.text;

    widget.onSubmit(
      relatorioNumero,
      relatorioOsNumero,
      relatorioFuncRegistro,
      relatorioClienteRegistro,
      relatorioDescricao,
      relatorioContatoCliente,
      relatorioSetorClicente,
      _relatorioData,
      relatorioEstado,
      relatorioObservacao,
      relatorioFoto,
      relatorioComentarioCliente,
      relatorioOutros,
      relatorioTipoServico,
    );
  }

  _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _relatorioData = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              controller: _relatorioNumeroController,
              decoration: const InputDecoration(labelText: 'Relatorio Numero'),
            ),
            TextField(
              controller: _relatorioOsNumeroController,
              decoration: const InputDecoration(labelText: 'Ordem de Servico'),
            ),
            TextField(
              controller: _relatorioFuncRegistroController,
              decoration: const InputDecoration(labelText: 'Funcionario'),
            ),
            TextField(
              controller: _relatorioClienteRegistroController,
              decoration: const InputDecoration(labelText: 'Cliente'),
            ),
            TextField(
              controller: _relatorioDescricaoController,
              decoration: const InputDecoration(labelText: 'Descricao'),
            ),
            TextField(
              controller: _relatorioContatoClienteController,
              decoration: const InputDecoration(labelText: 'Contato'),
            ),
            TextField(
              controller: _relatorioSetorClicenteController,
              decoration: const InputDecoration(labelText: 'Setor'),
            ),
            TextField(
              controller: _relatorioEstadoController,
              decoration: const InputDecoration(labelText: 'Estado'),
            ),
            TextField(
              controller: _relatorioObservacaoController,
              decoration: const InputDecoration(labelText: 'Observacao'),
            ),
            TextField(
              controller: _relatorioFotoController,
              decoration: const InputDecoration(labelText: 'Foto'),
            ),
            TextField(
              controller: _relatorioComentarioClienteController,
              decoration: const InputDecoration(labelText: 'Comentario'),
            ),
            TextField(
              controller: _relatorioOutrosController,
              decoration: const InputDecoration(labelText: 'Outros'),
            ),
            TextField(
              controller: _relatorioTipoServicoController,
              decoration: const InputDecoration(labelText: 'Tipo Servico'),
            ),
            SizedBox(
              height: 70,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      _relatorioData == null
                          ? 'Nenhuma data selecionada!'
                          : 'Data selecionada: ${DateFormat('dd/MM/y').format(_relatorioData)}',
                    ),
                  ),
                  TextButton(
                    child: const Text(
                      'Selecionar data',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      _showDatePicker();
                    },
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: _submitForm,
                  child: const Text(
                    'Novo Relatório',
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
