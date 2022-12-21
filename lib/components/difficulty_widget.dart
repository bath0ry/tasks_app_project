import 'package:flutter/material.dart';

class Difficulty extends StatelessWidget {
  final int dificulty;

  const Difficulty(this.dificulty, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.star,
            size: 15,
            color: (dificulty >= 1)
                ? const Color.fromARGB(255, 229, 243, 33)
                : Colors.blue[100]),
        Icon(Icons.star,
            size: 15,
            color: (dificulty >= 2)
                ? const Color.fromARGB(255, 229, 243, 33)
                : Colors.blue[100]),
        Icon(Icons.star,
            size: 15,
            color: (dificulty >= 3)
                ? const Color.fromARGB(255, 229, 243, 33)
                : Colors.blue[100]),
        Icon(Icons.star,
            size: 15,
            color: (dificulty >= 4)
                ? const Color.fromARGB(255, 229, 243, 33)
                : Colors.blue[100]),
        Icon(Icons.star,
            size: 15,
            color: (dificulty >= 5)
                ? const Color.fromARGB(255, 229, 243, 33)
                : Colors.blue[100]),
      ],
    );
  }
}
