import 'package:flutter/material.dart';
import 'chatscreen.dart';
import 'homescreen.dart';
import 'notificationsscreen.dart';
import 'searchscreen.dart';

class MessageLobbyScreen extends StatefulWidget {
  const MessageLobbyScreen({Key? key}) : super(key: key);

  @override
  _MessageLobbyScreenState createState() => _MessageLobbyScreenState();
}

class _MessageLobbyScreenState extends State<MessageLobbyScreen> {
  List<Message> messages = [
    Message(name: 'Alice', lastMessage: 'Hello', isMuted: false),
    Message(name: 'Bob', lastMessage: 'Hi there!', isMuted: true),
    // Add more messages as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mensagens'),
      ),
      body: ListView.builder(
        itemCount: messages.length,
        itemBuilder: (context, index) {
          return MessageTile(
            message: messages[index],
            onTap: () {
              // Navigate to the chat screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ChatScreen(),
                ),
              );
            },
            onDelete: () {
              // Delete the message
              setState(() {
                messages.removeAt(index);
              });
            },
            onMute: () {
              // Mute or unmute the message
              setState(() {
                messages[index].isMuted = !messages[index].isMuted;
              });
            },
          );
        },
      ),
      bottomNavigationBar: messages[0].buildBottomAppBar(context),
    );
  }
}

class MessageTile extends StatelessWidget {
  final Message message;
  final VoidCallback onTap;
  final VoidCallback onDelete;
  final VoidCallback onMute;

  const MessageTile({
    Key? key,
    required this.message,
    required this.onTap,
    required this.onDelete,
    required this.onMute,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(message.name),
      subtitle: Text(message.lastMessage),
      onTap: onTap,
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: onDelete,
          ),
          IconButton(
            icon: Icon(message.isMuted ? Icons.volume_off : Icons.volume_up),
            onPressed: onMute,
          ),
        ],
      ),
    );
  }
}

class Message {
  final String name;
  final String lastMessage;
  bool isMuted;

  Message({
    required this.name,
    required this.lastMessage,
    this.isMuted = false,
  });

  BottomAppBar buildBottomAppBar(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildBottomIconButton(Icons.home, Colors.black45, context),
          buildBottomIconButton(Icons.search, Colors.black45, context),
          buildBottomIconButton(Icons.notifications, Colors.black45, context),
          buildBottomIconButton(Icons.message, Colors.blue, context),
        ],
      ),
    );
  }

  IconButton buildBottomIconButton(
      IconData icon, Color color, BuildContext context) {
    return IconButton(
      icon: Icon(
        icon,
        color: color,
      ),
      onPressed: () {
        handleBottomIconButtonPress(icon, context);
      },
    );
  }

  void handleBottomIconButtonPress(IconData icon, BuildContext context) {
    switch (icon) {
      case Icons.home:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
        break;
      case Icons.search:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SearchScreen()),
        );
        break;
      case Icons.notifications:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NotificationsScreen()),
        );
        break;
      case Icons.message:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MessageLobbyScreen()),
        );
        break;
      default:
        break;
    }
  }
}
