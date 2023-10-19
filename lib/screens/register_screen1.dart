import 'package:flutter/material.dart';
import 'package:freshstart/screens/register_screen2.dart';

class Register1 extends StatefulWidget {
  const Register1({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Register1State createState() => _Register1State();
}

class _Register1State extends State<Register1> {
  final nameController = TextEditingController();
  bool showError = false;

  @override
  Widget build(BuildContext context) {
    const TextStyle buttonTextStyle = TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    );

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50.0),
              const Align(
                alignment: Alignment.topRight,
                child: Text(
                  'FreshStart',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1673FA),
                  ),
                ),
              ),
              const SizedBox(height: 100),
              Text(
                'Crie sua conta',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.withOpacity(0.8),
                ),
              ),
              const SizedBox(height: 125),
              const Text(
                'Nome',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  hintText: "Seu nome",
                  border: OutlineInputBorder(),
                ),
              ),
              if (showError)
                const Text(
                  'O nome deve ter pelo menos 4 caracteres',
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              const SizedBox(height: 250.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 15.0,
                    height: 15.0,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF1673FA),
                    ),
                  ),
                  const SizedBox(width: 17.0),
                  Container(
                    width: 15.0,
                    height: 15.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.withOpacity(0.5),
                    ),
                  ),
                  const SizedBox(width: 17.0),
                  Container(
                    width: 15.0,
                    height: 15.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Align(
                alignment: Alignment.center,
                child: FractionallySizedBox(
                  widthFactor: 0.8,
                  child: ElevatedButton(
                    onPressed: () {
                      if (nameController.text.length < 4) {
                        setState(() {
                          showError = true;
                        });
                      } else {
                        setState(() {
                          showError = false;
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Register2()),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      textStyle: buttonTextStyle,
                      minimumSize: const Size(double.infinity, 50.0),
                    ),
                    child: const Text("Continuar"),
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