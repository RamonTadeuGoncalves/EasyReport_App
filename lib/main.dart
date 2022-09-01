import 'dart:math';

import 'package:easy_report_app/screens/ordem_servico_lista.dart';
import 'package:easy_report_app/screens/relatorio_servico_form.dart';
import 'package:flutter/material.dart';
import 'models/relatorio_servico.dart';
import 'screens/relatorio_servico_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/service': (context) => const ServiceList(),
        '/report': (context) => const ServiceReport(),
        // '/report_form': (context) => RelatorioServicoForm(_addRelatorio),
      },
      title: 'Easy Report',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple)
            .copyWith(secondary: Colors.amber),
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: const TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: const MyHomePage(title: 'Easy Report'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Relatorio> _relatorios = [];

  int _selectedIndex = 0;

  static const List<Widget> _telas = [
    ServiceReport(),
    ServiceList(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.receipt_long_rounded),
                label: 'Relatorio',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.file_open_rounded),
                label: 'O.S.',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Configuracao',
              )
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.purple,
            onTap: _onItemTapped,
          ),
          body: _telas[_selectedIndex]),
    );
  }
}
