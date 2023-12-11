import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ngepet_id/models/buka_toko_model.dart';
import 'package:ngepet_id/services/buka_toko_service.dart';

part 'buka_toko_state.dart';

class BukaTokoCubit extends Cubit<BukaTokoState> {
  final BukaTokoService _bukaTokoService = BukaTokoService();

  BukaTokoCubit() : super(BukaTokoInitial());

  void ajukanBukaToko({
    required String userId,
    required String namaToko,
    required String deskripsiToko,
    required String alamatToko,
    required String namaPemilik,
    required String noTelepon,
    required String email,
  }) async {
    try {
      emit(BukaTokoLoading());
      BukaTokoModel bToko = BukaTokoModel(
        userId: userId,
        namaToko: namaToko,
        deskripsiToko: deskripsiToko,
        alamatToko: alamatToko,
        namaPemilik: namaPemilik,
        noTelepon: noTelepon,
        email: email,
      );
      await _bukaTokoService.ajukanBukaToko(bToko);

      emit(BukaTokoSuccess(bToko));
    } catch (e) {
      emit(BukaTokoFailed(e.toString()));
    }
  }
}
