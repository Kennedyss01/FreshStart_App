import 'package:flutter/material.dart';
import 'package:freshstart/screens/login_screen.dart';

// void main() => runApp(const MyApp());

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<FirstPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2), // Duration of the fade animation
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);

    // Start the animation
    _controller.forward().whenComplete(() {
      Navigator.of(context).pushReplacementNamed('/loginscreen');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            color: const Color(0xFF1673FA), // Cor de fundo
            child: Center(
              child: FadeTransition(
                opacity: _animation, // Use the animation value for opacity
                child: Image.asset(
                  '/logo.png', // Substitua pelo caminho da sua imagem
                  width: 200, // Largura da imagem
                  height: 200, // Altura da imagem
                  fit: BoxFit.cover, // Modo de ajuste da imagem
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
    _controller.dispose(); // Dispose the controller when the widget is removed from the tree
    super.dispose();
  }
}
