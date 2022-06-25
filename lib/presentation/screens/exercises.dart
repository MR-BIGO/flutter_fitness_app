import 'package:flutter/material.dart';
import 'package:flutter_fitness_app/data/data_exercises/data_exercises.dart';
import 'package:flutter_fitness_app/presentation/widgets/exercise_item.dart';

class Exercises extends StatelessWidget {
  Exercises({Key? key}) : super(key: key);

  final List<Exercise> exerciseList = exercisesList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
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
        child: Scrollbar(
          thumbVisibility: true,
          interactive: true,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.builder(
              itemBuilder: (context, index) {
                final exercise = exerciseList[index];
                return ExerciseItem(
                  name: exercise.name,
                  description: exercise.description,
                  img: exercise.img,
                );
              },
              itemCount: exerciseList.length,
            ),
          ),
        ),
      ),
    );
  }
}


// SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ExerciseItem(
//                     name: exerciseList[0].name,
//                     description: exerciseList[0].description,
//                     img: exerciseList[0].img),
//                 ExerciseItem(
//                     name: exerciseList[1].name,
//                     description: exerciseList[1].description,
//                     img: exerciseList[1].img),
//                 ExerciseItem(
//                     name: exerciseList[2].name,
//                     description: exerciseList[2].description,
//                     img: exerciseList[2].img),
//                 ExerciseItem(
//                     name: exerciseList[3].name,
//                     description: exerciseList[3].description,
//                     img: exerciseList[3].img),
//               ],
//             ),
//           ),