import 'package:flutter/material.dart';
import 'package:cleantrash_app/home_view.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MetalPage extends StatefulWidget{
  @override
  _MetalPageState createState() => _MetalPageState();
}

class _MetalPageState extends State<MetalPage>{
  final primaryColor = const Color(0xFF81C784);
  @override
  Widget build(BuildContext context){

    final fwidth = MediaQuery.of(context).size.width;
    final fheight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
          title: Text(""),
          actions:<Widget>[
            IconButton(
                icon:Icon(Icons.check_circle, color:Colors.grey, size: 30,),
                padding: const EdgeInsets.only(right:15),
                onPressed:(){
                  _appModalBottomSheet(context);
                }
            )
          ]
      ),
      body: Container(
        color: primaryColor,
        child: Image.asset('assets/metal_food_can.jpg',
          height: fheight,
          width: fwidth,
          fit: BoxFit.fill, ),
      ),
    );
  }
}

void _appModalBottomSheet(context){
  showModalBottomSheet(
    context: context,
    builder: (context) => SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          height: MediaQuery.of(context).size.height * .80,
          child: Column(
            children: <Widget>[
              Row(
                children: [
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.cancel, color: Colors.red, size:30,),
                    alignment: Alignment.topRight,
                    onPressed: (){
                      print("Pressed");
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeView()),
                      );
                    },
                  ),
                ],

              ),
              Row(
                children: [
                  buildCard(),
                  SizedBox(width:12),
                  buildCard(),
                  SizedBox(width:12),
                  buildCard(),
                  SizedBox(width:12),

                ],
              ),
              Text(
                "It's Recycable",
                style: TextStyle(fontSize: 25),
              ),
              Text("Instructions:\n1. Rinse can with warm water. May have to repeat this step a few times to completly remove food from can"
                  "\n2. Place lid into can after rinsing",
                style: TextStyle(fontSize:20),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget buildCard() => Container(
  width: 150,
  height: 150,
  color: Colors.grey,
);