// TODO remove me
// ignore_for_file: public_member_api_docs

enum Method {
  get,
  post,
}

extension MethodValue on Method {
  static const methods = {
    Method.get: 'GET',
    Method.post: 'POST',
  };

  String get value => methods[this]!;
}
