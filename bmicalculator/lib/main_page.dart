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
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 20, left: 20),
                    child: const Text(
                      'BMI Calculator',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Container(
                        
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 124, 243, 33),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          margin: const EdgeInsets.only(top: 20, left: 20),
                          child: Column(
                            children: const [
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
                          ])),
                    ],
                  ),
                  Spacer(),
                  Column(
                    children: [
                      Container(
                          
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 33, 170, 243),
                            borderRadius: BorderRadius.circular(10),
                          ) 
                          ,
                          
                          margin: const   EdgeInsets.only(
                              top: 20, left: 20, right: 20),
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
                          ])),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
