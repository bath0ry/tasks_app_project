import 'package:alura_flutter_curso_1/components/tasks_widget.dart';
import 'package:alura_flutter_curso_1/data/task_dao.dart';

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
                const Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Text(
                    'Tasks',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      setState(() {});
                    },
                    icon: Icon(Icons.refresh))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Padding(
                  padding: EdgeInsets.only(
                    left: 8,
                  ),
                  child: SizedBox(
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
      body: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 80),
        child: FutureBuilder<List<Tasks>>(
          builder: (context, snapshot) {
            List<Tasks>? items = snapshot.data;
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return const Center(
                  child: CircularProgressIndicator(),
                );

              case ConnectionState.waiting:
                return const Center(
                  child: CircularProgressIndicator(),
                );

              case ConnectionState.active:
                return const Center(
                  child: CircularProgressIndicator(),
                );

              case ConnectionState.done:
                if (items != null && snapshot.hasData) {
                  if (items.isNotEmpty) {
                    return ListView.builder(
                      itemBuilder: ((context, index) {
                        final Tasks tarefa = items[index];
                        return tarefa;
                      }),
                      itemCount: items.length,
                    );
                  }
                  return const Center(
                    child: Text('Ainda n??o h?? tarefas'),
                  );
                }
                return const Text('Erro ao pegar dados');
            }
          },
          future: TaskDao().findAll(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext contextNew) => FormPage(
                          taskContext: context,
                        ))).then((value) => setState(
                  () {},
                ));
          },
          child: const Icon(Icons.add)),
    );
  }
}
