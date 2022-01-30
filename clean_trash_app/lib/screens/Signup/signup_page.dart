import 'package:flutter/material.dart';

import '../Login/colors.dart' as color;

class CreateAccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: color.AppColor.homePageBackground,
      body: SingleChildScrollView(

        child: Container(
          padding: const EdgeInsets.only(top:80, left: 30, right: 30),
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    "Create Account",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 80,
              ),
              Column(
                children: <Widget>[
                  inputFile(label: "Email:"),
                  inputFile(label: "Username:"),
                  inputFile(label: "Password", obscureText: true),
                  inputFile(label: "Confirm Password: ", obscureText: true)
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                padding: EdgeInsets.only(top: 3, left: 3),
                decoration:
                  BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border(
                      bottom: BorderSide(color: Colors.green),
                      top: BorderSide(color: Colors.green),
                      left: BorderSide(color: Colors.green),
                      right: BorderSide(color: Colors.green),
                    ),
                  ),
                child: MaterialButton(
                  minWidth: double.infinity,
                  height: 60,
                  onPressed: () {/* create the account */},
                  color: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "Sign up",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.green,
                    ),
                  )
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Already have an account?",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.green,
                    ),
                  ),
                  MaterialButton(onPressed: () {
                    Navigator.pop(context);
                  },
                      child: Text(
                        "Log in",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      )
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget inputFile({label, obscureText = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w300,
          color: Colors.green,
        ),
      ),
      SizedBox(
        height: 15,
      ),
      TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.green
              ),
            ),
            border: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.green
                )
            )
        ),
      ),
    ],
  );
}
