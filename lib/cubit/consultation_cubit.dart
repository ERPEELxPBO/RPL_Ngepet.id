// consultation_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../models/consultation_detail_models.dart';
import '../models/consultation_models.dart';
import '../services/consultation_service.dart';

part 'consultation_state.dart';

class ConsultationCubit extends Cubit<ConsultationState> {
  final ConsultationService _consultationService = ConsultationService();

  ConsultationCubit() : super(ConsultationInitial());

  Future<void> getConsultations(String userId) async {
    try {
      final consultations = await _consultationService.getConsultations(userId);
      emit(ConsultationListLoaded(consultations));
    } catch (e) {
      emit(ConsultationError("Error: $e"));
    }
  }

  Future<void> getConsultationDetails(String consultationId) async {
    try {
      final consultationDetails =
          await _consultationService.getConsultationDetails(consultationId);
      emit(ConsultationDetailsLoaded(consultationDetails));
    } catch (e) {
      emit(ConsultationError("Error: $e"));
      throw e;
    }
  }

  Future<void> sendMessage(
      String consultationId, String senderId, String text) async {
    try {
      await _consultationService.sendMessage(consultationId, senderId, text);
      // Refresh consultation details after sending a message
      getConsultationDetails(consultationId);
    } catch (e) {
      emit(ConsultationError("Error sending message: $e"));
      throw e;
    }
  }
}
