import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_fitness_app/logic/fitness_provider.dart';
import 'package:flutter_fitness_app/data/barrel/screens_main_barrel.dart';
import 'package:provider/provider.dart';
import 'presentation/screens/launch_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
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
        '/exercise_types_page': (context) => Exercises(),
        '/diet_page': (context) => const Diet(),
        '/abs_page': (context) => AbsPage(),
        '/back_page': (context) => BackPage(),
        '/chest_page': (context) => ChestPage(),
        '/legs_page': (context) => LegsPage(),
      },
    );
  }
}
