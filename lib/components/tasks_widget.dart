import 'dart:ui';

import 'package:alura_flutter_curso_1/components/difficulty_widget.dart';
import 'package:alura_flutter_curso_1/data/task_dao.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Tasks extends StatefulWidget {
  final String nome;
  final String foto;
  final int dificuldade;

  Tasks(this.nome, this.foto, this.dificuldade, {Key? key}) : super(key: key);
  int level = 0;

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  bool assetOrNetwork() {
    if (widget.foto.contains('http')) {
      return false;
    } else {
      return true;
    }
  }

  void levelUp() {
    setState(() {
      if (widget.level <= widget.dificuldade * 10) {
        widget.level++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: const Color.fromARGB(255, 11, 6, 92)),
            height: 140,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: const Color.fromARGB(255, 135, 115, 226),
                ),
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.black12,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: assetOrNetwork()
                            ? Image.asset(
                                widget.foto,
                                height: 100,
                                width: 72,
                                fit: BoxFit.cover,
                              )
                            : Image.network(
                                widget.foto,
                                height: 100,
                                width: 72,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Image.asset(
                                      'assets/images/noimage.png');
                                },
                              ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 200,
                          child: Text(
                            widget.nome,
                            style: const TextStyle(
                                fontSize: 24,
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        ),
                        Difficulty(widget.dificuldade),
                      ],
                    ),
                    IconButton(
                        onPressed: () {
                          levelUp();
                        },
                        icon: const Icon(Icons.arrow_upward)),
                    IconButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: ((context) {
                                return AlertDialog(
                                  title: Text('Excluir'),
                                  content: Text('Deseja deletar essa tarefa?'),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('Não')),
                                    TextButton(
                                        onPressed: () {
                                          TaskDao().delete(widget.nome);
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('Sim'))
                                  ],
                                );
                              }));
                        },
                        icon: const Icon(Icons.delete)),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 8,
                    ),
                    child: Container(
                      width: 200,
                      height: 6,
                      child: LinearProgressIndicator(
                        color: Colors.white,
                        value: widget.dificuldade >= 0
                            ? ((widget.level / widget.dificuldade) / 10)
                            : 1,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      'Maestria: ${widget.level}',
                      style: const TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
