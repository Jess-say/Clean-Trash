import 'package:flutter/material.dart';
import '../../home/home_screen.dart';

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
            height: 425,
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
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                  },
                    child: const Text('Yay! I helped!', style: TextStyle(color: Colors.white),),
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
