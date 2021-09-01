import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  MyTextFormField({
    required this.placeholder,
    required this.callback,
    this.maxlines = 1,
  });

  final String placeholder;
  final int maxlines;
  final Function callback;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (String value) {
        callback(value);
        // Other way
        // CreateScreen.of(context).time = value;
      },
      maxLines: maxlines,
      style: TextStyle(
        fontSize: 14,
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(10),
        isDense: true,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xffffffff),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xffdddddd),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xffaaaaaa),
          ),
        ),
        hintText: placeholder,
      ),
    );
  }
}
