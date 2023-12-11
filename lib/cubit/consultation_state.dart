// consultation_state.dart
part of 'consultation_cubit.dart';

abstract class ConsultationState extends Equatable {
  const ConsultationState();

  @override
  List<Object> get props => [];
}

class ConsultationInitial extends ConsultationState {}

class ConsultationListLoaded extends ConsultationState {
  final List<ConsultationModels> consultations;

  const ConsultationListLoaded(this.consultations);

  @override
  List<Object> get props => [consultations];
}

class ConsultationDetailsLoaded extends ConsultationState {
  final List<ConsultationDetailsModels> consultationDetails;

  const ConsultationDetailsLoaded(this.consultationDetails);

  @override
  List<Object> get props => [consultationDetails];
}

class ConsultationError extends ConsultationState {
  final String errorMessage;

  const ConsultationError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
