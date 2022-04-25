import 'package:flutter/material.dart';
import 'navbar.dart';

class Imagedisplay extends StatefulWidget {
  const Imagedisplay({Key? key}) : super(key: key);

  @override
  State<Imagedisplay> createState() => _ImagedisplayState();
}

class _ImagedisplayState extends State<Imagedisplay> {
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
              Text("No image is selected"),
            ],
          ),
        ),
      ),
    );
  }
}
