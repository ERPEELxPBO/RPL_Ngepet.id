import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/product_model.dart';

class ProductService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<ProductModels>> getProducts() async {
    try {
      QuerySnapshot productSnapshot =
          await _firestore.collection('products').get();
      List<ProductModels> products = productSnapshot.docs.map((doc) {
        return ProductModels.fromJson(
            doc.id, doc.data() as Map<String, dynamic>);
      }).toList();

      return products;
    } catch (e) {
      throw e;
    }
  }

  // Future<List<ProductModels>> getProductsByStore(String storeId) async {
  //   try {
  //     QuerySnapshot productSnapshot = await _firestore
  //         .collection('stores')
  //         .doc(storeId)
  //         .collection('products')
  //         .get();
  //     List<ProductModels> products = productSnapshot.docs.map((doc) {
  //       return ProductModels.fromJson(
  //           doc.id, doc.data() as Map<String, dynamic>);
  //     }).toList();

  //     return products;
  //   } catch (e) {
  //     throw e;
  //   }
  // }
}
