import 'package:flutter/material.dart';

class Converter extends StatelessWidget {
  final VoidCallback konversi;
  Converter({
    Key? key,
    required this.konversi,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      color: Colors.blue,
      child: ElevatedButton(
        onPressed: konversi,
        child: Text(
          "Konversi",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
