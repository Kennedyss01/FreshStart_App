import 'package:flutter/material.dart';
import 'package:fresh_start/homescreen.dart';

void main() {
  runApp(const FreshStart());
}

class FreshStart extends StatelessWidget {
  const FreshStart({Key? key}) : super(key: key); // Corrigido super(key) para Key? key

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FreshStart',
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}