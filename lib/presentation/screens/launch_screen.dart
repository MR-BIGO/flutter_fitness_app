import 'package:flutter/material.dart';
import 'package:flutter_fitness_app/presentation/widgets/list_item.dart';

class LaunchScreen extends StatelessWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
            children:  const [
              SizedBox(
                width: 150,
                height: 150,
                child: Image(
                  image: AssetImage("assets/images/fitness_app_logo.png"),
                ),
              ),
              ListItem(title: "Exercises", img: "assets/images/gym.png", page: '/exercises_page',),
              ListItem(title: "Healthy Diet", img: "assets/images/checklist.png", page: '/diet_page',),
              ListItem(title: "Calculator", img: "assets/images/scale.png", page: '/calculator_page',),
            ],
          ),
        ),
      ),
    );
  }
}
