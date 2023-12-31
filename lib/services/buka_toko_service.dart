import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ngepet_id/models/buka_toko_model.dart';

class BukaTokoService {
  final CollectionReference _bukaTokoReference =
      FirebaseFirestore.instance.collection('buka_toko');

  Future<BukaTokoModel> ajukanBukaToko(BukaTokoModel bukaToko) async {
    try {
      DocumentReference docRef = await _bukaTokoReference.add({
        'userId': bukaToko.userId,
        'namaToko': bukaToko.namaToko,
        'deskripsiToko': bukaToko.deskripsiToko,
        'alamatToko': bukaToko.alamatToko,
        'namaPemilik': bukaToko.namaPemilik,
        'noTelepon': bukaToko.noTelepon,
        'email': bukaToko.email,
      });

      // Dapatkan ID yang baru dibuat dari dokumen yang ditambahkan
      String newId = docRef.id;

      // Gunakan ID tersebut untuk menghasilkan model yang diperbarui
      BukaTokoModel bukaTokoWithId = bukaToko.copyWith(id: newId);
      return bukaTokoWithId;
    } catch (e) {
      throw e;
    }
  }
}
