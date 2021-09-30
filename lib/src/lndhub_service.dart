// TODO remove me
// ignore_for_file: public_member_api_docs

import 'dart:convert';

import 'package:flutter_lndhub/src/model/account_type.dart';
import 'package:flutter_lndhub/src/model/auth_response_body.dart';
import 'package:http/http.dart' as http;

import 'model/api_response.dart';
import 'model/create_response_body.dart';

class LndHubService {
  LndHubService({
    this.defaultAccountType = AccountType.common,
    this.partnerId,
  });

  final http.Client _client = http.Client();
  final AccountType defaultAccountType;
  final String? partnerId;

  Future<ApiResponse<CreateResponseBody>> create(
    AccountType? accountType,
  ) async {
    final res = await _client.post(
      Uri.parse('/create'),
      body: jsonEncode(<String, dynamic>{
        'accounttype': accountType ?? defaultAccountType,
        'partnerid': partnerId,
      }),
    );

    return ApiResponse(
      body: CreateResponseBody.fromJson(
        jsonDecode(res.body) as JSON,
      ),
      statusCode: res.statusCode,
    );
  }

  Future<ApiResponse<AuthResponseBody>> auth(
    String login,
    String password,
  ) async {
    final res = await _client.post(
      Uri.parse('/create'),
      body: jsonEncode(<String, dynamic>{
        'login': login,
        'password': password,
      }),
    );

    return ApiResponse(
      body: AuthResponseBody.fromJson(
        jsonDecode(res.body) as JSON,
      ),
      statusCode: res.statusCode,
    );
  }

  Future<ApiResponse<AuthResponseBody>> refreshToken(
    String refreshToken,
  ) async {
    final res = await _client.post(
      Uri.parse('/create'),
      body: jsonEncode(<String, dynamic>{
        'refresh_token': refreshToken,
      }),
    );

    return ApiResponse(
      body: AuthResponseBody.fromJson(
        jsonDecode(res.body) as JSON,
      ),
      statusCode: res.statusCode,
    );
  }
}
