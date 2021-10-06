// TODO remove me
// ignore_for_file: public_member_api_docs

import 'package:flutter_lndhub/flutter_lndhub.dart';
import 'package:flutter_lndhub/src/model/api_error_response.dart';
import 'package:flutter_lndhub/src/model/auth_response.dart';
import 'package:flutter_lndhub/src/model/check_invoice_payment.dart';
import 'package:flutter_lndhub/src/model/create_response.dart';

typedef JSON = Map<String, dynamic>;

class ApiResponse<T> {
  ApiResponse({
    required this.statusCode,
    required this.data,
  });

  factory ApiResponse.fromJSON(JSON json, int statusCode) {
    if (T == CreateResponse) {
      return ApiResponse(
        statusCode: statusCode,
        data: CreateResponse.fromJSON(json) as T,
      );
    }

    if (T == AuthResponse) {
      return ApiResponse(
        statusCode: statusCode,
        data: AuthResponse.fromJSON(json) as T,
      );
    }

    if (T == CheckRouteResponse) {
      return ApiResponse(
        statusCode: statusCode,
        data: CheckRouteResponse.fromJSON(json) as T,
      );
    }

    if (T == DecodedInvoiceResponse) {
      return ApiResponse(
        statusCode: statusCode,
        data: DecodedInvoiceResponse.fromJSON(json) as T,
      );
    }

    if (T == GetBalanceResponse) {
      return ApiResponse(
        statusCode: statusCode,
        data: GetBalanceResponse.fromJSON(json) as T,
      );
    }

    if (T == GetBTCResponse) {
      return ApiResponse(
        statusCode: statusCode,
        data: GetBTCResponse.fromJSON(json as List<JSON>) as T,
      );
    }

    if (T == GetInfoResponse) {
      return ApiResponse(
        statusCode: statusCode,
        data: GetInfoResponse.fromJSON(json) as T,
      );
    }

    if (T == GetInvoiceResponse) {
      return ApiResponse(
        statusCode: statusCode,
        data: GetInvoiceResponse.fromJSON(json) as T,
      );
    }

    if (T == GetUserInvoicesResponse) {
      return ApiResponse(
        statusCode: statusCode,
        data: GetUserInvoicesResponse.fromJSON(json) as T,
      );
    }

    if (T == PayInvoiceResponse) {
      return ApiResponse(
        statusCode: statusCode,
        data: PayInvoiceResponse.fromJSON(json) as T,
      );
    }

    if (T == TransactionsResponse) {
      return ApiResponse(
        statusCode: statusCode,
        data: TransactionsResponse.fromJSON(json as List<JSON>) as T,
      );
    }

    if (T == CheckInvoicePaymentResponse) {
      return ApiResponse(
        statusCode: statusCode,
        data: CheckInvoicePaymentResponse.fromJSON(json) as T,
      );
    }

    throw ApiErrorResponse.fromJSON(json, statusCode);
  }

  final T data;
  final int statusCode;
}
