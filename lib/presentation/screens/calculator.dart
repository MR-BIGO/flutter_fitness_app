import 'package:flutter/material.dart';
import 'package:flutter_fitness_app/logic/fitness_provider.dart';
import 'package:flutter_fitness_app/presentation/widgets/calculator_card.dart';
import 'package:flutter_fitness_app/presentation/widgets/calculator_form_field.dart';
import 'package:flutter_fitness_app/presentation/widgets/colors.dart';
import 'package:provider/provider.dart';

final _formKey = GlobalKey<FormState>();

class Calculator extends StatelessWidget {
  Calculator({Key? key}) : super(key: key);

  String _sex = "";
  final List<String> _genders = [
    "Male",
    "Female",
  ];

  TextEditingController age = TextEditingController();
  TextEditingController weight = TextEditingController();
  TextEditingController height = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.only(top: deviceSize.height / 12.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "Enter your details",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 120,
                            height: 50,
                            child: DropdownButton(
                              underline: Container(
                                height: 2.0,
                                color: Colors.white,
                              ),
                              value: context.watch<FitnessProvider>().sex,
                              elevation: 4,
                              selectedItemBuilder: (_) => _genders
                                  .map(
                                    (e) => Center(
                                      child: Text(
                                        e,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                              isExpanded: true,
                              iconEnabledColor: Colors.white,
                              hint: const Center(
                                child: Text(
                                  "sex",
                                  style: TextStyle(
                                    color: Colors.white38,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              items: _genders
                                  .map(
                                    (gender) => DropdownMenuItem<String>(
                                      value: gender,
                                      child: Text(gender),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (dynamic value) {
                                context
                                    .read<FitnessProvider>()
                                    .sexSetter(value);
                                _sex = value;
                              },
                            ),
                          ),
                          SizedBox(
                            width: 120,
                            height: 50,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 9),
                              child: CalcFormField(
                                section: "age",
                                controller: age,
                                mou: "",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 120,
                            height: 50,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 9),
                              child: CalcFormField(
                                section: "height",
                                controller: height,
                                mou: " (cm)",
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 120,
                            height: 50,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 9),
                              child: CalcFormField(
                                section: "weight",
                                controller: weight,
                                mou: " (kg)",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: deviceSize.height / 12.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        onPressed: () {
                          if (_formKey.currentState!.validate() && _sex != "") {
                            context.read<FitnessProvider>().bmiCalc(
                                double.parse(weight.text),
                                double.parse(height.text));
                            context
                                .read<FitnessProvider>()
                                .healthyWeightCalc(double.parse(height.text));
                            context
                                .read<FitnessProvider>()
                                .heartRateCalc(double.parse(age.text));
                            context
                                .read<FitnessProvider>()
                                .waterCalc(double.parse(weight.text));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content:
                                    Text("Please, fill out all of the fields!"),
                              ),
                            );
                          }
                        },
                        child: Ink(
                          decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Color(0xff8e24aa), Color(0xff303030)],
                              ),
                              borderRadius: BorderRadius.circular(20)),
                          child: Container(
                            width: 100,
                            height: 40,
                            alignment: Alignment.center,
                            child: const Text(
                              "Calculate",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: deviceSize.height / 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CalcCard(
                            text: "Body mass index",
                            img: "assets/images/bmi.png",
                            amount: context.watch<FitnessProvider>().bmi,
                            bmiResult:
                                context.watch<FitnessProvider>().bmiResult,
                          ),
                          CalcCard(
                            text: "Max heart rate",
                            img: "assets/images/heart.png",
                            amount:
                                context.watch<FitnessProvider>().maxHeartRate,
                            //bmiResult: "",
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CalcCard(
                            text: "Ideal weight (kg)",
                            img: "assets/images/scale2.png",
                            amount:
                                context.watch<FitnessProvider>().healthyWeight,
                            //bmiResult: "",
                          ),
                          CalcCard(
                            text: "Water (liters)",
                            img: "assets/images/water-bottle.png",
                            amount:
                                context.watch<FitnessProvider>().waterAmount,
                            //bmiResult: "",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
