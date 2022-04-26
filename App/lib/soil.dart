import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'soil_card.dart';

class SoilList extends StatefulWidget {
  const SoilList({Key? key}) : super(key: key);

  @override
  _SoilListState createState() => _SoilListState();
}

class _SoilListState extends State<SoilList> {
  List<Soil> soils = [
    Soil(
        title: 'Early Blight',
        image: Image.asset(
          'assets/soil/early-blight.jpg',
          fit: BoxFit.fill,
        ),
        index: 0),
    Soil(
        title: 'Late Blight',
        image: Image.asset(
          'assets/soil/late-blight.jpg',
          fit: BoxFit.fill,
        ),
        index: 1),
    Soil(
        title: 'T - bacterial spot',
        image: Image.asset(
          'assets/soil/t-bacterial.jpg',
          fit: BoxFit.fill,
        ),
        index: 2),
    Soil(
        title: 'T - early blind',
        image: Image.asset(
          'assets/soil/t-early-blind.jpg',
          fit: BoxFit.fill,
        ),
        index: 3),
    Soil(
        title: 'Leaf mold',
        image: Image.asset(
          'assets/soil/leaf.jpg',
          fit: BoxFit.fill,
        ),
        index: 4),
    Soil(
        title: 'septori a leaf spot',
        image: Image.asset(
          'assets/soil/septori.jpg',
          fit: BoxFit.fill,
        ),
        index: 5),
    Soil(
        title: 'Canker',
        image: Image.asset(
          'assets/soil/canker.jpg',
          fit: BoxFit.fill,
        ),
        index: 6)
  ];

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        height: MediaQuery.of(context).size.height - 80,
        width: MediaQuery.of(context).size.width,
        child: Scaffold(
          backgroundColor: Colors.green[200],
          appBar: AppBar(
            title: Text('Diseasepedia',
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 25.0,
                )),
            backgroundColor: Colors.green[200],
            elevation: 0.0,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: soils.map((soil) {
                return SoilCard(soil: soil);
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}

class Soil {
  String title;
  Image image;
  int index;

  Soil({required this.title, required this.image, required this.index});
}

class Detail {
  String name;
  String about;
  String found;
  String character;
  String crop;
  Image photo;

  Detail(
      {required this.name,
      required this.about,
      required this.found,
      required this.character,
      required this.crop,
      required this.photo});
}
