import 'package:flutter/material.dart';
import 'input_form.dart';
import 'create_account_page.dart';
import 'forgot_pass.dart';
import '../../theme.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: kDefaultPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 200,
            ),
            Text(
              "Welcome Back",
              style: titleText,
            ),
            const SizedBox(
              height: 20,
            ),
            const InputForm(),
            const SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                MaterialButton(
                  padding:const EdgeInsets.only(left: 0),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ForgotPassPage()));
                    },
                    child: const Text(
                      "Forgot Password?",
                      style: TextStyle(
                        color: kZambeziColor,
                        fontSize: 14,
                        decoration: TextDecoration.underline,
                        decorationThickness: 1,
                      ),
                    )),
              ],
            ),
            // const Text(
            //   "Forgot password?",
            //   style: TextStyle(
            //     color: kZambeziColor,
            //     fontSize: 14,
            //     decoration: TextDecoration.underline,
            //     decorationThickness: 1,
            //   ),
            // ),
            const SizedBox(
              height: 50,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: kPrimaryColor, // background
                  onPrimary: kWhiteColor, // foreground
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 125, vertical: 15),
                ),
                child: const Text(
                  "LOG IN",
                  style: TextStyle(
                    fontSize: 14,
                    letterSpacing: 2.2,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Center(
              child: OutlinedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CreateAccountPage()));
                },
                style: OutlinedButton.styleFrom(
                  primary: kPrimaryColor,
                  side: const BorderSide(width: 0.5, color: kDarkGreyColor),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 120, vertical: 15),
                ),
                child: const Text(
                  "SIGN UP",
                  style: TextStyle(
                    fontSize: 14,
                    letterSpacing: 2.2,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
