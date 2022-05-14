import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            title: const Text('Quizzler App'),
          ),
          body: QuizzlerPage(),
        ),
      ),
    ),
  );
}

class QuizzlerPage extends StatefulWidget {
  const QuizzlerPage();

  @override
  State<QuizzlerPage> createState() => _QuizzlerPageState();
}

class _QuizzlerPageState extends State<QuizzlerPage> {
  final List<String> questions = [
    'Question 1',
    'Question 2',
    'Question 3',
    'End of Quiz'
  ];
  final List<bool> answers = [true, true, false];
  List<Widget> result = [];
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            child: Center(
              child: Text(
                questions[counter],
                style: const TextStyle(
                  fontFamily: 'Ubuntu',
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
          ),
          onPressed: () {
            setState(
              () {
                if (answers[counter] == true) {
                  result.add(
                    const Icon(
                      Icons.check_circle_outline,
                      size: 30,
                      color: Colors.white,
                    ),
                  );
                } else {
                  result.add(
                    const Icon(
                      Icons.highlight_off,
                      size: 30,
                      color: Colors.white,
                    ),
                  );
                }
                if (counter < questions.length) {
                  counter++;
                }
              },
            );
          },
          child: const Text('True'),
        ),
        SizedBox(
          height: 10,
        ),
        // False Button
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              Colors.red,
            ),
          ),
          onPressed: () {
            setState(
              () {
                if (answers[counter] == false) {
                  result.add(
                    const Icon(
                      Icons.check_circle_outline,
                      size: 30,
                      color: Colors.white,
                    ),
                  );
                } else {
                  result.add(
                    const Icon(
                      Icons.highlight_off,
                      size: 30,
                      color: Colors.white,
                    ),
                  );
                }
                if (counter < questions.length) {
                  counter++;
                }
              },
            );
          },
          child: const Text('False'),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: result,
        )
      ],
    );
  }
}
