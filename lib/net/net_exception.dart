import 'package:dio/dio.dart';

import 'package:flutter/material.dart';

/// 错误处理拦截器
class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    // error统一处理
    NetException appException = NetException.create(err);
    // 错误提示
    debugPrint('DioError===: ${appException.toString()}');
    err.error = appException;
    onError(err, handler);
  }
}

/// 自定义异常
class NetException implements Exception {
  final String message;
  final int code;

  const NetException({
    required this.code,
    required this.message,
  });

  @override
  String toString() {
    return 'NetException{message: $message, code: $code}';
  }

  factory NetException.create(DioError error) {
    switch (error.type) {
      case DioErrorType.cancel:
        return BadRequestException(-1, "请求取消");
      case DioErrorType.connectTimeout:
        return BadRequestException(-1, "连接超时");
      case DioErrorType.sendTimeout:
        return BadRequestException(-1, "请求超时");
      case DioErrorType.receiveTimeout:
        return BadRequestException(-1, "响应超时");
      case DioErrorType.response:
        int errCode = error.response?.statusCode ?? -1;
        switch (errCode) {
          case 400:
            return BadRequestException(errCode, "请求语法错误");
          case 401:
            return UnauthorisedException(errCode, "没有权限");
          case 403:
            return UnauthorisedException(errCode, "服务器拒绝执行");
          case 404:
            return UnauthorisedException(errCode, "无法连接服务器");
          case 405:
            return UnauthorisedException(errCode, "请求方法被禁止");
          case 500:
            return UnauthorisedException(errCode, "服务器内部错误");
          case 502:
            return UnauthorisedException(errCode, "无效的请求");
          case 503:
            return UnauthorisedException(errCode, "服务器挂了");
          case 505:
            return UnauthorisedException(errCode, "不支持HTTP协议请求");
          default:
            return NetException(
                message: error.response?.statusMessage ?? '', code: errCode);
        }
      default:
        return UnKnownException(error.response?.statusMessage);
    }
  }
}

/// 请求错误
class BadRequestException extends NetException {
  BadRequestException([int? code, String? message])
      : super(code: code ?? -1, message: message ?? '未知错误');
}

/// 未认证异常
class UnauthorisedException extends NetException {
  UnauthorisedException([int? code, String? message])
      : super(code: code ?? -1, message: message ?? '未知错误');
}

/// 未知异常
class UnKnownException extends NetException {
  UnKnownException([String? message])
      : super(code: -1, message: message ?? '未知错误');
}
