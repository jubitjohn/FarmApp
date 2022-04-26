import 'dart:io';

import 'package:flutter/material.dart';
import 'navbar.dart';

class Imagedisplay extends StatefulWidget {
  final File pickedImage;
  const Imagedisplay({Key? key, required this.pickedImage}) : super(key: key);

  @override
  State<Imagedisplay> createState() => _ImagedisplayState();
}

class _ImagedisplayState extends State<Imagedisplay> {
  File? get pickedImage => null;

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
                height: 50,
              ),
              Center(
                  child: Container(
                height: 400,
                width: 400,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: FileImage(pickedImage!), fit: BoxFit.contain)),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
