import 'package:alura_flutter_curso_1/page/home_page.dart';
import 'package:flutter/material.dart';

class ArrowBackFormWidget extends StatelessWidget {
  const ArrowBackFormWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: const Icon(Icons.arrow_back),
    );
  }
}
