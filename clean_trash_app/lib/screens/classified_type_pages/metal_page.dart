import 'package:flutter/material.dart';
import '/screens/home/home_screen.dart';
import 'components/custom_alert.dart';

class MetalPage extends StatefulWidget {
  @override
  _MetalPageState createState() => _MetalPageState();
}

class _MetalPageState extends State<MetalPage> {
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
        child: Image.asset(
          'assets/images/metal_food_can.jpg',
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
                  infoSection0,
                  infoSection1,
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
