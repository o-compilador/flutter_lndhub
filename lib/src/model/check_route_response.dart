// TODO remove me
// ignore_for_file: public_member_api_docs

import 'api_response.dart';

class CheckRouteResponse {
  const CheckRouteResponse({
    required this.ok,
  });

  factory CheckRouteResponse.fromJSON(JSON json) {
    return CheckRouteResponse(
      ok: json['ok'] as bool,
    );
  }

  final bool ok;
}
