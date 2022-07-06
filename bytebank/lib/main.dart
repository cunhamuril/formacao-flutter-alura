import 'package:flutter/material.dart';

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

class TransfersList extends StatefulWidget {
  final List<Transfer> _transfers = [];

  TransfersList({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return TransfersListState();
  }
}

class TransfersListState extends State<TransfersList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transferências'),
      ),
      body: ListView.builder(
          itemCount: widget._transfers.length,
          itemBuilder: (BuildContext context, int index) {
            final transfer = widget._transfers[index];

            return TransferItem(transfer: transfer);
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _handleNavigate(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _handleNavigate(BuildContext context) async {
    final Future<Transfer?> future = Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return TransferForm();
      }),
    );

    // future.then(
    //   (transfer) => {
    //     if (transfer != null) widget._transfers.add(transfer),
    //   },
    // );

    try {
      Transfer? transfer = await future;

      if (transfer != null) {
        setState(() {
          widget._transfers.add(transfer);
        });
      }
    } catch (e) {
      debugPrint(e.toString());
    }
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

class TransferForm extends StatefulWidget {
  TransferForm({Key? key}) : super(key: key);

  final TextEditingController _controllerAccountField = TextEditingController();
  final TextEditingController _controllerValueField = TextEditingController();

  void _createTransfer(BuildContext context) {
    final int? account = int.tryParse(_controllerAccountField.text);
    final double? value = double.tryParse(_controllerValueField.text);

    if (account != null && value != null) {
      final Transfer createdTransfer = Transfer(value, account);

      // debugPrint(createdTransfer.toString());

      Navigator.pop(context, createdTransfer);
    }
  }

  @override
  State<StatefulWidget> createState() {
    return TransferFormState();
  }
}

class TransferFormState extends State<TransferForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criando transferência'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
              controller: widget._controllerAccountField,
              label: 'Número da conta',
              hint: '0000',
            ),
            Editor(
              controller: widget._controllerValueField,
              label: 'Valor',
              hint: '0.00',
              icon: Icons.monetization_on,
            ),
            ElevatedButton(
              onPressed: () => widget._createTransfer(context),
              child: const Text('Confirmar'),
            )
          ],
        ),
      ),
    );
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
