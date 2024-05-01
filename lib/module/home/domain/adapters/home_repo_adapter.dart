import 'package:testproject/module/home/data/model/params/product_params.dart';

import '../../../../core/resource/data_state.dart';
import '../../data/model/product_model/product_model.dart';

abstract class IHomeRepository {
  Future<DataState<List<ProductModel>>> getProduct(
      {required ProductParams params});
  Future<DataState<ProductModel>> getProductDetail(
      {required ProductParams params});
}
