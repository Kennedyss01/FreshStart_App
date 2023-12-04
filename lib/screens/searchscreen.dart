import 'package:flutter/material.dart';
import 'homescreen.dart';
import 'messagelobbyscreen.dart';
import 'notificationsscreen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<String> searchData = [
    'Community 1',
    'Community 2',
    'Community 3',
    'Perfil 1',
    'Perfil 2',
    'Perfil3',
  ];

  List<String> searchResults = [];

  void search(String query) {
    setState(() {
      searchResults = searchData
          .where((data) => data.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Screen'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: (query) {
                search(query);
              },
              decoration: const InputDecoration(
                hintText: 'Search...',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: searchResults.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(searchResults[index]),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildBottomIconButton(Icons.home, Colors.black45),
            buildBottomIconButton(Icons.search, Colors.blue),
            buildBottomIconButton(Icons.notifications, Colors.black45),
            buildBottomIconButton(Icons.message, Colors.black45),
          ],
        ),
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
