import 'package:flutter/material.dart';
import 'package:flutter_fitness_app/logic/fitness_provider.dart';
import 'package:flutter_fitness_app/presentation/screens/calculator.dart';
import 'package:flutter_fitness_app/presentation/screens/diet.dart';
import 'package:flutter_fitness_app/presentation/screens/exercises.dart';
import 'package:provider/provider.dart';

import 'presentation/screens/launch_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => FitnessProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fitness App',
      initialRoute: '/home',
      routes: {
        '/home': (context) => const LaunchScreen(),
        '/calculator_page': (context) => const Calculator(),
        '/exercises_page': (context) => const Exercises(),
        '/diet_page': (context) => const Diet(),
      },
    );
  }
}
