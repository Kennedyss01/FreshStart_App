import 'package:flutter/material.dart';
import 'package:freshstart/screens/searchscreen.dart';
import 'homescreen.dart';
import 'messagelobbyscreen.dart';

class NotificationsScreen extends StatelessWidget {
  final List<String> notifications = [
    'Nova mensagem recebida',
    'Atualização disponível',
    'Lembrete: fim da meta amanhã',
    'Você tem novas notificações',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notificações'),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(notifications[index]),
            trailing: const Icon(Icons.notifications),
            onTap: () {
              _navigateToNotificationDetails(context, notifications[index]);
            },
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildBottomIconButton(Icons.home, Colors.black45, context),
            buildBottomIconButton(Icons.search, Colors.black45, context),
            buildBottomIconButton(Icons.notifications, Colors.blue, context),
            buildBottomIconButton(Icons.message, Colors.black45, context),
          ],
        ),
      ),
    );
  }

  IconButton buildBottomIconButton(IconData icon, Color color, BuildContext context) {
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

  void _navigateToNotificationDetails(BuildContext context, String notification) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NotificationDetailsScreen(notification: notification),
      ),
    );
  }
}

class NotificationDetailsScreen extends StatelessWidget {
  final String notification;

  const NotificationDetailsScreen({Key? key, required this.notification}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes da Notificação'),
      ),
      body: Center(
        child: Text(notification),
      ),
    );
  }
}
