import 'package:flutter/material.dart';
//import 'colors.dart' as color;
import '../../theme.dart';
import 'signup_form.dart';
import 'checkbox.dart';

class CreateAccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // avoids text field being covered by keyboard.
      body: Container(
        padding: const EdgeInsets.only(top:120, left: 30, right: 30),
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Create Account",
                style: titleText,
              ),
              const SizedBox(
                height: 20,
              ),
              SignUpForm(),
              const SizedBox(
                height: 20,
              ),
              const CheckBox(text: "Agree to terms and conditions."),
              const SizedBox(
                height: 20,
              ),
              const CheckBox(text: "I am at least 13 years old."),
              const SizedBox(
                height: 20,
              ),
              Center(
                  child: ElevatedButton(
                    onPressed: () {/* create the account */},
                    style: ElevatedButton.styleFrom(
                        primary: kPrimaryColor, // background
                        onPrimary: kWhiteColor, // foreground
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 120, vertical: 15),
                      ),
                    child: const Text(
                      "Sign up",
                      style: TextStyle(
                        fontSize: 14,
                        letterSpacing: 2.2,
                      ),
                    )
                  ),
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    "Already have an account?",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: kPrimaryColor,
                    ),
                  ),
                  MaterialButton(onPressed: () {
                    Navigator.pop(context);
                  },
                      child: const Text(
                        "Log in",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: kPrimaryColor,
                        ),
                      )
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Widget inputFile({label, obscureText = false}) {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: <Widget>[
//       Text(
//         label,
//         style: TextStyle(
//           fontSize: 20,
//           fontWeight: FontWeight.w300,
//           color: Colors.green,
//         ),
//       ),
//       SizedBox(
//         height: 15,
//       ),
//       TextField(
//         obscureText: obscureText,
//         decoration: InputDecoration(
//             contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
//             enabledBorder: OutlineInputBorder(
//               borderSide: BorderSide(
//                   color: Colors.green
//               ),
//             ),
//             border: OutlineInputBorder(
//                 borderSide: BorderSide(
//                     color: Colors.green
//                 )
//             )
//         ),
//       ),
//     ],
//   );
// }
