import 'package:flutter/material.dart';

import './header.dart';
import './recommended_classes1.dart';
import './recommended_classes2.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // It will provie us total height  and width of our screen
    Size size = MediaQuery.of(context).size;
    // it enable scrolling on small device
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Header(size: size),
          const RecomendsClasses(),
          const RecomendsClasses2(),
        ],
      ),
    );
  }
}