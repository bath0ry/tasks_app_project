import 'package:alura_flutter_curso_1/components/tasks_widget.dart';
import 'package:alura_flutter_curso_1/page/form_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        centerTitle: true,
        title: const Text(
          'Task App',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(30),
            child: Icon(Icons.search),
          )
        ],
      ),
      body: Container(
        color: const Color.fromARGB(255, 208, 221, 237),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 8),
              child:
                  Tasks('Estudar Flutter', 'assets/images/programmer.jpg', 4),
            ),
            Tasks('Andar de Skate', 'assets/images/skateboarding.jpg', 4),
            Tasks('Cozinhar', 'assets/images/cook.jpg', 3),
            Tasks('Correr', 'assets/images/correr.jpg', 5),
            Tasks(
              'Jogar',
              'assets/images/controle.jpg',
              1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FloatingActionButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => FormPage()));
                      },
                      child: Icon(Icons.add)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
