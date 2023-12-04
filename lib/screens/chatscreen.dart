import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<Message> messages = [
    Message(
      sender: 'Remetente',
      text: 'Olá, como você está?',
      isMe: false,
    ),
    Message(
      sender: 'Destinatário',
      text: 'Oi! Estou bem, obrigado!',
      isMe: true,
    ),
    // Adicione mais mensagens conforme necessário
  ];

  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/user.png'),
            ),
            SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Nome do Remetente'),
                Text('Online agora'),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return MessageWidget(messages[index]);
              },
            ),
          ),
          MessageInputWidget(
            onSendMessage: _sendMessage,
            messageController: messageController,
          ),
        ],
      ),
    );
  }

  void _sendMessage(String text) {
    if (text.isNotEmpty) {
      Message newMessage = Message(
        sender: 'You', // O remetente será sempre 'Remetente' neste exemplo
        text: text,
        isMe: true,
      );

      setState(() {
        messages.add(newMessage);
      });

      messageController.clear();
    }
  }
}

class Message {
  final String sender;
  final String text;
  final bool isMe;

  Message({
    required this.sender,
    required this.text,
    required this.isMe,
  });
}

class MessageWidget extends StatelessWidget {
  final Message message;

  const MessageWidget(this.message, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: message.isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: message.isMe ? Colors.blue : Colors.grey[300],
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  message.sender,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: message.isMe ? Colors.white : Colors.black,
                  ),
                ),
                Text(
                  '12:34 PM', // Substitua pelo horário real da mensagem
                  style: TextStyle(
                    color: message.isMe ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              message.text,
              style: TextStyle(
                color: message.isMe ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageInputWidget extends StatelessWidget {
  final Function(String) onSendMessage;
  final TextEditingController messageController;

  const MessageInputWidget({
    Key? key,
    required this.onSendMessage,
    required this.messageController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: messageController,
              decoration: const InputDecoration(
                hintText: 'Digite sua mensagem...',
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () {
              String messageText = messageController.text.trim();
              onSendMessage(messageText);
              messageController.clear();
            },
          ),
        ],
      ),
    );
  }
}
