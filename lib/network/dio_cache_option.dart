import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';

class DioCacheOptions {
  final Duration cacheDuration;
  final CachePolicy cachePolicy;

  DioCacheOptions({
    this.cacheDuration = const Duration(hours: 1),
    this.cachePolicy = CachePolicy.forceCache,
  });
}
