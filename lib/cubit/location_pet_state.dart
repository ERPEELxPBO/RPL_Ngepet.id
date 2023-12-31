part of 'location_pet_cubit.dart';

sealed class LocationPetState extends Equatable {
  const LocationPetState();

  @override
  List<Object> get props => [];
}

final class LocationPetInitial extends LocationPetState {}

final class LocationPetLoading extends LocationPetState {}

final class LocationPetSuccess extends LocationPetState {
  final List<LocationPetModels> locationPets;

  LocationPetSuccess(this.locationPets);

  @override
  List<Object> get props => [locationPets];
}

final class LocationPetFailed extends LocationPetState {
  final String error;

  LocationPetFailed(this.error);

  @override
  List<Object> get props => [error];
}

class LocationPetSearchSuccess extends LocationPetState {
  final List<LocationPetModels> searchResults;

  LocationPetSearchSuccess(this.searchResults);

  // Anda bisa menambahkan lebih banyak properti jika diperlukan
}

class SearchLocationPet extends LocationPetState {
  final String keyword;

  SearchLocationPet(this.keyword);

  @override
  List<Object> get props => [keyword];
}
