import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: xylophonePage(),
    ),
  ));
}

class xylophonePage extends StatelessWidget {
  const xylophonePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.green)),
                onPressed: () {
                  final AudioCache player = AudioCache();
                  player.play('/audio1.wav');
                },
                child: Container())),
        Expanded(
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red)),
                onPressed: () {
                  final AudioCache player = AudioCache();
                  player.play('/audio2.wav');
                },
                child: Container())),
        Expanded(
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.yellow)),
                onPressed: () {
                  final AudioCache player = AudioCache();
                  player.play('/audio3.wav');
                },
                child: Container())),
        Expanded(
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.pink)),
                onPressed: () {
                  final AudioCache player = AudioCache();
                  player.play('/audio4.wav');
                },
                child: Container())),
        Expanded(
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.orange)),
                onPressed: () {
                  final AudioCache player = AudioCache();
                  player.play('/audio5.wav');
                },
                child: Container())),
        Expanded(
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue)),
                onPressed: () {
                  final AudioCache player = AudioCache();
                  player.play('/audio6.wav');
                },
                child: Container())),
        Expanded(
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.black)),
                onPressed: () {
                  final AudioCache player = AudioCache();
                  player.play('/audio7.wav');
                },
                child: Container())),
      ],
    );
  }
}
