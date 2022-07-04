import 'package:flutter/material.dart';
import 'package:flutter_fitness_app/data/data_exercises/types/data_chest.dart';
import 'package:flutter_fitness_app/presentation/widgets/colors.dart';

import '../../widgets/exercises.dart';



class ChestPage extends StatelessWidget {
  ChestPage({Key? key}) : super(key: key);

  final List<Chest> chestlist = chestList;

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
                final exercise = chestlist[index];
                return Exercises(
                  name: exercise.name,
                  description: exercise.description,
                  img: exercise.img,
                );
              },
              itemCount: chestlist.length,
            ),
          ),
        ),
      ),
    );
  }
}