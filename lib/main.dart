import 'package:easy_report_app/screens/funcionario_page.dart';
import 'package:easy_report_app/screens/login_page.dart';
import 'package:easy_report_app/screens/ordem_servico_lista.dart';
import 'package:easy_report_app/screens/relatorio_servico_form.dart';
import 'package:easy_report_app/screens/relatorio_servico_lista.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'models/relatorio_servico.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
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
        '/service': (_) => const ServiceList(),
        '/report': (_) => const RelatorioServicoForm(),
        '/func_info': (_) => const FuncionarioInfo(),
        '/login': (_) => const LoginPage(),
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
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    await Future.delayed(const Duration(seconds: 1));
    FlutterNativeSplash.remove();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

  final List<Relatorio> _relatorios = [];

  int _selectedIndex = 0;

  static const List<Widget> _telas = [
    RelatorioDeServicoLista(),
    ServiceList(),
    FuncionarioInfo(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  logoutUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    CircularProgressIndicator;
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    // return Text('data');
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
            actions: [
              IconButton(
                icon: const Icon(Icons.exit_to_app),
                tooltip: 'Sair',
                onPressed: () {
                  logoutUser();
                },
              )
            ],
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
