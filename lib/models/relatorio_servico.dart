class Relatorio {
  final int relatorioNumero;
  final int relatorioOsNumero;
  final int relatorioFuncRegistro;
  final int relatorioClienteRegistro;
  final String relatorioDescricao;
  final String relatorioContatoCliente;
  final String relatorioSetorClicente;
  // final DateTime relatorioData;
  // final bool relatorioEstado;
  final String relatorioObservacao;
  // final String relatorioFoto;
  final String relatorioComentarioCliente;
  final String relatorioOutros;
  final String relatorioTipoServico;

  Relatorio({
    required this.relatorioNumero,
    required this.relatorioOsNumero,
    required this.relatorioFuncRegistro,
    required this.relatorioClienteRegistro,
    required this.relatorioDescricao,
    required this.relatorioContatoCliente,
    required this.relatorioSetorClicente,
    // required this.relatorioData,
    // required this.relatorioEstado,
    required this.relatorioObservacao,
    // required this.relatorioFoto,
    required this.relatorioComentarioCliente,
    required this.relatorioOutros,
    required this.relatorioTipoServico,
  });

  // String toString() {
  //   return 'Relatorio{Numero: $relatorioOsNumero, $relatorioFuncRegistro, $relatorioClienteRegistro, $relatorioDescricao, $relatorioContatoCliente, $relatorioSetorClicente, $relatorioData, $relatorioEstado, $relatorioObservacao, $relatorioFoto, $relatorioComentarioCliente, $relatorioOutros,    $relatorioTipoServico}';
  // }

  String toString() {
    return 'Relatorio {Numero Relatorio: $relatorioNumero, Numero O.S. $relatorioOsNumero, Funcionario: $relatorioFuncRegistro, Descricao: $relatorioDescricao, CLiente: $relatorioClienteRegistro, Contado: $relatorioContatoCliente, Setor: $relatorioSetorClicente';
  }
}
