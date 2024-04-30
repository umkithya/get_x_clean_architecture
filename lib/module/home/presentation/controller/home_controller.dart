import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/model/product_model/product_model.dart';
import '../../domain/usecases/get_home.dart';

class HomeController extends GetxController
    with StateMixin<List<ProductModel>> {
  final GetHomeUseCase _getHomeUseCase;
  HomeController(this._getHomeUseCase);

  Future<void> getProducts() async {
    change(null, status: RxStatus.loading());

    final result = await _getHomeUseCase.call();
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
    getProducts();
  }
}
