import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ngepet_id/models/product_model.dart';
import 'package:ngepet_id/services/product_service.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

  void getProducts() async {
    try {
      emit(ProductLoading());

      List<ProductModels> products = await ProductService().getProducts();
      

      emit(ProductSuccess(products));
    } catch (e) {
      emit(ProductFailed(e.toString()));
    }
  }

  void searchProducts(String keyword) async {
    try {
      emit(ProductLoading());

      List<ProductModels> products = await ProductService().getProducts();
      // Lakukan filter berdasarkan kata kunci
      final searchResults = products
          .where((product) =>
              product.name.toLowerCase().contains(keyword.toLowerCase()))
          .toList();

      emit(ProductSearchSuccess(searchResults));
    } catch (e) {
      emit(ProductFailed("Error: $e"));
    }
  }

  // void getProductsByStore(String storeId) async {
  //   try {
  //     emit(ProductLoading());

  //     List<ProductModels> products =
  //         await ProductService().getProductsByStore(storeId);

  //     emit(ProductSuccess(products));
  //   } catch (e) {
  //     emit(ProductFailed(e.toString()));
  //   }
  // }
}
