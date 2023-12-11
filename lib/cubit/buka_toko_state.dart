part of 'buka_toko_cubit.dart';

sealed class BukaTokoState extends Equatable {
  const BukaTokoState();

  @override
  List<Object> get props => [];
}

final class BukaTokoInitial extends BukaTokoState {}

final class BukaTokoLoading extends BukaTokoState {}

final class BukaTokoSuccess extends BukaTokoState {
  final BukaTokoModel bukaToko;

  BukaTokoSuccess(this.bukaToko);

  @override
  List<Object> get props => [bukaToko];
}

final class BukaTokoFailed extends BukaTokoState {
  final String error;

  BukaTokoFailed(this.error);

  @override
  List<Object> get props => [error];
}
