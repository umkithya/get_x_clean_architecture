import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../../../network/dio_client.dart';
import '../../../../../network/end_point.dart';
import '../../model/product_model/product_model.dart';

class HomeRemoteDataSourceImpl extends IHomeRemoteDataSource {
  @override
  Future<List<ProductModel>> getProducts() async {
    final Response response =
        await DioClient.instance.dio.get(Endpoints.products);
    return await compute(parseProducts, response);
  }

  @override
  List<ProductModel> parseProducts(Response response) {
    return response.data
        .map<ProductModel>((e) => ProductModel.fromJson(e))
        .toList();
  }
}

abstract class IHomeRemoteDataSource {
  Future<List<ProductModel>> getProducts();
  List<ProductModel> parseProducts(Response response);
}
