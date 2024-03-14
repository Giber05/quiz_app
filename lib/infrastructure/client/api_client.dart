import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:com_bahaso_gilang_liberty/infrastructure/env/network_constants.dart';
import 'package:com_bahaso_gilang_liberty/infrastructure/ext/map_ext.dart';
import 'package:com_bahaso_gilang_liberty/infrastructure/types/exceptions/base_exception.dart';
import 'package:com_bahaso_gilang_liberty/infrastructure/types/exceptions/form_exception.dart';
import 'package:com_bahaso_gilang_liberty/infrastructure/types/exceptions/session_exception.dart';
import 'package:com_bahaso_gilang_liberty/infrastructure/types/json.dart';

class APIResult<T> {
  final int code;
  final String status;
  final T data;
  final String message;

  const APIResult({required this.data, required this.message, required this.status, required this.code});
}

extension APIResultExt<T> on Future<APIResult<T>> {
  Future<T> get futureData async => (await this).data;
}

class MockedResult {
  final JSON result;
  final int statusCode;
  final Map<String, String> headers;

  const MockedResult({this.result, this.statusCode = 200, this.headers = const {}});
}

abstract class APIClient {
  final String baseURL;

  const APIClient(this.baseURL);

  String buildFullUrl(String extraPath, {bool useBaseUrl = true});

  Future<APIResult<T>> post<T>(
      {required String path,
      required MapFromJSON<T> mapper,
      Map<String, String>? headers,
      JSON? body,
      String? token,
      Map<String, dynamic>? query,
      bool shouldPrint = false,
      bool useBaseUrl = true,
      MockedResult? mockResult});

  Future<APIResult<T>> get<T>(
      {required String path,
      Map<String, String>? headers,
      required MapFromJSON<T> mapper,
      Map<String, dynamic>? query,
      bool shouldPrint = false,
      String? token,
      bool useBaseUrl = true,
      MockedResult? mockResult});

  Future<APIResult<T>> delete<T>(
      {required String path,
      required MapFromJSON<T> mapper,
      Map<String, String>? headers,
      JSON? body,
      String? token,
      Map<String, dynamic>? query,
      bool shouldPrint = false,
      bool useBaseUrl = true,
      MockedResult? mockResult});

  Future<APIResult<T>> put<T>(
      {required String path,
      required MapFromJSON<T> mapper,
      Map<String, String>? headers,
      JSON? body,
      String? token,
      Map<String, dynamic>? query,
      bool useBaseUrl = true,
      bool shouldPrint = false,
      MockedResult? mockResult});
}
