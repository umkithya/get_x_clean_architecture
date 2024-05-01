import '../../../../core/resource/data_state.dart';
import '../../domain/adapters/home_repo_adapter.dart';
import '../data_sources/remote/remote_data_source.dart';
import '../model/params/product_params.dart';
import '../model/product_model/product_model.dart';

class HomeRepositoyImpl implements IHomeRepository {
  final IHomeRemoteDataSource _newsRemoteDataSource;
  HomeRepositoyImpl(this._newsRemoteDataSource);

  @override
  Future<DataState<List<ProductModel>>> getProduct(
      {required ProductParams params}) async {
    try {
      var result =
          await _newsRemoteDataSource.getProducts(isRefresh: params.refresh);
      return DataSuccess(result);
    } catch (error) {
      return DataFailed(error);
    }
  }

  @override
  Future<DataState<ProductModel>> getProductDetail(
      {required ProductParams params}) async {
    try {
      var result = await _newsRemoteDataSource.getProductDetail(params: params);
      return DataSuccess(result);
    } catch (error) {
      return DataFailed(error);
    }
  }
}
