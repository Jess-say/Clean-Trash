import 'package:flutter/material.dart';
import 'package:cleantrash_app/home_view.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ScrollPage extends StatefulWidget{
  @override
  _ScrollPageState createState() => _ScrollPageState();
}

class _ScrollPageState extends State<ScrollPage>{
  final primaryColor = const Color(0xFF81C784);
  @override
  Widget build(BuildContext context){
    final fwidth = MediaQuery.of(context).size.width;
    final fheight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Container(
                  color: primaryColor,
                    margin: EdgeInsets.all(8),
                    height: 300,
                    width: 300,
                  child: Card(
                    child: Image.asset('assets/milk_glass.jpg'),
                  ),
                ),
                Container(
                    color: primaryColor,
                    margin: EdgeInsets.all(8),
                    height: 300,
                    width: 300,
                    child: Card(
                        child: Image.asset('assets/glass_jar.jpg')
                    )
                ),
                Container(
                    color: primaryColor,
                    margin: EdgeInsets.all(8),
                    height: 300,
                    width: 300,
                    child: Card(
                        child: Image.asset('assets/plastic_water_bottle.jpg')
                    )
                ),
              ],
            )
          )
      ),

    );
  }
}