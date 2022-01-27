import 'package:cleantrash_app/scroll_page.dart';
import 'package:flutter/material.dart';
import 'package:cleantrash_app/home_view.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cleantrash_app/recycled_pop_up.dart';

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
    isScrollControlled: true,
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
              ElevatedButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(16.0),
                  primary: Colors.white,
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  showDialog(context: context, builder: (_) => const CustomAlert("Awesome! You logged your first item! Did you know that Americans dispose of 10 million metric tons of glass anually."),);
                  print("pressed Recyle Button");
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

class CustomAlert extends StatelessWidget {
  final String message;

  const CustomAlert(this.message, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
   
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0)
      ),
      child: Stack(
        clipBehavior: Clip.none, alignment: Alignment.topCenter,
        children: [
          SizedBox(
            height: 350,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 80, 20, 20),
              child: Column(
                children: [
                  const Text('Way to go!', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                  const SizedBox(height: 15,),
                  Text(message, style: const TextStyle(fontSize: 20),),
                  const SizedBox(height: 25,),
                  ElevatedButton(onPressed: () {
                    //Navigator.of(context).pop();
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeView()),
                      );
                  },
                    child: const Text('Yay! I recycled!', style: TextStyle(color: Colors.white),),
                  )
                ],
              ),
            ),
          ),
          const Positioned(
            top: -60,
            child: CircleAvatar(
              backgroundColor: Color.fromARGB(255, 72, 194, 135),
              radius: 60,
              child: Icon(Icons.star, color: Colors.white, size: 50,),
            )
          ),
        ],
      )
    );
  }
}

void _appModalBottomSheet2(context){
  showModalBottomSheet(
    isScrollControlled: true,
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
                "Thank you for recycling ",
                style: TextStyle(fontSize: 25),
              ),

            ],
          ),
        ),
      ),
    ),
  );
}