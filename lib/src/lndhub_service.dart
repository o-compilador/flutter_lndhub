// TODO remove me
// ignore_for_file: public_member_api_docs

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_lndhub/src/model/account_type.dart';
import 'package:flutter_lndhub/src/model/api_error_response.dart';
import 'package:flutter_lndhub/src/model/auth_response.dart';
import 'package:flutter_lndhub/src/model/get_balance_response.dart';
import 'package:flutter_lndhub/src/model/get_info_response.dart';
import 'package:flutter_lndhub/src/model/get_invoice.dart';
import 'package:flutter_lndhub/src/model/pay_invoice_response.dart';
import 'package:flutter_lndhub/src/model/transactions_response.dart';
import 'package:http/http.dart' as http;

import 'model/api_response.dart';
import 'model/check_route_response.dart';
import 'model/create_response.dart';
import 'model/decoded_invoice_response.dart';
import 'model/get_btc_response.dart';
import 'model/method.dart';

class LndHubService {
  LndHubService({
    required this.baseUri,
    this.defaultAccountType = AccountType.common,
    this.partnerId,
  });

  final http.Client _client = http.Client();
  final AccountType defaultAccountType;
  final String? partnerId;
  final String baseUri;

  Future<ApiResponse<T>> _request<T>({
    required Uri path,
    required Method method,
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  }) async {
    final url = Uri.parse('$baseUri$path');

    if (headers != null) {
      headers.addAll({
        'content-type': 'application/json',
        'access-control-allow-origin': '*',
      });
    }

    http.Response res;
    switch (method) {
      case Method.get:
        {
          res = await _client.get(
            url,
            headers: headers,
          );
          break;
        }

      case Method.post:
        {
          res = await _client.post(
            url,
            headers: headers,
            body: body,
          );
          break;
        }
    }
    final JSON resBody = jsonDecode(res.body) as JSON;

    try {
      return ApiResponse<T>.fromJSON(resBody, res.statusCode);
    } catch (e) {
      if (kDebugMode) {
        if (e is ApiErrorResponse) {
          e.printToConsole();
        } else {
          // ignore: avoid_print
          print('Got error from LndHub:');
          // ignore: avoid_print
          print(e.toString());
        }
      }

      rethrow;
    }
  }

  Future<ApiResponse<CreateResponse>> create(
    AccountType? accountType,
  ) async {
    return _request(
      path: Uri.parse('/create'),
      method: Method.post,
      body: <String, dynamic>{
        'accounttype': accountType?.value ?? defaultAccountType.value,
        'partnerid': partnerId ?? 'bluewallet',
      },
    );
  }

  Future<ApiResponse<AuthResponse>> auth(
    String login,
    String password,
  ) async {
    return _request(
      path: Uri.parse('/auth?type=auth'),
      method: Method.post,
      body: <String, dynamic>{
        'login': login,
        'password': password,
      },
    );
  }

  Future<ApiResponse<AuthResponse>> refreshToken(
    String refreshToken,
  ) async {
    return _request(
      path: Uri.parse('/auth?type=refresh_token'),
      method: Method.post,
      body: <String, dynamic>{
        'refresh_token': refreshToken,
      },
    );
  }

  Future<ApiResponse<AuthResponse>> userOauth(
    String clientId,
    String clientSecret,
  ) async {
    return _request(
      path: Uri.parse('/oauth2/token'),
      method: Method.post,
      body: <String, dynamic>{
        'grant_type': 'client_credentials',
        'cient_id': clientId,
        'client_secret': clientSecret,
      },
    );
  }

  Future<ApiResponse<GetBTCResponse>> getBTC({
    required String accessToken,
  }) async {
    return _request(
      path: Uri.parse('/getbtc'),
      method: Method.get,
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
    );
  }

  Future<ApiResponse<BTCAddressResponse>> newBTC({
    required String accessToken,
  }) async {
    return _request(
      path: Uri.parse('/newbtc'),
      method: Method.post,
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
    );
  }

  Future<ApiResponse<TransactionsResponse>> getPending({
    required String accessToken,
  }) async {
    return _request(
      path: Uri.parse('/getpending'),
      method: Method.get,
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
    );
  }

  Future<ApiResponse<DecodedInvoiceResponse>> decodeInvoice({
    required String invoice,
    required String accessToken,
  }) async {
    return _request(
      path: Uri.parse('/decodeinvoice?invoice=$invoice'),
      method: Method.get,
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
    );
  }

  Future<ApiResponse<CheckRouteResponse>> checkRouteInvoice({
    required String invoice,
    required String accessToken,
  }) async {
    return _request(
      path: Uri.parse('/checkrouteinvoice?invoice=$invoice'),
      method: Method.get,
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
    );
  }

  Future<ApiResponse<CheckRouteResponse>> checkRoute({
    required String destination,
    required String amt,
    required String accessToken,
  }) async {
    return _request(
      path: Uri.parse('/checkrouteinvoice?destination=$destination&amt=$amt'),
      method: Method.get,
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
    );
  }

  Future<ApiResponse<PayInvoiceResponse>> payInvoice({
    required String invoice,
    required String accessToken,
  }) async {
    return _request(
      path: Uri.parse('/payinvoice'),
      method: Method.post,
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
      body: <String, dynamic>{
        'invoice': invoice,
      },
    );
  }

  Future<ApiResponse<PayInvoiceResponse>> checkPayment({
    required String paymentHash,
    required String accessToken,
  }) async {
    return _request(
      path: Uri.parse('/checkpayment/$paymentHash'),
      method: Method.get,
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
    );
  }

  Future<ApiResponse<TransactionResponse>> sendCoins({
    required String invoice,
    required String accessToken,
  }) async {
    return _request(
      path: Uri.parse('/sendcoins'),
      method: Method.post,
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
      body: <String, dynamic>{
        'invoice': invoice,
      },
    );
  }

  Future<ApiResponse<TransactionsResponse>> getTxs({
    int limit = 20,
    int offset = 0,
    required String accessToken,
  }) async {
    return _request(
      path: Uri.parse('/gettxs?limit=$limit&offset=$offset'),
      method: Method.get,
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
    );
  }

  Future<ApiResponse<GetBalanceResponse>> getBalance({
    required String accessToken,
  }) async {
    return _request(
      path: Uri.parse('/balance'),
      method: Method.get,
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
    );
  }

  Future<ApiResponse<GetInfoResponse>> getInfo({
    required String accessToken,
  }) async {
    return _request(
      path: Uri.parse('/getinfo'),
      method: Method.get,
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
    );
  }

  Future<ApiResponse<GetInvoiceResponse>> getInvoice(
    GetInvoiceParams params, {
    required String accessToken,
  }) async {
    return _request(
      path: Uri(
        path: '/getinvoice',
        queryParameters: params.toJSON(),
      ),
      method: Method.get,
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
    );
  }

  Future<ApiResponse<GetInvoiceResponse>> getUserInvoices(
    GetInvoiceParams params, {
    required String accessToken,
  }) async {
    return _request(
      path: Uri.parse('/getuserinvoices'),
      method: Method.get,
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
    );
  }
}
