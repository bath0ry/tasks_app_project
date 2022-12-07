import 'package:alura_flutter_curso_1/components/tasks_widget.dart';
import 'package:alura_flutter_curso_1/data/task_inherited.dart';
import 'package:alura_flutter_curso_1/page/form_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  int nivelUser = 1;
  void updateLevel() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text(
                    'Tasks',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.refresh))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 8,
                  ),
                  child: Container(
                    height: 10,
                    width: 200,
                    child: LinearProgressIndicator(
                      color: Colors.white,
                      value: 1,
                    ),
                  ),
                ),
                Text('Level: $nivelUser'),
              ],
            ),
          ],
        ),
      ),
      body: Container(
        color: const Color.fromARGB(255, 208, 221, 237),
        child: ListView(
          children: TaskInherited.of(context).taskList,
          padding: EdgeInsets.only(top: 10, bottom: 80),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext contextNew) => FormPage(
                      taskContext: context,
                    )));
          },
          child: Icon(Icons.add)),
    );
  }
}
