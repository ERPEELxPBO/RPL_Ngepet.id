import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ngepet_id/models/buka_toko_model.dart';

class BukaTokoService {
  final CollectionReference _userReference =
      FirebaseFirestore.instance.collection('buka_tokos');

  Future<void> ajukanBukaToko(BukaTokoModel bukaToko) async {
    try {
      await _userReference.doc(bukaToko.id).set({
        'userId': FirebaseAuth.instance.currentUser?.uid,
        'namaToko': bukaToko.namaToko,
        'deskripsiToko': bukaToko.deskripsiToko,
        'alamatToko': bukaToko.alamatToko,
        'namaPemilik': bukaToko.namaPemilik,
        'noTelepon': bukaToko.noTelepon,
        'email': bukaToko.email,
      });
    } catch (e) {
      throw e;
    }
  }
}
