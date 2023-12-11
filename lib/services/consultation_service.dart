// consultation_service.dart
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/consultation_detail_models.dart';
import '../models/consultation_models.dart';

class ConsultationService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<ConsultationModels>> getConsultations(String userId) async {
    try {
      final querySnapshot = await _firestore
          .collection('consultations')
          .where('senderId', isEqualTo: userId)
          .get();

      return querySnapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return ConsultationModels(
          consultationId: doc.id,
          senderId: data['senderId'],
          receiverId: data['receiverId'],
          timestamp: (data['timestamp'] as Timestamp).toDate(),
        );
      }).toList();
    } catch (e) {
      print("Error: $e");
      throw e;
    }
  }

  Future<List<ConsultationDetailsModels>> getConsultationDetails(
      String consultationId) async {
    try {
      final querySnapshot = await _firestore
          .collection('consultation_details')
          .where('consultationId', isEqualTo: consultationId)
          .orderBy('timestamp', descending: true)
          .get();

      return querySnapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return ConsultationDetailsModels(
          consultationDetailId: doc.id,
          senderId: data['senderId'],
          receiverId: data['receiverId'],
          text: data['text'],
          timestamp: (data['timestamp'] as Timestamp).toDate(),
        );
      }).toList();
    } catch (e) {
      print("Error: $e");
      return [];
    }
  }

  Future<void> sendMessage(
      String consultationId, String senderId, String text) async {
    try {
      await _firestore.collection('consultation_details').add({
        'consultationId': consultationId,
        'senderId': senderId,
        'text': text,
        'timestamp': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      print("Error sending message: $e");
    }
  }
}
