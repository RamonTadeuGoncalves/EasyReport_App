import 'dart:convert';

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
  final int osTipoServico;

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

  factory ServiceOrder.fromJson(Map<String, dynamic> json) => ServiceOrder(
      osNumero: json['osNumero'] as int,
      osFuncRegistro: json['osFuncRegistro'] as int,
      osClienteRegistro: json['osClienteRegistro'] as int,
      osVeicRegistro: json['osVeicRegistro'] as int,
      osDataAbertura: DateTime.parse(json['osDataAbertura']),
      osDescricao: json['osDescricao'] as String,
      osObservacao: json['osObservacao'] as String,
      osOutros: json['osOutros'] as String,
      osTipoServico: json['osTipoServico'] as int);

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
