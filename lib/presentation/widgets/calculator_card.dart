import 'package:flutter/material.dart';

class CalcCard extends StatelessWidget {
  const CalcCard(
      {Key? key,
      required this.text,
      required this.img,
      required this.amount,
      this.bmiResult})
      : super(key: key);

  final String text;
  final String img;
  final double amount;
  final String? bmiResult;

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return SizedBox(
      width: deviceSize.width / 2.5,
      height: 160,
      child: Card(
        color: const Color(0xff292d43),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  text,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: Image(image: AssetImage(img)),
                ),
                Text(
                  amount.toStringAsFixed(1),
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                bmiResult != null ?
                Text(
                  bmiResult!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                )
                : const SizedBox()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
