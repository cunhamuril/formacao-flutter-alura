import 'dart:convert';

import 'package:bytebank_2/http/client.dart';
import 'package:bytebank_2/models/contact.dart';
import 'package:bytebank_2/models/transaction.dart';
import 'package:http/http.dart';

class TransactionClient {
  Future<List<Transaction>> findAllTransactions() async {
    final Response response = await client
        .get(Uri.parse('$baseUrl/transactions'))
        .timeout(const Duration(seconds: 5));

    List<Transaction> transactions = _toTransactions(response.body);

    return transactions;
  }

  Future<Transaction> saveNewTransaction(Transaction transaction) async {
    final transactionJson = jsonEncode(transaction.toJson());

    final Response response = await client.post(
      Uri.parse('$baseUrl/transactions'),
      headers: {
        'Content-type': 'application/json',
        'password': '1000',
      },
      body: transactionJson,
    );

    final Map<String, dynamic> transactionResponseJson =
        jsonDecode(response.body);

    return Transaction.fromJson(transactionResponseJson);
  }

  List<Transaction> _toTransactions(String json) {
    final List<dynamic> transactionsJson = jsonDecode(json);
    final List<Transaction> transactions = [];

    for (Map<String, dynamic> transactionJson in transactionsJson) {
      transactions.add(Transaction.fromJson(transactionJson));
    }

    return transactions;
  }
}
