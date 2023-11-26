import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum MetodePembayaran {
  GOPAY,
  OVO,
  DANA,
  Transfer_Bank,
  LinkAja,
  ShopeePay,
}

class MetodePembayaranCubit extends Cubit<MetodePembayaran> {
  MetodePembayaranCubit() : super(MetodePembayaran.GOPAY);

  // Metode untuk memilih metode pembayaran
  void selectMetodePembayaran(MetodePembayaran metode) {
    emit(metode);
    _saveMetodePembayaranToPrefs(metode);
  }

  // Metode untuk menyimpan metode pembayaran ke shared preferences
  Future<void> _saveMetodePembayaranToPrefs(MetodePembayaran metode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedMetode', metode.toString());
  }

  // Metode untuk mendapatkan metode pembayaran dari shared preferences
  Future<void> getSavedMetodePembayaran() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? selectedMetodeString = prefs.getString('selectedMetode');

    if (selectedMetodeString != null) {
      MetodePembayaran selectedMetode =
          MetodePembayaran.values.firstWhere(
              (e) => e.toString() == selectedMetodeString,
              orElse: () => MetodePembayaran.GOPAY);

      emit(selectedMetode);
    }
  }
}
