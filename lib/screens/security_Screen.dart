// ignore_for_file: library_private_types_in_public_api, file_names

import 'package:flutter/material.dart';

class SecurityScreen extends StatefulWidget {
  const SecurityScreen({Key? key}) : super(key: key);

  @override
  _SecurityScreenState createState() => _SecurityScreenState();
}

class _SecurityScreenState extends State<SecurityScreen> {
  bool _backupEnabled = true;
  bool _shareData = false;
  bool _showAge = false;
  bool _showName = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações de Segurança'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: const Text('Trocar Senha'),
              onTap: () {
                _showChangePasswordDialog(context);
              },
            ),
            SwitchListTile(
              title: const Text('Compartilhar Dados'),
              value: _shareData,
              onChanged: (value) {
                setState(() {
                  _shareData = value;
                });
                // Implementar lógica para compartilhar dados
              },
              activeColor: Colors.blue,
            ),
            SwitchListTile(
              title: const Text('Mostrar Idade'),
              value: _showAge,
              onChanged: (value) {
                setState(() {
                  _showAge = value;
                });
                // Implementar lógica para mostrar a idade
              },activeColor: Colors.blue,
            ),
            SwitchListTile(
              title: const Text('Mostrar Nome'),
              value: _showName,
              onChanged: (value) {
                setState(() {
                  _showName = value;
                });
                // Implementar lógica para mostrar o nome
              },activeColor: Colors.blue,
            ),
            ListTile(
              title: const Text('Definir Email de Recuperação'),
              onTap: () {
               _showDefineRecoveryEmailDialog(context);
              },
            ),
            ListTile(
              title: const Text('Fazer Backup'),
              subtitle: Text('Backup ${_backupEnabled ? 'ativado' : 'desativado'}'),
              onTap: () {
                // Implementar lógica para ativar/desativar o backup
                setState(() {
                  _backupEnabled = !_backupEnabled;
                });
              },
            ),
            ListTile(
              title: const Text('Libertar o terrível Gesonel, o Pato'),
              onTap: () {
                _showReleaseGesonelDialog(context);
              },
            ), const SizedBox(height: 220.0),
             Container(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  // Adicione aqui a lógica para salvar as configurações.
                  // Pode ser útil usar um serviço de gerenciamento de configurações.
                  // Por exemplo: saveSettings(_notificationsEnabled, _volumeLevel);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Configurações salvas!')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: const Text(
                  'Salvar Configurações',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


void _showReleaseGesonelDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Gesonel Está Livre!'),
        content: SizedBox(
          height: 200, // ajuste conforme necessário
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/gesonel.png',
                height: 150, // ajuste conforme necessário
                width: 150, // ajuste conforme necessário
              ),
              const Text('Gesonel está livre, não existe mais lugar seguro'),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}



 void _showChangePasswordDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // ignore: prefer_typing_uninitialized_variables
        var newPasswordController;
        return AlertDialog(
          title: const Text('Trocar Senha'),
          content: TextField(
            controller: newPasswordController,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'Nova Senha',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                // Implementar lógica para trocar a senha com _newPasswordController.text
                // Pode validar a nova senha e realizar a troca
                Navigator.of(context).pop();
              },
              child: const Text('Trocar'),
            ),
          ],
        );
      },
    );
  }

void _showDefineRecoveryEmailDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // ignore: prefer_typing_uninitialized_variables
      var newEmailController;
      return AlertDialog(
        title: const Text('Definir Email de Recuperação'),
        content: TextField(
          controller: newEmailController,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            labelText: 'Novo Email de Recuperação',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              // Implementar lógica para definir o email de recuperação com _newEmailController.text
              // Pode validar o novo email e salvar
              Navigator.of(context).pop();
            },
            child: const Text('Definir'),
          ),
        ],
      );
    },
  );
}