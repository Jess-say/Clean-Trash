import 'package:flutter/material.dart';
import '../home/home_screen.dart';
import 'login_page.dart';
import 'colors.dart' as color;
import 'package:provider/provider.dart';
import 'user/auth.dart';
import '../../theme.dart';
import 'verify_email.dart';

class CreateAccPage extends StatefulWidget {
  const CreateAccPage({Key? key}) : super(key: key);

  @override
  _CreateAccPageState createState() => _CreateAccPageState();
}

class _CreateAccPageState extends State<CreateAccPage> {

  final _email = TextEditingController();
  final _passw = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _email.dispose();
    _passw.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final auth = Provider.of<Auth>(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: color.AppColor.homePageBackground,

      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: <Widget>[
                Text(
                  "Create Account",
                  style: titleText,
                ),
              ],
            ),
            const SizedBox(
              height: 30,
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: TextFormField(
                obscureText: true,
                controller: _passw,
                decoration:
                const InputDecoration(
                  labelText: 'Password',
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please input password';
                  }
                  else if (value.length <= 5) {
                    return 'Password should be more than 5 characters';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Column(
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () async {
                      final isValid = _formKey.currentState!.validate();
                      await auth
                          .SignUp(
                          _email.text, _passw.text).then((value) {
                        Navigator.push(context, MaterialPageRoute(builder:
                            (context) => Verify()));
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
                      "SIGN UP",
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
