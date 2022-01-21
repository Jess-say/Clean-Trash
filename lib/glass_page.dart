import 'package:cleantrash_app/scroll_page.dart';
import 'package:flutter/material.dart';
import 'package:cleantrash_app/home_view.dart';
import 'package:carousel_slider/carousel_slider.dart';

class GlassPage extends StatefulWidget{
  @override
  _GlassPageState createState() => _GlassPageState();
}

class _GlassPageState extends State<GlassPage>{
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
        child: Image.asset('assets/glass_soda.jpg',
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
              Text(
                "See similiar",
                style: TextStyle(fontSize: 25),
              ),
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        //color: primaryColor,
                        margin: EdgeInsets.all(8),
                        height: 150,
                        width: 150,
                        child: Card(
                          child: Image.asset('assets/glass_bottle.jpg'),
                        ),
                      ),
                      Container(
                        //color: primaryColor,
                          margin: EdgeInsets.all(8),
                          height: 150,
                          width: 150,
                          child: Card(
                              child: Image.asset('assets/milk_glass.jpg')
                          )
                      ),
                      Container(
                        //color: primaryColor,
                          margin: EdgeInsets.all(8),
                          height: 150,
                          width: 150,
                          child: Card(
                              child: Image.asset('assets/glass_jar.jpg')
                          )
                      ),
                    ],
                  )
              ),
              Text(
                "It's Recycable",
                style: TextStyle(fontSize: 25),
              ),
              Text("Instructions:\n1. Rinse with warm water. May have to repeat this step a few times"
                  "\n2. Place bottle in appropriate bin deicated to recycling and discard the lid of the bottle",
                style: TextStyle(fontSize:20),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(16.0),
                  primary: Colors.white,
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  print("pressed");
                },
                child: const Text('Recycle'),
                ),
            ],
          ),
        ),
      ),
    ),
  );
}
