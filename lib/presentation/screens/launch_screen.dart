import 'package:flutter/material.dart';
import 'package:flutter_fitness_app/presentation/widgets/section_item.dart';
import 'dart:math' as math;

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 10),
    vsync: this,
   
  )
    
    ..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment(0.8, 1),
            colors: <Color>[
              Color(0xff1f005c),
              Color(0xff270163),
              Color(0xff2e026a),
              Color(0xff360371),
              Color(0xff3d0579),
              Color(0xff450780),
              Color(0xff4d0987),
              Color(0xff550b8e),
              Color(0xff5d0d95),
              Color(0xff650f9d),
              Color(0xff6e11a4),
              Color(0xff7613ab),
            ],
            tileMode: TileMode.mirror,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedBuilder(
                  animation: _controller,
                  builder: (BuildContext context, Widget? child) {
                    return Transform.rotate(
                      angle: _controller.value * math.pi / 4,
                      child: child,
                    );
                  },
                  child: const SizedBox(
                    width: 150,
                    height: 150,
                    child: Image(
                      image: AssetImage("assets/images/fitness_app_logo.png"),
                    ),
                  ),
                ),
                const SectionItem(
                  title: "Exercises",
                  img: "assets/images/gym.png",
                  page: '/exercise_types_page',
                ),
                const SectionItem(
                  title: "Healthy Diet",
                  img: "assets/images/checklist.png",
                  page: '/diet_page',
                ),
                const SectionItem(
                  title: "Calculator",
                  img: "assets/images/scale.png",
                  page: '/calculator_page',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
