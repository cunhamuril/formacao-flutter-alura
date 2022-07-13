import 'package:bytebank_2/http/interceptors/logging_interceptor.dart';

import 'package:http/http.dart';
import 'package:http_interceptor/http/http.dart';

const baseUrl = 'http://192.168.0.109:8080';

final Client client = InterceptedClient.build(
  interceptors: [LoggingInterceptor()],
);
