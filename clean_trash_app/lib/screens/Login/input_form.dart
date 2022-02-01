import 'package:flutter/material.dart';
import '../../theme.dart';
import 'user/auth.dart';
import 'package:provider/provider.dart';

class InputForm extends StatefulWidget {
  const InputForm({Key? key}) : super(key: key);

  @override
  _InputFormState createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {

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


