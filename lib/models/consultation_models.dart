// consultation_models.dart

class ConsultationModels {
  final String consultationId;
  final String senderId;
  final String receiverId;
  final DateTime timestamp;

  ConsultationModels({
    required this.consultationId,
    required this.senderId,
    required this.receiverId,
    required this.timestamp,
  });
}
