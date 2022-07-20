import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_fitness_app/logic/fitness_provider.dart';
import 'package:flutter_fitness_app/data/barrel/screens_main_barrel.dart';
import 'package:flutter_fitness_app/logic/location_provider.dart';
import 'package:flutter_fitness_app/presentation/screens/splash_screens/maps_splash_screen.dart';
import 'package:provider/provider.dart';

import 'presentation/screens/splash_screens/splash_screen.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => FitnessProvider()),
      ChangeNotifierProvider(create: (context) => LocationProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fitness App',
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/maps_splash': (context) => const MapsSplashScreen(),
        '/home': (context) => const LaunchScreen(),
        '/calculator_page': (context) => Calculator(),
        '/exercise_types_page': (context) => Exercises(),
        '/diet_page': (context) => const Diet(),
        '/abs_page': (context) => AbsPage(),
        '/back_page': (context) => BackPage(),
        '/chest_page': (context) => ChestPage(),
        '/legs_page': (context) => LegsPage(),
        '/google_maps_page': (context) =>  GoogleMapsPage(),
 
      },
    );
  }
}
