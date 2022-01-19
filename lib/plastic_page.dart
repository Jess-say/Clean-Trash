import 'package:flutter/material.dart';
import 'package:cleantrash_app/home_view.dart';
import 'package:carousel_slider/carousel_slider.dart';

class PlasticPage extends StatefulWidget{
  @override
  _PlasticPageState createState() => _PlasticPageState();
}

class _PlasticPageState extends State<PlasticPage>{
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
            child: Image.asset('assets/plastic_laundry_bottle1.jpg',
            height: fheight,
            width: fwidth,
            fit: BoxFit.fitWidth),
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
              Text("Instructions:\n1. Fill detergent bottle with warm watter and let it stand for about 30 mins."
                        "\n2. Rinse with warm water. If water comes out foamy repeat step 1 again.",
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