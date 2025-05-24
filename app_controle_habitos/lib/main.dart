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
      appBar: AppBar(title: const Center(child: Text('Controle de Hábitos'),),),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
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
      ),
    );
  }
}