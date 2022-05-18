import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

import 'net_exception.dart';

///  网络请求管理类
///
class DioManager {
  factory DioManager() => getInstance();

  DioManager._internal();

  static DioManager? _instance;

  static DioManager get instance => getInstance();

  static DioManager getInstance() {
    return _instance ??= DioManager._internal();
  }

  final Dio _dio = Dio();

  void init(
    String baseUrl, {
    BaseOptions? options,
    int connectTimeout = 10000,
    int receiveTimeout = 10000,
    bool needInterceptor = true,
  }) async {
    // 默认配置
    _dio.options = options ??
        _dio.options.copyWith(
          baseUrl: baseUrl,
          responseType: ResponseType.json,
          connectTimeout: connectTimeout,
          receiveTimeout: receiveTimeout,
        );

    // add cookie
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;
    if ((kDebugMode || kProfileMode) && needInterceptor) {
      _dio.interceptors.addAll([
        LogInterceptor(
          request: true,
          requestBody: true,
          requestHeader: false,
          responseHeader: false,
          responseBody: true,
        ),
        ErrorInterceptor(),
      ]); //是否开启请求日志
    }
  }

  void setHeaders(Map<String, String> map) {
    _dio.options = _dio.options.copyWith(headers: map);
  }

  void addCookie(String? token) {
    if (token == null) return;
    _dio.options.headers[HttpHeaders.authorizationHeader] = 'Bearer $token';
  }

  void useProxy(String host, String port) {
    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (client) {
      client.findProxy = (uri) {
        return "PROXY $host:$port";
      };
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
    };
  }

  void addInterceptor(Interceptor interceptor) {
    _dio.interceptors.add(interceptor);
  }

  void clearInterceptor(Interceptor interceptor) {
    _dio.interceptors.clear();
  }

  /// restful get 操作
  Future get<T>(
    String path, {
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    Response<T> response = await _dio.get<T>(
      path,
      queryParameters: params,
      options: options,
      cancelToken: cancelToken,
    );
    return response;
  }

  /// restful post 操作
  Future post<T>(
    String path, {
    Map<String, dynamic>? params,
    data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    var response = await _dio.post<T>(
      path,
      data: data,
      queryParameters: params,
      options: options,
      cancelToken: cancelToken,
    );
    return response;
  }

  /// restful put 操作
  Future put<T>(
    String path, {
    data,
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    var response = await _dio.put<T>(
      path,
      data: data,
      queryParameters: params,
      options: options,
      cancelToken: cancelToken,
    );
    return response;
  }

  /// restful patch 操作
  Future patch<T>(
    String path, {
    data,
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    var response = await _dio.patch<T>(
      path,
      data: data,
      queryParameters: params,
      options: options,
      cancelToken: cancelToken,
    );
    return response;
  }

  /// restful delete 操作
  Future delete<T>(
    String path, {
    data,
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    var response = await _dio.delete<T>(
      path,
      data: data,
      queryParameters: params,
      options: options,
      cancelToken: cancelToken,
    );
    return response;
  }

  /// restful post form 表单提交操作
  Future postForm<T>(
    String path, {
    FormData? params,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    var response = await _dio.post<T>(
      path,
      data: params,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
    return response;
  }
}
