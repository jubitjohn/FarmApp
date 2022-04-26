import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';
import 'navbar.dart';

class DisplayImage extends StatefulWidget {
  const DisplayImage({Key? key}) : super(key: key);
  @override
  _DisplayImageState createState() => _DisplayImageState();
}

class _DisplayImageState extends State<DisplayImage> {
  File? pickedImage;

  pickImage() async {
    XFile? tempStore =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      pickedImage = File(tempStore!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 35),
            pickedImage != null
                ? Center(
                    child: Container(
                    child: Image.file(pickedImage!),
                  ))
                : Container()
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 50.0),
        child: FloatingActionButton(
          child: Icon(Icons.photo_album),
          onPressed: () {
            pickImage();
          },
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      // onPressed: () {
      //   DisplayImage();
      // },
      //   child: Icon(Icons.photo_album),
      // ),
    );
  }
}
