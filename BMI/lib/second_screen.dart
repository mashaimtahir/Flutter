// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  final String bmiValue;
  const SecondScreen(this.bmiValue);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF0A0E21),
        ),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Second Screen'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'The result is',
                style: TextStyle(fontSize: 30),
              ),
            ),
            DecoratedBox(
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Normal',
                    style: TextStyle(color: Colors.green),
                  ),
                  Text(bmiValue),
                  Text('You have a normal body weight.\nGood job!'),
                ],
              ),
              Color(0xFF1D1E33),
              350,
              400,
            ),
            DecoratedBox(
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Re Calculate',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              Color(0xFFEB1555),
              350,
              60,
            )
          ],
        ),
      ),
    );
  }
}

class DecoratedBox extends StatelessWidget {
  const DecoratedBox(
      this.cardColumn, this.cardColor, this.cardWidth, this.cardHeight);
  final Column cardColumn;
  final Color cardColor;
  final double cardWidth, cardHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: cardWidth,
      height: cardHeight,
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: cardColumn,
      ),
    );
  }
}
