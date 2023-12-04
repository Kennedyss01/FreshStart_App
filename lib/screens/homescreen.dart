import 'package:flutter/material.dart';
import 'package:freshstart/screens/profile_screen.dart';
import 'package:freshstart/screens/searchscreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'freshStart',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
        leading: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProfileScreen()),
            );
          },
          child: Container(
            margin: const EdgeInsets.all(10.0),
            child: const CircleAvatar(
              backgroundImage: AssetImage('/user.png'),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildBottomIconButton(Icons.home, Colors.blue),
            buildBottomIconButton(Icons.search, Colors.black45),
            buildBottomIconButton(Icons.notifications, Colors.black45),
            buildBottomIconButton(Icons.message, Colors.black45),
          ],
        ),
      ),
    ) ;
  }

  Widget buildBottomIconButton(IconData icon, Color color) {
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