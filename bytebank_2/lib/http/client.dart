// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:bytebank_2/models/contact.dart';
import 'package:bytebank_2/models/transaction.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http/http.dart';
import 'package:http_interceptor/models/request_data.dart';
import 'package:http_interceptor/models/response_data.dart';

const baseUrl = 'http://192.168.0.109:8080';

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    print('REQUEST');
    print('URL: ${data.baseUrl}');
    print('HEADERS: ${data.headers}');
    print('BODY: ${data.body}');
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    print('RESPONSE');
    print('STATUS CODE: ${data.statusCode}');
    print('HEADERS: ${data.headers}');
    print('BODY: ${data.body}');
    return data;
  }
}

Transaction _toTransaction(Map transactionJson) {
  return Transaction(
    transactionJson['value'],
    Contact(
      0,
      transactionJson['contact']['name'],
      transactionJson['contact']['accountNumber'],
    ),
  );
}

final Client client = InterceptedClient.build(
  interceptors: [LoggingInterceptor()],
);

Future<List<Transaction>> findAllTransactions() async {
  final Response response = await client
      .get(Uri.parse('$baseUrl/transactions'))
      .timeout(const Duration(seconds: 5));

  final List<dynamic> transactionsDecodedJson = jsonDecode(response.body);
  final List<Transaction> transactions = [];

  for (Map<String, dynamic> transaction in transactionsDecodedJson) {
    transactions.add(_toTransaction(transaction));
  }

  return transactions;
}

Future<Transaction> saveNewTransaction(Transaction transaction) async {
  final Map<String, dynamic> transactionMap = {
    'value': transaction.value,
    'contact': {
      'name': transaction.contact.name,
      'accountNumber': transaction.contact.accountNumber,
    }
  };

  final String transactionJson = jsonEncode(transactionMap);

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

  return _toTransaction(transactionResponseJson);
}
