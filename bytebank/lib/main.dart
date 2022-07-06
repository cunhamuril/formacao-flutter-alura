import 'package:flutter/material.dart';

import 'screens/transfer/list.dart';

void main() {
  runApp(const ByteBankApp());
}

class ByteBankApp extends StatelessWidget {
  const ByteBankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.from(
        colorScheme: ColorScheme.light(
          primary: Colors.green.shade900,
          secondary: Colors.blueAccent.shade700,
        ),
      ),
      darkTheme: ThemeData.from(
        colorScheme: ColorScheme.dark(
          primary: Colors.green.shade900,
          secondary: Colors.blueAccent.shade700,
        ),
      ),
      home: TransfersList(),
    );
  }
}
