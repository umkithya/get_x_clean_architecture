import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:testproject/network/dio_interceptor.dart';

import 'dio_logger.dart';
import 'end_point.dart';

class DioClient {
  static final DioClient _instance = DioClient._internal();
  static DioClient get instance => _instance;
  final Dio dio = Dio(
    BaseOptions(baseUrl: BaseUrl.dev),
  );

  DioClient._internal() {
    addInterceptor([DioLogger(), DioInterceptor()]);
  }

  void addInterceptor(List<Interceptor> interceptor) {
    log("$interceptor has been added");
    dio.interceptors.addAll(interceptor);
  }
}
