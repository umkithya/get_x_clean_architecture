import 'package:testproject/module/home/data/model/params/product_params.dart';

import '../../../../core/resource/base_use_case.dart';
import '../../../../core/resource/data_state.dart';
import '../../data/model/product_model/product_model.dart';
import '../adapters/home_repo_adapter.dart';

class GetProductUseCase
    implements BaseUseCase<DataState<List<ProductModel>>, ProductParams> {
  final IHomeRepository _usersRepository;
  GetProductUseCase(this._usersRepository);

  @override
  Future<DataState<List<ProductModel>>> call({ProductParams? params}) async {
    return _usersRepository.getProduct(params: params!);
  }
}
