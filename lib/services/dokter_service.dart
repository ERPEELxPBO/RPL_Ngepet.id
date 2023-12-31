import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/dokter_model.dart';

class DokterService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<DokterModels>> getDokters() async {
    try {
      QuerySnapshot dokterSnapshot =
          await _firestore.collection('dokters').get();
      List<DokterModels> dokters = dokterSnapshot.docs.map((doc) {
        return DokterModels.fromJson(
            doc.id, doc.data() as Map<String, dynamic>);
      }).toList();

      return dokters;
    } catch (e) {
      throw e;
    }
  }

 

  // Future<List<DokterModels>> getDoktersByStore(String storeId) async {
  //   try {
  //     QuerySnapshot dokterSnapshot = await _firestore
  //         .collection('stores')
  //         .doc(storeId)
  //         .collection('dokters')
  //         .get();
  //     List<DokterModels> dokters = dokterSnapshot.docs.map((doc) {
  //       return DokterModels.fromJson(
  //           doc.id, doc.data() as Map<String, dynamic>);
  //     }).toList();

  //     return dokters;
  //   } catch (e) {
  //     throw e;
  //   }
  // }
}
