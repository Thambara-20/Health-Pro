import 'package:bmicalculator/constants.dart';
import 'package:flutter/material.dart';


class FinalOutput extends StatelessWidget {
  final String Function(double) getStatus;
  final double bmi;


  const FinalOutput({
        required this.getStatus,
        required this.bmi


});

  @override
  Widget build(BuildContext context) {
    return  ClipOval(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 0, 0, 0),
                        shape: BoxShape.circle, // Set the shape to a circle
                        border: Border.all(
                          color: kborderColor,
                          width: 2.0,
                        ),
                      ),
                      margin:
                          const EdgeInsets.only(top: 20, left: 20, right: 20),
                      padding: const EdgeInsets.all(
                          50), // Add padding to control the content size
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'BMI',
                            style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                          Text(
                            '${bmi.toStringAsFixed(2)}',
                            style: TextStyle(fontSize: 50, color: koutputColor),
                          ),
                          Text(
                            getStatus(bmi),
                            style: TextStyle(color: Colors.amber, fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  );
  }
}