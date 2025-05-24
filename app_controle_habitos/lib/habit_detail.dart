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

  Color getSliderColor() {
    switch (widget.habit.name.toLowerCase()) {
      case 'beber água':
        return Colors.blueAccent;
      case 'estudar':
        return Colors.amber;
      case 'caminhar':
        return Colors.green;
      case 'ler':
        return Colors.deepPurple;
      case 'meditar':
        return const Color.fromARGB(255, 92, 255, 239);
      default:
        return const Color.fromARGB(255, 68, 255, 58);
    }
  }

  @override
  Widget build(BuildContext context) {
    final sliderColor = getSliderColor();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.habit.name,
          style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
        backgroundColor: sliderColor,
        elevation: 2,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 28.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Lembretes diários no topo, alinhado à esquerda
              Row(
                children: [
                  const Text(
                    "Lembrete diário:",
                    style: TextStyle(fontSize: 20),
                  ),
                  Switch(
                    value: remindersOn,
                    activeColor: sliderColor,
                    onChanged: (value) {
                      setState(() {
                        remindersOn = value;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Text(
                widget.habit.description,
                style: const TextStyle(fontSize: 20, color: Colors.black87),
              ),
              const SizedBox(height: 36),
              const Text(
                "Frequência semanal desejada:",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(height: 30),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTrackColor: sliderColor,
                  inactiveTrackColor: sliderColor.withOpacity(0.3),
                  thumbColor: sliderColor,
                  overlayColor: sliderColor.withOpacity(0.2),
                  valueIndicatorColor: sliderColor,
                  trackHeight: 6,
                ),
                child: Slider(
                  value: frequency,
                  min: 1,
                  max: 7,
                  divisions: 6,
                  label: "${frequency.toInt()}x",
                  onChanged: (value) {
                    setState(() {
                      frequency = value;
                    });
                  },
                ),
              ),
              Center(
                child: Text(
                  "${frequency.toInt()}x por semana",
                  style: TextStyle(
                    fontSize: 22,
                    color: sliderColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 36),
              Center(
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: sliderColor,
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Configurações salvas!")),
                      );
                    },
                    child: const Text(
                      "Salvar Configurações",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
