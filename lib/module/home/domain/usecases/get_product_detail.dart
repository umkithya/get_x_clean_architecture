import 'package:testproject/module/home/data/model/params/product_params.dart';

import '../../../../core/resource/base_use_case.dart';
import '../../../../core/resource/data_state.dart';
import '../../data/model/product_model/product_model.dart';
import '../adapters/home_repo_adapter.dart';

class GetProductDetailUseCase
    implements BaseUseCase<DataState<ProductModel>, ProductParams> {
  final IHomeRepository _usersRepository;
  GetProductDetailUseCase(this._usersRepository);

  @override
  Future<DataState<ProductModel>> call({ProductParams? params}) {
    return _usersRepository.getProductDetail(params: params!);
  }

  // @override
  // Future<DataState<List<ProductModel>>> call({ProductParams? params}) async {
  //   return _usersRepository.getProductDetail(params: params!);
  // }
}
