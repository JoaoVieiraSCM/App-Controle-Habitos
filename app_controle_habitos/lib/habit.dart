import 'package:flutter/material.dart';

class Habit {
  final String name;
  final String description;
  final IconData icon;
  bool completedToday;

  Habit({
    required this.name,
    required this.description,
    required this.icon,
    this.completedToday = false,
  });
}
