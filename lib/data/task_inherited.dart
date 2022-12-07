import 'package:alura_flutter_curso_1/components/tasks_widget.dart';
import 'package:flutter/material.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({required super.child});
  final List<Tasks> taskList = [
    Tasks(
      'Estudar Flutter',
      'assets/images/programmer.jpg',
      4,
      maestria: 1,
    ),
    Tasks(
      'Andar de Skate',
      'assets/images/skateboarding.jpg',
      4,
      maestria: 2,
    ),
    Tasks(
      'Cozinhar',
      'assets/images/cook.jpg',
      3,
      maestria: 3,
    ),
    Tasks(
      'Correr',
      'assets/images/correr.jpg',
      5,
      maestria: 4,
    ),
    Tasks(
      'Jogar',
      'assets/images/controle.jpg',
      1,
      maestria: 5,
    ),
  ];
  void newTask(String name, String photo, int difficulty) {
    taskList.add(Tasks(
      name,
      photo,
      difficulty,
      maestria: 5,
    ));
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result =
        context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }
}
