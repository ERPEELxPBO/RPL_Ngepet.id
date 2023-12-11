// consultation_details_models.dart

class ConsultationDetailsModels {
  final String consultationDetailId;
  final String senderId;
  final String receiverId;
  final String text;
  final DateTime timestamp;

  ConsultationDetailsModels({
    required this.consultationDetailId,
    required this.senderId,
    required this.receiverId,
    required this.text,
    required this.timestamp,
  });
}
