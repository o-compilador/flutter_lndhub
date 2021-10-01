// TODO remove me
// ignore_for_file: public_member_api_docs

import 'api_response.dart';

class GetUserInvoicesResponse {
  const GetUserInvoicesResponse({
    required this.rHash,
    required this.paymentRequest,
    required this.addIndex,
    required this.description,
    required this.amt,
    required this.isPaid,
  });

  factory GetUserInvoicesResponse.fromJSON(JSON json) {
    return GetUserInvoicesResponse(
      rHash: json['r_hash'] as String,
      paymentRequest: json['payment_request'] as String,
      addIndex: json['add_index'] as String,
      description: json['description'] as String,
      amt: json['amt'] as int,
      isPaid: json['ispaid'] as int,
    );
  }

  final String rHash;
  final String paymentRequest;
  final String addIndex;
  final String description;
  final int amt;
  final int isPaid;
}
