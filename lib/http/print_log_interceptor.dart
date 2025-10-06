import 'dart:developer';

import 'package:dio/dio.dart';

class PrintLogInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log("\nrequest start===================");
    options.headers?.forEach((key, value) {
      log("请求头信息：key=$key, value=${value.toString()}");
    });
    log("path:${options.path}");
    log("method:${options.method}");
    log("data:${options.data}");
    log("queryParamterts:${options.queryParameters}");
    log("\nrequest end===================");
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log("\onResponse start===================");
    response.headers?.forEach((key, value) {
      log("响应头信息：key=$key, value=${value.toString()}");
    });
    log("data:${response.data}");
    log("\onResponse end===================");
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log("\onError start===================");
    log("error: ${err.toString()}");
    log("\onError end===================");
    super.onError(err, handler);
  }
}
