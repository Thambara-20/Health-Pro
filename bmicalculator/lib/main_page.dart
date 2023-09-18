import 'package:bmicalculator/constants.dart';
import 'package:bmicalculator/src/GenderSelectionWidget.dart';
import 'package:bmicalculator/src/ValueFinalOutput.dart';
import 'package:bmicalculator/src/WeightHeightSelectionWidget.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int height = 150;
  int weight = 50;
  bool isFemaleClicked = false;
  bool isMaleClicked = false;
  double bmi = 0.0;

  void calculateBMI() {
    // Implement your BMI calculation logic here
    // You can use height and weight to calculate BMI
    // Update the bmi variable with the calculated value
    setState(() {
      // Example calculation
      bmi = (weight / ((height / 100) * (height / 100)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'BMI Calculator',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: SafeArea(
          child: Container(
            color: const Color.fromARGB(255, 0, 0, 0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment:
                          MainAxisAlignment.center, // Center horizontally
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GenderSelectionWidget(
                          isSelected: isMaleClicked,
                          onTap: () {
                            setState(() {
                              isMaleClicked = !isMaleClicked;
                            });
                          },
                          icon: Icons.male,
                          label: 'Male',
                        ),
                        const SizedBox(width: 10),
                        GenderSelectionWidget(
                          isSelected: isFemaleClicked,
                          onTap: () {
                            setState(() {
                              print('hello');
                              isFemaleClicked = !isFemaleClicked;
                            });
                          },
                          icon: Icons.female,
                          label: 'Female',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        WeightHeightSelectionWidget(
                          label: 'Height',
                          height: height,
                          weight: weight,
                          onHeightChanged: (newHeight) {
                            setState(() {
                              height = newHeight;
                              calculateBMI(); // Recalculate BMI when height changes
                            });
                          },
                          onWeightChanged: (newWeight) {},
                        ),
                        const SizedBox(width: 10),
                        WeightHeightSelectionWidget(
                          label: 'weight',
                          height: height,
                          weight: weight,
                          onHeightChanged: (newHeight) {},
                          onWeightChanged: (newWeight) {
                            setState(() {
                              weight = newWeight;
                              calculateBMI(); // Recalculate BMI when weight changes
                            });
                          },
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                   
                 FinalOutput(getStatus: getStatus, bmi: bmi)
                ]),
          ),
        ));
  }

  static String getStatus(double bmi) {
    if (bmi >= 25) {
      return 'Over Weighted';
    } else if (bmi >= 18.5) {
      return 'Good....!';
    } else {
      return 'Under Weighted';
    }
  }
}
