import 'package:testproject/module/home/data/model/params/product_params.dart';

import '../../../../core/resource/base_use_case.dart';
import '../../../../core/resource/data_state.dart';
import '../entities/product.dart';
import '../repository/home_repository.dart';

class GetProductDetailUseCase
    implements BaseUseCase<DataState<Product>, ProductParams> {
  final IHomeRepository _usersRepository;
  GetProductDetailUseCase(this._usersRepository);

  @override
  Future<DataState<Product>> call({ProductParams? params}) {
    return _usersRepository.getProductDetail(params: params!);
  }

  // @override
  // Future<DataState<List<ProductModel>>> call({ProductParams? params}) async {
  //   return _usersRepository.getProductDetail(params: params!);
  // }
}
