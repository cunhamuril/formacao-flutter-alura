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

Future<List<Transaction>> findAll() async {
  final Client client = InterceptedClient.build(
    interceptors: [LoggingInterceptor()],
  );

  try {
    final Response response = await client
        .get(Uri.parse('$baseUrl/transactions'))
        .timeout(const Duration(seconds: 5));

    final List<dynamic> transactionsDecodedJson = jsonDecode(response.body);
    final List<Transaction> transactions = [];

    for (Map<String, dynamic> transaction in transactionsDecodedJson) {
      transactions.add(
        Transaction(
          transaction['value'],
          Contact(
            0,
            transaction['contact']['name'],
            transaction['contact']['accountNumber'],
          ),
        ),
      );
    }

    return transactions;
  } catch (error) {
    rethrow;
  }
}
