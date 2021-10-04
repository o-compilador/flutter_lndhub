// TODO remove me
// ignore_for_file: public_member_api_docs

import 'api_response.dart';

class ApiErrorResponse extends Error {
  ApiErrorResponse({
    required this.statusCode,
    required this.code,
    required this.message,
  });

  factory ApiErrorResponse.fromJSON(JSON json, int statusCode) {
    return ApiErrorResponse(
      statusCode: statusCode,
      code: json['code'] as int,
      message: json['message'] as String,
    );
  }

  void printToConsole() {
    // ignore: avoid_print
    print('Got error from LndHub:');
    // ignore: avoid_print
    print('- status code: $statusCode');
    // ignore: avoid_print
    print('- code: $code');
    // ignore: avoid_print
    print('- message: $message');
  }

  final int code;
  final String message;
  final int statusCode;
}
