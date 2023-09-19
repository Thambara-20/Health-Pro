import 'dart:math';

import 'package:bmicalculator/explore/exporeComponent.dart';
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

    List<int> text = [1,2,3,4];

    return Scaffold(
      appBar: AppBar(backgroundColor:Colors.amber[400] ,actions: [
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
          children:  [
            for ( var i in text ) exploreComponent(),
            SizedBox(
              height: 10,
            ),
            
          ],
        ),
      ),
    );
  }
}
