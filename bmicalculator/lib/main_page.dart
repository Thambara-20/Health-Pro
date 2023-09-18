import 'package:bmicalculator/constants.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int height = 150;
  int weight = 50;

  late double bmi = calculateBMI(height:height,weight:weight);


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
            child: Column(children: [
              Row(
                children: [
                  Column(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              color: Colors.green[500],
                              borderRadius: BorderRadius.circular(10),
                              border:
                                  Border.all(color: kborderColor, width: 2.0)),
                          margin: const EdgeInsets.only(top: 20, left: 20),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(children: const [
                              Text(
                                'Male',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Icon(
                                Icons.male,
                                size: 100,
                              ),
                            ]),
                          )),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              color: Colors.yellow[600],
                              borderRadius: BorderRadius.circular(10),
                              border:
                                  Border.all(color: kborderColor, width: 2.0)),
                          margin: const EdgeInsets.only(
                              top: 20, left: 20, right: 20),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(children: const [
                              Text(
                                'Female',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Icon(
                                Icons.female,
                                size: 100,
                              )
                            ]),
                          )),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Column(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 0, 208, 255),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color:
                                    kborderColor, // Set the border color here
                                width: 2.0,
                              )),
                          margin: const EdgeInsets.only(top: 20, left: 20),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(children: [
                              const Text(
                                'Height',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text('${height}', style: kHeightStyle),
                              Row(
                                children: [
                                  FloatingActionButton(
                                      onPressed: () {
                                        setState(() {
                                          height++;
                                          bmi = calculateBMI(height: height, weight: weight);
                                        });
                                      },
                                      backgroundColor: kbuttonColor,
                                      child: Icon(Icons.add, size: 30)),
                                  const SizedBox(width: 10),
                                  FloatingActionButton(
                                    onPressed: () {
                                      setState(() {
                                        if (height >100)
                                             height--;
                                             bmi = calculateBMI(height: height, weight: weight);
                                      });
                                    },
                                    backgroundColor: kbuttonColor,
                                    child: const Icon(Icons.remove, size: 30),
                                  )
                                ],
                              )
                            ]),
                          )),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 255, 143, 69),
                            borderRadius: BorderRadius.circular(10),
                            border:
                                Border.all(color: kborderColor, width: 2.0)),
                        margin:
                            const EdgeInsets.only(top: 20, left: 20, right: 20),
                        child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              children: [
                                const Text(
                                  'weight',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text('${weight}', style: kweightStyle),
                                Row(
                                  children: [
                                    FloatingActionButton(
                                        onPressed: () {
                                          setState(() {
                                            weight++;
                                            bmi = calculateBMI(height: height, weight: weight);
                                          });
                                        },
                                        backgroundColor: kbuttonColor,
                                        child: const Icon(Icons.add, size: 30)),
                                    const SizedBox(width: 10),
                                    FloatingActionButton(
                                      onPressed: () {
                                        setState(() {
                                          if (weight>1) weight--;
                                          bmi = calculateBMI(height: height, weight: weight);
                                        });
                                      },
                                      backgroundColor: kbuttonColor,
                                      child: const Icon(Icons.remove, size: 30),
                                    )
                                  ],
                                )
                              ],
                            )),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:  [
                  const Text(
                    'BMI',
                    style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                  Text(
                    '${bmi.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 50, color: koutputColor),
                  )
                ],
              ),
            ]),
          ),
        ));
  }

  double calculateBMI( { required int  height, required int weight}) {
    return weight /(height * height)* 10000;
  }
}
