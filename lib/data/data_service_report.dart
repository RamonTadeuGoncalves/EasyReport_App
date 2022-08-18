import 'dart:async';

import 'package:dio/dio.dart';

final client = Dio(
  BaseOptions(baseUrl: 'http://10.0.2.2:8000/api'),
);

List<dynamic> ordemDeServicos = [];

Future<void> getServiceOrder() async {
  final response = await client.get('/ordem_servico');
  ordemDeServicos = response.data;
}

int itemCount = ordemDeServicos.length;
