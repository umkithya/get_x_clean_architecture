import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testproject/module/home/data/model/params/product_params.dart';
import 'package:testproject/module/home/domain/entities/product.dart';

import '../../domain/usecases/get_product.dart';

class HomeController extends GetxController
    with StateMixin<List<Product>>, GetSingleTickerProviderStateMixin {
  final GetProductUseCase _getHomeUseCase;
  late TabController tabController;
  HomeController(this._getHomeUseCase);

  Future<void> getProducts({bool isRefresh = false}) async {
    change(null, status: RxStatus.loading());

    final result =
        await _getHomeUseCase.call(params: ProductParams(refresh: isRefresh));
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
    tabController = TabController(length: 3, vsync: this);
    getProducts();
  }

  Future<void> refreshProduct() async {
    await getProducts(isRefresh: true);
  }
}
