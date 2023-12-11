import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ngepet_id/models/user_model.dart';
import 'package:ngepet_id/services/auth_service.dart';
import 'package:ngepet_id/services/user_service.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void register(
      {required String email,
      required String name,
      required String password,
      required String username,
      required String no_telepon,
      String role_id = 'usr_usr',
      String imageUrl =
          'https://firebasestorage.googleapis.com/v0/b/ngepet-id.appspot.com/o/imageUsers%2Fdokter_1.png?alt=media&token=6062cb87-4078-4b67-8f68-9b19e8743ad3'}) async {
    try {
      emit(AuthLoading());

      UserModel user = await AuthService().register(
        email: email,
        name: name,
        password: password,
        username: username,
        no_telepon: no_telepon,
        role_id: role_id,
        imageUrl: imageUrl,
      );

      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  void logIn({
    required String email,
    required String password,
  }) async {
    try {
      emit(AuthLoading());
      UserModel user = await AuthService().logIn(
        email: email,
        password: password,
      );
      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  void logOut() async {
    try {
      emit(AuthLoading());
      await AuthService().logOut();
      emit(AuthInitial());
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  void getCurrentUser(String id) async {
    try {
      UserModel user = await UserService().getUserById(id);
      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }
}
