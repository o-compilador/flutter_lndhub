// TODO remove me
// ignore_for_file: public_member_api_docs

import 'api_response.dart';

enum TransactionType {
  bitcoindInternalTx,
  bitcoindTx,
  paidInvoice,
  sentCoins,
  receivedInvoicePayments,
}

extension TransactionTypeValue on TransactionType {
  static const types = {
    'bitcoind_internal_tx': TransactionType.bitcoindInternalTx,
    'bitcoind_tx': TransactionType.bitcoindTx,
    'paid_invoice': TransactionType.paidInvoice,
    'sent_coins': TransactionType.sentCoins,
    'received_invoice_payments': TransactionType.receivedInvoicePayments,
  };

  static TransactionType fromString(String value) {
    final type = types[value];

    if (type == null) {
      throw Error();
    }

    return type;
  }
}

class TransactionResponse {
  const TransactionResponse({
    required this.type,
    required this.txId,
    required this.amt,
    required this.fee,
    required this.timestamp,
    required this.from,
    required this.to,
    required this.description,
    required this.invoice,
  });

  factory TransactionResponse.fromJSON(JSON json) => TransactionResponse(
        type: TransactionTypeValue.fromString(json['type'] as String),
        txId: json['txId'] as String,
        amt: json['amt'] as int,
        fee: json['fee'] as int,
        timestamp: json['timestamp'] as int,
        from: json['from'] as String,
        to: json['to'] as String,
        description: json['description'] as String,
        invoice: json['invoice'] as String,
      );

  final TransactionType type;
  final String txId;
  final int amt;
  final int fee;
  final int timestamp;
  final String from;
  final String to;
  final String description;
  final String invoice;
}

class TransactionsResponse {
  const TransactionsResponse(this.transactions);

  factory TransactionsResponse.fromJson(List<JSON> json) {
    return TransactionsResponse(
        json.map((e) => TransactionResponse.fromJSON(e)).toList());
  }

  final List<TransactionResponse> transactions;
}
