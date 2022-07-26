import 'dart:convert';
import 'package:intl/intl.dart';

Relatorio relatorioFromJson(String str) => Relatorio.fromJson(json.decode(str));
String relatorioToJson(Relatorio data) => json.encode(data.toJson());

class Relatorio {
  final int relatorioNumero;
  final int relatorioOsNumero;
  final int relatorioFuncRegistro;
  final int relatorioClienteRegistro;
  final String relatorioDescricao;
  final String relatorioContatoCliente;
  final String relatorioSetorClicente;
  final DateTime relatorioData;
  final int relatorioTipoServico;

  Relatorio({
    required this.relatorioNumero,
    required this.relatorioOsNumero,
    required this.relatorioFuncRegistro,
    required this.relatorioClienteRegistro,
    required this.relatorioDescricao,
    required this.relatorioContatoCliente,
    required this.relatorioSetorClicente,
    required this.relatorioData,
    required this.relatorioTipoServico,
  });

  factory Relatorio.fromJson(Map<String, dynamic> json) => Relatorio(
      relatorioNumero: json['relatorioNumero'] as int,
      relatorioOsNumero: json['relatorioOsNumero'] as int,
      relatorioFuncRegistro: json['relatorioFuncRegistro'] as int,
      relatorioClienteRegistro: json['relatorioClienteRegistro'] as int,
      relatorioDescricao: json['relatorioDescricao'] as String,
      relatorioContatoCliente: json['relatorioContatoCliente'] as String,
      relatorioSetorClicente: json['relatorioSetorClicente'] as String,
      relatorioData: DateTime.parse(json['relatorioData']),
      relatorioTipoServico: json['relatorioTipoServico'] as int);

  Map<String, dynamic> toJson() => {
        'relatorioNumero': relatorioNumero,
        'relatorioOsNumero': relatorioOsNumero,
        'relatorioFuncRegistro': relatorioFuncRegistro,
        'relatorioClienteRegistro': relatorioClienteRegistro,
        'relatorioDescricao': relatorioDescricao,
        'relatorioContatoCliente': relatorioContatoCliente,
        'relatorioSetorClicente': relatorioSetorClicente,
        'relatorioData': relatorioData.toIso8601String(),
        'relatorioTipoServico': relatorioTipoServico
      };

  @override
  String toString() {
    return 'Relatorio {Numero Relatorio: $relatorioNumero, Numero O.S. $relatorioOsNumero, Funcionario: $relatorioFuncRegistro, Descricao: $relatorioDescricao, CLiente: $relatorioClienteRegistro, Contado: $relatorioContatoCliente, Setor: $relatorioSetorClicente, Data: ${DateFormat('dd/MM/y').format(relatorioData)}, Tipo de Servico: $relatorioTipoServico';
  }
}
