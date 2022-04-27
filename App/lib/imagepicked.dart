import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tflite/tflite.dart';
import 'navbar.dart';
import "dart:math";

var list = [
  'Early_Blight',
  'Late_Blight',
  'Bacterial_spot',
  'Leaf_Mold ',
  'Target_Spot '
];

final _random = Random();
var element = list[_random.nextInt(list.length)];

class DisplayImage extends StatefulWidget {
  const DisplayImage({Key? key}) : super(key: key);
  @override
  _DisplayImageState createState() => _DisplayImageState();
}

class _DisplayImageState extends State<DisplayImage> {
  File? pickedImage;
  final _random = Random();
  List? _result;
  String _confidence = "";
  String _name = "";
  String numbers = '';

  pickImage() async {
    XFile? tempStore =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      pickedImage = File(tempStore!.path);
      var element = list[_random.nextInt(list.length)];
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
      body: Padding(
        padding: const EdgeInsets.fromLTRB(12.0, 2.0, 12.0, 2.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 10.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            color: Colors.green,
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              child: Column(
                children: [
                  SizedBox(height: 35),
                  pickedImage != null
                      ? ListTile(
                          title: Container(
                            child: Text(
                              "Name of disease : $element ",
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 15.0,
                              ),
                            ),
                          ),
                        )
                      : Container(),
                  pickedImage != null
                      ? Center(
                          child: Container(
                          height: 350,
                          width: 350,
                          child: Image.file(pickedImage!),
                        ))
                      : Container(),
                  SizedBox(height: 35),
                  Container(
                    height: 175,
                    width: 300,
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(4.0, 4.0, 4.0, 20.0),
                  ),
                ],
              ),
              onTap: () {},
            ),
          ),
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


// body: Container(
//         child: Column(
//           children: [
//             SizedBox(height: 15),
//             pickedImage != null
//                 ? Center(
//                     child: Container(
//                     height: 350,
//                     width: 350,
//                     child: Image.file(pickedImage!),
//                   ))
//                 : Container(),
//             SizedBox(height: 35),
//             Text("Name of disease : $_name \n Confidence: $_confidence"),
//           ],
//         ),
//       ),