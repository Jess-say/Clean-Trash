import 'dart:convert';
import 'package:cleantrash_app/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../theme.dart';
import '../home/home_view.dart';

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

  int _selectedItemIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: kBlackColor,
          ),
          onPressed: () {
            print("X Pressed");
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeView()),
            );
          },
        ),
      ),
      bottomNavigationBar: Row(
        children: [
          buildNaviBarItem(Icons.home, 0),
          buildNaviBarItem(Icons.camera, 1),
          buildNaviBarItem(Icons.settings, 2),
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(left: 30, right: 30),
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

  GestureDetector buildNaviBarItem(IconData icon, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedItemIndex = index;
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 3,
        height: 60,
        decoration: index == _selectedItemIndex
            ? BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 4,
                    color: kPrimaryColor,
                  ),
                ),
                gradient: LinearGradient(colors: [
                  kPrimaryColor.withOpacity(0.2),
                  kSecondaryColor.withOpacity(0.02),
                ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
              )
            : BoxDecoration(),
        child: Icon(
          icon,
          color: index == _selectedItemIndex ? kBlackColor : kDarkGreyColor,
        ),
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
