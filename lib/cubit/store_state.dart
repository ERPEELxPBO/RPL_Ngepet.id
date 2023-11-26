part of 'store_cubit.dart';

sealed class StoreState extends Equatable {
  const StoreState();

  @override
  List<Object> get props => [];
}

final class StoreInitial extends StoreState {}

final class StoreLoading extends StoreState {}

final class StoreSuccess extends StoreState {
  final List<StoreModels> Stores;

  StoreSuccess(this.Stores);

  @override
  List<Object> get props => [Stores];
}

final class StoreByIdSuccess extends StoreState {
  final StoreModels store;

  StoreByIdSuccess(this.store);

  @override
  List<Object> get props => [store];
}

final class StoreFailed extends StoreState {
  final String error;

  StoreFailed(this.error);

  @override
  List<Object> get props => [error];
}
