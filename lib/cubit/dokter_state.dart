part of 'dokter_cubit.dart';

sealed class DokterState extends Equatable {
  const DokterState();

  @override
  List<Object> get props => [];
}

final class DokterInitial extends DokterState {}

final class DokterLoading extends DokterState {}

final class DokterSuccess extends DokterState {
  final List<DokterModels> dokters;

  DokterSuccess(this.dokters);

  @override
  List<Object> get props => [dokters];
}

final class DokterFailed extends DokterState {
  final String error;

  DokterFailed(this.error);

  @override
  List<Object> get props => [error];
}

class DokterSearchSuccess extends DokterState {
  final List<DokterModels> searchResults;

  DokterSearchSuccess(this.searchResults);

  // Anda bisa menambahkan lebih banyak properti jika diperlukan
}

class SearchDokter extends DokterState {
  final String keyword;

  SearchDokter(this.keyword);

  @override
  List<Object> get props => [keyword];
}
