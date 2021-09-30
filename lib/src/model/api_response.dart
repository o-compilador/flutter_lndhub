// TODO remove me
// ignore_for_file: public_member_api_docs

import 'base_body.dart';

typedef JSON = Map<String, dynamic>;

class ApiResponse<T extends BaseBody> {
  const ApiResponse({
    required this.body,
    required this.statusCode,
  });

  final T body;
  final int statusCode;
}
