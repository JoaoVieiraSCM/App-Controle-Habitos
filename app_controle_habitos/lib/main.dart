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
    Habit(
      name: "Beber água",
      description: "O objetivo é beber pelo menos 8 copos de água ao longo do dia, distribuindo a ingestão entre Manhã, Tarde e Noite para garantir o bom funcionamento do corpo.",
      icon: Icons.water_drop,
    ),
    Habit(
      name: "Ler",
      description: "Reserve um tempo para o seu desenvolvimento pessoal e relaxamento. Leia por pelo menos 30 minutos diariamente, seja um livro, artigo ou revista de sua preferência.",
      icon: Icons.book,
    ),
    Habit(
      name: "Caminhar",
      description: "Cuide da sua saúde física e mental caminhando por 30 minutos todos os dias. Caminhadas ao ar livre ajudam a aliviar o estresse e melhoram a disposição.",
      icon: Icons.directions_walk,
    ),
    Habit(
      name: "Estudar",
      description: "Dedique pelo menos uma hora do seu dia aos estudos. Pode ser para aprender algo novo, revisar conteúdos ou aprimorar habilidades profissionais e pessoais.",
      icon: Icons.school,
    ),
    Habit(
      name: "Meditar",
      description: "Encontre um momento de paz e autoconhecimento. Medite por 10 minutos diariamente para reduzir a ansiedade, melhorar o foco e promover o bem-estar.",
      icon: Icons.self_improvement,
    ),
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