import 'package:firebase_auth/firebase_auth.dart';
import 'package:ngepet_id/services/user_service.dart';

import '../models/user_model.dart';

final class AuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserModel> register(
      {required String email,
      required String name,
      required String password,
      required String username,
      required String no_telepon,
      String role_id = 'usr_usr',
      String imageUrl =
          'https://firebasestorage.googleapis.com/v0/b/ngepet-id.appspot.com/o/imageUsers%2Fdokter_1.png?alt=media&token=6062cb87-4078-4b67-8f68-9b19e8743ad3'}) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      UserModel user = UserModel(
        id: userCredential.user!.uid,
        email: email,
        name: name,
        username: username,
        no_telepon: no_telepon,
        role_id: role_id,
        imageUrl: imageUrl,
      );

      await UserService().setUser(user);

      return user;
    } catch (e) {
      throw e;
    }
  }

  Future<UserModel> logIn({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      UserModel user = await UserService().getUserById(
        userCredential.user!.uid,
      );
      return user;
    } catch (e) {
      throw e;
    }
  }

  Future<void> logOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      throw e;
    }
  }
}
