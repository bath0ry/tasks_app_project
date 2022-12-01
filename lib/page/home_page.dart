import 'package:alura_flutter_curso_1/components/tasks_widget.dart';
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
        title: Text(
          'Task App',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(30),
            child: Icon(Icons.search),
          )
        ],
      ),
      body: Container(
        color: Color.fromARGB(255, 208, 221, 237),
        child: ListView(
          children: const [
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
            SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
