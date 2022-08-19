class ServiceOrder {
  final int osNumero;
  final int osFuncRegistro;
  final int osClienteRegistro;
  final int osVeicRegistro;
  final String osDataAbertura;
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
  static ServiceOrder fromJson(json) => ServiceOrder(
      osNumero: json['osNumero'],
      osFuncRegistro: json['osFuncRegistro'],
      osClienteRegistro: json['osClienteRegistro'],
      osVeicRegistro: json['osVeicRegistro'],
      osDataAbertura: json['osDataAbertura'],
      osDescricao: json['osDescricao'],
      osObservacao: json['osObservacao'],
      osOutros: json['osOutros'],
      osTipoServico: json['osTipoServico']);
}
