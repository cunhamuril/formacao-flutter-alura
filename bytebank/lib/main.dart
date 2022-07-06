import 'package:flutter/material.dart';

void main() {
  runApp(const ByteBankApp());
}

class ByteBankApp extends StatelessWidget {
  const ByteBankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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

  @override
  String toString() {
    return "Transfer {value: $value, account: $account}";
  }
}

class TransferForm extends StatelessWidget {
  TransferForm({Key? key}) : super(key: key);

  final TextEditingController _controllerAccountField = TextEditingController();
  final TextEditingController _controllerValueField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criando transferência'),
      ),
      body: Column(
        children: <Widget>[
          Editor(
            controller: _controllerAccountField,
            label: 'Número da conta',
            hint: '0000',
          ),
          Editor(
            controller: _controllerValueField,
            label: 'Valor',
            hint: '0.00',
            icon: Icons.monetization_on,
          ),
          ElevatedButton(
            onPressed: _createTransfer,
            child: const Text('Confirmar'),
          )
        ],
      ),
    );
  }

  void _createTransfer() {
    final int? account = int.tryParse(_controllerAccountField.text);
    final double? value = double.tryParse(_controllerValueField.text);

    if (account != null && value != null) {
      final Transfer createdTransfer = Transfer(value, account);

      debugPrint(createdTransfer.toString());
    }
  }
}

class Editor extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final IconData? icon;

  const Editor({
    Key? key,
    required this.controller,
    required this.label,
    required this.hint,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      // padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
      padding: const EdgeInsets.all(16),
      child: TextField(
        controller: controller,
        style: const TextStyle(
          fontSize: 16,
        ),
        decoration: InputDecoration(
          icon: icon != null ? Icon(icon) : null,
          labelText: label,
          hintText: hint,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}
