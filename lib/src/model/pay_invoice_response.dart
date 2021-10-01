// TODO remove me
// ignore_for_file: public_member_api_docs

import 'api_response.dart';

class Hop {
  const Hop({
    required this.chanId,
    required this.chanCapacity,
    required this.amtToForward,
    required this.fee,
    required this.expiry,
    required this.amtToForwardMsat,
    required this.feeMsat,
  });

  factory Hop.fromJSON(JSON json) {
    return Hop(
      chanId: json['chan_id'] as int,
      chanCapacity: json['chan_capacity'] as int,
      amtToForward: json['amt_to_forward'] as int,
      fee: json['fee'] as int,
      expiry: json['expiry'] as int,
      amtToForwardMsat: json['amt_to_forward_msat'] as int,
      feeMsat: json['fee_msat'] as int,
    );
  }

  final int chanId;
  final int chanCapacity;
  final int amtToForward;
  final int fee;
  final int expiry;
  final int amtToForwardMsat;
  final int feeMsat;
}

class PaymentRoute {
  const PaymentRoute({
    required this.totalTimeLock,
    required this.totalFees,
    required this.totalAmt,
    required this.totalFeesMsat,
    required this.totalAmtMsat,
    required this.hops,
  });

  factory PaymentRoute.fromJSON(JSON json) {
    return PaymentRoute(
      totalTimeLock: json['total_time_lock'] as int,
      totalFees: json['total_fees'] as int,
      totalAmt: json['total_amt'] as int,
      totalFeesMsat: json['total_fees_msat'] as int,
      totalAmtMsat: json['total_amt_msat'] as int,
      hops: (json['hops'] as List<JSON>).map((e) => Hop.fromJSON(e)).toList(),
    );
  }

  final int totalTimeLock;
  final int totalFees;
  final int totalAmt;
  final int totalFeesMsat;
  final int totalAmtMsat;
  final List<Hop> hops;
}

class PayInvoiceResponse {
  const PayInvoiceResponse({
    required this.paymentError,
    required this.paymentPreimage,
    required this.paymentRoute,
  });

  factory PayInvoiceResponse.fromJSON(JSON json) {
    return PayInvoiceResponse(
      paymentError: json['payment_error'] as String,
      paymentPreimage: json['payment_preimage'] as String,
      paymentRoute: PaymentRoute.fromJSON(json['payment_route'] as JSON),
    );
  }

  final String paymentError;
  final String paymentPreimage;
  final PaymentRoute paymentRoute;
}
