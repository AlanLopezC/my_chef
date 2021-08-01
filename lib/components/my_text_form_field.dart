import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  MyTextFormField({
    required this.placeholder,
    this.maxlines = 1,
  });

  final String placeholder;
  final int maxlines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxlines,
      style: TextStyle(
        fontSize: 14,
        color: Color(0xffaaaaaa),
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
