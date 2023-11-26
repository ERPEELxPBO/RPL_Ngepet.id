import 'package:firebase_auth/firebase_auth.dart';
import 'package:ngepet_id/services/user_service.dart';

import '../models/user_model.dart';

final class AuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserModel> register({
    required String email,
    required String name,
    required String password,
    required String username,
    required String no_telepon,
    String role_id = 'usr_usr',
  }) async {
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
          role_id: role_id);

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
