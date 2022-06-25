import 'package:flutter/material.dart';

class ExerciseDetails extends StatelessWidget {
  const ExerciseDetails(
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
        child: Row(
          children: [
            SizedBox(
              width: 100,
              height: 300,
              child: Image(
                image: AssetImage(img),
              ),
            ),
            Column(
              children: [
                Text(name),
                Text(description),
              ],
            )
          ],
        ),
      ),
    );
  }
}
