// TODO remove me
// ignore_for_file: public_member_api_docs

import 'api_response.dart';
import 'base_body.dart';

class CreateResponseBody extends BaseBody {
  const CreateResponseBody({
    required this.login,
    required this.password,
  });

  factory CreateResponseBody.fromJson(JSON json) {
    return CreateResponseBody(
      login: json['login'] as String,
      password: json['password'] as String,
    );
  }

  final String login;
  final String password;
}
