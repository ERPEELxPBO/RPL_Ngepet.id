import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ngepet_id/models/user_model.dart';

class UserService {
  CollectionReference _userReference =
      FirebaseFirestore.instance.collection('users');

  Future<void> setUser(UserModel user) async {
    try {
      _userReference.doc(user.id).set({
        'email': user.email,
        'name': user.name,
        'username': user.username,
        'no_telepon': user.no_telepon,
        'role_id': user.role_id,
      });
    } catch (e) {
      throw e;
    }
  }

  Future<UserModel> getUserById(String id) async {
    try {
      DocumentSnapshot snapshot = await _userReference.doc(id).get();
      return UserModel(
        id: id,
        email: snapshot['email'],
        name: snapshot['name'],
        username: snapshot['username'],
        no_telepon: snapshot['no_telepon'],
        role_id: snapshot['role_id'],
      );
    } catch (e) {
      throw e;
    }
  }
}
