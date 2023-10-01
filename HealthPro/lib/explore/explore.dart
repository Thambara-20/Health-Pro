import 'package:bmicalculator/explore/exporeComponent.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Explore extends StatefulWidget {
  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  final FirebaseService _firebaseService = FirebaseService();

  List<String> _imageUrls = [];
  // List<String> _titles = ['title1', 'title2', 'title3', 'title4', 'title5'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
       
        child: FutureBuilder<List<String>>(
          future: _firebaseService
              .getImageUrls(), // Replace with your image folder path
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Text('No images found.');
            } else {
              final List<String>? imageUrls = snapshot.data;
              return ListView.builder(
                
                itemCount: imageUrls!.length,
                itemBuilder: (context, index) {
                  final imageUrl = imageUrls[index];
                  return ExploreComponent(imageUrl: imageUrl, title: 'title');
                },
              );
            }
          },
        ),
      ),
    );
  }
}

// class ExploreComponent extends StatelessWidget {
//   final String imageUrl;

//   ExploreComponent({required this.imageUrl});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.all(10),
//       child: Image.network(
//         imageUrl,
//         fit: BoxFit.cover,
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:get/get.dart';

class ImageListFromFirebaseStorage extends StatefulWidget {
  @override
  _ImageListFromFirebaseStorageState createState() =>
      _ImageListFromFirebaseStorageState();
}

class _ImageListFromFirebaseStorageState
    extends State<ImageListFromFirebaseStorage> {
  final FirebaseService _firebaseService = FirebaseService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Storage Images'),
      ),
      body: FutureBuilder<List<String>>(
        future: _firebaseService
            .getImageUrls(), // Replace with your image folder path
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Text('No images found.');
          } else {
            final List<String>? imageUrls = snapshot.data;
            return ListView.builder(
              itemCount: imageUrls!.length,
              itemBuilder: (context, index) {
                final imageUrl = imageUrls[index];
                return ListTile(
                  title: Image.network(imageUrl),
                );
              },
            );
          }
        },
      ),
    );
  }
}

class FirebaseService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<List<String>> getImageUrls() async {
    try {
      final ListResult result = await _storage.ref().listAll();
      final List<String> imageUrls = [];

      for (final Reference ref in result.items) {
        final String downloadURL = await ref.getDownloadURL();
        imageUrls.add(downloadURL);
      }

      return imageUrls;
    } catch (e) {
      print('Error getting image URLs: $e');
      return [];
    }
  }
}
