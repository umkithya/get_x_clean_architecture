import 'package:testproject/module/home/data/model/params/product_params.dart';

import '../../../../core/resource/data_state.dart';
import '../entities/product.dart';

abstract class IHomeRepository {
  Future<DataState<List<Product>>> getProduct({required ProductParams params});
  Future<DataState<Product>> getProductDetail({required ProductParams params});
}
