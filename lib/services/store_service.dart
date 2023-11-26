import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/store_model.dart';

class StoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Mengambil daftar toko
  Future<List<StoreModels>> getStores() async {
    try {
      QuerySnapshot storeSnapshot = await _firestore.collection('stores').get();
      List<StoreModels> stores = storeSnapshot.docs.map((doc) {
        return StoreModels.fromJson(doc.id, doc.data() as Map<String, dynamic>);
      }).toList();

      return stores;
    } catch (e) {
      throw e;
    }
  }

  // Mengambil detail toko berdasarkan ID
  Future<StoreModels> getStoreById(String storeId) async {
    try {
      DocumentSnapshot storeDoc =
          await _firestore.collection('stores').doc(storeId).get();
      return StoreModels(
        id: storeDoc.id,
        name: storeDoc['name'],
        imageUrl: storeDoc['imageUrl'],
        address: storeDoc['address'],
        createdAt: (storeDoc['createdAt']),
        productIds: List<String>.from(storeDoc['productIds']),
      );
    } catch (e) {
      print('Error fetching store by ID: $e');
      throw e;
    }
  }

  // Tambahkan metode lain sesuai kebutuhan, misalnya untuk menambah, mengupdate, atau menghapus toko
}
