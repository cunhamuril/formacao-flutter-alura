import 'package:flutter/material.dart';

import '../../components/editor.dart';
import '../../models/transfer.dart';

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
              textInputAction: TextInputAction.next,
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
