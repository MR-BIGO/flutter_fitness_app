import 'package:flutter/material.dart';
import 'package:flutter_fitness_app/presentation/screens/exercise_details.dart';

class Exercises extends StatelessWidget {
  const Exercises(
      {Key? key,
      required this.name,
      required this.description,
      required this.img})
      : super(key: key);

  final String name;
  final String description;
  final String img;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ExerciseDetails(
              name: name,
              description: description,
              img: img,
            ),
          ),
        ),
        child: SizedBox(
          height: 280,
          child: Card(
            color: const Color(0xff443e67),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0)),
            elevation: 4.0,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image(
                    image: AssetImage(img),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
