import 'package:flutter/material.dart';
import '../home/home_screen.dart';
//import 'input_form.dart';
import 'signup_page.dart';
import 'forgot_pass.dart';
import 'colors.dart' as color;
import '../../theme.dart';
import 'user/auth.dart';
import 'package:provider/provider.dart';

class EmailFieldValidator {
  static String? validate(String value) {
    if (value == null || value.isEmpty) {
      return 'Please input email can\'t be empty';
    }
    else {
      return null;
    }
    //return value.isEmpty ? 'Please input email can\'t be empty' : null;
  }
}

class PasswordFieldValidator {
  static String? validate(String value) {
    return value.isEmpty ? 'Please enter password can\'t be empty' : null;
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isObscure = true;

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
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
                  "Welcome Back",
                  style: titleText,
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: TextFormField(
                controller: _email,
                decoration:
                const InputDecoration(
                  labelText: 'Email',
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (String? value) {
                  EmailFieldValidator.validate;
                  //if (value == null || value.isEmpty)
                  //  return 'Please input email';
                  //return null;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: TextFormField(
                obscureText: true ? _isObscure : false,
                controller: _password,
                decoration:

                InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: (){
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                    icon: Icon(
                      _isObscure ? Icons.visibility_off : Icons.visibility,
                      color: kSecondaryColor,
                    ),
                  ),
                  labelText: 'Password',
                ),
                validator: (String? value) {
                  PasswordFieldValidator.validate;
                  //if (value == null || value.isEmpty)
                  //  return 'Please input password';
                  //return null;
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ForgotPass()));
              },
              child: const Text(
                "Forgot password?",
                style: TextStyle(
                  color: kZambeziColor,
                  fontSize: 14,
                  decoration: TextDecoration.underline,
                  decorationThickness: 1,
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Center(
              child: Column(
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () async {
                      final isValid = _formKey.currentState!.validate();
                      await auth .handleSignInEmail(
                          _email.text, _password.text).then((value) {
                        Navigator.push(context, MaterialPageRoute(builder:
                            (context) => const HomeScreen()));
                      }).catchError((e) => print(e));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: kPrimaryColor, // background
                      onPrimary: kWhiteColor, // foreground
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 125, vertical: 15),
                    ),
                    child: const Text(
                      "LOG IN",
                      style: TextStyle(
                        fontSize: 14,
                        letterSpacing: 2.2,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CreateAccPage()));
                    },
                    style: OutlinedButton.styleFrom(
                      primary: kPrimaryColor,
                      side: const BorderSide(width: 0.5, color: kDarkGreyColor),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 120, vertical: 15),
                    ),
                    child: const Text(
                      "SIGN UP",
                      style: TextStyle(
                        fontSize: 14,
                        letterSpacing: 2.2,
                      ),
                    ),
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
