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
                  padding: const EdgeInsets.only(top: 100, left: 30, right: 30),
                  child: ListView(
                    padding: const EdgeInsets.only(top: 10),
                    children: [
                      const Text(
                        "Your Badges",
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 25,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          buildBadgets(
                            Icons.account_circle_rounded,
                            "Create Account",
                            Color(0xFFBBDEFB),
                            kSecondaryColor,
                          ),
                          buildBadgets(
                            Icons.delete,
                            "Recycle 10 Days",
                            Color(0xFFC5CAE9),
                            kSecondaryColor,
                          ),
                          buildBadgets(
                            Icons.delete_forever,
                            "Recycle 20 Days",
                            Color(0xFFB2BFDB),
                            kSecondaryColor,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Badges To Earn",
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 25,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          buildBadgets(
                            Icons.inventory_2_outlined,
                            "5 Cardboard",
                            Color(0xFFFFE0B2),
                            kSecondaryColor,
                          ),
                          buildBadgets(
                            Icons.liquor_outlined,
                            "10 Glass",
                            Color(0xFFFFECB3),
                            kSecondaryColor,
                          ),
                          buildBadgets(
                            Icons.ad_units,
                            "10 Metal",
                            Color(0xFFFFF9C4),
                            kSecondaryColor,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          buildBadgets(
                            Icons.description_outlined,
                            "10 Paper",
                            Color(0xFFDCEDC8),
                            kSecondaryColor,
                          ),
                          buildBadgets(
                            Icons.credit_card_outlined,
                            "10 Plastic",
                            Color(0xFFC8E6C9),
                            kSecondaryColor,
                          ),
                          buildBadgets(
                            Icons.fastfood_outlined,
                            "5 Non-Recycable",
                            Color(0xFFC5E1A5),
                            kSecondaryColor,
                          ),
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
      margin: EdgeInsets.all(10),
      height: 90,
      width: 90,
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
