import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testproject/module/home/domain/entities/product.dart';
import 'package:testproject/module/home/domain/usecases/get_product_detail.dart';

import '../../../../utils/helper/state_manager/my_state_manager.dart';
import '../../../home/data/model/params/product_params.dart';

class DetailController extends GetxController
    with StateMixin<Product>, GoRouterStateMixin {
  final GetProductDetailUseCase _getDetailUseCase;
  DetailController(this._getDetailUseCase);

  Future<void> getProductDetail({bool isRefresh = false}) async {
    change(null, status: RxStatus.loading());

    debugPrint('$queryParameters');
    final result = await _getDetailUseCase.call(
        params: ProductParams(
            refresh: isRefresh,
            id: int.tryParse(queryParameters['id'] ?? '0')));
    if (result.error != null) {
      change(null, status: RxStatus.error(result.toString()));
    } else if (result.data != null) {
      change(result.data, status: RxStatus.success());
    }
  }

  @override
  void onClose() {
    debugPrint("HomeController OnClosed: ");
    super.onClose();
  }

  @override
  void onInit() {
    super.onInit();
    getProductDetail();
  }

  Future<void> refreshProduct() async {
    await getProductDetail(isRefresh: true);
  }
}
