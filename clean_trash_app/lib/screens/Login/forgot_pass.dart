import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'colors.dart' as color;
import 'package:provider/provider.dart';
import 'user/auth.dart';
import '../../theme.dart';
import 'login_page.dart';

class ForgotPass extends StatefulWidget {
  const ForgotPass({Key? key}) : super(key: key);

  @override
  _ForgotPassState createState() => _ForgotPassState();
}

class _ForgotPassState extends State<ForgotPass> {

  //final auth = FirebaseAuth.instance;
  final _email = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final auth = Provider.of<Auth>(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: color.AppColor.homePageBackground,
      body: Container(
        padding: const EdgeInsets.only(top:100, left: 30, right: 30),
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(
                  "Reset Password",
                  style: titleText,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: TextFormField(
                decoration:
                const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Email',
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please input email';
                  }
                  return null;
                },
                controller: _email,
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            Center(
              child: Column(
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () async {

                      await auth
                        .ResetPass(_email.text).then((value) {
                          Navigator.of(context).pop();
                      }).catchError((e) => print(e));
                    },
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
    );
  }
}

/*Widget inputFile({label, obscureText = false}) {
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
}*/
