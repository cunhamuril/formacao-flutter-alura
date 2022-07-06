import 'package:flutter/material.dart';

void main() {
  runApp(const ByteBankApp());
}

class ByteBankApp extends StatelessWidget {
  const ByteBankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        // body: TransfersList(),
        body: TransferForm(),
      ),
    );
  }
}

class TransfersList extends StatelessWidget {
  const TransfersList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transferências'),
      ),
      body: Column(
        children: <Widget>[
          TransferItem(transfer: Transfer(100.0, 1000)),
          TransferItem(transfer: Transfer(200.0, 2000)),
          TransferItem(transfer: Transfer(300.0, 3000)),
        ],
      ),
      floatingActionButton: const FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.add),
      ),
    );
  }
}

class TransferItem extends StatelessWidget {
  final Transfer transfer;

  const TransferItem({super.key, required this.transfer});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.monetization_on),
        title: Text(transfer.value.toString()),
        subtitle: Text(transfer.account.toString()),
      ),
    );
  }
}

class Transfer {
  final double value;
  final int account;

  Transfer(this.value, this.account);
}

class TransferForm extends StatelessWidget {
  const TransferForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criando transferência'),
      ),
      body: Column(
        children: const <Widget>[
          Padding(
            // padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
            padding: EdgeInsets.all(16),
            child: TextField(
              style: TextStyle(
                fontSize: 16,
              ),
              decoration: InputDecoration(
                labelText: 'Número da conta',
                hintText: '0000',
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            // padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
            padding: EdgeInsets.all(16),
            child: TextField(
              style: TextStyle(
                fontSize: 16,
              ),
              decoration: InputDecoration(
                icon: Icon(Icons.monetization_on),
                labelText: 'Valor',
                hintText: '0.00',
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          ElevatedButton(
            onPressed: null,
            child: Text('Confirmar'),
          )
        ],
      ),
    );
  }
}
