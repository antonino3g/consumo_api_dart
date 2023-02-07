// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:example_api/models/cidade.dart';
import 'package:example_api/models/telefone.dart';

class Endereco {
  String rua;
  String numero;
  String cep;
  Telefone telefone;
  Cidade cidade;

  Endereco({
    required this.rua,
    required this.numero,
    required this.cep,
    required this.telefone,
    required this.cidade,
  });

  Map<String, dynamic> toMap() {
    return {
      'rua': rua,
      'numero': numero,
      'CEP': cep,
      'telefone': telefone.toMap(),
      'cidade': cidade.toMap(),
    };
  }

  factory Endereco.fromMap(Map<String, dynamic> map) {
    return Endereco(
      rua: map['rua'] ?? '',
      numero: map['numero'] ?? '',
      cep: map['CEP'] ?? '',
      telefone: Telefone.fromMap(map['telefone']),
      cidade: Cidade.fromMap(map['cidade']),
    );
  }

  String toJson() => jsonEncode(toMap());

  factory Endereco.fromJson(String json) => Endereco.fromMap(jsonDecode(json));

  @override
  String toString() {
    return 'Endereco(rua: $rua, numero: $numero, cep: $cep, telefone: $telefone, cidade: $cidade)';
  }
}
