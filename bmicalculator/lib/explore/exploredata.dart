import 'package:flutter/material.dart';

class ExplorePage extends StatelessWidget {
  final String title;

  ExplorePage({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Color.fromARGB(255, 255, 196, 0),
      ),
      body: ListView.builder(
        itemCount: 20, 
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Item $index'),
            
          );
        },
      ),
    );
  }
}
