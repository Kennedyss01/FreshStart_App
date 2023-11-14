import 'package:flutter/material.dart';
import 'package:freshstart/screens/homescreen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'FreshStart',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
            PopupMenuButton<String>(
              icon: const Icon (
                Icons.more_horiz,
                color: Colors.black45,
                size: 30,
              ),
              itemBuilder: (BuildContext context) {
                return <PopupMenuEntry<String>>[
                  const PopupMenuItem<String>(
                    value: 'settings',
                    child: Text('Settings'),
                  ),
                  const PopupMenuItem<String>(
                    value: 'help',
                    child: Text('Help'),
                  ),
                ];
              },
              onSelected: (String value) {
                if (value == 'settings') {
                  // Handle settings action
                } else if (value == 'help') {
                  // Handle help action
                }
              },
            ),
          ],
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.blue,
          ),
        ),
      ),

      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white,
                  Colors.white38
                ],
              ),
            ),
          ),
          const ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage('/user.png'),
            ),
            title: Text(
                "Nome de Usuário"
            ),
            subtitle: Text(
                "Descrição do Usuário"
            ),
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Conteúdo do perfil",
              style: TextStyle(
                fontSize: 20
              ),
            ),/
          ),
        ],
      ),

      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildBottomIconButton(Icons.home, Colors.black45),
            buildBottomIconButton(Icons.search, Colors.black45),
            buildBottomIconButton(Icons.notifications, Colors.black45),
            buildBottomIconButton(Icons.message, Colors.black45),
          ],
        ),
      ),
    );
  }

  Widget buildBottomIconButton(IconData icon, Color color) {
    return IconButton(
      icon: Icon(
        icon,
        color: color,
      ),
      onPressed: () {
        if (icon == Icons.home) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        } else if (icon == Icons.search) {
          // Navigate to the search page. Replace with your logic.
        } else if (icon == Icons.notifications) {
          // Navigate to the notifications page. Replace with your logic.
        } else {
          // Navigate to messages. Replace with your logic.
        }
      },
    );
  }
}