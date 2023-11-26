import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum Vouchers {
  Diskon_100,
  Diskon_80,
  Diskon_70,
  Diskon_50,
  Diskon_25,
  Diskon_Pacar,
  none,
}

class PilihVoucherCubit extends Cubit<Vouchers> {
  PilihVoucherCubit() : super(Vouchers.none);

  // Metode untuk memilih metode voucher
  void selectPilihVoucher(Vouchers metode) {
    emit(metode);
    _savePilihVoucherToPrefs(metode);
  }

  // Metode untuk menyimpan metode voucher ke shared preferences
  Future<void> _savePilihVoucherToPrefs(Vouchers metode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedMetode', metode.toString());
  }

  // Metode untuk mendapatkan metode voucher dari shared preferences
  Future<void> getSavedPilihVoucher() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? selectedMetodeString = prefs.getString('selectedMetode');

    if (selectedMetodeString != null) {
      Vouchers selectedMetode = Vouchers.values.firstWhere(
          (e) => e.toString() == selectedMetodeString,
          orElse: () => Vouchers.none);

      emit(selectedMetode);
    }
  }
}
