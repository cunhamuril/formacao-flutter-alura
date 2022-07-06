import 'package:flutter/material.dart';

import '../../models/transfer.dart';
import 'form.dart';

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
