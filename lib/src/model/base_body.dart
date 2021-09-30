// TODO remove me
// ignore_for_file: public_member_api_docs

abstract class BaseBody {
  const BaseBody({
    this.ok,
    this.code,
    this.error,
    this.message,
  });

  final bool? ok;
  final bool? error;
  final int? code;
  final String? message;

  bool didError() => error != null && error == true;
}
