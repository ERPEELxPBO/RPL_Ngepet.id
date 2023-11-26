import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum MetodePengiriman {
  Reguler,
  Express,
  Ninja_Hatori,
  Burokh,
  Kura_kura,
}

class MetodePengirimanCubit extends Cubit<MetodePengiriman> {
  MetodePengirimanCubit() : super(MetodePengiriman.Burokh);

  // Metode untuk memilih metode pengiriman
  void selectMetodePengiriman(MetodePengiriman metode) {
    emit(metode);
    _saveMetodePengirimanToPrefs(metode);
  }

  // Metode untuk menyimpan metode pengiriman ke shared preferences
  Future<void> _saveMetodePengirimanToPrefs(MetodePengiriman metode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedMetode', metode.toString());
  }

  // Metode untuk mendapatkan metode pengiriman dari shared preferences
  Future<void> getSavedMetodePengiriman() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? selectedMetodeString = prefs.getString('selectedMetode');

    if (selectedMetodeString != null) {
      MetodePengiriman selectedMetode = MetodePengiriman.values.firstWhere(
          (e) => e.toString() == selectedMetodeString,
          orElse: () => MetodePengiriman.Burokh);

      emit(selectedMetode);
    }
  }
}
