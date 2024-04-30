
import '../../../../core/resource/base_use_case.dart';
import '../../../../core/resource/data_state.dart';
import '../../data/model/product_model/product_model.dart';
import '../adapters/home_repo_adapter.dart';

class GetHomeUseCase
    implements BaseUseCase<DataState<List<ProductModel>>, void> {
  final IHomeRepository _usersRepository;
  GetHomeUseCase(this._usersRepository);

  @override
  Future<DataState<List<ProductModel>>> call({void params}) {
    return _usersRepository.getProduct();
  }
}
