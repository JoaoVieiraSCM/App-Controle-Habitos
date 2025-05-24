import 'package:flutter/material.dart';

class Habit {
  final String name;
  final String description;
  final IconData icon;
  bool completedToday;
  double frequencyPerWeek;
  bool remindersOn;

  Habit({
    required this.name,
    required this.description,
    required this.icon,
    this.completedToday = false,
    this.frequencyPerWeek = 3,
    this.remindersOn = false,
  });
}
