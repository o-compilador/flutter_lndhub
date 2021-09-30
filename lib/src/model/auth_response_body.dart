// TODO remove me
// ignore_for_file: public_member_api_docs

import 'api_response.dart';
import 'base_body.dart';

class AuthResponseBody extends BaseBody {
  const AuthResponseBody({
    required this.accessToken,
    required this.tokenType,
    required this.refreshToken,
    required this.expiry,
  });

  factory AuthResponseBody.fromJson(JSON json) {
    return AuthResponseBody(
      accessToken: json['accessToken'] as String,
      tokenType: json['tokenType'] as String,
      refreshToken: json['refreshToken'] as String,
      expiry: DateTime.parse(json['expiry'] as String),
    );
  }

  final String accessToken;
  final String tokenType;
  final String refreshToken;
  final DateTime expiry;
}
