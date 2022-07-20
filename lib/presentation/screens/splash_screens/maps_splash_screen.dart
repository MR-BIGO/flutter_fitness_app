import 'package:flutter/material.dart';
import 'package:flutter_fitness_app/presentation/widgets/colors.dart';
import 'package:lottie/lottie.dart';

class MapsSplashScreen extends StatefulWidget {
  const MapsSplashScreen({Key? key}) : super(key: key);

  @override
  State<MapsSplashScreen> createState() => _MapsSplashScreenState();
}

class _MapsSplashScreenState extends State<MapsSplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3)).then((value) =>
        Navigator.of(context).pushReplacementNamed('/google_maps_page'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: const Alignment(0.8, 1),
            colors: colors,
            tileMode: TileMode.mirror,
          ),
        ),
        child: Center(
          child: SizedBox(
            width: 200,
            height: 200,
            child: LottieBuilder.asset(
                'assets/lottie_animations/maps_splash_animation.json'),
          ),
        ),
      ),
    );
  }
}
