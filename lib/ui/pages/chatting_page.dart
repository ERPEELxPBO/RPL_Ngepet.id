import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../models/consultation_detail_models.dart';
import '../../shared/theme.dart';

class ChatScreen extends StatefulWidget {
  final String consultationId;
  final String receiverId;

  ChatScreen({required this.consultationId, required this.receiverId});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<ConsultationDetailsModels> messages = [];
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return buildChatMessage(messages[index]);
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            constraints: BoxConstraints(
              maxHeight: 120, // Maximum height
            ),
            child: Row(
              children: [
                IconButton(
                  icon: ImageIcon(
                    AssetImage('assets/icons/icon_add.png'),
                    size: 24,
                  ),
                  onPressed: () {
                    // Handle the action when the 'add' icon is pressed (e.g., open gallery).
                  },
                ),
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: InputDecoration.collapsed(
                      hintText: 'Type your message...',
                    ),
                  ),
                ),
                IconButton(
                  icon: ImageIcon(
                    AssetImage('assets/icons/icon_send.png'),
                    size: 24,
                  ),
                  onPressed: () {
                    // Handle the action when the 'send' icon is pressed.
                    sendMessage(_textController.text);
                    _textController
                        .clear(); // Clear the text field after sending
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildChatMessage(ConsultationDetailsModels message) {
    // Tentukan apakah pesan ini dari sender atau receiver
    bool isSender = message.senderId == FirebaseAuth.instance.currentUser?.uid;

    return Align(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.all(8.0),
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: isSender ? kPrimaryColor : kSilver2Color,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              message.text,
              style: regularTextStyle.copyWith(
                color: isSender ? kWhiteColor : kBlackColor,
              ),
            ),
            SizedBox(height: 4.0),
            Text(
              formatTime(message.timestamp),
              style: regularTextStyle.copyWith(
                  fontSize: 10.0,
                  color: isSender ? kSilver2Color : kSilver3Color),
            ),
          ],
        ),
      ),
    );
  }

  void sendMessage(String text) {
    // Kirim pesan ke Firebase atau implementasikan sesuai kebutuhan Anda
    // Pastikan untuk mengupdate state messages dengan data yang baru
  }

  String formatTime(DateTime timestamp) {
    // Format time as HH:mm
    String hour = timestamp.hour.toString().padLeft(2, '0');
    String minute = timestamp.minute.toString().padLeft(2, '0');
    return "$hour:$minute";
  }
}
