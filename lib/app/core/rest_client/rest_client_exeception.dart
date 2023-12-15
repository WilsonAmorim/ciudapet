// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cuidapet_mobile/app/core/rest_client/rest_client_response.dart';

class RestClientExeception implements Exception {
  String? message;
  int? statusCode;
  dynamic error;
  RestClientResponse response;

  RestClientExeception({
    this.message,
    this.statusCode,
    required this.error,
    required this.response,
  });

  @override
  String toString() {
    return 'RestClientExeception(message: $message, statusCode: $statusCode, error: $error, response: $response)';
  }
}
