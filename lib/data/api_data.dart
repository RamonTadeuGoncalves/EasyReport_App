import 'dart:convert';
import 'dart:io';
import 'package:easy_report_app/models/funcionario.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import '../models/ordem_servico.dart';
import '../models/relatorio_servico.dart';

class ApiDataLogin {
  final String apiUrl =
      'http://www.relatoriofacil.kinghost.net/relatorio_facil/api/usuario/';

  Future<Object> loginUser(
    String password,
    String username,
  ) async {
    Map data = {
      'password': password,
      'username': username,
    };

    final Response response = await http.post(
      Uri.parse(apiUrl),
      body: jsonEncode(data),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      },
    );

    if (response.statusCode == 201) {
      return username;
    }
    if (response.statusCode == 200) {
      username = 'userError';
      return username;
    } else {
      throw Exception('Falha...');
    }
  }
}

class ApiDataRelatorioServico {
  static Future<List<Relatorio>> getRelatoriosDeServico() async {
    const apiUrl =
        'http://www.relatoriofacil.kinghost.net/relatorio_facil/api/relatorio_servico';
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      List<Relatorio> relatorios =
          body.map((dynamic item) => Relatorio.fromJson(item)).toList();
      return relatorios;
    } else {
      throw 'Falha ao carregar';
    }
  }

  Future<Relatorio> addRelatorio(
    int relatorioNumero,
    int relatorioOsNumero,
    int relatorioFuncRegistro,
    int relatorioClienteRegistro,
    String relatorioDescricao,
    String relatorioContatoCliente,
    String relatorioSetorClicente,
    DateTime relatorioData,
    int relatorioTipoServico,
  ) async {
    const String apiUrl =
        'http://www.relatoriofacil.kinghost.net/relatorio_facil/api/relatorio_servico/';

    final response = await http.post(
      Uri.parse(apiUrl),
      body: jsonEncode({
        'relatorioNumero': relatorioNumero,
        'relatorioOsNumero': relatorioOsNumero,
        'relatorioFuncRegistro': relatorioFuncRegistro,
        'relatorioClienteRegistro': relatorioClienteRegistro,
        'relatorioDescricao': relatorioDescricao,
        'relatorioContatoCliente': relatorioContatoCliente,
        'relatorioSetorClicente': relatorioSetorClicente,
        'relatorioData': relatorioData.toIso8601String(),
        'relatorioTipoServico': relatorioTipoServico
      }),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      },
    );
    if (response.statusCode == 201) {
      return Relatorio.fromJson(json.decode(response.body));
      // final String responseString = response.body;
      // return Relatorio.fromJson(responseString);
    } else {
      throw Exception(response);
    }
  }
}

class ApiDataOrdemServico {
  static Future<List<ServiceOrder>> getServiceOrders() async {
    const url =
        'http://www.relatoriofacil.kinghost.net/relatorio_facil/api/ordem_servico';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      List<ServiceOrder> serviceOrders =
          body.map((dynamic item) => ServiceOrder.fromJson(item)).toList();
      return serviceOrders;
    } else {
      throw 'Falha ao carregar';
    }
  }
}

class ApiDataFuncionario {
  static Future<List<Funcionarios>> getFuncionarios(String email) async {
    String mainUrl =
        'http://www.relatoriofacil.kinghost.net/relatorio_facil/api/funcionario/';
    String funcEmail = email;
    final String url = '$mainUrl$funcEmail';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      List<Funcionarios> funcionarios =
          body.map((dynamic item) => Funcionarios.fromJson(item)).toList();
      return funcionarios;
    } else {
      throw 'Falha ao carregar';
    }
  }
}
