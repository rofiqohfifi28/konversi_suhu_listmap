import 'dart:html';

import 'package:flutter/material.dart';
import 'package:konversi_suhu_listmap/widgets/convert.dart';
import 'package:konversi_suhu_listmap/widgets/result.dart';
import 'package:konversi_suhu_listmap/widgets/history.dart';
import 'package:konversi_suhu_listmap/widgets/input.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController etInput = new TextEditingController();
  String _newValue = "Kelvin";
  double _result = 0;
  double input = 0;
  double kelvin = 0;
  double reamur = 0;
  double fahrenheit = 0;

  final inputController = TextEditingController();

  List<String> listViewItem = <String>[];

  var listItem = ["Kelvin", "Reamur", "Fahrenheit"];

  void konversi() {
    setState(() {
      input = double.parse(etInput.text);

      switch (_newValue) {
        case "Kelvin":
          _result = input + 273;
          listViewItem.add("$_newValue : $_result");
          break;
        case "Reamur":
          _result = input * (4 / 5);
          listViewItem.add("$_newValue : $_result");
          break;
        case "Fahrenheit":
          _result = (input * (9 / 5)) + 32;
          listViewItem.add("$_newValue : $_result");
          break;
      }
    });
  }

  dropdownOnChanged(String? changeValue) {
    setState(() {
      _newValue = changeValue!;
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Konversi Suhu (Rofiqoh Wahyuningtyas - 2041720217)"),
        ),
        body: Container(
          margin: EdgeInsets.all(8),
          child: Column(
            children: [
              Input(etInput: etInput),
              DropdownButton<String>(
                items: listItem.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                value: _newValue,
                onChanged: dropdownOnChanged,
              ),
              result(
                result_: _result,
              ),
              Converter(
                konversi: konversi,
              ),
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: Text(
                  "Riwayat Konversi",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              History(listViewItem: listViewItem),
            ],
          ),
        ),
      ),
    );
  }
}
