// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, camel_case_types, prefer_final_fields, unused_import
import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text("App Bar"),
      ),
      body: Container(
        child: Row(
          children: [
            stfw1(),
            stfw1(),
            stfw1(),
          ],
        ),
      ),
    ),
  ));
}

class stfw1 extends StatefulWidget {
  const stfw1({Key? key}) : super(key: key);

  @override
  State<stfw1> createState() => _stfw1State();
}

class _stfw1State extends State<stfw1> {
  int _counter = 1;
  void _increment() {
    setState(() {
      _counter = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
            onPressed: _increment,
            child: Image.asset("Images/dice$_counter.png"))
      ],
    );
  }
}
