// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, camel_case_types

import 'package:flutter/material.dart';

void main() {
  Color card = Colors.grey.shade300;
  Color card_dark = Colors.grey.shade800;
  Color text = Colors.grey.shade600;
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        primaryColor: card,
        primaryColorLight: card,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey.shade50,
          titleTextStyle: TextStyle(color: Colors.black),
          actionsIconTheme: IconThemeData(color: Colors.black),
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        primaryColor: card_dark,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey[850],
          titleTextStyle: TextStyle(color: Colors.white),
          actionsIconTheme: IconThemeData(color: Colors.white),
        ),
      ),
      home: HomePage(),
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Color card = Colors.grey.shade300;
  Color card_dark = Colors.grey.shade700;
  Color text = Colors.grey.shade600;
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        // leadingWidth: 110,
        leading: Image.asset('Assets/Ewalle.png'),
        title: Text('eWalle'),
        elevation: 0,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 25, 10),
            child: Icon(
              Icons.app_registration_rounded,
              size: 40,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                    child: Row(
                      children: [
                        Text('Account Overview'),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).primaryColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '20,600',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                              Padding(padding: EdgeInsets.all(4)),
                              Text(
                                'Current balance',
                                style: TextStyle(
                                    color: text, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.add_circle,
                            size: 40,
                            color: Colors.amber,
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 30, 0, 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Send Money'),
                        Icon(Icons.qr_code),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(3, 10, 15, 10),
                          child: Icon(
                            Icons.add_circle,
                            color: Colors.amber,
                            size: 50,
                          ),
                        ),
                        card1(card, 'Mike', Icon(Icons.abc_rounded)),
                        card1(card, 'Joseph', Icon(Icons.access_alarm)),
                        card1(card, 'Ash ley', Icon(Icons.yard_outlined)),
                        card1(card, 'Phoenix',
                            Icon(Icons.account_balance_wallet)),
                        card1(card, 'Mike', Icon(Icons.abc_rounded)),
                        card1(card, 'Mike', Icon(Icons.abc_rounded)),
                        card1(card, 'Mike', Icon(Icons.abc_rounded)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 30, 0, 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Services'),
                        Icon(Icons.menu),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Wrap(
                textDirection: TextDirection.ltr,
                verticalDirection: VerticalDirection.down,
                direction: Axis.horizontal,
                alignment: WrapAlignment.start,
                runAlignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.start,
                spacing: 10,
                runSpacing: 20,
                children: [
                  card2(card, 'Money', Icon(Icons.wrap_text_outlined)),
                  card2(card, 'Recieve Money ',
                      Icon(Icons.account_balance_wallet)),
                  card2(
                      card, 'Mobile Prepaid', Icon(Icons.account_circle_sharp)),
                  card2(card, 'Electricity Bill', Icon(Icons.abc_outlined)),
                  card2(card, 'Cash Back Offer', Icon(Icons.add_home_rounded)),
                  card2(card, 'Movie Tickets', Icon(Icons.abc_outlined)),
                  card2(card, 'Flight Tickets', Icon(Icons.add_business_sharp)),
                  card2(card, 'More Options', Icon(Icons.abc_outlined)),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

class card1 extends StatelessWidget {
  card1(this.card, this.text, this.icon);
  Color card;
  final text;
  Icon icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).primaryColor,
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(23, 20, 23, 20),
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: icon,
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  Text(text),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class card2 extends StatelessWidget {
  card2(this.card, this.text, this.icon);
  Color card;
  final text;
  Icon icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: icon,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 70,
            height: 40,
            child: Text(
              text,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
