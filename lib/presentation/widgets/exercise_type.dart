import 'package:flutter/material.dart';

class ExerciseType extends StatelessWidget {
  const ExerciseType(
      {Key? key, required this.name, required this.page, required this.img})
      : super(key: key);

  final String name;
  final String page;
  final String img;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(
          context,
          page,
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
                  padding: const EdgeInsets.only(
                    top: 8,
                    bottom: 8,
                  ),
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
                  child: SizedBox(
                    width: 200,
                    height: 200,
                    child: Image(
                      image: AssetImage(img),
                    ),
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
