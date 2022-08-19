import 'package:easy_report_app/models/service_order.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ServiceReportList extends StatelessWidget {
  final List<ServiceOrder> reports;
  final void Function(String) onRemove;

  const ServiceReportList(this.reports, this.onRemove, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: reports.isEmpty
          ? Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Nenhuma Ordem de Servico Recebida :(',
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
            )
          : ListView.builder(
              itemCount: reports.length,
              itemBuilder: (ctx, item) {
                final tr = reports[item];
                return Card(
                  elevation: 5,
                  margin: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      radius: 30,
                      // child: Padding(
                      //   padding: const EdgeInsets.all(5.0),
                      //   child: FittedBox(
                      //     child: Text(
                      //       'R\$${tr.value}',
                      //       style: const TextStyle(
                      //         color: Color.fromARGB(255, 241, 247, 250),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ),
                    title: Text(tr.osNumero.toString(),
                        style: Theme.of(context).textTheme.titleLarge),
                    subtitle: Text(tr.osDataAbertura),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Theme.of(context).errorColor,
                      ),
                      onPressed: () => onRemove(tr.osNumero.toString()),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
