import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

abstract class IClientBuilder {
  ClientBuilder setBaseUrl(String url);
  ClientBuilder setResponseType(ResponseType type);
  ClientBuilder setHeaders(Map<String, String> headers);
  ClientBuilder setInterceptor(Interceptor interceptor);
  ClientBuilder setRetryCount(int count);
  Dio build();
}

class ClientBuilder implements IClientBuilder {
  final Dio _dio;
  final BaseOptions _baseOptions;
  int _retryCount = 2;
  List<Interceptor> _interceptors = [];

  ClientBuilder({required Dio client})
    : _dio = client,
      _baseOptions = BaseOptions(
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 30),
        headers: {'Content-Type': 'application/json'},
        responseType: ResponseType.json,
      );

  @override
  ClientBuilder setBaseUrl(String url) {
    _baseOptions.baseUrl = url;
    return this;
  }

  @override
  ClientBuilder setResponseType(ResponseType type) {
    _baseOptions.responseType = type;
    return this;
  }

  @override
  ClientBuilder setHeaders(Map<String, String> headers) {
    _baseOptions.headers.addAll(headers);
    return this;
  }

  @override
  ClientBuilder setInterceptor(Interceptor interceptor) {
    _interceptors.add(interceptor);
    return this;
  }

  @override
  ClientBuilder setRetryCount(int count) {
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
