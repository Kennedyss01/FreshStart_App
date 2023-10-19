import 'package:flutter/material.dart';

import 'register_screen1.dart';
import 'register_screen3.dart';

class Register2 extends StatefulWidget {
  const Register2({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _Register2State createState() => _Register2State();
}

class _Register2State extends State<Register2> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController repeatEmailController = TextEditingController();
  String emailError = '';
  String repeatEmailError = '';

  void validateEmailFields() {
    final email = emailController.text;
    final repeatEmail = repeatEmailController.text;

    if (email.isEmpty || !email.contains('@') || !email.contains('.')) {
      emailError = 'Email inválido';
    } else {
      emailError = '';
    }

    if (email != repeatEmail) {
      repeatEmailError = 'Os emails não coincidem';
    } else {
      repeatEmailError = '';
    }

    if (emailError.isEmpty && repeatEmailError.isEmpty) {
      // Navegue para a próxima tela se tudo estiver correto.
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Register3()),
      );
    } else {
      // Atualize o estado para mostrar mensagens de erro.
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
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Register1()),
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
              const SizedBox(height: 50),
              const Text(
                'Email',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: "Digite seu email",
                  border: const OutlineInputBorder(),
                  errorText: emailError.isNotEmpty ? emailError : null,
                ),
              ),
              const SizedBox(height: 30.0),
              const Text(
                'Repita o Email',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                controller: repeatEmailController,
                decoration: InputDecoration(
                  hintText: "Digite seu email",
                  border: const OutlineInputBorder(),
                  errorText: repeatEmailError.isNotEmpty ? repeatEmailError : null,
                ),
              ),
              const SizedBox(height: 195.0),
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
                ],
              ),
              const SizedBox(height: 20.0),
              Align(
                alignment: Alignment.center,
                child: FractionallySizedBox(
                  widthFactor: 0.8,
                  child: ElevatedButton(
                    onPressed: validateEmailFields, // Chame a função de validação ao pressionar o botão.
                    style: ElevatedButton.styleFrom(
                      textStyle: buttonTextStyle,
                      minimumSize: const Size(double.infinity, 50.0),
                    ),
                    child: const Text("continuar"),
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