import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ngepet_id/models/dokter_model.dart';
import 'package:ngepet_id/services/dokter_service.dart';

part 'dokter_state.dart';

class DokterCubit extends Cubit<DokterState> {
  DokterCubit() : super(DokterInitial());

  void getDokters() async {
    try {
      emit(DokterLoading());

      List<DokterModels> dokters = await DokterService().getDokters();
      

      emit(DokterSuccess(dokters));
    } catch (e) {
      emit(DokterFailed(e.toString()));
    }
  }

  void searchDokters(String keyword) async {
    try {
      emit(DokterLoading());

      List<DokterModels> dokters = await DokterService().getDokters();
      // Lakukan filter berdasarkan kata kunci
      final searchResults = dokters
          .where((dokter) =>
              dokter.name.toLowerCase().contains(keyword.toLowerCase()))
          .toList();

      emit(DokterSearchSuccess(searchResults));
    } catch (e) {
      emit(DokterFailed("Error: $e"));
    }
  }

  // void getDoktersByStore(String storeId) async {
  //   try {
  //     emit(DokterLoading());

  //     List<DokterModels> dokters =
  //         await DokterService().getDoktersByStore(storeId);

  //     emit(DokterSuccess(dokters));
  //   } catch (e) {
  //     emit(DokterFailed(e.toString()));
  //   }
  // }
}
