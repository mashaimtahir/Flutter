// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, camel_case_types, prefer_final_fields, unused_import
import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(0, 148, 140, 1),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Text("data updated"),
              stlw1(),
              // stfl1(),
            ],
          ),
        ),
      ),
    ),
  ));
}

class stlw1 extends StatelessWidget {
  const stlw1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.center,
      child: FractionallySizedBox(
        widthFactor: 0.8,
        child: Column(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("Images/profile.png"),
              radius: 50,
            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            Text(
              "Mashaim Ali",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontFamily: 'zenkurenaido',
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            ListTile(
              tileColor: Colors.white,
              leading: Icon(Icons.phone),
              title: Text(
                "+9245678899",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Lato',
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            ListTile(
              tileColor: Colors.white,
              leading: Icon(Icons.access_alarm_outlined),
              title: Text(
                "mashaim@gmail.com",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Lato',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
