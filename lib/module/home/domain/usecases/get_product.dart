import 'package:testproject/module/home/data/model/params/product_params.dart';

import '../../../../core/resource/base_use_case.dart';
import '../../../../core/resource/data_state.dart';
import '../entities/product.dart';
import '../repository/home_repository.dart';

class GetProductUseCase
    implements BaseUseCase<DataState<List<Product>>, ProductParams> {
  final IHomeRepository _usersRepository;
  GetProductUseCase(this._usersRepository);

  @override
  Future<DataState<List<Product>>> call({ProductParams? params}) async {
    return _usersRepository.getProduct(params: params!);
  }
}
