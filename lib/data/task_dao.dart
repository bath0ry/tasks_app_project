import 'package:alura_flutter_curso_1/components/tasks_widget.dart';
import 'package:alura_flutter_curso_1/data/database.dart';
import 'package:sqflite/sqflite.dart';

class TaskDao {
  static const String tableSql = 'CREATE TABLE $_tableName('
      '$_name TEXT,'
      '$_difficulty INTEGER,'
      '$_image TEXT,'
      '$_level INTEGER)';

  static const String _tableName = 'taskTable';
  static const String _name = 'name';
  static const String _difficulty = 'difficulty';
  static const String _image = 'image';
  static const String _level = 'level';

  save(Tasks tarefa) async {
    final Database bancoDeDados = await getDatabase();
    var itemExist = await find(tarefa.nome);
    Map<String, dynamic> taskMap = toMap(tarefa);
    if (itemExist.isEmpty) {
      return await bancoDeDados.insert(_tableName, taskMap);
    } else {
      return await bancoDeDados.update(_tableName, taskMap,
          where: '$_name = ?', whereArgs: [tarefa.nome]);
    }
  }

  Map<String, dynamic> toMap(Tasks tarefa) {
    final Map<String, dynamic> mapaDeTarefas = {};
    mapaDeTarefas[_name] = tarefa.nome;
    mapaDeTarefas[_difficulty] = tarefa.dificuldade;
    mapaDeTarefas[_image] = tarefa.foto;
    mapaDeTarefas[_level] = tarefa.level;
    return mapaDeTarefas;
  }

  Future<List<Tasks>> findAll() async {
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result =
        await bancoDeDados.query(_tableName);
    return toList(result);
  }

  List<Tasks> toList(List<Map<String, dynamic>> mapaDeTarefas) {
    final List<Tasks> tarefas = [];
    for (Map<String, dynamic> linha in mapaDeTarefas) {
      final Tasks tarefa =
          Tasks(linha[_name], linha[_image], linha[_difficulty], linha[_level]);
      tarefas.add(tarefa);
    }
    return tarefas;
  }

  Future<List<Tasks>> find(String nomeDaTarefa) async {
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result = await bancoDeDados
        .query(_tableName, where: '$_name = ?', whereArgs: [nomeDaTarefa]);
    return toList(result);
  }

  delete(String nomeDaTarefa) async {
    final Database bancoDeDados = await getDatabase();
    return bancoDeDados
        .delete(_tableName, where: '$_name = ?', whereArgs: [nomeDaTarefa]);
  }
}
