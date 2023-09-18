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
  bool isFemaleClicked = false;
  bool isMaleClicked = false;
  late double bmi = calculateBMI(height: height, weight: weight);

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
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              MouseRegion(
                                onEnter: (_) {
                                  setState(() {
                                    isMaleClicked = true;
                                  });
                                },
                                onExit: (event) {
                                  setState(() {
                                    isMaleClicked = false;
                                  });
                                },
                                child: Container(
                                    width: double.maxFinite,
                                    decoration: BoxDecoration(
                                        color: isMaleClicked
                                            ? Colors.green[500]
                                            : Colors.yellow[600],
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: kborderColor, width: 2.0)),
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
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isFemaleClicked = !isFemaleClicked;
                                  });
                                },
                                child: Container(
                                    width: double.maxFinite,
                                    decoration: BoxDecoration(
                                        color: isFemaleClicked
                                            ? Colors.green[600]
                                            : Colors.yellow[600],
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: kborderColor, width: 2.0)),
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
                              ),
                            ],
                          ),
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
                        Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center, // Center horizontally
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
                                  // margin: const EdgeInsets.only(top: 20, left: 10,right: 10),
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
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          
                                          FloatingActionButton(
                                              hoverColor: Colors.red,
                                              onPressed: () {
                                                setState(() {
                                                  height++;
                                                  bmi = calculateBMI(
                                                      height: height,
                                                      weight: weight);
                                                });
                                              },
                                              backgroundColor: kbuttonColor,
                                              child: Icon(Icons.add, size: 30)),
                                          const SizedBox(width: 10),
                                          FloatingActionButton(
                                            onPressed: () {
                                              setState(() {
                                                if (height > 100) height--;
                                                bmi = calculateBMI(
                                                    height: height, weight: weight);
                                              });
                                            },
                                            backgroundColor: kbuttonColor,
                                            child:
                                                const Icon(Icons.remove, size: 30),
                                          )
                                        ],
                                      )
                                    ]),
                                  )),
                            ],
                          ),
                        ),
                          const SizedBox(width: 10),
                        Expanded(
                          flex: 1,
                          child: Column(
                           
                            mainAxisAlignment:
                                MainAxisAlignment.center, // Center horizontally
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                 width: double.maxFinite/2,
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(255, 255, 143, 69),
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: kborderColor, width: 2.0)),
                                // margin: const EdgeInsets.only(
                                //     top: 20, left: 20, right: 20),
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
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            FloatingActionButton(
                                                onPressed: () {
                                                  setState(() {
                                                    weight++;
                                                    bmi = calculateBMI(
                                                        height: height,
                                                        weight: weight);
                                                  });
                                                },
                                                backgroundColor: kbuttonColor,
                                                child: const Icon(Icons.add,
                                                    size: 30)),
                                            const SizedBox(width: 10),
                                            FloatingActionButton(
                                              onPressed: () {
                                                setState(() {
                                                  if (weight > 1) weight--;
                                                  bmi = calculateBMI(
                                                      height: height,
                                                      weight: weight);
                                                });
                                              },
                                              backgroundColor: kbuttonColor,
                                              child: const Icon(Icons.remove,
                                                  size: 30),
                                            )
                                          ],
                                        )
                                      ],
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  ClipOval(
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
                  )
                ]),
          ),
        ));
  }

  double calculateBMI({required int height, required int weight}) {
    return weight / (height * height) * 10000;
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
