import 'package:bytebank_2/http/client.dart';
import 'package:flutter/material.dart';

import 'package:bytebank_2/screens/dashboard.dart';

void main() {
  runApp(const BytebankApp());
  findAll().then((transactions) => print('new transactions $transactions'));
}

class BytebankApp extends StatelessWidget {
  const BytebankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bytebank',
      theme: ThemeData.from(
        colorScheme: ColorScheme.light(
          primary: Colors.green.shade900,
          secondary: Colors.blueAccent.shade700,
        ),
      ),
      home: const DashboardPage(),
    );
  }
}
