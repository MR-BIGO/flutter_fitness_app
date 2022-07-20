import 'package:flutter/material.dart';
import 'package:flutter_fitness_app/presentation/widgets/colors.dart';
import 'package:flutter_fitness_app/presentation/widgets/section_item.dart';

class LaunchScreen extends StatelessWidget {
  const LaunchScreen({Key? key}) : super(key: key);

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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                SizedBox(
                  width: 150,
                  height: 150,
                  child: Image(
                    image: AssetImage("assets/images/fitness_app_logo.png"),
                  ),
                ),
                SectionItem(
                  title: "Exercises",
                  img: "assets/images/gym.png",
                  page: '/exercise_types_page',
                ),
                SectionItem(
                  title: "Healthy Diet",
                  img: "assets/images/checklist.png",
                  page: '/diet_page',
                ),
                SectionItem(
                  title: "Calculator",
                  img: "assets/images/scale.png",
                  page: '/calculator_page',
                ),
                SectionItem(
                  title: "Find Nearby Gyms",
                  img: "assets/images/map.png",
                  page: "/maps_splash",
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
