import 'package:flutter/material.dart';
import '../../theme.dart';

class InputForm extends StatefulWidget {
  const InputForm({Key? key}) : super(key: key);

  @override
  _InputFormState createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildInputForm("Email", false),
        buildInputForm("Password", true),
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
