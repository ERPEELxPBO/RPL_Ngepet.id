import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ngepet_id/models/location_pet_model.dart';
import 'package:ngepet_id/services/location_pet_service.dart';

part 'location_pet_state.dart';

class LocationPetCubit extends Cubit<LocationPetState> {
  LocationPetCubit() : super(LocationPetInitial());

  void getLocationPets() async {
    try {
      emit(LocationPetLoading());

      List<LocationPetModels> locationPets = await LocationPetService().getLocationPets();
      

      emit(LocationPetSuccess(locationPets));
    } catch (e) {
      emit(LocationPetFailed(e.toString()));
    }
  }

  void searchLocationPets(String keyword) async {
    try {
      emit(LocationPetLoading());

      List<LocationPetModels> locationPets = await LocationPetService().getLocationPets();
      // Lakukan filter berdasarkan kata kunci
      final searchResults = locationPets
          .where((locationPet) =>
              locationPet.name.toLowerCase().contains(keyword.toLowerCase()))
          .toList();

      emit(LocationPetSearchSuccess(searchResults));
    } catch (e) {
      emit(LocationPetFailed("Error: $e"));
    }
  }

  // void getLocationPetsByStore(String storeId) async {
  //   try {
  //     emit(LocationPetLoading());

  //     List<LocationPetModels> locationPets =
  //         await LocationPetService().getLocationPetsByStore(storeId);

  //     emit(LocationPetSuccess(locationPets));
  //   } catch (e) {
  //     emit(LocationPetFailed(e.toString()));
  //   }
  // }
}
