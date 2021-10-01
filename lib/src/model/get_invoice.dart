// TODO remove me
// ignore_for_file: public_member_api_docs

import 'api_response.dart';

class GetInvoiceParams {
  const GetInvoiceParams({
    required this.amt,
    required this.memo,
    this.receipt,
    this.preimage,
    this.fallbackAddr,
    this.expiry,
    this.private,
  });

  final String amt;
  final String memo;
  final String? receipt;
  final String? preimage;
  final String? fallbackAddr;
  final String? expiry;
  final String? private;

  JSON toJSON() {
    return <String, dynamic>{
      'amt': amt,
      'memo': memo,
      'receipt': receipt,
      'preimage': preimage,
      'fallbackAddr': fallbackAddr,
      'expiry': expiry,
      'private': private,
    };
  }
}

class GetInvoiceResponse {
  const GetInvoiceResponse({
    required this.rHash,
    required this.payReq,
    required this.addIndex,
  });

  factory GetInvoiceResponse.fromJSON(JSON json) {
    return GetInvoiceResponse(
      rHash: json['rHash'] as String,
      payReq: json['payReq'] as String,
      addIndex: json['addIndex'] as int,
    );
  }

  final String rHash;
  final String payReq;
  final int addIndex;
}
