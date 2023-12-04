import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';

class GoalScreen extends StatefulWidget {
  const GoalScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _GoalScreenState createState() => _GoalScreenState();
}

class _GoalScreenState extends State<GoalScreen> {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  // Lista de metas
  final List<Goal> _goals = [];

  @override
  void initState() {
    super.initState();
    initializeNotifications();
  }

  void initializeNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('logo.png');
    const InitializationSettings initializationSettings =
    InitializationSettings(android: initializationSettingsAndroid);

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );
  }

  void showNotification(String title, String body) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
      'your channel name',
      'your channel description',
      importance: Importance.max,
      priority: Priority.high,
      playSound: true,
      sound: RawResourceAndroidNotificationSound('notification_sound'),
      largeIcon: DrawableResourceAndroidBitmap('logo.png'),
      icon: 'logo.png',
    );
    const NotificationDetails platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      platformChannelSpecifics,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Metas'),
      ),
      body: Column(
        children: [
          buildGoalList(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddGoalDialog(context);
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget buildGoalList() {
    return Expanded(
      child: ListView.builder(
        itemCount: _goals.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(_goals[index].description),
              subtitle: Text(
                'Data Limite: ${DateFormat('dd/MM/yyyy').format(_goals[index].deadline)}',
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: _goals[index].completed
                        ? const Icon(Icons.check, color: Colors.green)
                        : const Icon(Icons.check, color: Colors.grey),
                    onPressed: () {
                      // Handle goal completion
                      setState(() {
                        _goals[index].completed = !_goals[index].completed;
                      });
                      if (_goals[index].completed) {
                        showNotification(
                          'Meta Concluída',
                          'Parabéns! Você concluiu uma meta!',
                        );
                      }
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      // Handle goal deletion
                      setState(() {
                        _goals.removeAt(index);
                      });
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _showAddGoalDialog(BuildContext context) {
    DateTime selectedDate = DateTime.now();
    String description = '';
    bool dateSelected = false;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Adicionar Meta'),
          content: Column(
            children: <Widget>[
              TextField(
                decoration: const InputDecoration(labelText: 'Descrição'),
                onChanged: (value) {
                  description = value;
                },
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Text('Data Limite:'),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: selectedDate,
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2030),
                      );

                      if (pickedDate != null && pickedDate != selectedDate) {
                        setState(() {
                          selectedDate = pickedDate;
                          dateSelected = true;
                        });
                      }
                    },
                    child: const Text('Escolher Data'),
                  ),
                  const SizedBox(width: 8),
                  // Display the selected date conditionally
                  if (dateSelected)
                    Text(
                      'Selecionado: ${DateFormat('dd/MM/yyyy').format(selectedDate)}',
                      style: const TextStyle(fontSize: 14),
                    ),
                ],
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                if (!dateSelected) {
                  // Handle case where the user hasn't selected a date
                  return;
                }

                // Adicionar lógica para criar a meta aqui
                // Criar uma instância de Goal com os dados informados
                Goal newGoal = Goal(
                  description: description,
                  deadline: selectedDate,
                );

                // Adicionar a nova meta à lista de metas
                setState(() {
                  _goals.add(newGoal);
                });

                // Mostrar notificação ao criar a meta
                showNotification('Meta Criada', 'Sua nova meta foi criada!');

                Navigator.of(context).pop();
              },
              child: const Text('Adicionar'),
            ),
          ],
        );
      },
    );
  }
}

class Goal {
  final String description;
  final DateTime deadline;
  bool completed;

  Goal({
    required this.description,
    required this.deadline,
    this.completed = false,
  });
}
