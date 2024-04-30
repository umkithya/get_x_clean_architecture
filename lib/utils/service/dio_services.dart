import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../network/dio_interceptor.dart';

class DioService extends GetxService {
  void init() {
    final dio = Dio();
    dio.interceptors.add(DioInterceptor());
  }
}
