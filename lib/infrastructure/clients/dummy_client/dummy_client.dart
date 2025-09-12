import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:flutter/foundation.dart';
import 'package:nebx_flutter_template/env.dart';
import 'package:nebx_flutter_template/infrastructure/interfaces/dio_client.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DummyClient implements IDioClient {
  final Dio _dio;

  DummyClient._internal(this._dio);

  factory DummyClient() {
    final dio = Dio(
      BaseOptions(
        baseUrl: Env.dummyClientUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 30),
        headers: {'Content-Type': 'application/json'},
        responseType: ResponseType.json,
      ),
    );

    dio.interceptors.add(RetryInterceptor(dio: dio, retries: 2));

    if (kDebugMode) {
      dio.interceptors.add(
        PrettyDioLogger(
          request: true,
          requestBody: true,
          responseBody: true,
          requestHeader: true,
          responseHeader: true,
          error: true,
          compact: false,
        ),
      );
    }

    return DummyClient._internal(dio);
  }

  @override
  Dio get dio => _dio;
}
