import 'package:example_api/repositories/alunos_repository.dart';

class AlunosController {
  final _alunosRepository = AlunosRepository();

  Future<void> findAll() async {
    final alunos = await _alunosRepository.findAll();
    alunos.forEach(print);
  }

  // Future<void> findById(String id) {}
}
