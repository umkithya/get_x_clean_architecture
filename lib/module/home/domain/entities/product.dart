import '../../data/model/product_model/product_model.dart';

class Product {
  ProductModel? product;
  Product.fromModel(ProductModel model) {
    product = model;
  }
}
