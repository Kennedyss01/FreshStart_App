// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = true;
  bool _updatesEnabled = true;
  bool _contentEnabled = false;
  double _volumeLevel = 0.5;
  // ignore: prefer_final_fields
  TextEditingController _feedbackController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 16.0),
            SwitchListTile(
              title: const Text('Notificações'),
              value: _notificationsEnabled,
              onChanged: (value) {
                setState(() {
                  _notificationsEnabled = value;
                });
              },
              activeColor: Colors.blue,
            ),
            const SizedBox(height: 16.0),
            SwitchListTile(
              title: const Text('Atualizações automáticas'),
              value: _updatesEnabled,
              onChanged: (value) {
                setState(() {
                  _updatesEnabled = value;
                });
              },
              activeColor: Colors.blue,
            ),
            const SizedBox(height: 16.0),
            SwitchListTile(
              title: const Text('Conteúdo Sensível'),
              value: _contentEnabled,
              onChanged: (value) {
                setState(() {
                  _contentEnabled = value;
                });
              },
              activeColor: Colors.blue,
            ),
            const SizedBox(height: 16.0),
            const Text('Nível de Volume', style: TextStyle(color: Colors.blue)),
            Slider(
              value: _volumeLevel,
              onChanged: (value) {
                setState(() {
                  _volumeLevel = value;
                });
              },
              activeColor: Colors.blue,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                _showFeedbackDialog(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              child: const Text(
                'Enviar Feedback',
                style: TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(height: 280.0),
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
      ),
    );
  }

void _showFeedbackDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Enviar Feedback'),
        content: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: _feedbackController,
                maxLength: 500,
                maxLines: 5,
                decoration: const InputDecoration(
                  hintText: 'Digite seu feedback (máx. 500 caracteres)',
                ),
              ),
              const SizedBox(height: 16.0),
            ],
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
              // Adicione aqui a lógica para enviar o feedback.
              // Você pode acessar o feedback usando _feedbackController.text.
              // Limpar o texto após enviar
              _feedbackController.clear();
              Navigator.of(context).pop();

              // Mostrar o pop-up de confirmação
              _showConfirmationDialog(context);
            },
            child: const Text('Enviar'),
          ),
        ],
      );
    },
  );
}

void _showConfirmationDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Popup Enviado'),
        content: const Text(
          'Obrigado por nos enviar sua opinião',
          style: TextStyle(color: Colors.green, fontSize: 20),
          
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
}