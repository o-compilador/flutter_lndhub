// TODO remove me
// ignore_for_file: public_member_api_docs

import 'api_response.dart';

class BTCAddress {
  const BTCAddress(this.address);

  factory BTCAddress.fromJson(JSON json) {
    return BTCAddress(
      json['address'] as String,
    );
  }

  final String address;
}

class BTCAddressResponse {
  const BTCAddressResponse(this.address);

  factory BTCAddressResponse.fromJson(JSON json) {
    return BTCAddressResponse(
      json['address'] as String,
    );
  }

  final String address;
}

class GetBTCResponse {
  const GetBTCResponse(this.addresses);

  factory GetBTCResponse.fromJSON(List<JSON> json) {
    return GetBTCResponse(
      json.map((e) => BTCAddress.fromJson(e)).toList(),
    );
  }

  final List<BTCAddress> addresses;
}
