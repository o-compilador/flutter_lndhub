// TODO remove me
// ignore_for_file: public_member_api_docs

import 'api_response.dart';

class CheckInvoicePaymentResponse {
  const CheckInvoicePaymentResponse({required this.paid});

  factory CheckInvoicePaymentResponse.fromJSON(JSON json) {
    return CheckInvoicePaymentResponse(paid: json['paid'] as bool);
  }

  final bool paid;
}
