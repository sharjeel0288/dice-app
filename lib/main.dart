import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 148, 30, 30),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 99, 10, 10),
          title: const Text(
            'DICEE',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: const DicePage(),
      ),
    );
  }
}

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1, rightDiceNumber = 1;
  void changeDiceFace() {
    leftDiceNumber = Random().nextInt(6) + 1;
    rightDiceNumber = Random().nextInt(6) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: FlatButton(
              onPressed: () {
                setState(() {
                  this.changeDiceFace();
                });
              },
              child: Image.asset('images/inverted-dice-$leftDiceNumber.png'),
            ),
          ),
          Expanded(
            child: FlatButton(
              onPressed: () {
                setState(() {
                  this.changeDiceFace();
                });
              },
              child: Image.asset('images/dice-six-faces-$rightDiceNumber.png'),
            ),
          ),
        ],
      ),
    );
  }
}
