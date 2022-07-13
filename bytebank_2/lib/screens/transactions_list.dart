import 'package:bytebank_2/components/centered_message.dart';
import 'package:bytebank_2/components/progress.dart';
import 'package:bytebank_2/http/client.dart';
import 'package:bytebank_2/models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionsListPage extends StatelessWidget {
  const TransactionsListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transactions'),
      ),
      body: FutureBuilder<List<Transaction>>(
        future: findAll(),
        builder: (context, snapshot) {
          final List<Transaction> transactions = snapshot.data ?? [];

          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return const Progress();

            case ConnectionState.waiting:
              return const Progress();

            case ConnectionState.active:
              break;

            case ConnectionState.done:
              if (!snapshot.hasData) {
                return const CenteredMessage(
                  message: 'Unknown error',
                  icon: Icons.error,
                );
              }

              if (transactions.isNotEmpty) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    final Transaction transaction = transactions[index];
                    return Card(
                      child: ListTile(
                        leading: const Icon(Icons.monetization_on),
                        title: Text(
                          transaction.value.toString(),
                          style: const TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          transaction.contact.accountNumber.toString(),
                          style: const TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: transactions.length,
                );
              }

              return const CenteredMessage(
                message: 'No transactions found',
                icon: Icons.warning,
              );
          }

          return const CenteredMessage(
            message: 'Unknown error',
            icon: Icons.error,
          );
        },
      ),
    );
  }
}
