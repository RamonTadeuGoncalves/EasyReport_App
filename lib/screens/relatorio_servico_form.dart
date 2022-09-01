import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/relatorio_servico.dart';

class RelatorioServicoForm extends StatefulWidget {
  RelatorioServicoForm({Key? key}) : super(key: key);

  @override
  State<RelatorioServicoForm> createState() => _RelatorioServicoFormState();
}

class _RelatorioServicoFormState extends State<RelatorioServicoForm> {
  final TextEditingController _relatorioNumeroController =
      TextEditingController();

  final TextEditingController _relatorioOsNumeroController =
      TextEditingController();

  final TextEditingController _relatorioFuncRegistroController =
      TextEditingController();

  final TextEditingController _relatorioClienteRegistroController =
      TextEditingController();

  final TextEditingController _relatorioDescricaoController =
      TextEditingController();

  final TextEditingController _relatorioContatoClienteController =
      TextEditingController();

  final TextEditingController _relatorioSetorClicenteController =
      TextEditingController();

  final TextEditingController relatorioData = TextEditingController();

  final TextEditingController _relatorioEstadoController =
      TextEditingController();

  final TextEditingController _relatorioObservacaoController =
      TextEditingController();

  final TextEditingController _relatorioFotoController =
      TextEditingController();

  final TextEditingController _relatorioComentarioClienteController =
      TextEditingController();

  final TextEditingController _relatorioOutrosController =
      TextEditingController();

  final TextEditingController _relatorioTipoServicoController =
      TextEditingController();

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
    // final relatorioData = _relatorioData;
    // final relatorioEstado =
    // bool.fromEnvironment(_relatorioEstadoController.text);
    final relatorioObservacao = _relatorioObservacaoController.text;
    // final relatorioFoto = _relatorioFotoController.text;
    final relatorioComentarioCliente =
        _relatorioComentarioClienteController.text;
    final relatorioOutros = _relatorioOutrosController.text;
    final relatorioTipoServico = _relatorioTipoServicoController.text;

    // widWget.onSubmit(
    //   relatorioNumero,
    //   relatorioOsNumero,
    //   relatorioFuncRegistro,
    //   relatorioClienteRegistro,
    //   relatorioDescricao,
    //   relatorioContatoCliente,
    //   relatorioSetorClicente,
    //   _relatorioData,
    //   relatorioEstado,
    //   relatorioObservacao,
    //   relatorioFoto,
    //   relatorioComentarioCliente,
    //   relatorioOutros,
    //   relatorioTipoServico,
    // );

    final Relatorio novoRelatorio = Relatorio(
        relatorioNumero: relatorioNumero,
        relatorioOsNumero: relatorioOsNumero,
        relatorioFuncRegistro: relatorioFuncRegistro,
        relatorioClienteRegistro: relatorioClienteRegistro,
        relatorioDescricao: relatorioDescricao,
        relatorioContatoCliente: relatorioContatoCliente,
        relatorioSetorClicente: relatorioSetorClicente,
        relatorioData: _relatorioData,
        // relatorioEstado: relatorioEstado,
        relatorioObservacao: relatorioObservacao,
        // relatorioFoto: relatorioFoto,
        relatorioComentarioCliente: relatorioComentarioCliente,
        relatorioOutros: relatorioOutros,
        relatorioTipoServico: relatorioTipoServico);
    print(novoRelatorio);
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
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Cadastrar Relatorio'),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
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
              controller: _relatorioObservacaoController,
              decoration: const InputDecoration(labelText: 'Observacao'),
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
          ]),
        ),
      );
}