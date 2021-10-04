// TODO remove me
// ignore_for_file: public_member_api_docs

import 'api_response.dart';

class Balance {
  const Balance({
    required this.availableBalance,
    this.totalBalance,
    this.uncomfirmedBalance,
  });

  factory Balance.fromJSON(JSON json) {
    return Balance(
      availableBalance: json['AvailableBalance'] as int,
      totalBalance: json['TotalBalance'] as int?,
      uncomfirmedBalance: json['UncomfirmedBalance'] as int?,
    );
  }

  final int availableBalance;
  final int? totalBalance;
  final int? uncomfirmedBalance;
}

class GetBalanceResponse {
  const GetBalanceResponse({
    required this.btc,
  });

  factory GetBalanceResponse.fromJSON(JSON json) {
    return GetBalanceResponse(
      btc: Balance.fromJSON(
        json['BTC'] as JSON,
      ),
    );
  }

  final Balance btc;
}
