import 'package:flutter/material.dart';
import 'firstpage.dart';


void main() {
  runApp(const FreshStart());
}

class FreshStart extends StatelessWidget {
  const FreshStart({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/firstpage',
      routes: {
        '/firstpage': (context) => const FirstPage(),
      },

      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
