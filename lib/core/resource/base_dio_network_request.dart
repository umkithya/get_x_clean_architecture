import 'package:dio/dio.dart';

import '../../network/dio_cache_option.dart';

abstract class BaseDioNetworkRequest {
  Future<Response<T>> get<T>(String path,
      {Object? data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onReceiveProgress,
      DioCacheOptions? dioCacheOptions});
}
