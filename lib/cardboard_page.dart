import 'package:flutter/material.dart';
import 'package:cleantrash_app/home_view.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cleantrash_app/custom_alert.dart';

class CardboardPage extends StatefulWidget {
  const CardboardPage({Key? key}) : super(key: key);

  @override
  _CardboardPageState createState() => _CardboardPageState();
}

class _CardboardPageState extends State<CardboardPage> {
  final primaryColor = const Color(0xFF81C784);
  @override
  Widget build(BuildContext context) {
    final fwidth = MediaQuery.of(context).size.width;
    final fheight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(title: const Text(""), actions: <Widget>[
        IconButton(
            icon: const Icon(
              Icons.check,
              color: Colors.white,
              size: 30,
            ),
            padding: const EdgeInsets.only(right: 15),
            onPressed: () {
              _appModalBottomSheet(context);
            })
      ]),
      body: Container(
        color: primaryColor,
        child: Image.asset(
          'assets/cardboard.jpg',
          height: fheight,
          width: fwidth,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

void _appModalBottomSheet(context) {
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
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
                            MaterialPageRoute(builder: (context) => HomeView()),
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
                                child: Image.asset('assets/towelrolls.jpg'),
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
                                    Image.asset('assets/cardboard-bundled.jpg'),
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
                                child: Image.asset('assets/cardboard_box.jpg'),
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
                                child: Image.asset('assets/tissue_box.jpg'),
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
                  infoSection0,
                  infoSection1,
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
                            "Awesome! You logged your first item! Did you know that Recycling cardboard only takes 75% of the energy needed to make new cardboard."),
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

Widget infoSection0 = Container(
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

Widget infoSection1 = Container(
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
              "Make sure it's clean and dry otherwise it is not recycable. Flatten down the cardboard. Place in recycling bin",
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
