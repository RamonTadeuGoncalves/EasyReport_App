import 'dart:convert';

Funcionarios usuarioFromJson(String str) =>
    Funcionarios.fromJson(json.decode(str));
String usuarioToJson(Funcionarios data) => json.encode(data.toJson());

class Funcionarios {
  final int funcRegistro;
  final String funcCpf;
  final String funcNome;
  final String funcSobrenome;
  final String funcEnderecoRua;
  final String funcEnderecoNumero;
  final String? funcEnderecoComplemento;
  final String funcEnderecoCidade;
  final String funcEnderecoCep;
  final String funcTelefone;
  final String funcEmail;
  final String funcFuncao;
  final String funcDpto;
  final String funcCnh;

  Funcionarios({
    required this.funcRegistro,
    required this.funcCpf,
    required this.funcNome,
    required this.funcSobrenome,
    required this.funcEnderecoRua,
    required this.funcEnderecoNumero,
    required this.funcEnderecoComplemento,
    required this.funcEnderecoCidade,
    required this.funcEnderecoCep,
    required this.funcTelefone,
    required this.funcEmail,
    required this.funcFuncao,
    required this.funcDpto,
    required this.funcCnh,
  });

  factory Funcionarios.fromJson(Map<String, dynamic> json) => Funcionarios(
        funcRegistro: json['funcRegistro'] as int,
        funcCpf: json['funcCpf'] as String,
        funcNome: json['funcNome'] as String,
        funcSobrenome: json['funcSobrenome'] as String,
        funcEnderecoRua: json['funcEnderecoRua'] as String,
        funcEnderecoNumero: json['funcEnderecoNumero'] as String,
        funcEnderecoComplemento: json['funcEnderecoComplemento'] as String?,
        funcEnderecoCidade: json['funcEnderecoCidade'] as String,
        funcEnderecoCep: json['funcEnderecoCep'] as String,
        funcTelefone: json['funcTelefone'] as String,
        funcEmail: json['funcEmail'] as String,
        funcFuncao: json['funcFuncao'] as String,
        funcDpto: json['funcDpto'] as String,
        funcCnh: json['funcCnh'] as String,
      );

  Map<String, dynamic> toJson() => {
        'funcRegistro': funcRegistro,
        'funcCpf': funcCpf,
        'funcNome': funcNome,
        'funcSobrenome': funcSobrenome,
        'funcEnderecoRua': funcEnderecoRua,
        'funcEnderecoNumero': funcEnderecoNumero,
        'funcEnderecoComplemento': funcEnderecoComplemento,
        'funcEnderecoCidade': funcEnderecoCidade,
        'funcEnderecoCep': funcEnderecoCep,
        'funcTelefone': funcTelefone,
        'funcEmail': funcEmail,
        'funcFuncao': funcFuncao,
        'funcDpto': funcDpto,
        'funcCnh': funcCnh,
      };
}
