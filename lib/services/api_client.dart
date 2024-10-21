import 'dart:io';

import 'package:app_test/services/request_handler.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiClient {
// singleton instance
  static final ApiClient _instance = ApiClient._internal();

  factory ApiClient() => _instance;

  ApiClient._internal() {
    ApiInterceptors.addInterceptors(_dio);
  }

  final Dio _dio = Dio();

  Map<String, dynamic> defaultHeaders = {
    HttpHeaders.authorizationHeader: null,
  };

  Future<Response> get(String url, {Map<String, dynamic>? query}) async {
    return _dio.get(
      url,
      queryParameters: query,
      options: Options(headers: defaultHeaders),
    );
  }

  Future<Response> post(
    String url, {
    dynamic data,
    Map<String, dynamic>? headers,
  }) async {
    return _dio.post(
      url,
      data: data,
      options: Options(
        headers: headers ?? defaultHeaders,
        followRedirects: false,
        validateStatus: ((status) {
          return status! <= 500;
        }),
      ),
    );
  }

  Future<Response> put(
    String url, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
  }) async {
    return _dio.put(
      url,
      data: data,
      options: Options(
        headers: headers ?? defaultHeaders,
        followRedirects: false,
        validateStatus: ((status) {
          return status! <= 500;
        }),
      ),
    );
  }

  Future<Response> delete(String url,
      {Map<String, dynamic>? data,
      Map<String, dynamic>? headers,
      Map<String, dynamic>? query}) async {
    return _dio.delete(
      url,
      data: data,
      queryParameters: query,
      options: Options(
        headers: headers ?? defaultHeaders,
        followRedirects: false,
        validateStatus: ((status) {
          return status! <= 500;
        }),
      ),
    );
  }

  void updateToken({required String token}) {
    defaultHeaders[HttpHeaders.authorizationHeader] = 'Bearer $token';
    debugPrint(
        'Update Token:${defaultHeaders[HttpHeaders.authorizationHeader]}');
  }
}
