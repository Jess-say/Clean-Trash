import 'package:cleantrash_app/glass_page.dart';
import 'package:cleantrash_app/metal_page.dart';
import 'package:flutter/material.dart';
import 'package:cleantrash_app/plastic_page.dart';

class HomeView extends StatefulWidget{

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>{
  final primaryColor = const Color(0xFF81C784);
  @override
  Widget build(BuildContext context){

    final fwidth = MediaQuery.of(context).size.width;
    final fheight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text("CleanTrash"),
        actions:[
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {},
              child: Icon(Icons.settings_sharp),
            ),
          )
        ]
      ),
        body:SafeArea(
              child: Container(
                height: fheight,
                width: fwidth,//MediaQuery.of(context).size.width,
                color: primaryColor,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 40 * 0.50,
                    ),
                    Text("Welcome",
                        style: TextStyle(fontSize: 25, color: Colors.white)
                    ),
                    SizedBox(
                      height: 40 * 0.30,
                    ),
                    Text("What would you like to recycle?",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                    SizedBox(
                      height: 40 * 0.30,
                    ),
                    ElevatedButton(
                      child: Text('Plastic'),
                      onPressed: (){
                        print("Pressed");
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PlasticPage()
                          ),
                        );
                      },
                    ),
                    ElevatedButton(
                      child: Text('Glass'),
                      onPressed: (){
                        print("Pressed");
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => GlassPage()
                          ),
                        );
                      },
                    ),
                    ElevatedButton(
                      child: Text('Metal'),
                      onPressed: (){
                        print("Pressed");
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MetalPage()
                          ),
                        );
                      },
                    ),
                  ]
                )

    ),

    )
    );
  }
}