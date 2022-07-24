import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionFom extends StatefulWidget {
  final void Function(String, DateTime) onSubmit;

  const TransactionFom(this.onSubmit, {Key? key}) : super(key: key);

  @override
  State<TransactionFom> createState() => _TransactionFomState();
}

class _TransactionFomState extends State<TransactionFom> {
  final _titleController = TextEditingController();
  // final _valueController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  _submitForm() {
    final title = _titleController.text;
    // final value = double.tryParse(_valueController.text) ?? 0.0;

    if (title.isEmpty || _selectedDate == null) {
      return;
    }
    widget.onSubmit(title, _selectedDate);
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
        _selectedDate = pickedDate;
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
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Titulo'),
            ),
            // TextField(
            //   keyboardType:
            //       const TextInputType.numberWithOptions(decimal: true),
            //   onSubmitted: (_) => _submitForm(),
            //   // controller: _valueController,
            //   decoration: const InputDecoration(labelText: 'Valor R\$'),
            // ),
            SizedBox(
              height: 70,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      _selectedDate == null
                          ? 'Nenhuma data selecionada!'
                          : 'Data selecionada: ${DateFormat('dd/MM/y').format(_selectedDate)}',
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
