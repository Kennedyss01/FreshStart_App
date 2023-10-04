import 'package:flutter/material.dart';
import 'package:freshstart/homescreen.dart';

void main() {
  runApp(const LoginScreen());
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: LoginForm(),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool manterConectado = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 60.0), // Espaço entre o início da tela e o texto "FreshStart"
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'FreshStart',
                  style: TextStyle(
                    fontSize: 48.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1673FA), // Cor "#1673FA"
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Seja Bem Vindo!',
                  style: TextStyle(
                    fontSize: 32.0,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24.0), // Espaço entre os títulos e os campos
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Login:',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Senha:',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 0.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: manterConectado,
                      onChanged: (bool? value) {
                        setState(() {
                          manterConectado = value ?? false;
                        });
                      },
                    ),
                    const Text('Manter Conectado'),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    // Implementar a lógica para o botão "Esqueceu a Senha" aqui.
                  },
                  child: RichText(
                    text: const TextSpan(
                      text: 'Esqueceu a Senha',
                      style: TextStyle(
                        color: Colors.black,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            // Botão "Entrar" com a cor #1673FA e centralizado
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Implementar a lógica para o botão "Entrar" aqui.
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1673FA), // Cor "#1673FA"
                  minimumSize: const Size(200.0, 50.0), // Altura e largura do botão
                ),
                child: const Text(
                  'Entrar',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Center(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Não tem uma conta? ',
                        style: TextStyle(
                          color: Colors.black87,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          // Implemente a lógica para o link "Registre-se agora" aqui.
                        },
                        child: const Text(
                          'Registre-se agora',
                          style: TextStyle(
                            
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 140.0, // A largura da linha
                    height: 1.0,   // A altura da linha (pode ser ajustada conforme necessário)
                    color: Colors.black, // Cor da linha
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'ou',
                      style: TextStyle(
                        color: Colors.black,
                        backgroundColor: Colors.white, // Cor do fundo do texto
                      ),
                    ),
                  ),
                  Container(
                    width: 140.0, // A largura da linha
                    height: 1.0,   // A altura da linha (pode ser ajustada conforme necessário)
                    color: Colors.black, // Cor da linha
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            Center(
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Implementar a lógica para login com Facebook aqui.
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0084F9), // Cor "#0084F9"
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      minimumSize: Size(
                        MediaQuery.of(context).size.width, // Largura igual à tela
                        60.0, // Altura desejada para o botão
                      ),
                    ),
                    child: const Text('Login com Facebook'),
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      // Implementar a lógica para login com Google aqui.
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF132F79), // Cor "#132F79"
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      minimumSize: Size(
                        MediaQuery.of(context).size.width, // Largura igual à tela
                        60.0, // Altura desejada para o botão
                      ),
                    ),
                    child: const Text('Login com Google'),
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      // Implementar a lógica para login com Twitter aqui.
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF3AA0D0), // Cor "#3AA0D0"
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      minimumSize: Size(
                        MediaQuery.of(context).size.width, // Largura igual à tela
                        60.0, // Altura desejada para o botão
                      ),
                    ),
                    child: const Text('Login com Twitter'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}