import 'package:flutter/material.dart';
import '../home/home_screen.dart';
import 'login_page.dart';
import 'colors.dart' as color;
import 'package:provider/provider.dart';
import 'user/auth.dart';
import '../../theme.dart';
import 'verify_email.dart';
import 'checkbox.dart';

class CreateAccPage extends StatefulWidget {
  const CreateAccPage({Key? key}) : super(key: key);

  @override
  _CreateAccPageState createState() => _CreateAccPageState();
}

class _CreateAccPageState extends State<CreateAccPage> {

  //final _first = TextEditingController();
  //final _last = TextEditingController();
  final _email = TextEditingController();
  final _passw = TextEditingController();
  final _checkpass = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isObscure1 = true;
  bool _isObscure2 = true;
  bool check = false;

  @override
  void dispose() {
    //_first.dispose();
    //_last.dispose();
    _email.dispose();
    _passw.dispose();
    _checkpass.dispose();
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
              height: 50,
            ),
            /*Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: TextFormField(
                textInputAction: TextInputAction.next,
                decoration:
                const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'First Name',
                ),
                keyboardType: TextInputType.name,
                /*onSaved: (value) {
                  _first.text = value!;
                },*/
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please input first name';
                  }
                  return null;
                },
                controller: _first,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
              child: TextFormField(
                textInputAction: TextInputAction.next,
                decoration:
                const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Last Name',
                ),
                keyboardType: TextInputType.name,
                /*onSaved: (value) {
                  _last.text = value!;
                },*/
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please input last name';
                  }
                  return null;
                },
                controller: _last,
              ),
            ),*/
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
              child: TextFormField(
                textInputAction: TextInputAction.next,
                decoration:
                const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Email',
                ),
                keyboardType: TextInputType.emailAddress,
                /*onSaved: (value) {
                  _email.text = value!;
                },*/
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
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
              child: TextFormField(
                obscureText: true ? _isObscure1 : false,
                controller: _passw,
                /*onSaved: (value) {
                  _passw.text = value!;
                },*/
                textInputAction: TextInputAction.next,
                decoration:
                InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: (){
                      setState(() {
                        _isObscure1 = !_isObscure1;
                      });
                    },
                    icon: Icon(
                      _isObscure1 ? Icons.visibility_off : Icons.visibility,
                      color: kSecondaryColor,
                    ),
                  ),
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
              child: TextFormField(
                obscureText: true ? _isObscure2 : false,
                controller: _checkpass,
                /*onSaved: (value) {
                  _checkpass.text = value!;
                },*/
                textInputAction: TextInputAction.next,
                decoration:
                InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: (){
                      setState(() {
                        _isObscure2 = !_isObscure2;
                      });
                    },
                    icon: Icon(
                      _isObscure2 ? Icons.visibility_off : Icons.visibility,
                      color: kSecondaryColor,
                    ),
                  ),
                  labelText: 'Confirm Password',
                ),
                validator: (String? value) {
                  if (_checkpass.text != _passw.text) {//value == null || value.isEmpty) {
                    return 'Passwords do not match ${_checkpass.text} and ${_passw.text}';
                  }
                  return null;
                },
              ),
            ),
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
              child: Column(
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await auth
                            .SignUp(
                            _email.text, _passw.text).then((value) {
                          Navigator.push(context, MaterialPageRoute(builder:
                              (context) => Verify()));
                        }).catchError((e) => print(e));
                      }
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