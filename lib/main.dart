import 'package:flutter/material.dart';
import 'package:freshstart/screens/login_screen.dart';


void main() {
  runApp(const FreshStart());
}

class FreshStart extends StatelessWidget {
  const FreshStart({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      initialRoute: '/loginscreen',
      routes: {
        '/loginscreen': (context) => const LoginScreen(),
      },
    );
  }
}
