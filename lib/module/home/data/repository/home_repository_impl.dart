import 'package:dio_cache_interceptor/src/model/cache_options.dart';

import '../../../../core/resource/data_state.dart';
import '../../domain/adapters/home_repo_adapter.dart';
import '../data_sources/remote/remote_data_source.dart';
import '../model/product_model/product_model.dart';

class HomeRepositoyImpl implements IHomeRepository {
  final IHomeRemoteDataSource _newsRemoteDataSource;
  HomeRepositoyImpl(this._newsRemoteDataSource);

  @override
  Future<DataState<List<ProductModel>>> getProduct(
      {CachePolicy cachePolicy = CachePolicy.forceCache}) async {
    try {
      var result = await _newsRemoteDataSource.getProducts();
      return DataSuccess(result);
    } catch (error) {
      return DataFailed(error);
    }
  }
}
