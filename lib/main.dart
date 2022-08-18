import 'package:easy_report_app/screens/service_list.dart';
import 'package:easy_report_app/screens/service_report.dart';
import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          bottom: const TabBar(tabs: [
            Tab(
              icon: Icon(Icons.receipt_long_rounded),
            ),
            Tab(
              icon: Icon(Icons.file_open_rounded),
            ),
            Tab(
              icon: Icon(Icons.settings),
            ),
          ]),
        ),
        body: TabBarView(children: [
          Center(
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/report');
              },
              icon: const Icon(Icons.receipt_long_rounded),
              label: const Text('Report'),
            ),
          ),
          Center(
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/service');
              },
              icon: const Icon(Icons.receipt_long_rounded),
              label: const Text('Service'),
            ),
          ),
          const Icon(Icons.settings),
        ]),
      ),
    );
  }
}
