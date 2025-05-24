import 'package:flutter/material.dart';
import 'habit.dart';
import 'habit_detail.dart';

/*
  Grupo: Adriano Ribeiro Fraga, João Victor Alves da Silva, João Vitor Vieira Souto Camelo Monteiro
  Disciplina: Desenvolvimento para Dispositivos Móveis 1
  Professor: Davi Reis
  Data: 20/05/2025
*/

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
      appBar: AppBar(title: const Center(child: Text('Controle de Hábitos'),),),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Membros do grupo:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const Text("Adriano Ribeiro Fraga", style: TextStyle(fontSize: 16)),
            const Text("João Victor Alves da Silva", style: TextStyle(fontSize: 16)),
            const Text("João Vitor Vieira Souto Camelo Monteiro", style: TextStyle(fontSize: 16)),
            const SizedBox(height: 20),
            const Text("Hábitos do dia:", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            SizedBox(
              height: 220,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: habits.length,
                itemBuilder: (context, index) {
                  final habit = habits[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: SizedBox(
                      width: 250,
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(habit.icon, size: 40),
                              const SizedBox(height: 10),
                              Text(
                                habit.name,
                                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                              Checkbox(
                                value: habit.completedToday,
                                onChanged: (value) {
                                  setState(() {
                                    habit.completedToday = value ?? false;
                                  });
                                },
                              ),
                              const SizedBox(height: 16),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => HabitDetailScreen(habit: habit),
                                    ),
                                  );
                                },
                                child: const Text("Detalhes"),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}