// TODO remove me
// ignore_for_file: public_member_api_docs

import 'api_response.dart';

class CreateResponse {
  const CreateResponse({
    required this.login,
    required this.password,
  });

  factory CreateResponse.fromJSON(JSON json) {
    return CreateResponse(
      login: json['login'] as String,
      password: json['password'] as String,
    );
  }

  final String login;
  final String password;
}
