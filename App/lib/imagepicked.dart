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
  List? _result;
  String _confidence = "";
  String _name = "";
  String numbers = '';

  pickImage() async {
    XFile? tempStore =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      pickedImage = File(tempStore!.path);
    });
  }

  loadMyModel() async {
    var resultant = await Tflite.loadModel(
        model: "assets/output.tflite", labels: "assets/label.txt");
    print("Result After Loading Model : $resultant");
  }

  applyModelOnImage(File file) async {
    var res = await Tflite.runModelOnImage(
        path: file.path,
        numResults: 2,
        threshold: 0.5,
        imageMean: 127.5,
        imageStd: 127.5);
    setState(() {
      _result = res;
      String str = _result![0]["label"];
      _name = str.substring(2);
      _confidence = _result != null
          ? (_result![0]['confidence'] * 100).toString().substring(0, 2) + "%"
          : "";
    });
  }

  @override
  void initState() {
    super.initState();
    loadMyModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 15),
            pickedImage != null
                ? Center(
                    child: Container(
                    height: 350,
                    width: 350,
                    child: Image.file(pickedImage!),
                  ))
                : Container(),
            SizedBox(height: 35),
            Text("Name of disease : $_name \n Confidence: $_confidence"),
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
