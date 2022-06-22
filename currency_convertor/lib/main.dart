// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

void main() {
  runApp(HomePage());
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final key = 'S9CvuZMbZ9uQ5CxpLsyAc9nskYMraANa';
  String dropdownValue1 = 'PKR';
  String dropdownValue2 = 'USD';
  List<String> liststring = ['PKR', 'USD', 'SOS', 'EURO', 'UYU'];
  String rate = '';
  final myController = TextEditingController();
  String amount = '';
  @override
  void initState() {
    fetchlist();
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    return (MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Container(
              height: 70,
              color: Colors.grey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(
                    'Currency Converter',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text('From'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: DropdownButton(
                  // borderRadius: BorderRadius.circular(20),
                  isExpanded: true,
                  menuMaxHeight: 300,
                  value: dropdownValue1,
                  items:
                      liststring.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue1 = newValue!;
                    });
                  }),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text('To'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: DropdownButton(
                  // borderRadius: BorderRadius.circular(20),
                  isExpanded: true,
                  menuMaxHeight: 300,
                  value: dropdownValue2,
                  items:
                      liststring.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue2 = newValue!;
                    });
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                child: TextFormField(
                  controller: myController,
                  maxLength: 100,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Amount'),
                  Text((rate == '') ? '0' : rate),
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  amount = myController.text;
                });
                fetchcurrency();
                print(rate);
              },
              child: Text('Convert'),
            ),
          ],
        ),
      ),
    ));
  }

  Future fetchlist() async {
    String list =
        'https://api.apilayer.com/exchangerates_data/symbols?apikey=$key';
    var listurl = Uri.parse(list);
    http.Response list_response = await http.get(listurl);
    var parsed_list_Response = json.decode(list_response.body);
    print(parsed_list_Response['symbols']!.keys.toList());
    print(parsed_list_Response['symbols']!.keys.toList().runtimeType);
    print('object');
    setState(() {
      List<String> lists = [];
      parsed_list_Response['symbols']!.keys.forEach((key) {
        lists.add(key);
      });
      liststring = lists;
      // list = parsed_list_Response['symbols']!.keys.toList();
    });
    print('object');
  }

  fetchcurrency() async {
    // String list = 'https://api.apilayer.com/currency_data/list?apikey=$key';
    // String uri =
    //     'https://api.apilayer.com/fixer/latest?base=$dropdownValue1&symbols=$dropdownValue2&amount=100&apikey=$key';
    // String uri =
    //     'https://api.apilayer.com/currency_data/convert?to=$dropdownValue2&from=$dropdownValue1&amount=$amount&apikey=$key';
    String uri =
        'https://api.apilayer.com/exchangerates_data/convert?to=$dropdownValue2&from=$dropdownValue1&amount=$amount&apikey=$key';
    var url = Uri.parse(uri);
    http.Response response = await http.get(url);
    var responseBody = response.body;
    var parsedResponse = json.decode(responseBody);
    print(parsedResponse);

    setState(() {
      rate = parsedResponse['result'].toString();
    });
  }
}
