import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _nrSchimb = TextEditingController();
  String _raspuns = "";
  int ok = 0;

  void _verif() {
    setState(() {
      for (int i = 0; i <= int.parse(_nrSchimb.text); i++) {
        int cube = i * i * i;
        if (cube == double.parse(_nrSchimb.text).toInt()) {
          ok = 1;
        }
      }
      if ((sqrt(double.parse(_nrSchimb.text)).toInt()) ==
              sqrt(double.parse(_nrSchimb.text)) &&
          ok == 1) {
        _raspuns = "Ambele";
      } else if ((sqrt(double.parse(_nrSchimb.text)).toInt()) ==
          sqrt(double.parse(_nrSchimb.text))) {
        _raspuns = "Este Patrat Perfect";
      } else if (ok == 1) {
        _raspuns = "Este cub Perfect";
      } else {
        _raspuns = "Nu este nici Patrat nici Cub Perfect";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Center(
            child: Text("Patrat sau Cub"),
          ),
        ),
        body: Form(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.all(15.0),
                  padding: const EdgeInsets.all(5.0),
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black26)),
                  child: const Text(
                    'Tasteaza un numar pentru a vedea daca este Patrat perfect sau Cub Perfect',
                    style: TextStyle(fontSize: 22.0, color: Colors.black),
                  ),
                ),
                TextField(
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: false),
                  controller: _nrSchimb,
                  decoration: const InputDecoration(
                      label: Text.rich(
                        TextSpan(
                          children: <InlineSpan>[
                            WidgetSpan(
                              child: Text(
                                'Tasteaza DOAR NUMERE',
                              ),
                            ),
                            WidgetSpan(
                              child: Text(
                                '*',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ],
                        ),
                      ),
                      border: OutlineInputBorder(),
                      hintText: 'Tasteaza Numarul'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _verif();
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text(_nrSchimb.text),
                        content: Text(_raspuns),
                        actions: <Widget>[
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Ok'),
                          ),
                        ],
                      ),
                    );
                  },
                  child: const Text(
                    "Reincearca",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
