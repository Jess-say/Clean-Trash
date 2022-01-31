import 'package:flutter/material.dart';
import '../../theme.dart';

class ResetForm extends StatefulWidget {
  const ResetForm({Key? key}) : super(key: key);

  @override
  _ResetFormState createState() => _ResetFormState();
}

class _ResetFormState extends State<ResetForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildResetForm("Email"),
      ],
    );
  }

  Padding buildResetForm(String label) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: TextFormField(
          //autocorrect: mounted
          cursorColor: kTextFieldColor,
          decoration: InputDecoration(
            labelText: label,
            labelStyle: const TextStyle(
              color: kTextFieldColor,
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: kPrimaryColor),
            ),
          ),
        ));
  }
}
