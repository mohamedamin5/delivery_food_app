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
    Map<String, String>? headers,
  }) async {
    try {
      final response = await _dio.delete(
        url,
        options: Options(headers: headers),
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      return handleDioException(e);
    }
  }

  @override
  Future<dynamic> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    try {
      final response = await _dio.get(
        url,
        options: Options(headers: headers),
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      return handleDioException(e);
    }
  }

  @override
  Future<dynamic> post(
    String url, {
    Map<String, dynamic>? queryParameters,
    dynamic body,
    Map<String, String>? headers,
  }) async {
    try {
      final response = await _dio.post(
        url,
        queryParameters: queryParameters,
        data: body,
        options: Options(headers: headers),
      );
      return response.data;
    } on DioException catch (e) {
      return handleDioException(e);
    }
  }

  @override
  Future<dynamic> put(
    String url, {
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
    dynamic body,
  }) async {
    try {
      final response = await _dio.put(
        url,
        options: Options(headers: headers),
        queryParameters: queryParameters,
        data: body,
      );
      return response.data;
    } on DioException catch (e) {
      return handleDioException(e);
    }
  }
}
