import 'package:flutter/material.dart';
import 'package:flutter_fitness_app/data/data_exercises/data_exercises_section.dart';
import 'package:flutter_fitness_app/presentation/widgets/colors.dart';
import 'package:flutter_fitness_app/presentation/widgets/exercise_type.dart';

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
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: const Alignment(0.8, 1),
            colors: colors,
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
                return ExerciseType(
                  name: exercise.name,
                  page: exercise.page,
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
