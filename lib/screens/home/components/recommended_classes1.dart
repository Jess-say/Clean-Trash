import 'package:flutter/material.dart';

import '../../../styles.dart';
import '../../camera/camera.dart';

class RecomendsClasses extends StatelessWidget {
  const RecomendsClasses({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          RecomendClassCard(
            image: "assets/images/green_plastic_bottle.png",
            title: "Plastic",
            press: () {},
          ),
          RecomendClassCard(
            image: "assets/images/green_cardboard_box.png",
            title: "Cardboard",
            press: () {},
          ),
          RecomendClassCard(
            image: "assets/images/green_glass_bottle.png",
            title: "Glass",
            press: () {},
          ),
        ],
      ),
    );
  }
}

class RecomendClassCard extends StatelessWidget {
  const RecomendClassCard({
    Key? key,
    required this.image,
    required this.title,
    required this.press,
  }) : super(key: key);

  final String image, title;
  final Function press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(
        left: kDefaultPadding,
        bottom: kDefaultPadding * 2.5,
      ),
      width: size.width * 0.26,
      child: Column(
        children: <Widget>[
          Image.asset(image),
          GestureDetector(
            onTap: (){
              print("Pressed");
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CameraPage()
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(kDefaultPadding / 2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 10),
                    blurRadius: 50,
                    color: kPrimaryColor.withOpacity(0.23),
                  ),
                ],
              ),
              child: Row(
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: title.toUpperCase(),
                            style: Theme.of(context).textTheme.button),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}