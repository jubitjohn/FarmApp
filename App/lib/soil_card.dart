import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'detail_page.dart';
import 'soil.dart';

class SoilCard extends StatelessWidget {
  // const SoilCard({
  //   Key? key,
  // }) : super(key: key);

  final Soil soil;
  SoilCard({Key? key, required this.soil}) : super(key: key);

  List<Detail> details = [
    Detail(
        name: 'Early Blight',
        about:
            'Early blight is primarily a disease of stressed or senescing plants. Symptoms appear first on the oldest foliage. Affected leaves develop circular to angular dark brown lesions 0.12 to 0.16 inch (3–4 mm) in diameter. Concentric rings often form in lesions to produce characteristic target-board effect',
        found: 'Found on the leaves of the plant.',
        character: 'often found at the sides of leaves as round patches',
        crop:
            'Cotton, wheat, sorghum, bajra, maize, barley, jute, tobacco, green and black gram, chickpea, pigeon pea, soybean, sesame, groundnut, linseed + any type of oilseed, fruit, and vegetable.',
        photo: Image.asset(
          'assets/detail/early-blight.jpg',
          fit: BoxFit.fill,
        )),
    Detail(
        name: 'Late Blight',
        about:
            'Late blight is a potentially devastating disease of tomato and potato, infecting leaves, stems, tomato fruit, and potato tubers. The disease spreads quickly in fields and can result in total crop failure if untreated. Late blight does not occur every year in Minnesota.',
        found:
            'Late Blight in the beginning affects the leaves and slowly it starts affecting the fruits too',
        character:
            'Similar to early blight they occur as round patches at the edges of leaves',
        crop: 'Major crops affected are tomato and potato',
        photo: Image.asset(
          'assets/detail/late-blight.jpg',
          fit: BoxFit.fill,
        )),
    Detail(
        name: 'T-bacterial spot',
        about:
            'Bacterial spot is one of the most detrimental diseases of tomato and is present worldwide wherever tomatoes are grown. Bacterial spot of tomato is especially severe in the southeast United States when weather conditions (high temperature, high humidity, and rain) become conducive for disease development.',
        found:
            'Found on leaves with black patches and a light coloured border.',
        character:
            'They show rapid increase in spreading all over the leaves and slowly affecting the fruits',
        crop: ' Tomatoes and potatoes',
        photo: Image.asset(
          'assets/detail/t-bacterial.jpg',
          fit: BoxFit.fill,
        )),
    Detail(
        name: 'T- Early blind',
        about:
            'Early blight is a common tomato disease caused by the fungus Alternaria solani. It can affect almost all parts of the tomato plants, including the leaves, stems, and fruits. The plants may not die, but they will be weakened and will set fewer tomatoes than normal',
        found:
            'Found on leaves as brown patches with thick white circumference',
        character: 'They are found on leaves slowly affecting the fruits',
        crop: 'Tomato and potato',
        photo: Image.asset(
          'assets/detail/t-early-blind.jpg',
          fit: BoxFit.fill,
        )),
    Detail(
        name: 'leaf mold',
        about:
            'Leaf mold is caused by the fungus Passalora fulva (previously called Fulvia fulva or Cladosporium fulvum). It is not known to be pathogenic on any plant other than tomato. There are many races of P. fulva. ',
        found: 'It is mainly found in regions of Aravalli west, Rajasthan.',
        character:
            'Sandy soils with low clay content. Poor in organic matter and moisture because arid regions are usually dry. Saline in nature with low nitrogen and high salt. Rich in plant food. Their color varies between red and brown.',
        crop:
            'Saline resistant and drought tolerant crops are suitable. Barley, maize, wheat, millets, cotton, and pulses.',
        photo: Image.asset(
          'assets/detail/leaf.jpg',
          fit: BoxFit.fill,
        )),
    Detail(
        name: 'septori a leaf spot',
        about:
            'Septoria leaf spot is caused by a fungus, Septoria lycopersici. It is one of the most destructive diseases of tomato foliage and is particularly severe in areas where wet, humid weather persists for extended periods.',
        found:
            'Septoria leaf spot usually appears on the lower leaves after the first fruit sets.',
        character: 'They appear as small dots with thin white circumference',
        crop:
            'Wheat, barley, maize, tea, coffee, spices, tropical and temperate fruits',
        photo: Image.asset(
          'assets/detail/septori.jpg',
          fit: BoxFit.fill,
        )),
    Detail(
        name: 'Canker',
        about:
            'A plant canker is a small area of dead tissue, which grows slowly, often over years. Some cankers are of only minor consequence, but others are ultimately lethal and therefore can have major economic implications for agriculture and horticulture',
        found: 'Found on stems of plants that produce citrus fruits',
        character: 'They occur as small black patches on stem',
        crop: 'lemon, tomato',
        photo: Image.asset(
          'assets/detail/canker.jpg',
          fit: BoxFit.fill,
        ))
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12.0, 2.0, 12.0, 2.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 10.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          color: Colors.green,
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    soil.title,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ),
                Container(height: 175, width: 300, child: soil.image),
                const SizedBox(
                  height: 5.0,
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(4.0, 4.0, 4.0, 20.0),
                ),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailPage(
                          detail: details[soil.index],
                        )),
              );
            },
          ),
        ),
      ),
    );
  }
}
