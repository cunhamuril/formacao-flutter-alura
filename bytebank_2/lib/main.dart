import 'package:flutter/material.dart';

import 'package:bytebank_2/database/app_database.dart';
import 'package:bytebank_2/models/contact.dart';
import 'package:bytebank_2/screens/dashboard.dart';

void main() {
  runApp(const BytebankApp());
  save(Contact(1, 'Murilo', 1111)).then(((id) {
    findAll().then((contacts) => debugPrint(contacts.toString()));
  }));
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
