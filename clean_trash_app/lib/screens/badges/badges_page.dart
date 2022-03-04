import 'dart:convert';
import 'package:cleantrash_app/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
//import 'package:get/get.dart';
import '../../theme.dart';
import '../home/home_view.dart';
import '../camera/camera.dart';
import '../settings/settings.dart';

class BadgesPage extends StatefulWidget {
  const BadgesPage({Key? key}) : super(key: key);

  @override
  _BadgesPageState createState() => _BadgesPageState();
}

class _BadgesPageState extends State<BadgesPage> {
  late bool _isPressed1 = false;
  late bool _isPressed2 = false;
  late bool _isPressed3 = false;
  late bool _isPressed4 = false;
  late bool _isPressed5 = false;
  late bool _isPressed6 = false;
  late bool _isPressed7 = false;
  late bool _isPressed8 = false;
  late bool _isPressed9 = false;

  @override
  void initState() {
    super.initState();
  }

  int _selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
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
        defaultSelectedIndex: 2,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(top: 60, left: 30, right: 30),
                  child: ListView(
                    padding: const EdgeInsets.only(top: 15),
                    children: [
                      const Text(
                        "Badges",
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 25,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          buildBadgets(
                            Icons.account_circle_rounded,
                            "Create Account",
                            Color(0xFFBBDEFB),
                            kSecondaryColor,
                          ),
                          Progress(1, 1, _isPressed1),
                        ],
                      ),
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          buildBadgets(
                            Icons.delete,
                            "Recycle 10 Days",
                            Color(0xFFC5CAE9),
                            kSecondaryColor,
                          ),
                          Progress(0, 10, _isPressed2),
                        ],
                      ),
                      Row(
                        children: [
                          buildBadgets(
                            Icons.delete_forever,
                            "Recycle 20 Days",
                            Color(0xFFB2BFDB),
                            kSecondaryColor,
                          ),
                          Progress(0, 20, _isPressed3),
                        ],
                      ),
                      Row(
                        children: [
                          buildBadgets(
                            Icons.inventory_2_outlined,
                            "5 Cardboard",
                            Color(0xFFFFE0B2),
                            kSecondaryColor,
                          ),
                          Progress(0, 5, _isPressed4),
                        ],
                      ),
                      Row(
                        children: [
                          buildBadgets(
                            Icons.liquor_outlined,
                            "10 Glass",
                            Color(0xFFFFECB3),
                            kSecondaryColor,
                          ),
                          Progress(0, 10, _isPressed5),
                        ],
                      ),
                      Row(
                        children: [
                          buildBadgets(
                            Icons.ad_units,
                            "10 Metal",
                            Color(0xFFFFF9C4),
                            kSecondaryColor,
                          ),
                          Progress(0, 10, _isPressed6),
                        ],
                      ),
                      Row(
                        children: [
                          buildBadgets(
                            Icons.description_outlined,
                            "10 Paper",
                            Color(0xFFDCEDC8),
                            kSecondaryColor,
                          ),
                          Progress(0, 10, _isPressed7),
                        ],
                      ),
                      Row(
                        children: [
                          buildBadgets(
                            Icons.credit_card_outlined,
                            "10 Plastic",
                            Color(0xFFC8E6C9),
                            kSecondaryColor,
                          ),
                          Progress(0, 10, _isPressed8),
                        ],
                      ),
                      Row(
                        children: [
                          buildBadgets(
                            Icons.fastfood_outlined,
                            "5 Non-Recycable",
                            Color(0xFFC5E1A5),
                            kSecondaryColor,
                          ),
                          Progress(0, 5, _isPressed9),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container buildBadgets(
      IconData icon, String title, Color backgroundColor, Color iconColor) {
    return Container(
      margin: EdgeInsets.all(5),
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: iconColor,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 11,
              color: kBlackColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Container Progress(int temp, int total, bool pressed_temp) {
    return Container(
      width: 220,
      height: 110,
      decoration: BoxDecoration(color: Colors.white),
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          LinearProgressIndicator(
            minHeight: 5,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
            value: temp / total,
            backgroundColor: Colors.grey,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(temp.toString() + "/" + total.toString()),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              OutlinedButton(
                child: const Text("CLAIM"),
                onPressed: pressed_temp
                    ? null
                    : () {
                        // once pressed can't press again (doesn't work yet)
                        // if onPressed : null then button disabled
                        print("clicked create\n");
                        setState(() {
                          pressed_temp = !pressed_temp;
                        });
                      },
                style: OutlinedButton.styleFrom(
                  primary: Colors.black,
                  backgroundColor: Colors.white,
                  onSurface: Colors.grey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

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
