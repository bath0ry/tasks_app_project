import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'New Task',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color.fromARGB(255, 204, 231, 233),
                      border: Border.fromBorderSide(
                          BorderSide(width: 5, style: BorderStyle.solid))),
                  width: 360,
                  height: 650,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color.fromARGB(255, 223, 222, 222),
                              border: Border.fromBorderSide(BorderSide(
                                  width: 3,
                                  style: BorderStyle.solid,
                                  color: Color.fromARGB(255, 128, 180, 223)))),
                          width: 280,
                          height: 50,
                          child: TextField(
                            maxLines: 1,
                            decoration: InputDecoration(),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 80),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color.fromARGB(255, 223, 222, 222),
                              border: Border.fromBorderSide(BorderSide(
                                  width: 3,
                                  style: BorderStyle.solid,
                                  color: Color.fromARGB(255, 128, 180, 223)))),
                          width: 280,
                          height: 50,
                          child: TextField(
                            maxLines: 1,
                            decoration: InputDecoration(),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 80),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color.fromARGB(255, 223, 222, 222),
                              border: Border.fromBorderSide(BorderSide(
                                  width: 3,
                                  style: BorderStyle.solid,
                                  color: Color.fromARGB(255, 4, 83, 148)))),
                          width: 280,
                          height: 50,
                          child: TextFormField(
                            maxLines: 1,
                            decoration: InputDecoration(),
                          ),
                        ),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
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
    );
  }
}
