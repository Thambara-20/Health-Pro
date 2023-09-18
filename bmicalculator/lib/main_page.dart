import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'BMI Calculator',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: SafeArea(
          child: Container(
            color: Color.fromARGB(255, 0, 0, 0),
            child: Column(children: [
              Row(
                children: [
                  Column(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              color: Colors.green[500],
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  width: 2.0)),
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
                              border: Border.all(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  width: 2.0)),
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
              Row(
                children: [
                  Column(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 0, 208, 255),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Color.fromARGB(255, 255, 255,
                                    255), // Set the border color here
                                width: 2.0,
                              )),
                          margin: const EdgeInsets.only(top: 20, left: 20),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(children: [
                              const Text(
                                'Height',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text(
                                '151',
                                style: TextStyle(
                                  fontSize: 60,
                                  color: Color.fromARGB(255, 11, 66, 148),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                children: const [
                                  FloatingActionButton(
                                      onPressed: null,
                                      backgroundColor: Colors.black,
                                      child: Icon(Icons.add, size: 30)),
                                  const SizedBox( width:10)
                                ,
                                  FloatingActionButton(
                                    onPressed: null,
                                    backgroundColor: Colors.black,
                                    child: Icon(Icons.remove, size: 30),
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
                            color: Color.fromARGB(255, 255, 143, 69),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: Color.fromARGB(255, 255, 255, 255),
                                width: 2.0)),
                        margin:
                            const EdgeInsets.only(top: 20, left: 20, right: 20),
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                const Text(
                                  'weight',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Text(
                                  '11',
                                  style: TextStyle(
                                    fontSize: 60,
                                    color: Color.fromARGB(255, 129, 0, 0),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                 Row(
                                children: const [
                                  FloatingActionButton(
                                      onPressed: null,
                                      backgroundColor: Colors.black,
                                      child: Icon(Icons.add, size: 30)),
                                  const SizedBox( width:10)
                                ,
                                  FloatingActionButton(
                                    onPressed: null,
                                    backgroundColor: Colors.black,
                                    child: Icon(Icons.remove, size: 30),
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
            ]),
          ),
        ));
  }
}
