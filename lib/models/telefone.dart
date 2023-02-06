// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Telefone {
  int ddd;
  String telefone;

  Telefone({
    required this.ddd,
    required this.telefone,
  });

// Método que pega o objeto (telefone) e transforma em um map<string, dymic>
  Map<String, dynamic> toMap() {
    return {
      'ddd': ddd,
      'telefone': telefone,
    };
  }

// Construtor que vai pegar um MAP e transformar em um obj telefone
  factory Telefone.fromMap(Map<String, dynamic> map) {
    return Telefone(ddd: map['ddd'] ?? 0, telefone: map['telefone'] ?? '');
  }

// Método que baseado em uma string json do obj telefone
  String toJson() => jsonEncode(toMap());

// Método que baseado em uma string json retorna um obj telefone
  factory Telefone.fromJson(String json) => Telefone.fromMap(jsonDecode(json));

  @override
  String toString() => 'Telefone(ddd: $ddd, telefone: $telefone)';
}
