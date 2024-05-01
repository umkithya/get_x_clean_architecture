import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:testproject/module/home/data/model/params/product_params.dart';

import '../../../../../network/dio_cache_option.dart';
import '../../../../../network/dio_client.dart';
import '../../../../../network/end_point.dart';
import '../../model/product_model/product_model.dart';

class HomeRemoteDataSourceImpl extends IHomeRemoteDataSource {
  @override
  Future<ProductModel> getProductDetail({required ProductParams params}) async {
    final Response response = await DioClient.instance.dio.get(
      Endpoints.productDetail(params.id),
      dioCacheOptions: DioCacheOptions(isRefresh: params.refresh),
    );
    return await compute(parseProduct, response);
  }

  // @override
  // Future<ProductModel> getProductDetail(int id) async {
  //   final Response response = await DioClient.instance.dio.get(
  //       Endpoints.products,
  //       dioCacheOptions: DioCacheOptions(isRefresh: isRefresh));
  //   return await compute(parseProduct, response);
  // }

  @override
  Future<List<ProductModel>> getProducts({bool isRefresh = false}) async {
    final Response response = await DioClient.instance.dio.get(
        Endpoints.products,
        dioCacheOptions: DioCacheOptions(isRefresh: isRefresh));
    return await compute(parseProducts, response);
  }

  @override
  ProductModel parseProduct(Response response) {
    return ProductModel.fromJson(response.data);
  }

  @override
  List<ProductModel> parseProducts(Response response) {
    return response.data
        .map<ProductModel>((e) => ProductModel.fromJson(e))
        .toList();
  }
}

abstract class IHomeRemoteDataSource {
  Future<ProductModel> getProductDetail({required ProductParams params});
  Future<List<ProductModel>> getProducts({bool isRefresh = false});
  ProductModel parseProduct(Response response);
  List<ProductModel> parseProducts(Response response);
}
