import 'package:testproject/module/home/domain/entities/product.dart';

import '../../../../core/resource/data_state.dart';
import '../../domain/repository/home_repository.dart';
import '../data_sources/remote/remote_data_source.dart';
import '../model/params/product_params.dart';

class HomeRepositoyImpl implements IHomeRepository {
  final IHomeRemoteDataSource _newsRemoteDataSource;
  HomeRepositoyImpl(this._newsRemoteDataSource);

  @override
  Future<DataState<List<Product>>> getProduct(
      {required ProductParams params}) async {
    try {
      var result =
          await _newsRemoteDataSource.getProducts(isRefresh: params.refresh);

      return DataSuccess(result.map((e) => Product.fromModel(e)).toList());
    } catch (error) {
      return DataFailed(error);
    }
  }

  @override
  Future<DataState<Product>> getProductDetail(
      {required ProductParams params}) async {
    try {
      var result = await _newsRemoteDataSource.getProductDetail(params: params);
      return DataSuccess(Product.fromModel(result));
    } catch (error) {
      return DataFailed(error);
    }
  }
}
