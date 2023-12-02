import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';

class GoalScreen extends StatefulWidget {
  const GoalScreen({Key? key}) : super(key: key);

  @override
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
      'your channel id',
      'your channel name',
      'your channel description',
      importance: Importance.max,
      priority: Priority.high,
      playSound: true,
      sound: RawResourceAndroidNotificationSound('notification_sound'),
      largeIcon: DrawableResourceAndroidBitmap('@mipmap/ic_launcher'),
      icon: '@mipmap/ic_launcher',
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
                  'Data Limite: ${DateFormat('dd/MM/yyyy').format(_goals[index].deadline)}'),
            ),
          );
        },
      ),
    );
  }

  void _showAddGoalDialog(BuildContext context) {
    DateTime selectedDate = DateTime.now();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Adicionar Meta'),
          content: Column(
            children: <Widget>[
              const TextField(
                decoration: InputDecoration(labelText: 'Descrição'),
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
                        });
                      }
                    },
                    child: const Text('Escolher Data'),
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
                // Adicionar lógica para criar a meta aqui
                // Criar uma instância de Goal com os dados informados
                Goal newGoal = Goal(
                  description: 'Descrição da Meta', // Substituir pela descrição do TextField
                  deadline: selectedDate, // Utilizar a data escolhida
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

  Goal({required this.description, required this.deadline});
}
