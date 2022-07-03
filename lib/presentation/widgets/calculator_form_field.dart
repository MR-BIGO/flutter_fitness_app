import 'package:flutter/material.dart';

class CalcFormField extends StatelessWidget {
  const CalcFormField({Key? key, required this.section, required this.controller, required this.mou}) : super(key: key);

  final String section;
  final TextEditingController controller;
  final String mou;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      cursorColor: Colors.white,
      controller: controller,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
      decoration:  InputDecoration(
        enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 2.0)),
        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 2.0)),
        hintStyle: const TextStyle(
          color: Colors.white38,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        hintText: section + mou,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "no $section found";
        }
        return null;
      },
    );
  }
}
