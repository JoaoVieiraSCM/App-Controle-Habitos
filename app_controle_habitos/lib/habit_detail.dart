import 'package:flutter/material.dart';
import 'habit.dart';

class HabitDetailScreen extends StatefulWidget {
  final Habit habit;

  const HabitDetailScreen({Key? key, required this.habit}) : super(key: key);

  @override
  _HabitDetailScreenState createState() => _HabitDetailScreenState();
}

class _HabitDetailScreenState extends State<HabitDetailScreen> {
  double frequency = 3;
  bool remindersOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.habit.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.habit.description, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 20),
            const Text("Frequência semanal desejada:", style: TextStyle(fontWeight: FontWeight.bold)),
            Slider(
              value: frequency,
              min: 1,
              max: 7,
              divisions: 6,
              label: "${frequency.toInt()}x por semana",
              onChanged: (value) {
                setState(() {
                  frequency = value;
                });
              },
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Text("Lembretes diários:"),
                Switch(
                  value: remindersOn,
                  onChanged: (value) {
                    setState(() {
                      remindersOn = value;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Configurações salvas!")),
                  );
                },
                child: const Text("Salvar Configurações"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
