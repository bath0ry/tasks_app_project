import 'package:alura_flutter_curso_1/components/arrow_back_form_widget.dart';
import 'package:alura_flutter_curso_1/components/tasks_widget.dart';
import 'package:alura_flutter_curso_1/data/task_dao.dart';
import 'package:alura_flutter_curso_1/data/task_inherited.dart';
import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key, required this.taskContext});

  final BuildContext taskContext;

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerDifficulty = TextEditingController();
  TextEditingController controllerImage = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool valueValidator(String? value) {
    if (value != null && value.isEmpty) {
      return true;
    }
    return false;
  }

  bool difficultyValidator(String? value) {
    if (value != null && value.isEmpty) {
      if (int.parse(value) > 5 && int.parse(value) < 1) {
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        key: _formKey,
        child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 186, 218, 245),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: const [
                    ArrowBackFormWidget(),
                  ],
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: const Color.fromARGB(255, 204, 231, 233),
                          border: const Border.fromBorderSide(
                              BorderSide(width: 5, style: BorderStyle.solid))),
                      width: 360,
                      height: 650,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(30),
                            child: TextFormField(
                              validator: (String? value) {
                                if (valueValidator(value)) {
                                  return 'Não há informações suficientes, insira um valor válido';
                                }
                                return null;
                              },
                              onChanged: (text) {
                                setState(() {});
                              },
                              controller: controllerName,
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: 'Task Name',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20))),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: TextFormField(
                              validator: (String? value) {
                                if (difficultyValidator(value)) {
                                  return 'Valor menor que 1 ou maior que 5 são inválidos';
                                }
                                return null;
                              },
                              maxLength: 1,
                              keyboardType: TextInputType.number,
                              onChanged: (text) {
                                setState(() {});
                              },
                              controller: controllerDifficulty,
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: 'Task Difficulty',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20))),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: TextFormField(
                              validator: (String? value) {
                                if (valueValidator(value)) {
                                  return 'Não há informações suficientes, insira um valor válido';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.url,
                              onChanged: (text) {
                                setState(() {});
                              },
                              controller: controllerImage,
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: 'Task Image URL',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(17),
                                      borderSide: const BorderSide(
                                          width: 20,
                                          color: Colors.black,
                                          style: BorderStyle.solid))),
                            ),
                          ),
                          Container(
                            height: 100,
                            width: 72,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: const Color.fromARGB(255, 255, 255, 255),
                                border: Border.all(
                                    width: 2,
                                    color:
                                        const Color.fromARGB(255, 1, 42, 77))),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.network(
                                controllerImage.text,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Image.asset(
                                      'assets/images/noimage.png');
                                },
                              ),
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  TaskDao().save(Tasks(
                                      controllerName.text,
                                      controllerImage.text,
                                      int.parse(controllerDifficulty.text)));
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content:
                                              Text('Nova Tarefa Adicionada')));
                                  Navigator.of(context).pop();
                                }
                              },
                              child: const Text(
                                'Adicionar',
                                style: TextStyle(color: Colors.black),
                              ),
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Color.fromARGB(255, 128, 180, 223))))
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
