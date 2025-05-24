import 'package:flutter/material.dart';
import 'habit.dart';
import 'habit_detail.dart';

void main() {
  runApp(HabitApp());
}

class HabitApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Controle de Hábitos',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: HabitListScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HabitListScreen extends StatefulWidget {
  @override
  _HabitListScreenState createState() => _HabitListScreenState();
}

class _HabitListScreenState extends State<HabitListScreen> {
  List<Habit> habits = [
    Habit(name: "Beber água", description: "Beber 8 copos de água por dia.", icon: Icons.water_drop),
    Habit(name: "Ler", description: "Ler por pelo menos 30 minutos.", icon: Icons.book),
    Habit(name: "Caminhar", description: "Caminhar 30 minutos por dia.", icon: Icons.directions_walk),
    Habit(name: "Estudar", description: "Estudar uma hora por dia.", icon: Icons.school),
    Habit(name: "Meditar", description: "Meditar por 10 minutos diariamente.", icon: Icons.self_improvement),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Controle de Hábitos')),
      body: ListView.builder(
        itemCount: habits.length,
        itemBuilder: (context, index) {
          final habit = habits[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: ListTile(
              leading: Icon(habit.icon, size: 30),
              title: Text(habit.name),
              trailing: Checkbox(
                value: habit.completedToday,
                onChanged: (value) {
                  setState(() {
                    habit.completedToday = value ?? false;
                  });
                },
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => HabitDetailScreen(habit: habit),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}