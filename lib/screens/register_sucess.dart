import 'package:flutter/material.dart';
import 'package:freshstart/screens/homescreen.dart';

class RegisterSuccess extends StatelessWidget {
  const RegisterSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40.0),
              const Align(
                alignment: Alignment.topRight,
                child: Text(
                  'freshStart',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1673FA),
                  ),
                ),
              ),
              Image.asset(
                'imagens/Successful_purchase.png',
                width: 300,
                height: 400,
              ),
              const Center(
                child: Text(
                  'Parabéns',
                  style: TextStyle(
                    fontSize: 38.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              Center(
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 250,
                    height: 2,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              const Center(
                child: Text(
                  'Você criou sua conta',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
              const SizedBox(height: 120.0),
              Center(
                child: SizedBox(
                  width: 250, 
                  height: 45.0, 
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(const Color(0xFF1673FA)),
                    ),
                    onPressed: () {
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                    },
                    child: const Text('Finalizar'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}