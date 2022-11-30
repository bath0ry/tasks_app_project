import 'package:alura_flutter_curso_1/components/tasks.dart';
import 'package:flutter/material.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
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
            Tasks('Andar de Skate', 'assets/images/skateboarding.jpg', 3),
            Tasks('Cozinhar', 'assets/images/cook.jpg', 2),
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
