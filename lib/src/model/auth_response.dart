// TODO remove me
// ignore_for_file: public_member_api_docs

import 'api_response.dart';

class AuthResponse {
  const AuthResponse({
    required this.accessToken,
    required this.tokenType,
    required this.refreshToken,
    required this.expiry,
  });

  factory AuthResponse.fromJSON(JSON json) {
    return AuthResponse(
      accessToken: json['access_token'] as String,
      tokenType: json['token_type'] as String,
      refreshToken: json['refresh_token'] as String,
      expiry: DateTime.parse(json['expiry'] as String),
    );
  }

  final String accessToken;
  final String tokenType;
  final String refreshToken;
  final DateTime expiry;
}
