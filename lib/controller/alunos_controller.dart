import 'package:example_api/models/aluno.dart';
import 'package:example_api/models/cidade.dart';
import 'package:example_api/models/curso.dart';
import 'package:example_api/models/endereco.dart';
import 'package:example_api/models/telefone.dart';
import 'package:example_api/repositories/alunos_repository.dart';

class AlunosController {
  final _alunosRepository = AlunosRepository();

  Future<void> findAll() async {
    final alunos = await _alunosRepository.findAll();
    alunos.forEach(print);
  }

  Future<void> findById(String id) async {
    final aluno = await _alunosRepository.findById(id);
    print(aluno);
  }

  Future<void> update() async {
    final aluno = await _alunosRepository.findById('1');
    aluno.nomeCursos.add('Imersão Shelf');

    await _alunosRepository.update(aluno);

    final alunoAlterado = await _alunosRepository.findById('1');
    print(alunoAlterado.nomeCursos);
  }

  Future<void> insert() async {
    final aluno = Aluno(
      nome: 'Bartolomeu',
      nomeCursos: ['Academia do Flutter'],
      endereco: Endereco(
          rua: 'Rua X',
          numero: '300',
          cep: '3030303',
          telefone: Telefone(ddd: 95, telefone: '95989-8989'),
          cidade: Cidade(id: 1, nome: 'Boa Vista')),
      cursos: [
        Curso(id: 1, nome: 'Academia do Flutter', isAluno: true),
        Curso(id: 2, nome: 'Imersão GetX', isAluno: false),
      ],
    );

    _alunosRepository.insert(aluno);
  }
}
