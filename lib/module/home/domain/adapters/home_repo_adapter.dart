import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';

import '../../../../core/resource/data_state.dart';
import '../../data/model/product_model/product_model.dart';


abstract class IHomeRepository {
  Future<DataState<List<ProductModel>>> getProduct(
      {CachePolicy cachePolicy = CachePolicy.forceCache});
}
