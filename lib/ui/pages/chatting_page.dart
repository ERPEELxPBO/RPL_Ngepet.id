import 'package:flutter/material.dart';
import 'package:ngepet_id/shared/theme.dart';
import 'package:ngepet_id/ui/pages/custom_appbar_chat.dart';

class ChattingPage extends StatelessWidget {
  const ChattingPage({Key? key, required this.contactName}) : super(key: key);

  final String contactName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomChatAppBar(
        title: contactName,
      ),
      body: ChatScreen(),
    );
  }
}

class ChatMessage {
  final String text;
  final DateTime timestamp;

  ChatMessage({required this.text, required this.timestamp});
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<ChatMessage> messages = [];
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

  Widget buildChatMessage(ChatMessage message) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.all(8.0),
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
          color: kPrimaryColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              message.text,
              style: regularTextStyle.copyWith(
                color: kWhiteColor,
              ),
            ),
            SizedBox(height: 4.0),
            Text(
              formatTime(message.timestamp),
              style: regularTextStyle.copyWith(
                  fontSize: 10.0, color: kSilver2Color),
            ),
          ],
        ),
      ),
    );
  }

  void sendMessage(String text) {
    setState(() {
      messages.add(ChatMessage(text: text, timestamp: DateTime.now()));
    });
  }

  String formatTime(DateTime timestamp) {
    // Format time as HH:mm
    String hour = timestamp.hour.toString().padLeft(2, '0');
    String minute = timestamp.minute.toString().padLeft(2, '0');
    return "$hour:$minute";
  }
}
