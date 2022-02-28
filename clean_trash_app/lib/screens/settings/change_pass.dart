import 'package:cleantrash_app/screens/settings/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Login/user/auth.dart';
import '../../theme.dart';
import '../Login/login_page.dart';
import 'settings.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

class ChangePassPage extends StatefulWidget {
  const ChangePassPage({Key? key}) : super(key: key);

  @override
  _ChangePassPageState createState() => _ChangePassPageState();
}

class _ChangePassPageState extends State<ChangePassPage> {

  /*final TextEditingController _password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isObscure = true;*/
  final user = auth.FirebaseAuth.instance.currentUser!;


  @override
  Widget build(BuildContext context) {

    final auth = Provider.of<Auth>(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.green,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SettingsPage()),
            );
          },
        ),
      ),
        body: Container(
            padding: const EdgeInsets.only(left: 30, top: 25, right: 30),

            child: ListView(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Change Password",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  const Text(
                    "Are you sure you want to change your password?",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  buildTextField("Email will be sent to: ", user.email as String, false),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SettingsPage()),
                          );
                        },
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                        ),
                        child: const Text(
                          "NO",
                          style: TextStyle(
                              fontSize: 14,
                              letterSpacing: 2.2,
                              color: Colors.black),
                        ),
                      ),
                      OutlinedButton(
                        onPressed: () async {
                          await auth
                              .ChangePass(user.email).then((value) {
                            Navigator.of(context).pop();
                          }).catchError((e) => print(e));
                        },
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                        ),
                        child: const Text(
                          "YES",
                          style: TextStyle(
                              fontSize: 14,
                              letterSpacing: 2.2,
                              color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ]
            )
        ),
      /*appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.green,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SettingsPage()),
            );
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
            child: ListView(
              children: [
                const Text(
                  "Change Password",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 10
                ),
                const Text(
                  "Please input a new password",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
                ),
                SizedBox(
                    height: 30
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: TextFormField(
                    obscureText: true ? _isObscure : false,
                    decoration: InputDecoration(
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
                      labelText: "New password",
                      hintText: "Please enter new password",
                      labelStyle: TextStyle(fontSize: 20),
                      border: OutlineInputBorder(),
                      errorStyle: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                    controller: _password,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter new password";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {

                      }
                      /*await auth
                          .ResetPass(_email.text).then((value) {
                        Navigator.of(context).pop();
                      }).catchError((e) => print(e));*/
                    },
                    style: ElevatedButton.styleFrom(
                    primary: Colors.green, // background
                    onPrimary: Colors.white, // foreground
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    ),
                  child: const Text(
                    "CHANGE PASSWORD",
                    style: TextStyle(
                      fontSize: 14,
                      letterSpacing: 2.2,
                    ),
                  ),
                ),
              ],
            ),
          ),
      ),*/
    );
  }
}