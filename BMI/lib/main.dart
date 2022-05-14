// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'second_screen.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF0A0E21),
        ),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('BMI Calculator'),
          ),
          body: _BMIHomePageState(),
        ),
      ),
    ),
  );
}

class _BMIHomePageState extends StatefulWidget {
  const _BMIHomePageState({Key? key}) : super(key: key);

  @override
  State<_BMIHomePageState> createState() => _BMIHomePageStateState();
}

class _BMIHomePageStateState extends State<_BMIHomePageState> {
  Color MaleCardColor = const Color(0xFF111328);
  Color FemaleCardColor = const Color(0xFF111328);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  MaleCardColor = const Color(0xFF1D1E33);
                  FemaleCardColor = const Color(0xFF111328);
                });
              },
              child: GenderCard(
                const Text('Male'),
                const Icon(
                  Icons.male_rounded,
                  size: 50,
                ),
                MaleCardColor,
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  FemaleCardColor = const Color(0xFF1D1E33);
                  MaleCardColor = const Color(0xFF111328);
                });
              },
              child: GenderCard(
                const Text('Female'),
                const Icon(
                  Icons.female_rounded,
                  size: 50,
                ),
                FemaleCardColor,
              ),
            ),
          ],
        ),
        slidercontainer(),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            bottomcontainer('Age', 'yrs'),
            bottomcontainer('Weight', 'cm'),
          ],
        ),
        bottomButton(),
      ],
    );
  }
}

class bottomButton extends StatelessWidget {
  const bottomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SecondScreen('bmiValue'),
                ),
              );
            },
            child: Text(
              'Button',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      Color(0xFFEB1555),
      350,
      60,
    );
  }
}

class slidercontainer extends StatefulWidget {
  const slidercontainer({Key? key}) : super(key: key);

  @override
  State<slidercontainer> createState() => _slidercontainerState();
}

class _slidercontainerState extends State<slidercontainer> {
  double slidervalue = 100;
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Height'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                slidervalue.round().toString(),
                style: TextStyle(fontSize: 30),
              ),
              Text('cm'),
            ],
          ),
          SliderTheme(
            data: SliderThemeData(
                activeTrackColor: Color(0xFFEB1555),
                overlayColor: Color(0x29EB1555),
                inactiveTrackColor: Colors.grey,
                thumbColor: Color(0xFFEB1555),
                overlayShape: RoundSliderOverlayShape(overlayRadius: 18)),
            child: Slider(
              min: 100,
              max: 200,
              value: slidervalue,
              onChanged: (value) {
                setState(() {
                  slidervalue = value;
                });
              },
            ),
          ),
        ],
      ),
      Color(0xFF1D1E33),
      350,
      132,
    );
  }
}

class bottomcontainer extends StatefulWidget {
  const bottomcontainer(this.text, this.unit);
  final text, unit;

  @override
  State<bottomcontainer> createState() => _bottomcontainerState();
}

class _bottomcontainerState extends State<bottomcontainer> {
  int ageValue = 1;
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(widget.text),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                ageValue.toString(),
                style: TextStyle(fontSize: 35),
              ),
              Text(widget.unit),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Color(0xFF4C4F5C),
                child: IconButton(
                  color: Colors.white,
                  onPressed: () {
                    setState(() {
                      ageValue++;
                    });
                  },
                  icon: Icon(Icons.add),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              CircleAvatar(
                backgroundColor: Color(0xFF4C4F5C),
                child: IconButton(
                  color: Colors.white,
                  onPressed: () {
                    setState(() {
                      ageValue--;
                    });
                  },
                  icon: Icon(Icons.remove),
                ),
              ),
            ],
          )
        ],
      ),
      Color(0xFF1D1E33),
      150,
      134,
    );
  }
}

class GenderCard extends StatelessWidget {
  final Text cardText;
  final Icon cardIcon;
  final Color cardColor;

  GenderCard(this.cardText, this.cardIcon, this.cardColor);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          cardIcon,
          const SizedBox(
            height: 5,
          ),
          cardText,
        ],
      ),
      cardColor,
      150,
      125,
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
