import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';
import 'dart:io';
import 'about_us.dart';
import 'helper.dart';
import 'soil.dart';
import 'tips.dart';
import 'weather.dart';
import 'imagepicked.dart';

class KisanRakshak extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return KisanRakshakState();
  }
}

class KisanRakshakState extends State<KisanRakshak> {
  // List _result;

  // String _confidence = "";
  // String _name = "";
  // String numbers = '';

  // loadMyModal() async {
  //   var resultant = await Tflite.loadModel(model: "assets/output.tflite");
  //   print("Result After loading model : $resultant");
  // }

  // applyModelOnImage(File file) async {
  //   var res = await Tflite.runModelOnImage(
  //     path: file.path,
  //     numResults: 2,
  //     threshold: .5,
  //     imageMean: 127.5,
  //     imageStd: 127.5,
  //   );
  //   setState(() {
  //     _result = res;
  //     String str = _result[0];
  //   });
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   loadMyModal();
  // }

  int currentIndex = 0;
  final List<Widget> _pages = [
    Weather(),
    SoilList(),
    Helper(),
    Tips(),
    AboutUs(),
    const DisplayImage(),
  ];
  setBottomBarIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.green[200],
      body: Stack(
        children: [
          Center(
            child: _pages[currentIndex],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              width: size.width,
              height: 80,
              child: Stack(
                overflow: Overflow.visible,
                children: [
                  CustomPaint(
                    size: Size(size.width, 80),
                    painter: BNBCustomPainter(),
                  ),
                  Column(
                    children: [
                      Center(
                        heightFactor: 0.6,
                        child: FloatingActionButton(
                            backgroundColor: Colors.green,
                            child: Icon(FontAwesomeIcons.camera),
                            elevation: 0.1,
                            onPressed: () {
                              setBottomBarIndex(5);
                            }),
                      ),
                      const SizedBox(
                        height: 26,
                      ),
                      Text(
                        'Scan ',
                        style: GoogleFonts.getFont('Didact Gothic',
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      )
                    ],
                  ),
                  Container(
                    width: size.width,
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Icon(
                                FontAwesomeIcons.cloudSunRain,
                                color: currentIndex == 0
                                    ? Colors.white
                                    : Colors.black,
                              ),
                              onPressed: () {
                                setBottomBarIndex(0);
                              },
                              splashColor: Colors.white,
                            ),
                            Text(
                              'Weather',
                              style: GoogleFonts.didactGothic(
                                  fontSize: 14,
                                  color: currentIndex == 0
                                      ? Colors.white
                                      : Colors.black),
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                                icon: Icon(
                                  FontAwesomeIcons.seedling,
                                  color: currentIndex == 1
                                      ? Colors.white
                                      : Colors.black,
                                ),
                                onPressed: () {
                                  setBottomBarIndex(1);
                                }),
                            Text(
                              'Diseasepedia',
                              style: GoogleFonts.didactGothic(
                                  fontSize: 14,
                                  color: currentIndex == 1
                                      ? Colors.white
                                      : Colors.black),
                            )
                          ],
                        ),
                        Container(
                          width: size.width * 0.30,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                                icon: Icon(
                                  FontAwesomeIcons.list,
                                  color: currentIndex == 3
                                      ? Colors.white
                                      : Colors.black,
                                ),
                                onPressed: () {
                                  setBottomBarIndex(3);
                                }),
                            Text(
                              'Tips',
                              style: GoogleFonts.didactGothic(
                                  fontSize: 14,
                                  color: currentIndex == 3
                                      ? Colors.white
                                      : Colors.black),
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                                icon: Icon(
                                  FontAwesomeIcons.mobile,
                                  color: currentIndex == 2
                                      ? Colors.white
                                      : Colors.black,
                                ),
                                onPressed: () {
                                  setBottomBarIndex(2);
                                }),
                            Text(
                              'Help',
                              style: GoogleFonts.didactGothic(
                                  fontSize: 14,
                                  color: currentIndex == 2
                                      ? Colors.white
                                      : Colors.black),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = Colors.green
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, 20); // Start
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    path.arcToPoint(Offset(size.width * 0.60, 20),
        radius: Radius.circular(20.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 20);
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
