import 'package:flutter/material.dart';
import 'package:flutter_fitness_app/logic/fitness_provider.dart';
import 'package:flutter_fitness_app/presentation/widgets/calculator_card.dart';
import 'package:flutter_fitness_app/presentation/widgets/calculator_form_field.dart';
import 'package:provider/provider.dart';

final _formKey = GlobalKey<FormState>();

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator>
    with SingleTickerProviderStateMixin {
  bool _isPressed = false;
  late Widget _animatedModalBarrier;

  late AnimationController _animationController;
  late Animation<Color?> _colorAnimation;

  String? _gender;
  final List<String> _genders = [
    "Male",
    "Female",
  ];

  TextEditingController age = TextEditingController();
  TextEditingController weight = TextEditingController();
  TextEditingController height = TextEditingController();

  @override
  void initState() {
    ColorTween _colorTween = ColorTween(
      begin: Colors.orangeAccent.withOpacity(0.5),
      end: Colors.blueGrey.withOpacity(0.5),
    );

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _colorAnimation = _colorTween.animate(_animationController);

    _animatedModalBarrier = AnimatedModalBarrier(
      color: _colorAnimation,
      dismissible: true,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.only(top: deviceSize.height / 12.0),
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
                    padding: const EdgeInsets.only(top: 20),
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
                            value: _gender,
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
                              setState(
                                () {
                                  _gender = value;
                                },
                              );
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
                    padding: const EdgeInsets.only(top: 16),
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
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.orange),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                context.read<FitnessProvider>().bmiCalc(
                                    int.parse(weight.text),
                                    int.parse(height.text));
                                context
                                    .read<FitnessProvider>()
                                    .healthyWeightCalc(
                                        _gender, int.parse(height.text));
                                context
                                    .read<FitnessProvider>()
                                    .heartRateCalc(int.parse(age.text));
                                context
                                    .read<FitnessProvider>()
                                    .waterCalc(int.parse(weight.text));
                              }
                              // setState(() {
                              //   _isPressed = true;
                              // });
                              // _animationController.reset();
                              // _animationController.forward();
                              // Future.delayed(const Duration(seconds: 3), () {
                              //   setState(() {
                              //     _isPressed = false;
                              //   });
                              // });
                            },
                            child: Text("Button"),
                          ),
                          // if (_isPressed) _animatedModalBarrier,
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(top: deviceSize.height / 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CalcCard(
                              text: "Body mass index",
                              img: "assets/images/bmi.png",
                              amount: context.watch<FitnessProvider>().bmi),
                          CalcCard(
                              text: "Max heart rate",
                              img: "assets/images/heart.png",
                              amount: context
                                  .watch<FitnessProvider>()
                                  .maxHeartRate),
                        ],
                      ),
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
                                context.watch<FitnessProvider>().healthyWeight),
                        CalcCard(
                            text: "Water (liters)",
                            img: "assets/images/water-bottle.png",
                            amount:
                                context.watch<FitnessProvider>().waterAmount),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
