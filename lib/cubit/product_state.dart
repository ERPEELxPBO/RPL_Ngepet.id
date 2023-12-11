part of 'product_cubit.dart';

sealed class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

final class ProductInitial extends ProductState {}

final class ProductLoading extends ProductState {}

final class ProductSuccess extends ProductState {
  final List<ProductModels> products;

  ProductSuccess(this.products);

  @override
  List<Object> get props => [products];
}

final class ProductFailed extends ProductState {
  final String error;

  ProductFailed(this.error);

  @override
  List<Object> get props => [error];
}

class ProductSearchSuccess extends ProductState {
  final List<ProductModels> searchResults;

  ProductSearchSuccess(this.searchResults);

  // Anda bisa menambahkan lebih banyak properti jika diperlukan
}

class SearchProduct extends ProductState {
  final String keyword;

  SearchProduct(this.keyword);

  @override
  List<Object> get props => [keyword];
}
