// TODO remove me
// ignore_for_file: public_member_api_docs

import 'package:flutter_lndhub/src/model/auth_response.dart';
import 'package:flutter_lndhub/src/model/create_response.dart';

typedef JSON = Map<String, dynamic>;

class ApiResponse<T> {
  ApiResponse({
    required this.statusCode,
    required this.data,
  });

  factory ApiResponse.fromJSON(JSON json, int statusCode) {
    if (T is CreateResponse) {
      return ApiResponse(
        statusCode: statusCode,
        data: CreateResponse.fromJSON(json) as T,
      );
    }

    if (T is AuthResponse) {
      return ApiResponse(
        statusCode: statusCode,
        data: AuthResponse.fromJSON(json) as T,
      );
    }

    throw Error();
  }

  final T data;
  final int statusCode;
}
