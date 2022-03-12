import 'dart:io';
import 'package:cleantrash_app/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
//import 'package:path_provider/path_provider.dart';
import 'package:image_picker/image_picker.dart';

import '../home/classified_type_pages/components/custom_alert.dart';
import '../badges/badges_page.dart';
import '../settings/settings.dart';

//import 'package:clean_trash_app/styles.dart';
//import 'package:clean_trash_app/screens/home/home_screen.dart';

// FIX: the camera feature is running as the main app, need to make connect to the class buttons instead

class CameraPage extends StatefulWidget {
  const CameraPage({Key? key}) : super(key: key);

  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  int _selectedItem = 0;
  // Install Plugins
  // 1. Path Provider to get the path of files
  // 2. Image Picker that allows you to pick an image from different sources

  // Create a new object
  // ignore: unused_field
  File? _image;
  // Create and instantiate our ImagePicker
  final ImagePicker imagePicker = ImagePicker();

  Future pickImage() async {
    final navigator = Navigator.of(context);
    XFile? pickedImage =
        await imagePicker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      print(pickedImage.path);
      await navigator.push(
        MaterialPageRoute(
          builder: (context) => _DisplayPictureScreen(
            imagePath: pickedImage.path,
          ),
        ),
      );
    }
  }

  // Create a new function to get the Image from the camera
  //Future getImage() async{
  //  // Allows us access the camera and get the picture
  //  final image = await imagePicker.pickImage(source: ImageSource.camera);
  //  setState(() {
  //    // assign the image path to our image File
  //    if (image != null) {
  //      _image = File(image.path);
  //      print(pickedImage.path);
  //      await navigator.push(
  //        MaterialPageRoute(
  //          builder: (context) =>
  //              ViewStory(
  //                localImagePath: pickedImage.path,
  //              ),
  //        ),
  //      );
  //      AppBar(
  //          title: Text("CleanTrash"),
  //          actions:[
  //            Padding(
  //              padding: const EdgeInsets.only(right: 20.0),
  //              child: GestureDetector(
  //                onTap: () {},
  //                child: Icon(Icons.settings_sharp),
  //              ),
  //            )
  //          ]);
  //      DecorationImage(
  //        image: FileImage(_image!),
  //        fit: BoxFit.cover,
  //          //_appModalBottomSheet(context),
  //      );
  //    }
  //  });
  //}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(
        iconList: [
          Icons.home,
          Icons.camera_alt,
          Icons.assignment_turned_in,
          Icons.settings,
        ],
        onChange: (val) {
          setState(() {
            _selectedItem = val;
          });
        },
        defaultSelectedIndex: 1,
      ),
      body: Center(
        // ignore: unnecessary_null_comparison
        child: _image == null
            ? const Text("No Images Selected")
            : const Text("Testing"), //Image.file(_image!),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: pickImage,
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}

class _DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const _DisplayPictureScreen({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

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
              _appModalBottomSheet(context);
            })
      ]),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: Image.file(File(imagePath)),
    );
  }
}

void _appModalBottomSheet(context) {
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
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
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()),
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
                                child:
                                    Image.asset('assets/images/coke_can.jpg'),
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
                                    Image.asset('assets/images/milk_glass.jpg'),
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
                                    'assets/images/plastic_water_bottle.jpg'),
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
                                    Image.asset('assets/images/towelrolls.jpg'),
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
                'It\'s Recyclable! Or Not Recyclable',
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
              "For most containers rinse with warm water. \nFor cardboard and paper make sure they are dry and clean (no food stains).",
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

class CustomBottomNavigationBar extends StatefulWidget {
  final int defaultSelectedIndex;
  final Function(int) onChange;
  final List<IconData> iconList;

  CustomBottomNavigationBar(
      {this.defaultSelectedIndex = 0,
      required this.iconList,
      required this.onChange});

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;
  List<IconData> _iconList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _selectedIndex = widget.defaultSelectedIndex;
    _iconList = widget.iconList;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _navBarItemList = [];

    for (var i = 0; i < _iconList.length; i++) {
      _navBarItemList.add(buildNavBarItem(_iconList[i], i));
    }

    return Row(
      children: _navBarItemList,
    );
  }

  Widget buildNavBarItem(IconData icon, int index) {
    final _pageOptions = [
      HomeScreen(),
      CameraPage(),
      BadgesPage(),
      SettingsPage(),
    ];
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => _pageOptions[index]));
        widget.onChange(index);
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width / _iconList.length,
        decoration: index == _selectedIndex
            ? BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 4, color: Colors.green),
                ),
                gradient: LinearGradient(colors: [
                  Colors.green.withOpacity(0.3),
                  Colors.green.withOpacity(0.015),
                ], begin: Alignment.bottomCenter, end: Alignment.topCenter)
                // color: index == _selectedItemIndex ? Colors.green : Colors.white,
                )
            : BoxDecoration(),
        child: Icon(
          icon,
          color: index == _selectedIndex ? Colors.black : Colors.grey,
        ),
      ),
    );
  }
}
