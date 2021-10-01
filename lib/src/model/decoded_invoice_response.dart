// TODO remove me
// ignore_for_file: public_member_api_docs

import 'api_response.dart';

class HopHint {
  const HopHint({
    required this.nodeId,
    required this.chanId,
    required this.feeBaseMsat,
    required this.feeProportionalMillionths,
    required this.cltvExpiryDelta,
  });

  factory HopHint.fromJSON(JSON json) {
    return HopHint(
      nodeId: json['node_id'] as String,
      chanId: json['chan_id'] as String,
      feeBaseMsat: json['fee_base_msat'] as int,
      feeProportionalMillionths: json['fee_proportional_millionths'] as int,
      cltvExpiryDelta: json['cltv_expiry_delta'] as int,
    );
  }

  final String nodeId;
  final String chanId;
  final int feeBaseMsat;
  final int feeProportionalMillionths;
  final int cltvExpiryDelta;
}

class RouteHint {
  const RouteHint(this.hopHints);

  factory RouteHint.fromJSON(JSON json) {
    return RouteHint(
      (json['hop_hints'] as List<JSON>)
          .map((h) => HopHint.fromJSON(h))
          .toList(),
    );
  }

  final List<HopHint> hopHints;
}

class DecodedInvoiceResponse {
  const DecodedInvoiceResponse({
    required this.destination,
    required this.paymentHash,
    required this.numSatoshis,
    required this.timestamp,
    required this.expiry,
    required this.description,
    required this.descriptionHash,
    required this.fallbackAddr,
    required this.cltvExpiry,
    required this.routeHints,
  });

  factory DecodedInvoiceResponse.fromJson(JSON json) {
    return DecodedInvoiceResponse(
      destination: json['destination'] as String,
      paymentHash: json['payment_hash'] as String,
      numSatoshis: json['num_satoshis'] as String,
      timestamp: json['timestamp'] as String,
      expiry: json['expiry'] as String,
      description: json['description'] as String,
      descriptionHash: json['description_hash'] as String,
      fallbackAddr: json['fallback_addr'] as String,
      cltvExpiry: json['cltv_expiry'] as String,
      routeHints: (json['route_hints'] as List<JSON>)
          .map((r) => RouteHint.fromJSON(r))
          .toList(),
    );
  }

  final String destination;
  final String paymentHash;
  final String numSatoshis;
  final String timestamp;
  final String expiry;
  final String description;
  final String descriptionHash;
  final String fallbackAddr;
  final String cltvExpiry;
  final List<RouteHint> routeHints;
}
