import 'product_model.dart';

class CartModel {
  final String userId;
  final List<ProductModels> products;

  CartModel({
    required this.userId,
    required this.products,
  });
}
