import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:path_provider/path_provider.dart';
import 'package:retry/retry.dart';

import 'dio_logger.dart';
import 'end_point.dart';

class DioHelper {
  static final DioHelper _singleton = DioHelper._internal();
  factory DioHelper() {
    return _singleton;
  }

  DioHelper._internal();
  Future<Response> onNetworkRequest(
    String endPoint, {
    required METHODE? methode,
    Map<dynamic, dynamic>? body,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    bool isAuthorize = false,
    bool isDebugOn = false,
    bool noRequiredBody = false,
    bool showBodyInput = false,
    bool hideResponseBody = true,
    bool isBasicAuth = false,
    Duration cacheDuration = const Duration(days: 1),
    CachePolicy cachePolicy = CachePolicy.forceCache,
    bool autoRefreshToken = true,
    int? connectTimeout,
    int? receiveTimeout,
  }) async {
    CacheOptions? customCacheOptions;
    if (cachePolicy != CachePolicy.noCache) {
      final cacheDir = await getTemporaryDirectory();

      final cacheStore = HiveCacheStore(
        cacheDir.path,
        hiveBoxName: "uthrapp",
      );
      customCacheOptions = CacheOptions(
        store: cacheStore,
        policy: cachePolicy,
        priority: CachePriority.high,
        maxStale: cacheDuration,
        hitCacheOnErrorExcept: [401, 404],
        keyBuilder: (request) {
          return request.uri.toString();
        },
        allowPostMethod: false,
      );
    }

    Dio dio = Dio()
      ..options.baseUrl = BaseUrl.dev
      ..options.connectTimeout =
          Duration(milliseconds: connectTimeout ?? Endpoints.connectionTimeout)
      ..options.receiveTimeout =
          Duration(milliseconds: receiveTimeout ?? Endpoints.receiveTimeout)
      ..options.responseType = ResponseType.json
      ..interceptors.add(DioLogger(
        requestHeader: isDebugOn,
        requestBody: showBodyInput ? true : isDebugOn,
        responseBody: hideResponseBody ? false : isDebugOn,
        responseHeader: isDebugOn,
        compact: false,
      ));
    if (customCacheOptions != null) {
      dio = dio
        ..interceptors.add(DioCacheInterceptor(options: customCacheOptions));
    }
    if (!noRequiredBody) {
      if (methode != METHODE.get && body == null) {
        throw Exception('Body must not be null of $methode');
      }
    }

    String token = isBasicAuth
        ? 'Basic ${base64.encode(utf8.encode('${BasicAuth().username}:${BasicAuth().password}'))}'
        : "Bearer TOKENENENNENEN";

    Map<String, String> header = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': isBasicAuth ? token : "",
    };
    if (isAuthorize) {
      header['Token'] = token;
    }
    if (headers != null) {
      header.addAll(headers);
    }
    dio.options.headers = header;

    try {
      Response response = await retry(
        () async {
          switch (methode) {
            case METHODE.get:
              return await dio.get(
                endPoint,
                queryParameters: queryParameters,
                onReceiveProgress: onReceiveProgress,
              );
            case METHODE.post:
              {
                return await dio.post(
                  endPoint,
                  data: json.encode(body),
                  queryParameters: queryParameters,
                  onReceiveProgress: onReceiveProgress,
                  onSendProgress: onSendProgress,
                );
              }
            case METHODE.put:
              {
                return await dio.put(
                  endPoint,
                  data: json.encode(body),
                  queryParameters: queryParameters,
                  onReceiveProgress: onReceiveProgress,
                  onSendProgress: onSendProgress,
                );
              }
            case METHODE.delete:
              {
                return await dio.delete(
                  endPoint,
                  data: json.encode(body),
                  queryParameters: queryParameters,
                );
              }
            default:
              return await dio.get(
                endPoint,
                data: json.encode(body),
                queryParameters: queryParameters,
              );
          }
        },
        retryIf: (e) async {
          return false;
        },
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }
}

enum METHODE {
  get,
  post,
  delete,
  put,
}
