import 'package:cleantrash_app/scroll_page.dart';
import 'package:flutter/material.dart';
import 'package:cleantrash_app/home_view.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cleantrash_app/custom_alert.dart';

class PlasticLaundryPage extends StatefulWidget {
  @override
  _PlasticLaundryPageState createState() => _PlasticLaundryPageState();
}

class _PlasticLaundryPageState extends State<PlasticLaundryPage> {
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
        child: Image.asset('assets/plastic_laundry_bottle1.jpg',
            height: fheight, width: fwidth, fit: BoxFit.fitWidth),
      ),
    );
  }
}

void _appModalBottomSheet(context) {
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
                                child: Image.asset(
                                    'assets/plastic_laundry_bottle1.jpg'),
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
                                child: Image.asset(
                                    'assets/plastic_laundry_bottle2.jpg'),
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
                                child: Image.asset(
                                    'assets/persil_pod.jpg'),
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
                                child: Image.asset(
                                    'assets/plastic_laundry_bottle3.jpg'),
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
                            "Awesome! You logged your first item! Did you know that recycling plastic saves twice as much energy as burning it in an incinerator."),
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
              "Fill detergent bottle with warm watter and let it stand for about 30 mins. Rinse with warm water. If water comes out foamy repeat step 1 again.",
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