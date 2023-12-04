import 'package:flutter/material.dart';
import 'package:freshstart/screens/Security_Screen.dart';
import 'package:freshstart/screens/about_screen.dart';
import 'package:freshstart/screens/editProfile_screen.dart';
import 'package:freshstart/screens/homescreen.dart';
import 'package:freshstart/screens/goalscreen.dart';
import 'package:freshstart/screens/settings_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(),
      bottomNavigationBar: buildBottomAppBar(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 1,
      backgroundColor: Colors.white,
      title: buildAppBarTitle(),
      leading: buildAppBarLeading(),
    );
  }

  Row buildAppBarTitle() {
    return Row(
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
          icon: const Icon(
            Icons.more_horiz,
            color: Colors.black45,
            size: 30,
          ),
          itemBuilder: (BuildContext context) {
            return <PopupMenuEntry<String>>[
              buildPopupMenuItem('goal', Icons.calendar_month_rounded, 'Goal'),
              buildPopupMenuItem('settings', Icons.settings, 'Settings'),
              buildPopupMenuItem('security', Icons.security, 'Security'),
              buildPopupMenuItem('edit profile', Icons.edit, 'Edit profile'),
              buildPopupMenuItem('about', Icons.help, 'about'),
            ];
          },
          onSelected: (String value) {
            handlePopupMenuSelection(value);
          },
        ),
      ],
    );
  }

  IconButton buildAppBarLeading() {
    return IconButton(
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
    );
  }

  Widget buildBody() {
    return Column(
      children: [
        buildProfileHeader(),
        const ListTile(
          title: Text("Nome de Usuário"),
          subtitle: Text("Descrição do Usuário"),
        ),
        const Divider(),
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            "Conteúdo do perfil",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ],
    );
  }

  Container buildProfileHeader() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.white,
            Colors.black54,
          ],
        ),
      ),
      height: 200, // Ajuste a altura conforme necessário
      child: const Stack(
        children: [
          Positioned(
            bottom: 16,
            right: 16,
            child: CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/user.png'), // Substitua pelo caminho da sua imagem de perfil
            ),
          ),
        ],
      ),
    );
  }

  BottomAppBar buildBottomAppBar() {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildBottomIconButton(Icons.home, Colors.black45),
          buildBottomIconButton(Icons.search, Colors.black45),
          buildBottomIconButton(Icons.notifications, Colors.black45),
          buildBottomIconButton(Icons.message, Colors.black45),
        ],
      ),
    );
  }

  IconButton buildBottomIconButton(IconData icon, Color color) {
    return IconButton(
      icon: Icon(
        icon,
        color: color,
      ),
      onPressed: () {
        handleBottomIconButtonPress(icon);
      },
    );
  }

  PopupMenuItem<String> buildPopupMenuItem(String value, IconData icon, String text) {
    return PopupMenuItem<String>(
      value: value,
      child: ListTile(
        leading: Icon(icon),
        title: Text(text),
      ),
    );
  }

  void handlePopupMenuSelection(String value) {
    switch (value) {
      case 'goal':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const GoalScreen()),
        );
      // Navigate to the goal screen. Replace with your logic.
        break;
      case 'settings':
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SettingsScreen()),
          );
      // Navigate to the settings screen. Replace with your logic.
        break;
      case 'security':
      Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SecurityScreen()),
          );
      // Navigate to the security screen. Replace with your logic.
        break;
      case 'edit profile':
      Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EditProfileScreen()),
          );
        break;
      case 'about':
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AboutScreen()),
          );
        break;
      default:
        break;
    }
  }

  void handleBottomIconButtonPress(IconData icon) {
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
      // Navigate to the notifications page. Replace with your logic.
        break;
      case Icons.message:
      // Navigate to the messages page. Replace with your logic.
        break;
      default:
        break;
    }
  }
}
