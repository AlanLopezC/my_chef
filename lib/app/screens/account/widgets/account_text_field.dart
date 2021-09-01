import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class AccountTextField extends StatelessWidget {
  const AccountTextField({
    required this.hintText,
    required this.callback,
    this.obscureText = false,
    this.validator,
  });

  final String hintText;
  final Function callback;
  final bool obscureText;
  final validator;

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      style: NeumorphicStyle(
        lightSource: LightSource.top,
        depth: -2.5,
        intensity: .8,
        boxShape: NeumorphicBoxShape.roundRect(
          BorderRadius.circular(5),
        ),
        color: Colors.transparent,
      ),
      child: TextFormField(
        validator: validator,
        obscureText: obscureText,
        cursorColor: Colors.black12,
        style: TextStyle(
          fontSize: 13,
        ),
        onChanged: (String value) => callback(value),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10),
          isDense: true,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 13,
            color: Colors.grey,
          ),
          filled: true,
          fillColor: Color(0xfffdede7),
        ),
        keyboardType: TextInputType.emailAddress,
      ),
    );
  }
}
