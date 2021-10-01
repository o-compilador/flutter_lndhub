// TODO remove me
// ignore_for_file: public_member_api_docs

import 'api_response.dart';

class Balance {
  const Balance({
    required this.totalBalance,
    required this.availableBalance,
    required this.uncomfirmedBalance,
  });

  factory Balance.fromJSON(JSON json) {
    return Balance(
      totalBalance: json['TotalBalance'] as int,
      availableBalance: json['AvailableBalance'] as int,
      uncomfirmedBalance: json['UncomfirmedBalance'] as int,
    );
  }

  final int totalBalance;
  final int availableBalance;
  final int uncomfirmedBalance;
}

class GetBalanceResponse {
  const GetBalanceResponse({
    required this.btc,
  });

  factory GetBalanceResponse.fromJSON(JSON json) {
    return GetBalanceResponse(
      btc: Balance.fromJSON(
        json['btc'] as JSON,
      ),
    );
  }

  final Balance btc;
}
