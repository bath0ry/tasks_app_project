import 'package:flutter/material.dart';

class AddButtonFormPage extends StatelessWidget {
  const AddButtonFormPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {},
        child: Text(
          'Adicionar',
          style: TextStyle(color: Colors.black),
        ),
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(Color.fromARGB(255, 128, 180, 223))));
  }
}
