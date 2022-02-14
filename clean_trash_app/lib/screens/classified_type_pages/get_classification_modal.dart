import 'dart:io';
import 'package:cleantrash_app/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../classified_type_pages/components/custom_alert.dart';
import '../home/components/recommended_classes1.dart';
import '../home/components/recommended_classes2.dart';
import 'components/custom_alert.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({ Key? key, this.classification, }) : super(key: key);
  final classification;

  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  File ? _image;
  final ImagePicker imagePicker = ImagePicker();
  Future pickImage() async {
    final navigator = Navigator.of(context);
    XFile? pickedImage = await imagePicker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      print(pickedImage.path);
      await navigator.push(
        MaterialPageRoute(
          builder: (context) =>
              DisplayPictureScreen(
                imagePath: pickedImage.path, classification : "plastic",
              ),
        ),
      );

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        // ignore: unnecessary_null_comparison
        child: _image == null ? const Text("No Images Selected") : const Text("Testing"),//Image.file(_image!),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: pickImage,
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}

class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;
  final classification;

  const DisplayPictureScreen({Key? key, required this.imagePath, this.classification,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(''), actions: <Widget>[
        IconButton(
            icon: const Icon(
              Icons.check,
              color: Colors.white,
              size: 30,
            ),
            padding: const EdgeInsets.only(right: 15),
            onPressed: () {
              //String classname = classification;
              if (classification == "plastic") {
                _plasticModalBottomSheet(context);
              }
              else if (classification == "glass"){
                _glassModalBottomSheet(context);
              }
              else if (classification == "paper"){
                _paperModalBottomSheet(context);
              }
              else if (classification == "metal"){
                _metalModalBottomSheet(context);
              }
              else if (classification == "cardboard"){
                _cardboardModalBottomSheet(context);
              }
            })
      ]),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: Image.file(File(imagePath)),
    );
  }
}

//class GetClassificationModal extends StatefulWidget {
//  @override
//  _GetClassificationModalState createState() => _GetClassificationModalState();
//}
//
//class _GetClassificationModalState extends State<GetClassificationModal> {
//  final primaryColor = const Color(0xFF81C784);
//  @override
//  Widget build(BuildContext context) {
//    final fwidth = MediaQuery.of(context).size.width;
//    final fheight = MediaQuery.of(context).size.height;
//
//    return Scaffold(
//      appBar: AppBar(title: const Text(""), actions: <Widget>[
//        IconButton(
//            icon: const Icon(
//              Icons.check,
//              color: Colors.white,
//              size: 30,
//            ),
//            padding: const EdgeInsets.only(right: 15),
//            onPressed: () {
//              _appModalBottomSheet(context);
//            })
//      ]),
//      body: Container(
//        color: primaryColor,
//        child: Image.asset('assets/images/plastic_water_bottle.jpg',
//            height: fheight, width: fwidth, fit: BoxFit.fitWidth),
//      ),
//    );
//  }
//}

void _plasticModalBottomSheet(context) {
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
    ),
    builder: (context) => SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * .65,
          child: ListView(
            children: [
              Column(
                children: <Widget>[
                  Row(
                    children: [
                      //const Spacer(),
                      IconButton(
                        icon: const Icon(
                          Icons.close,
                          color: Colors.black,
                          size: 30,
                        ),
                        onPressed: () {
                          print("X Pressed");
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomeScreen()),
                          );
                        },
                      ),
                      const Spacer(),
                    ],
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
                    child: Row(children: const [
                      Expanded(
                        child: Text(
                          "Similar Items",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ]),
                  ),
                  SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Container(
                            //color: primaryColor,
                            margin: const EdgeInsets.all(8),
                            height: 120,
                            width: 125,
                            child: Card(
                              child: Container(
                                padding: const EdgeInsets.all(4.0),
                                child: Image.asset('assets/images/plastic_2liter.jpg'),
                              ),
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    color: Color.fromARGB(255, 214, 214, 214),
                                    width: 1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(255, 214, 214, 214),
                                  blurRadius: 5.0,
                                  offset: Offset(0, 7),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            //color: primaryColor,
                            margin: const EdgeInsets.all(8),
                            height: 120,
                            width: 125,
                            child: Card(
                              child: Container(
                                padding: const EdgeInsets.all(4.0),
                                child: Image.asset('assets/images/plastic_bottle1.jpg'),
                              ),
                              shape: RoundedRectangleBorder(
                                //side: const BorderSide(color: Color.fromARGB(255, 255, 254, 254), width: 1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(255, 214, 214, 214),
                                  blurRadius: 5.0,
                                  offset: Offset(0, 7),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            //color: primaryColor,
                            margin: const EdgeInsets.all(8),
                            height: 120,
                            width: 125,
                            child: Card(
                              child: Container(
                                padding: const EdgeInsets.all(4.0),
                                child: Image.asset('assets/images/plastic_soda.jpg'),
                              ),
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    color: Color.fromARGB(255, 206, 204, 204),
                                    width: 1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(255, 214, 214, 214),
                                  blurRadius: 5.0,
                                  offset: Offset(0, 7),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            //color: primaryColor,
                            margin: const EdgeInsets.all(8),
                            height: 120,
                            width: 125,
                            child: Card(
                              child: Container(
                                padding: const EdgeInsets.all(4.0),
                                child: Image.asset('assets/images/plastic_juice.jpg'),
                              ),
                              shape: RoundedRectangleBorder(
                                //side: const BorderSide(color: Color.fromARGB(255, 255, 254, 254), width: 1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(255, 214, 214, 214),
                                  blurRadius: 5.0,
                                  offset: Offset(0, 7),
                                ),
                              ],
                            ),
                          ),

                        ],
                      )),
                  infoSectionPlastic0,
                  infoSectionPlastic1,
                  ElevatedButton(
                    style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(18.0),
                        primary: Colors.white,
                        textStyle: const TextStyle(fontSize: 18),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                    onPressed: () {
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (_) => const CustomAlert(
                            "Awesome! You logged your first item! Did you know that recycling a single plastic bottle will save enough energy to power a lightbulb for three hours or more."),
                      );
                      print("pressed Recyle Button");
                    },
                    child: const Text('Recycle'),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget infoSectionPlastic0 = Container(
  padding: const EdgeInsets.all(12),
  child: Row(
    children: [
      Expanded(
        /*1*/
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /*2*/
            Container(
              padding: const EdgeInsets.only(bottom: 5, top: 5),
              child: const Text(
                'It\'s Recyclable!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              "Recyle in Riverside County.",
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
      ),
    ],
  ),
);

Widget infoSectionPlastic1 = Container(
  padding: const EdgeInsets.all(12),
  child: Row(
    children: [
      Expanded(
        /*1*/
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /*2*/
            Container(
              padding: const EdgeInsets.only(bottom: 5),
              child: const Text(
                'Instructions!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              "Rinse with warm water. Check if liquid is clear if not rinse again.",
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
      ),
    ],
  ),
);

void _glassModalBottomSheet(context) {
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
    ),
    builder: (context) => SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * .65,
          child: ListView(
            children: [
              Column(
                children: <Widget>[
                  Row(
                    children: [
                      //const Spacer(),
                      IconButton(
                        icon: const Icon(
                          Icons.close,
                          color: Colors.black,
                          size: 30,
                        ),
                        onPressed: () {
                          print("X Pressed");
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomeScreen()),
                          );
                        },
                      ),
                      const Spacer(),
                    ],
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
                    child: Row(children: const [
                      Expanded(
                        child: Text(
                          "Similar Items",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ]),
                  ),
                  SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Container(
                            //color: primaryColor,
                            margin: const EdgeInsets.all(8),
                            height: 120,
                            width: 125,
                            child: Card(
                              child: Container(
                                padding: const EdgeInsets.all(4.0),
                                child: Image.asset('assets/images/glass_bottle.jpg'),
                              ),
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    color: Color.fromARGB(255, 214, 214, 214),
                                    width: 1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(255, 214, 214, 214),
                                  blurRadius: 5.0,
                                  offset: Offset(0, 7),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            //color: primaryColor,
                            margin: const EdgeInsets.all(8),
                            height: 120,
                            width: 125,
                            child: Card(
                              child: Container(
                                padding: const EdgeInsets.all(4.0),
                                child: Image.asset('assets/images/milk_glass.jpg'),
                              ),
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    color: Color.fromARGB(255, 206, 204, 204),
                                    width: 1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(255, 214, 214, 214),
                                  blurRadius: 5.0,
                                  offset: Offset(0, 7),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            //color: primaryColor,
                            margin: const EdgeInsets.all(8),
                            height: 120,
                            width: 125,
                            child: Card(
                              child: Container(
                                padding: const EdgeInsets.all(4.0),
                                child: Image.asset('assets/images/glass_jar.jpg'),
                              ),
                              shape: RoundedRectangleBorder(
                                //side: const BorderSide(color: Color.fromARGB(255, 255, 254, 254), width: 1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(255, 214, 214, 214),
                                  blurRadius: 5.0,
                                  offset: Offset(0, 7),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            //color: primaryColor,
                            margin: const EdgeInsets.all(8),
                            height: 120,
                            width: 125,
                            child: Card(
                              child: Container(
                                padding: const EdgeInsets.all(4.0),
                                child: Image.asset('assets/images/coffee.jpg'),
                              ),
                              shape: RoundedRectangleBorder(
                                //side: const BorderSide(color: Color.fromARGB(255, 255, 254, 254), width: 1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(255, 214, 214, 214),
                                  blurRadius: 5.0,
                                  offset: Offset(0, 7),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                  infoSectionGlass0,
                  infoSectionGlass1,
                  ElevatedButton(
                    style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(18.0),
                        primary: Colors.white,
                        textStyle: const TextStyle(fontSize: 18),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                    onPressed: () {
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (_) => const CustomAlert(
                            "Awesome! You logged your first item! Did you know that Americans dispose of 10 million metric tons of glass anually."),
                      );
                      print("pressed Recyle Button");
                    },
                    child: const Text('Recycle'),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget infoSectionGlass0 = Container(
  padding: const EdgeInsets.all(12),
  child: Row(
    children: [
      Expanded(
        /*1*/
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /*2*/
            Container(
              padding: const EdgeInsets.only(bottom: 5, top: 5),
              child: const Text(
                'It\'s Recyclable!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              "Recyle in Riverside County.",
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
      ),
    ],
  ),
);

Widget infoSectionGlass1 = Container(
  padding: const EdgeInsets.all(12),
  child: Row(
    children: [
      Expanded(
        /*1*/
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /*2*/
            Container(
              padding: const EdgeInsets.only(bottom: 5),
              child: const Text(
                'Instructions!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              "Rinse with warm water. You may have to repeat this step a few times. Place the bottle in the appropriate bin deicated to recycling and discard the lid of the bottle.",
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
      ),
    ],
  ),
);

void _metalModalBottomSheet(context) {
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
    ),
    builder: (context) => SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * .65,
          child: ListView(
            children: [
              Column(
                children: <Widget>[
                  Row(
                    children: [
                      //const Spacer(),
                      IconButton(
                        icon: const Icon(
                          Icons.close,
                          color: Colors.black,
                          size: 30,
                        ),
                        onPressed: () {
                          print("X Pressed");
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomeScreen()),
                          );
                        },
                      ),
                      const Spacer(),
                    ],
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
                    child: Row(children: const [
                      Expanded(
                        child: Text(
                          "Similar Items",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ]),
                  ),
                  SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Container(
                            //color: primaryColor,
                            margin: const EdgeInsets.all(8),
                            height: 120,
                            width: 125,
                            child: Card(
                              child: Container(
                                padding: const EdgeInsets.all(4.0),
                                child: Image.asset('assets/images/coke_can.jpg'),
                              ),
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    color: Color.fromARGB(255, 214, 214, 214),
                                    width: 1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(255, 214, 214, 214),
                                  blurRadius: 5.0,
                                  offset: Offset(0, 7),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            //color: primaryColor,
                            margin: const EdgeInsets.all(8),
                            height: 120,
                            width: 125,
                            child: Card(
                              child: Container(
                                padding: const EdgeInsets.all(4.0),
                                child: Image.asset('assets/images/metal_foil.png'),
                              ),
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    color: Color.fromARGB(255, 206, 204, 204),
                                    width: 1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(255, 214, 214, 214),
                                  blurRadius: 5.0,
                                  offset: Offset(0, 7),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            //color: primaryColor,
                            margin: const EdgeInsets.all(8),
                            height: 120,
                            width: 125,
                            child: Card(
                              child: Container(
                                padding: const EdgeInsets.all(4.0),
                                child: Image.asset('assets/images/alum_container.jpg'),
                              ),
                              shape: RoundedRectangleBorder(
                                //side: const BorderSide(color: Color.fromARGB(255, 255, 254, 254), width: 1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(255, 214, 214, 214),
                                  blurRadius: 5.0,
                                  offset: Offset(0, 7),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            //color: primaryColor,
                            margin: const EdgeInsets.all(8),
                            height: 120,
                            width: 125,
                            child: Card(
                              child: Container(
                                padding: const EdgeInsets.all(4.0),
                                child: Image.asset('assets/images/soda_can1.jpg'),
                              ),
                              shape: RoundedRectangleBorder(
                                //side: const BorderSide(color: Color.fromARGB(255, 255, 254, 254), width: 1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(255, 214, 214, 214),
                                  blurRadius: 5.0,
                                  offset: Offset(0, 7),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                  infoSectionMetal0,
                  infoSectionMetal1,
                  Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                      child: ElevatedButton(
                        style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(18.0),
                            primary: Colors.white,
                            textStyle: const TextStyle(fontSize: 18),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                        onPressed: () {
                          showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (_) => const CustomAlert(
                                "Awesome! Thank you for recyling correctly! Did you know that 1 in 4 items placed in recycling bins are in fact not recyclabe."),
                            /*"Awesome! You logged your first item! Did you know that Steel is the most recycled material in North America—more than cardboard or paper!"),*/
                          );
                          print("pressed Recyle Button");
                        },
                        child: const Text('Throw Away'),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget infoSectionMetal0 = Container(
  padding: const EdgeInsets.all(12),
  child: Row(
    children: [
      Expanded(
        /*1*/
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /*2*/
            Container(
              padding: const EdgeInsets.only(bottom: 5, top: 5),
              child: const Text(
                'It\'s Not Recyclable!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              "Do Not Recyle in Riverside County.",
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
      ),
    ],
  ),
);

Widget infoSectionMetal1 = Container(
  padding: const EdgeInsets.all(12),
  child: Row(
    children: [
      Expanded(
        /*1*/
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /*2*/
            Container(
              padding: const EdgeInsets.only(bottom: 5),
              child: const Text(
                'Instructions!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              "Place in trash can.",
              /*"Scrape any food residue off the can. Rinse can. Place the lid inside the can.",*/
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
      ),
    ],
  ),
);

void _paperModalBottomSheet(context) {
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
    ),
    builder: (context) => SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * .65,
          child: ListView(
            children: [
              Column(
                children: <Widget>[
                  Row(
                    children: [
                      //const Spacer(),
                      IconButton(
                        icon: const Icon(
                          Icons.close,
                          color: Colors.black,
                          size: 30,
                        ),
                        onPressed: () {
                          print("X Pressed");
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomeScreen()),
                          );
                        },
                      ),
                      const Spacer(),
                    ],
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
                    child: Row(children: const [
                      Expanded(
                        child: Text(
                          "Similar Items",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ]),
                  ),
                  SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Container(
                            //color: primaryColor,
                            margin: const EdgeInsets.all(8),
                            height: 120,
                            width: 125,
                            child: Card(
                              child: Container(
                                padding: const EdgeInsets.all(4.0),
                                child: Image.asset('assets/images/cereal1.jpg'),
                              ),
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    color: Color.fromARGB(255, 214, 214, 214),
                                    width: 1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(255, 214, 214, 214),
                                  blurRadius: 5.0,
                                  offset: Offset(0, 7),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            //color: primaryColor,
                            margin: const EdgeInsets.all(8),
                            height: 120,
                            width: 125,
                            child: Card(
                              child: Container(
                                padding: const EdgeInsets.all(4.0),
                                child: Image.asset('assets/images/eggo_paper.png'),
                              ),
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    color: Color.fromARGB(255, 206, 204, 204),
                                    width: 1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(255, 214, 214, 214),
                                  blurRadius: 5.0,
                                  offset: Offset(0, 7),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            //color: primaryColor,
                            margin: const EdgeInsets.all(8),
                            height: 120,
                            width: 125,
                            child: Card(
                              child: Container(
                                padding: const EdgeInsets.all(4.0),
                                child: Image.asset('assets/images/eggcartonpaper.jpg'),
                              ),
                              shape: RoundedRectangleBorder(
                                //side: const BorderSide(color: Color.fromARGB(255, 255, 254, 254), width: 1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(255, 214, 214, 214),
                                  blurRadius: 5.0,
                                  offset: Offset(0, 7),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            //color: primaryColor,
                            margin: const EdgeInsets.all(8),
                            height: 120,
                            width: 125,
                            child: Card(
                              child: Container(
                                padding: const EdgeInsets.all(4.0),
                                child: Image.asset('assets/images/paper.jpg'),
                              ),
                              shape: RoundedRectangleBorder(
                                //side: const BorderSide(color: Color.fromARGB(255, 255, 254, 254), width: 1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(255, 214, 214, 214),
                                  blurRadius: 5.0,
                                  offset: Offset(0, 7),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                  infoSectionPaper0,
                  infoSectionPaper1,
                  ElevatedButton(
                    style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(18.0),
                        primary: Colors.white,
                        textStyle: const TextStyle(fontSize: 18),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                    onPressed: () {
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (_) => const CustomAlert(
                            "Awesome! You logged your first item! Did you know that using old paper to make new paper uses 30 to 50 percent less energy than making paper from trees."),
                      );
                      print("pressed Recyle Button");
                    },
                    child: const Text('Recycle'),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget infoSectionPaper0 = Container(
  padding: const EdgeInsets.all(12),
  child: Row(
    children: [
      Expanded(
        /*1*/
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /*2*/
            Container(
              padding: const EdgeInsets.only(bottom: 5, top: 5),
              child: const Text(
                'It\'s Recyclable!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              "Recyle in Riverside County.",
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
      ),
    ],
  ),
);

Widget infoSectionPaper1 = Container(
  padding: const EdgeInsets.all(12),
  child: Row(
    children: [
      Expanded(
        /*1*/
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /*2*/
            Container(
              padding: const EdgeInsets.only(bottom: 5),
              child: const Text(
                'Instructions!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              "Remove cereal bag from the box and either recycle or discard according to box recycle logo. "
                  "Check to make sure there are no left over cereal or crumbs in the box. "
                  "Then flatten your box and place in appropriate bin.",
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
      ),
    ],
  ),
);

void _cardboardModalBottomSheet(context) {
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
    ),
    builder: (context) => SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * .65,
          child: ListView(
            children: [
              Column(
                children: <Widget>[
                  Row(
                    children: [
                      //const Spacer(),
                      IconButton(
                        icon: const Icon(
                          Icons.close,
                          color: Colors.black,
                          size: 30,
                        ),
                        onPressed: () {
                          print("X Pressed");
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomeScreen()),
                          );
                        },
                      ),
                      const Spacer(),
                    ],
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
                    child: Row(children: const [
                      Expanded(
                        child: Text(
                          "Similar Items",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ]),
                  ),
                  SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Container(
                            //color: primaryColor,
                            margin: const EdgeInsets.all(8),
                            height: 120,
                            width: 125,
                            child: Card(
                              child: Container(
                                padding: const EdgeInsets.all(4.0),
                                child: Image.asset('assets/images/towelrolls.jpg'),
                              ),
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    color: Color.fromARGB(255, 214, 214, 214),
                                    width: 1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(255, 214, 214, 214),
                                  blurRadius: 5.0,
                                  offset: Offset(0, 7),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            //color: primaryColor,
                            margin: const EdgeInsets.all(8),
                            height: 120,
                            width: 125,
                            child: Card(
                              child: Container(
                                padding: const EdgeInsets.all(4.0),
                                child:
                                Image.asset('assets/images/cardboard-bundled.jpg'),
                              ),
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    color: Color.fromARGB(255, 206, 204, 204),
                                    width: 1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(255, 214, 214, 214),
                                  blurRadius: 5.0,
                                  offset: Offset(0, 7),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            //color: primaryColor,
                            margin: const EdgeInsets.all(8),
                            height: 120,
                            width: 125,
                            child: Card(
                              child: Container(
                                padding: const EdgeInsets.all(4.0),
                                child: Image.asset('assets/images/cardboard_box.jpg'),
                              ),
                              shape: RoundedRectangleBorder(
                                //side: const BorderSide(color: Color.fromARGB(255, 255, 254, 254), width: 1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(255, 214, 214, 214),
                                  blurRadius: 5.0,
                                  offset: Offset(0, 7),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            //color: primaryColor,
                            margin: const EdgeInsets.all(8),
                            height: 120,
                            width: 125,
                            child: Card(
                              child: Container(
                                padding: const EdgeInsets.all(4.0),
                                child: Image.asset('assets/images/tissue_box.jpg'),
                              ),
                              shape: RoundedRectangleBorder(
                                //side: const BorderSide(color: Color.fromARGB(255, 255, 254, 254), width: 1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(255, 214, 214, 214),
                                  blurRadius: 5.0,
                                  offset: Offset(0, 7),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                  infoSectionCardboard0,
                  infoSectionCardboard1,
                  Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                      child: ElevatedButton(
                        style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(18.0),
                            primary: Colors.white,
                            textStyle: const TextStyle(fontSize: 18),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                        onPressed: () {
                          showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (_) => const CustomAlert(
                                "Awesome! You logged your first item! Did you know that Recycling cardboard only takes 75% of the energy needed to make new cardboard."),
                          );
                          print("pressed Recyle Button");
                        },
                        child: const Text('Recycle'),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget infoSectionCardboard0 = Container(
  padding: const EdgeInsets.all(12),
  child: Row(
    children: [
      Expanded(
        /*1*/
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /*2*/
            Container(
              padding: const EdgeInsets.only(bottom: 5, top: 5),
              child: const Text(
                'It\'s Recyclable!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              "Recyle in Riverside County.",
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
      ),
    ],
  ),
);

Widget infoSectionCardboard1 = Container(
  padding: const EdgeInsets.all(12),
  child: Row(
    children: [
      Expanded(
        /*1*/
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /*2*/
            Container(
              padding: const EdgeInsets.only(bottom: 5),
              child: const Text(
                'Instructions!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              "Make sure it's clean and dry otherwise it is not recycable. "
                  "If there is tape please remove. "
                  "Flatten down the cardboard. Place in recycling bin",
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
      ),
    ],
  ),
);
