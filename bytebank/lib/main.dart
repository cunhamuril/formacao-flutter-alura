import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Column(
        children: const <Widget>[
          Card(
            child: ListTile(
              leading: Icon(Icons.monetization_on),
              title: Text('100.0'),
              subtitle: Text('1000'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.monetization_on),
              title: Text('300.0'),
              subtitle: Text('1000'),
            ),
          ),
        ],
      ),
      appBar: AppBar(
        title: const Text('Transferências'),
      ),
      floatingActionButton: const FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.add),
      ),
    ),
  ));
}
