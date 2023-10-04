import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
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
    _controller.forward();
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
                  'assets/images/logo.png', // Substitua pelo caminho da sua imagem
                  width: 200, // Largura da imagem
                  height: 200, // Altura da imagem
                  fit: BoxFit.cover, // Modo de ajuste da imagem
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose the controller when the widget is removed from the tree
    super.dispose();
  }
}
