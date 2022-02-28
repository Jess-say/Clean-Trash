import 'package:flutter/material.dart';
import 'components/custom_alert.dart';
import 'package:cleantrash_app/styles.dart';

class GlassDrinkFullPage extends StatefulWidget {
  @override
  _GlassDrinkFullPageState createState() => _GlassDrinkFullPageState();
}

class _GlassDrinkFullPageState extends State<GlassDrinkFullPage> {

  @override
  Widget build(BuildContext context) {
    final fwidth = MediaQuery.of(context).size.width;
    final fheight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
      ),
      body: Container(
        color: kBackgroundColor,
        child: ListView(
          children: [
            Column(
              children: <Widget>[
                const SizedBox(height: 30,),
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
                const SizedBox(height: 10,),
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
                                  'assets/images/glass_soda.jpg'),
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
                          margin: const EdgeInsets.all(8),
                          height: 120,
                          width: 125,
                          child: Card(
                            child: Container(
                              padding: const EdgeInsets.all(4.0),
                              child: Image.asset(
                                  'assets/images/snapple.jpg'),
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
                              child:
                              Image.asset('assets/images/glass_lemonade.jpg'),
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
                                  'assets/images/glass_juice.jpg'),
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
                const SizedBox(height: 20,),
                infoSection0,
                const SizedBox(height: 20,),
                infoSection1,
                const SizedBox(height: 40,),
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
                          "Awesome! You logged your first item! Did you know that Americans dispose of 10 million metric tons of glass annually."),
                    );
                    print("pressed Recycle Button");
                  },
                  child: const Text('Recycle'),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
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
              "Recycle in Riverside County.",
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
              "Rinse with warm water. Place the bottle in the appropriate bin dedicated to recycling and discard the lid of the bottle.",
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
