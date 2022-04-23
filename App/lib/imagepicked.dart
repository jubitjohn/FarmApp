import 'package:flutter/material.dart';
import 'navbar.dart';

class Imagedisplay extends StatelessWidget {
  const Imagedisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Image'),
          backgroundColor: Colors.green,
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              //  image != null ? Image.file(image!): Text("No image selected")
              Text("No image selected"),
            ],
          ),
        ),
      ),
    );
  }
}
