import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/dokter_model.dart';
import '../models/location_pet_model.dart';

class LocationPetService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<LocationPetModels>> getLocationPets() async {
    try {
      QuerySnapshot dokterSnapshot =
          await _firestore.collection('locations').get();
      List<LocationPetModels> dokters = dokterSnapshot.docs.map((doc) {
        return LocationPetModels.fromJson(
            doc.id, doc.data() as Map<String, dynamic>);
      }).toList();

      return dokters;
    } catch (e) {
      throw e;
    }
  }

 

  // Future<List<LocationPetModels>> getLocationPetsByStore(String storeId) async {
  //   try {
  //     QuerySnapshot dokterSnapshot = await _firestore
  //         .collection('stores')
  //         .doc(storeId)
  //         .collection('dokters')
  //         .get();
  //     List<LocationPetModels> dokters = dokterSnapshot.docs.map((doc) {
  //       return LocationPetModels.fromJson(
  //           doc.id, doc.data() as Map<String, dynamic>);
  //     }).toList();

  //     return dokters;
  //   } catch (e) {
  //     throw e;
  //   }
  // }
}
