import 'package:flutter/material.dart';
import 'package:freshstart/screens/register_sucess.dart';
import 'register_screen2.dart';

class Register3 extends StatefulWidget {
  const Register3({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _Register3State createState() => _Register3State();
}

class _Register3State extends State<Register3> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController repeatPasswordController = TextEditingController();
  String passwordError = '';
  String repeatPasswordError = '';

  void validatePasswordFields() {
    final password = passwordController.text;
    final repeatPassword = repeatPasswordController.text;

    final hasUppercase = password.contains(RegExp(r'[A-Z]'));
    final hasLowercase = password.contains(RegExp(r'[a-z]'));
    final hasDigit = password.contains(RegExp(r'[0-9]'));
    final hasSpecialChar = password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));

    if (password.length < 8 ||
        !hasUppercase ||
        !hasLowercase ||
        !hasDigit ||
        !hasSpecialChar) {
      passwordError =
          'A senha deve ter pelo menos 8 caracteres, uma maiúscula, uma minúscula, um número e um caractere especial.';
    } else {
      passwordError = '';
    }

    if (password != repeatPassword) {
      repeatPasswordError = 'As senhas não coincidem';
    } else {
      repeatPasswordError = '';
    }

    if (passwordError.isEmpty && repeatPasswordError.isEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const RegisterSuccess()),
      );
    } else {
      setState(() {});
    }
  }

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
          child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
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
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Register2()),
                  );
                },
                child: const Text(
                  '<- Voltar',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              const Text(
                'Senha',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  hintText: "Digite sua senha",
                  border: const OutlineInputBorder(),
                  errorText: passwordError.isNotEmpty ? passwordError : null,
                  errorMaxLines: 3,
                ),
              ),
              const SizedBox(height: 27.0),
              const Text(
                'Repita a Senha',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                controller: repeatPasswordController,
                decoration: InputDecoration(
                  hintText: "Digite sua senha",
                  border: const OutlineInputBorder(),
                  errorText: repeatPasswordError.isNotEmpty ? repeatPasswordError : null,
                ),
              ),
              const SizedBox(height: 200.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
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
                  const SizedBox(width: 17.0),
                  Container(
                    width: 15.0,
                    height: 15.0,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF1673FA),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18.0),
              Align(
                alignment: Alignment.center,
                child: FractionallySizedBox(
                  widthFactor: 0.8,
                  child: ElevatedButton(
                    onPressed: validatePasswordFields,
                    style: ElevatedButton.styleFrom(
                      textStyle: buttonTextStyle,
                      minimumSize: const Size(double.infinity, 40.0),
                    ),
                    child: const Text("continuar"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      ),
    );
  }
}