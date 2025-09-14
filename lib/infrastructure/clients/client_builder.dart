import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

abstract class IClientBuilder {
  IClientBuilder setBaseUrl(String url);
  IClientBuilder setResponseType(ResponseType type);
  IClientBuilder setHeaders(Map<String, String> headers);
  IClientBuilder setInterceptor(Interceptor interceptor);
  IClientBuilder setRetryCount(int count);
  Dio build();
}

class ClientBuilder implements IClientBuilder {
  final Dio _dio;
  BaseOptions _baseOptions;

  final List<Interceptor> _interceptors = [];
  int _retryCount = 2;

  ClientBuilder({required Dio client})
    : _dio = client,
      _baseOptions = BaseOptions(
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 30),
        headers: {'Content-Type': 'application/json'},
        responseType: ResponseType.json,
      );

  @override
  IClientBuilder setBaseUrl(String url) {
    _baseOptions = _baseOptions.copyWith(baseUrl: url);
    return this;
  }

  @override
  IClientBuilder setResponseType(ResponseType type) {
    _baseOptions = _baseOptions.copyWith(responseType: type);
    return this;
  }

  @override
  IClientBuilder setHeaders(Map<String, String> headers) {
    _baseOptions = _baseOptions.copyWith(headers: headers);
    return this;
  }

  @override
  IClientBuilder setInterceptor(Interceptor interceptor) {
    _interceptors.add(interceptor);
    return this;
  }

  @override
  IClientBuilder setRetryCount(int count) {
    _retryCount = count;
    return this;
  }

  @override
  Dio build() {
    // add default interceptors
    _dio.interceptors.add(RetryInterceptor(dio: _dio, retries: _retryCount));

    if (kDebugMode) {
      final logger = PrettyDioLogger(
        request: true,
        requestBody: true,
        responseBody: true,
        requestHeader: true,
        responseHeader: true,
        error: true,
        compact: false,
      );

      _dio.interceptors.add(logger);
    }

    _dio.interceptors.addAll(_interceptors);

    // add base options
    _dio.options = _baseOptions;
    return _dio;
  }
}
