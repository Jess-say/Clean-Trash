import 'package:flutter/material.dart';
//import 'colors.dart' as color;
import '../../theme.dart';
import 'reset_form.dart';

class ForgotPassPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: const EdgeInsets.only(top: 200, left: 30, right: 30),
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Reset Password",
                style: titleText,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Please eneter your email address",
                style: subTitle.copyWith(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 40,
              ),
              const ResetForm(),
              const SizedBox(
                height: 40,
              ),
              Center(
                child: Column(
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {/*Should lead to home page*/},
                      style: ElevatedButton.styleFrom(
                        primary: kPrimaryColor, // background
                        onPrimary: kWhiteColor, // foreground
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 83, vertical: 14),
                      ),
                      child: const Text(
                        "Reset Password",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 1,
                        ), //
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
                        MaterialButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              "Log in",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: kPrimaryColor,
                              ),
                            )),
                      ],
                    ),
                  ],
                ),
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
