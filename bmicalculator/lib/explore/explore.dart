import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.more_vert),
          onPressed: () {},
        ),
      ]),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 200,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Color.fromARGB(255, 70, 70, 70),
                        width: 1.0,
                      ),boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                  ),
                ],
              )),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 200,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 200,
                    width: 200,
                    color: Colors.red,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 200,
                    width: 200,
                    color: Colors.blue,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 200,
              width: double.infinity,
              child: Row(),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 200,
              width: double.infinity,
              child: Row(),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 200,
              width: double.infinity,
              child: Row(),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 200,
              width: double.infinity,
              child: Row(),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 200,
              width: double.infinity,
              child: Row(),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 200,
              width: double.infinity,
              child: Row(),
            ),
          ],
        ),
      ),
    );
  }
}
