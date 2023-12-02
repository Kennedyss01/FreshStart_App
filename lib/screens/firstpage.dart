import 'package:flutter/material.dart';
import 'package:freshstart/screens/login_screen.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<FirstPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _hasNavigated = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);

    _controller.forward().whenComplete(() {
      // Set the flag when the animation completes
      setState(() {
        _hasNavigated = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_hasNavigated) {
      // Navigate to login screen when the flag is false
      Navigator.of(context).pushReplacementNamed('/loginscreen');
    }

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            color: const Color(0xFF1673FA),
            child: Center(
              child: FadeTransition(
                opacity: _animation,
                child: Image.asset(
                  'assets/logo.png', // Assuming the image is in the assets folder
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ),
      routes: {
        '/loginscreen': (context) => const LoginScreen(),
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
