import 'package:alura_flutter_curso_1/components/tasks.dart';
import 'package:flutter/material.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  bool opacidade = true;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Task App'),
      ),
      body: AnimatedOpacity(
        opacity: opacidade ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 500),
        child: Container(
          color: Color.fromARGB(255, 208, 221, 237),
          child: ListView(
            children: const [
              Padding(
                padding: EdgeInsets.only(top: 8),
                child:
                    Tasks('Estudar Flutter', 'assets/images/programmer.jpg', 4),
              ),
              Tasks('Fazer Compras', 'assets/images/skate.jpg', 3),
              Tasks('Ler 50 páginas', 'assets/images/ler.jpg', 2),
              Tasks('Meditar', 'assets/images/meditar.jpeg', 5),
              Tasks(
                'Jogar',
                'assets/images/jogar.jpg',
                1,
              ),
              SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            opacidade = !opacidade;
          });
        },
        backgroundColor: Colors.blue[100],
        child: const Icon(Icons.remove_red_eye),
      ),
    );
  }
}
