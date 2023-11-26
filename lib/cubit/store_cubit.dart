import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ngepet_id/services/store_service.dart';

import '../models/store_model.dart';

part 'store_state.dart';

class StoreCubit extends Cubit<StoreState> {
  StoreCubit() : super(StoreInitial());

  void getStores() async {
    try {
      emit(StoreLoading());

      List<StoreModels> products = await StoreService().getStores();

      emit(StoreSuccess(products));
    } catch (e) {
      emit(StoreFailed(e.toString()));
    }
  }

  void getStoreById(String storeId) async {
    try {
      emit(StoreLoading());

      StoreModels store = await StoreService().getStoreById(storeId);

      emit(StoreByIdSuccess(store));
    } catch (e) {}
  }
}
