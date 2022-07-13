import 'dart:convert';

import 'package:bytebank_2/http/client.dart';
import 'package:bytebank_2/models/transaction.dart';
import 'package:http/http.dart';

class TransactionClient {
  Future<List<Transaction>> findAllTransactions() async {
    final Response response = await client
        .get(Uri.parse('$baseUrl/transactions'))
        .timeout(const Duration(seconds: 5));

    List<Transaction> transactions = _toTransactions(response);

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

  List<Transaction> _toTransactions(Response response) {
    final List<dynamic> decodedJson = jsonDecode(response.body);

    final List<Transaction> transactions = decodedJson
        .map(
          (json) => Transaction.fromJson(json),
        )
        .toList();

    return transactions;

    // for (Map<String, dynamic> transactionJson in transactionsJson) {
    //   transactions.add(Transaction.fromJson(transactionJson));
    // }
  }
}
