import 'dart:math';

import 'package:flutter/material.dart';
import 'components/custom_alert.dart';
import 'package:cleantrash_app/styles.dart';

import 'components/random_facts.dart';

class GlassFullPage extends StatefulWidget {
  final String recyclable;

  const GlassFullPage({Key? key, required this.recyclable}) : super(key: key);

  @override
  _GlassFullPageState createState() => _GlassFullPageState();
}

class _GlassFullPageState extends State<GlassFullPage> {
  @override
  Widget build(BuildContext context) {
    final fwidth = MediaQuery.of(context).size.width;
    final fheight = MediaQuery.of(context).size.height;

    final _random = new Random();
    String message = "";
    
    try {
      if (widget.recyclable == 'True') {
        int num = Random().nextInt(glass_list.length);
        // print(glass_list.length);
        message = glass_list[num];
      } else {
        message = other_list[_random.nextInt(other_list.length)];
      }
    } on RangeError catch (e) {
      message = default_message;
    } catch (e) {
      message = default_message;
    }
    
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
                const SizedBox(
                  height: 30,
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
                const SizedBox(
                  height: 10,
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
                              child:
                                  Image.asset('assets/images/glass_bottle.jpg'),
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
                              child:
                                  Image.asset('assets/images/milk_glass.jpg'),
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
                              child: Image.asset('assets/images/glass_jar.jpg'),
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
                const SizedBox(
                  height: 20,
                ),
                Container(
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
                              child: widget.recyclable == "True"
                                  ? const Text(
                                      'It\'s Recyclable!',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  : const Text(
                                      'It\'s Not Recyclable!',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                            ),
                            Text(
                              widget.recyclable == "True"
                                  ? "Recycle in Riverside County."
                                  : "Do Not Recycle in Riverside County.",
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
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
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
                              widget.recyclable == "True"
                                  ? "Rinse with warm water. You may have to repeat this step a few times. Place the bottle in the appropriate bin deicated to recycling and discard the lid of the bottle."
                                  : "Place in waste bin.",
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
                ),
                const SizedBox(
                  height: 40,
                ),
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
                      builder: (_) => CustomAlert(message),
                    );
                    // print("pressed Recycle Button");
                  },
                  child: widget.recyclable == "True"
                      ? const Text('Recycle')
                      : const Text('Throw Away'),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}