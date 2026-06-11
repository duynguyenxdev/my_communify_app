import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:my_communify/config/env.dart';
import 'package:my_communify/core/models/exception.dart';
import 'package:my_communify/core/models/result.dart';

@singleton
class ApiClient {
  late final Dio _dio;

  ApiClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: Env.baseUrl,
        sendTimeout: const Duration(seconds: 10),
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ),
    );
  }

  void setHeader(String key, String value) {
    _dio.options.headers[key] = value;
  }

  void removeHeader(String key) {
    _dio.options.headers.remove(key);
  }

  void setAuthCrecentials({String? token}) {
    setHeader('Authorization', 'Bearer $token');
  }

  void clearAuthCrecentials() {
    removeHeader('Authorization');
  }

  Future<ResultType<T>> request<T>(
    String method,
    String path, {
    Map<String, dynamic>? queryParameters,
    Object? data,
    Options? options,
  }) async {
    try {
      final response = await _dio.request(
        path,
        queryParameters: queryParameters,
        data: data,
        options: Options(method: method, headers: options?.headers),
      );
      final responseData = response.data['data'] ?? response.data;
      return Ok(responseData as T);
    } on DioException catch (dioError) {
      return Error(_handleDioError(dioError));
    } catch (error) {
      return Error(UnkownException(error.toString()));
    }
  }

  AppException _handleDioError(DioException error) {
    final List<DioExceptionType> networkErrors = [
      .connectionTimeout,
      .receiveTimeout,
      .sendTimeout,
    ];

    if (networkErrors.contains(error.type)) {
      return NetworkException('Server timeout');
    }

    if (error.type == .connectionError) {
      return NetworkException(
        'Can not connect to the server, ${error.message}',
      );
    }

    if (error.type == .badCertificate) {
      return NetworkException('Invalid server certificate');
    }

    final data = error.response?.data;
    if (data != null && data is Map<String, dynamic>) {
      return ApiException.fromJson(data);
    }

    return NetworkException('Network error: ${error.message}');
  }

  Future<ResultType<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) {
    return request(
      'get',
      path,
      queryParameters: queryParameters,
      options: options,
    );
  }

  Future<ResultType<T>> post<T>(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) {
    return request(
      'post',
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
  }
}
