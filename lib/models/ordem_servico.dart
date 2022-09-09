import 'dart:convert';
import 'package:intl/intl.dart';

ServiceOrder relatorioFromJson(String str) =>
    ServiceOrder.fromJson(json.decode(str));
String relatorioToJson(ServiceOrder data) => json.encode(data.toJson());

class ServiceOrder {
  final int osNumero;
  final int osFuncRegistro;
  final int osClienteRegistro;
  final int osVeicRegistro;
  final DateTime osDataAbertura;
  final String osDescricao;
  final String osObservacao;
  final String osOutros;
  final String osTipoServico;

  ServiceOrder({
    required this.osNumero,
    required this.osFuncRegistro,
    required this.osClienteRegistro,
    required this.osVeicRegistro,
    required this.osDataAbertura,
    required this.osDescricao,
    required this.osObservacao,
    required this.osOutros,
    required this.osTipoServico,
  });
  // static ServiceOrder fromJson(json) => ServiceOrder(
  //     osNumero: json['osNumero'],
  //     osFuncRegistro: json['osFuncRegistro'],
  //     osClienteRegistro: json['osClienteRegistro'],
  //     osVeicRegistro: json['osVeicRegistro'],
  //     osDataAbertura: json['osDataAbertura'],
  //     osDescricao: json['osDescricao'],
  //     osObservacao: json['osObservacao'],
  //     osOutros: json['osOutros'],
  //     osTipoServico: json['osTipoServico']);

  factory ServiceOrder.fromJson(Map<String, dynamic> json) => ServiceOrder(
      osNumero: json['osNumero'] as int,
      osFuncRegistro: json['osFuncRegistro'] as int,
      osClienteRegistro: json['osClienteRegistro'] as int,
      osVeicRegistro: json['osVeicRegistro'] as int,
      osDataAbertura: DateTime.parse(json['osDataAbertura']),
      osDescricao: json['osDescricao'] as String,
      osObservacao: json['osObservacao'] as String,
      osOutros: json['osOutros'] as String,
      osTipoServico: json['osTipoServico'] as String);

  Map<String, dynamic> toJson() => {
        'osNumero': osNumero,
        'osFuncRegistro': osFuncRegistro,
        'osClienteRegistro': osClienteRegistro,
        'osVeicRegistro': osVeicRegistro,
        'osDataAbertura': osDataAbertura.toIso8601String(),
        'osDescricao': osDescricao,
        'osObservacao': osObservacao,
        'osOutros': osOutros,
        'osTipoServico': osTipoServico
      };
}
