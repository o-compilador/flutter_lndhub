// TODO remove me
// ignore_for_file: public_member_api_docs

import 'api_response.dart';

enum Chain {
  bitcoin,
}

extension ChainValue on Chain {
  static const chains = {
    'bitcoin': Chain.bitcoin,
  };

  static Chain fromString(String value) {
    final chain = chains[value];

    if (chain == null) {
      throw Error();
    }

    return chain;
  }
}

class GetInfoResponse {
  const GetInfoResponse({
    required this.fee,
    required this.identityPubkey,
    required this.alias,
    required this.numActiveChannels,
    required this.numPeers,
    required this.numPendingChannels,
    required this.blockHeight,
    required this.syncedToChain,
    required this.testnet,
    required this.chains,
    required this.uris,
    required this.bestHeaderTimestamp,
    required this.version,
  });

  factory GetInfoResponse.fromJSON(JSON json) {
    return GetInfoResponse(
      fee: json['fee'] as int,
      identityPubkey: json['identityPubkey'] as String,
      alias: json['alias'] as String,
      numActiveChannels: json['numActiveChannels'] as int,
      numPeers: json['numPeers'] as int,
      numPendingChannels: json['numPendingChannels'] as int,
      blockHeight: json['blockHeight'] as int,
      syncedToChain: json['syncedToChain'] as bool,
      testnet: json['testnet'] as bool,
      chains: (json['chains'] as List<String>)
          .map((e) => ChainValue.fromString(e))
          .toList(),
      uris: json['uris'] as List<String>,
      bestHeaderTimestamp: json['bestHeaderTimestamp'] as String,
      version: json['version'] as String,
    );
  }

  final int fee;
  final String identityPubkey;
  final String alias;
  final int numPendingChannels;
  final int numActiveChannels;
  final int numPeers;
  final int blockHeight;
  final bool syncedToChain;
  final bool testnet;
  final List<Chain> chains;
  final List<String> uris;
  final String bestHeaderTimestamp;
  final String version;
}
