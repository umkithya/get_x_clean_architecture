import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:get/get.dart' hide Response;
import 'package:testproject/network/dio_interceptor.dart';

import '../core/resource/base_dio_network_request.dart';
import '../utils/service/path_provider_serivces.dart';
import 'dio_cache_option.dart';
import 'dio_logger.dart';
import 'end_point.dart';

class DioClient {
  static final DioClient _instance = DioClient._internal();
  static DioClient get instance => _instance;
  final DioHelper dio = DioHelper(
    BaseOptions(baseUrl: BaseUrl.dev),
  );
  DioClient._internal() {
    dio.addInterceptor([DioLogger(), DioInterceptor()]);
    dio.onInitHiveCached();
  }
}

class DioHelper implements BaseDioNetworkRequest {
  static DioHelper? _instance;
  final Dio _dio;
  late BaseOptions? options;
  DioCacheOptions defaultCacheOptions = DioCacheOptions();
  Directory? _directory;
  late HiveCacheStore _cacheStore;
  factory DioHelper([BaseOptions? options]) =>
      _instance ??= DioHelper._(options);

  DioHelper._([BaseOptions? options]) : _dio = Dio(options); // MODIFIED

  void addInterceptor(List<Interceptor> interceptor) {
    log("$interceptor has been added");
    _dio.interceptors.addAll(interceptor);
  }

  @override
  Future<Response<T>> get<T>(String path,
      {Object? data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onReceiveProgress,
      DioCacheOptions? dioCacheOptions}) async {
    await _setCachedResponse(dioCacheOptions);

    return _dio.get(
      path,
      queryParameters: queryParameters,
      onReceiveProgress: onReceiveProgress,
    );
  }

  void onInitHiveCached() async {
    _directory = Get.find<PathProviderService>().directory;
    _cacheStore = HiveCacheStore(
      _directory?.path,
      hiveBoxName: "getxcleanarchitectureapp",
    );
  }

  Future<void> _setCachedResponse(DioCacheOptions? dioCacheOptions) async {
    if (dioCacheOptions != null &&
        dioCacheOptions.cachePolicy == CachePolicy.forceCache) {
      final customCacheOptions = CacheOptions(
        store: _cacheStore,
        policy: defaultCacheOptions.cachePolicy,
        priority: CachePriority.high,
        maxStale: defaultCacheOptions.cacheDuration,
        // hitCacheOnErrorExcept: [401, 404],
        keyBuilder: (request) {
          return request.uri.toString();
        },
        allowPostMethod: false,
      );
      _dio.interceptors.add(DioCacheInterceptor(options: customCacheOptions));
    } else {
      final customCacheOptions = CacheOptions(
        store: _cacheStore,
        policy: defaultCacheOptions.cachePolicy,
        priority: CachePriority.high,
        maxStale: defaultCacheOptions.cacheDuration,
        // hitCacheOnErrorExcept: [401, 404],
        keyBuilder: (request) {
          return request.uri.toString();
        },
        allowPostMethod: false,
      );
      _dio.interceptors.add(DioCacheInterceptor(options: customCacheOptions));
    }
  }
}
