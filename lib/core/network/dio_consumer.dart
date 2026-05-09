import 'package:dio/dio.dart';
import 'package:flutter_application_2/core/errors/exceptions.dart';
import 'package:flutter_application_2/core/network/i_api_consumer.dart';

class DioConsumer implements IApiConsumer {
  final Dio _dio;

  DioConsumer(this._dio);

  @override
  Future<dynamic> delete(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.delete(
        options: options,
        url,
        queryParameters: queryParameters,
      );
      return response;
    } on DioException catch (e) {
      return handleDioException(e);
    }
  }

  @override
  Future<dynamic> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.get(url, queryParameters: queryParameters);
      return response;
    } on DioException catch (e) {
      return handleDioException(e);
    }
  }

  @override
  Future<dynamic> post(
    String url, {
    Map<String, dynamic>? queryParameters,
    dynamic body,
    Options? options,
  }) async {
    try {
      final response = await _dio.post(
        url,
        queryParameters: queryParameters,
        data: body,
        options: options,
      );
      return response;
    } on DioException catch (e) {
      return handleDioException(e);
    }
  }

  @override
  Future<dynamic> put(
    String url, {
    Options? options,
    Map<String, dynamic>? queryParameters,
    dynamic body,
  }) async {
    try {
      final response = await _dio.put(
        options: options,
        url,
        queryParameters: queryParameters,
        data: body,
      );
      return response;
    } on DioException catch (e) {
      return handleDioException(e);
    }
  }
}
