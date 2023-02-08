import 'dart:convert';

import 'package:example_api/models/aluno.dart';
import 'package:http/http.dart' as http;

String serverUri = 'http://localhost:3031';

class AlunosRepository {
  Future<List<Aluno>> findAll() async {
    final alunosResponse = await http.get(
      Uri.parse('$serverUri/alunos'),
    );

    final alunosList = jsonDecode(alunosResponse.body);

    return alunosList.map<Aluno>((alunoMap) {
      return Aluno.fromMap(alunoMap);
    }).toList();
  }

  Future<Aluno> findById(String id) async {
    final alunoResponse = await http.get(Uri.parse('$serverUri/alunos/$id'));

    return Aluno.fromJson(alunoResponse.body);
  }

  Future<void> update(Aluno aluno) async {
    await http.put(
      Uri.parse('$serverUri/alunos/${aluno.id}'),
      body: aluno.toJson(),
      headers: {
        'content-type': 'application/json',
      },
    );
  }

  Future<void> insert(Aluno aluno) async {
    await http.post(
      Uri.parse('$serverUri/alunos/'),
      body: aluno.toJson(),
      headers: {
        'content-type': 'application/json',
      },
    );
  }
}
