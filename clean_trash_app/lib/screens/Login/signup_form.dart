import 'package:flutter/material.dart';
import '../../theme.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildInputForm("First Name", false),
        buildInputForm("Last Name", false),
        buildInputForm("Email", false),
        buildInputForm("Password", true),
        buildInputForm("Retype Password", true),
      ],
    );
  }

  Padding buildInputForm(String label, bool pass) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        //autocorrect: mounted
        cursorColor: kTextFieldColor,
        obscureText: pass ? _isObscure : false,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(
            color: kTextFieldColor,
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: kPrimaryColor),
          ),
          suffixIcon: pass 
            ? IconButton(
              onPressed: (){
                setState(() {
                  _isObscure = !_isObscure;
                });
              }, 
              icon: Icon(
                _isObscure ? Icons.visibility_off : Icons.visibility,
                color: kSecondaryColor,
              ),
            ) 
        : null)
      ),
    );
  }
}
