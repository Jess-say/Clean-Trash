import 'package:flutter/material.dart';

import '../../../styles.dart';
import '../../camera/camera.dart';

class RecomendsClasses2 extends StatelessWidget {
  const RecomendsClasses2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              print("Pressed Paper");
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CameraPage()),
              );
            },
            child: const RecomendClassCard(
              image: "assets/images/green_paper.png",
              title: "Paper",
            ),
          ),
          GestureDetector(
            onTap: () {
              print("Pressed Metal");
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CameraPage()),
              );
            },
            child: const RecomendClassCard(
              image: "assets/images/spoon.png",
              title: "Metal",
            ),
          ),
          GestureDetector(
            onTap: () {
              print("Pressed Other");
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CameraPage()),
              );
            },
            child: const RecomendClassCard(
              image: "assets/images/green_question_mark.png",
              title: "Other",
            ),
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
  }) : super(key: key);

  final String image, title;

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
          Container(
            padding: const EdgeInsets.all(kDefaultPadding / 2),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
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
          // )
        ],
      ),
    );
  }
}
