import 'dart:convert';

import 'package:example_api/models/aluno.dart';
import 'package:http/http.dart' as http;

class AlunosRepository {
  Future<List<Aluno>> findAll() async {
    final alunosResponse = await http.get(
      Uri.parse('http://localhost:3031/alunos'),
    );

    final alunosList = jsonDecode(alunosResponse.body);

    return alunosList.map<Aluno>((alunoMap) {
      return Aluno.fromMap(alunoMap);
    }).toList();
  }
}
